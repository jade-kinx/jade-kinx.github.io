# OpenStack Image Service Sequence Dump

이 문서에서는 `requestshook` 패키지를 만들고, 이를 이용하여 `glance` 서비스의 API 시퀀스를 추적하는 방법을 알아본다.  

## requestshook package

`requestshook` 패키지는 API 요청시 `Header`에 요청자 정보를 추가하고, 오픈스택 API 서비스에서 사용할 수 있는 로깅 미들웨어 기능을 제공한다.  

!!! reference ""
    :fontawesome-brands-github: [https://github.com/jade-kinx/requestshook](https://github.com/jade-kinx/requestshook)


=== "Package Tree"

    ``` cmd title=""
    D:\works\REQUESTSHOOK
    │  .gitignore
    │  build.cmd
    │  LICENSE
    │  README.md
    │  setup.py
    │
    └─requestshook
            requestshook.py
            requestshook_middleware.py
            should_not_hook.py
            utils.py
            __init__.py
    ```

`requestshook_middleware` 모듈은 오픈스택 서비스들(`keystone`, `glance`, `cinder`, `neutron`, `nova`, `swift`, `trove`, `horizone`)에서 API 요청을 처리할때 요청과 응답을 추적하는 `Middleware`를 제공한다.  
`requestshook` 모듈은 `requests.adapters.HttpAdapter.send()` 메소드를 후킹하여, API 요청 `header`에 `X-Requestshook-Request-Id`, `X-Requestshook-Requests-From` 값을 추가하는 기능을 제공한다. 올인원 버전의 데브스택에서는 `Remote IP`, `User-Agent` 만으로는 어느 서비스에서 발생한 요청인지 판단하기 어렵기 때문에, 헤더에 요청한 서비스에 대한 정보를 추가하도록 한다.  
`should_not_hook` 모듈은 일정 주기로 지속적으로 발생하는 요청이나, 추적하고 싶지 않은 요청 등을 필터링하여 로깅에서 제외하여 주는 기능을 제공한다.  


=== "setup.py"
    ``` py title="" linenums="1" hl_lines="23 24"
    --8<-- "openstack/image/requestshook/setup.py"
    ```
    `setup.py`에서 `entry_points` 정보를 포함한다. 이를 이용하여 `keystone`, `placement-api`에서 미들웨어를 추가할 수 있다.  

=== "\_\_init\_\_.py"
    ``` py title="" linenums="1"
    --8<-- "openstack/image/requestshook/__init__.py"
    ```

=== "requestshook.py"
    ``` py title=""
    --8<-- "openstack/image/requestshook/requestshook.py"
    ```

=== "requestshook_middleware.py"
    ``` py title=""
    --8<-- "openstack/image/requestshook/requestshook_middleware.py"
    ```

=== "should_not_hook.py"
    ``` py title=""
    --8<-- "openstack/image/requestshook/should_not_hook.py"
    ```

=== "utils.py"
    ``` py title=""
    --8<-- "openstack/image/requestshook/utils.py"
    ```

``` cmd title="build package"
$ python setup.py bdist_wheel
```

``` cmd title="install package"
# pip install requestshook-0.0.1-py3-none-any.whl [--upgrade]
```

## `requests` 패키지 후킹

``` py title="/usr/local/lib/python3.8/dist-package/requests/adapters.py" linenums="1" hl_lines="4 5"
    class HTTPAdapter(BaseAdapter):
        """The built-in HTTP Adapter for urllib3."""
    ...
    from requestshook import requestshook
    @requestshook
    def send(
        self, request, stream=False, timeout=None, verify=True, cert=None, proxies=None
    ):
        """Sends PreparedRequest object. Returns Response object."""
    ...
```
`openstackclient`, `keystone`, `glance-api`, `swift-proxy-server` 등의 대부분의 오픈스택 클라이언트 및 서비스들은 API 요청시 `requests` 패키지의 `adapters.HttpAdapter.send()` 메소드를 거쳐가고 있다.  
우리는 `requests.adapters.HttpAdapter.send()` 메소드를 위와 같이 데코레이터를 이용하여 후킹하고, HTTP 요청 헤더에 요청자 정보를 추가할 수 있다.  
HTTP 요청 헤더에 요청자 정보를 추가하는 것은, API 서비스 미들웨어에서 요청자를 식별하여 시퀀스 다이어그램을 생성하기 위해서이다.  

!!! note
    `requests` 패키지 후킹에서 직접 API 요청과 응답을 덤프할 수 있지만, `swfit` 서비스의 경우 `response.body`에 접근하면 이후 서비스 처리에서 `http 500 internal server error` 등의 문제가 발생한다. (`response` 버퍼 포인터 수정이 원인이 아닐까 싶은데? 정확히는 모르겠다)  
    그래서, `requests` `send()` 후킹에서는 요청자 정보만 포함하고, service api의 middleware에서 시퀀스 덤프를 수행하도록 한다.  
    (또는, `requests` `send()` 후킹에서는 `http.request`에 대해 덤프하고, service `middleware`에서 `http.response`에 대해 덤프해도 무방해 보인다)

## Middleware 추가

오픈스택의 API 서비스들은 API 요청을 Middleware 파이프라인 방식으로 처리한다.  
데브스택 `zed` 기준으로 `keystone`, `placement-api` 서비스는 코드에서 직접 파이프라인에 사용할 미들웨어를 추가하도록 되어 있고, `glance-api`, `cinder-api`, `nova-api`, `neutron-server`, `swift-proxy-server`, `trove-api` 는 `api-paste.ini` 설정으로 파이프라인에 미들웨어를 추가할 수 있다.

### keystone middleware 추가

``` py title="/opt/stack/keystone/keystone/server/flask/core.py" linenums="1" hl_lines="20 21 22"
    ...
    # NOTE(morgan): ORDER HERE IS IMPORTANT! The middleware will process the
    # request in this list's order.
    _APP_MIDDLEWARE = (
        _Middleware(namespace='keystone.server_middleware',
                    ep='cors',
                    conf={'oslo_config_project': 'keystone'}),
        _Middleware(namespace='keystone.server_middleware',
                    ep='sizelimit',
                    conf={}),
        _Middleware(namespace='keystone.server_middleware',
                    ep='http_proxy_to_wsgi',
                    conf={}),
        _Middleware(namespace='keystone.server_middleware',
                    ep='osprofiler',
                    conf={}),
        _Middleware(namespace='keystone.server_middleware',
                    ep='request_id',
                    conf={}),
        _Middleware(namespace='requestshook.api_middleware',
                    ep='requestshook',
                    conf={}),
    )
    ...
```

`requestshook` 패키지의 `setup.py` 에서 `entry_points` 정보를 아래와 같이 추가하였으므로, 패키지의 엔트리 포인트 정보를 이용하여 위 코드와 같이 미들웨어를 직접 추가한다.  

``` py title="setup.py" linenums="1" hl_lines="4 5"
setuptools.setup(
...
entry_points={
    'requestshook.api_middleware': [
        'requestshook = requestshook:RequestsHookMiddleware',
    ]
},
...
)
```
미들웨어 실행순서는 위에서 아래로 순서대로 실행된다. 

``` bash title="restart service"
# service devstack@keystone restart
```
서비스를 재시작하고 `keystone` 서비스에 API 요청을 전송한 후에 `/var/log/requestshook/` 경로에 관련 로그가 정상적으로 생성되는지 확인한다.

### glance-api middleware 추가

``` ini title="/etc/glance/glance-api-paste.ini"
...
# Use this pipeline for keystone auth with caching and cache management
[pipeline:glance-api-keystone+cachemanagement]
pipeline = cors healthcheck http_proxy_to_wsgi versionnegotiation osprofiler requestshook authtoken context cache cachemanage rootapp

[filter:requestshook]
paste.filter_factory = requestshook:RequestsHookMiddleware.factory
...
```

`pipeline`의 `rootapp`의 앞의 어느 위치에 `requestshook` 을 추가한다. 추가하는 위치에 따라 덤프되는 시퀀스 내용이 다를 수 있다.  
가령, `versionnegotiation` 미들웨어 보다 앞에 추가하면 버전 확인하는 시퀀스가 추가되어 덤프될 것이고, `versionnegotiation` 미들웨어 보다 뒤에 추가하면 버전 확인하는 시퀀스는 생략되어 보이지 않을 것이다.  
또는 `authtoken` 미들웨어 뒤에 추가하게 되면, 사용자 요청에 대해 `keystone`으로 인증 토큰을 검증하는 시퀀스(`GET /identity/v3/auth/tokens`)가 빠지게 된다.

``` bash title="restart service"
# service devstack@g-api restart
```

### swift-proxy-server middleware 추가

``` ini title="/etc/swift/proxy-server.conf"
...
[pipeline:main]
# This sample pipeline uses tempauth and is used for SAIO dev work and
# testing. See below for a pipeline using keystone.
pipeline = catch_errors gatekeeper healthcheck proxy-logging requestshook cache listing_formats container_sync bulk tempurl ratelimit crossdomain authtoken keystoneauth tempauth  formpost staticweb copy container-quotas account-quotas slo dlo versioned_writes symlink proxy-logging proxy-server

# requestshook API middleware for sequence logging
[filter:requestshook]
paste.filter_factory = requestshook:RequestsHookMiddleware.factory
...
```

`requestshook` 미들웨어의 적절한 위치를 판단하기 어려워, `proxy-logging` 미들웨어 뒤에 추가하였다. `proxy-logging` 미들웨어가 요청을 로깅하는 미들웨어로 보이고, `authtoken` 미들웨어 보다 앞에 있으므로 적당한 위치로 추정된다.

??? question "pipeline에 `proxy-logging` 미들웨어가 2개 있는 이유는?"
    두 `proxy-logging` 사이의 미들웨어들에서 처리된 이후의 `request`, `response` 변화를 확인하기 위해서인가???  

``` bash title="restart service"
# service devstack@s-account restart
# service devstack@s-container restart
# service devstack@s-object restart
# service devstack@s-proxy restart
```

### other api-service middleware 추가

`이미지(glance)` 서비스로 들어오는 API 요청에 대해서 시퀀스 덤프를 하기 위해서는 `keystone`, `glance-api`, `swift-proxy-server` 3개의 API 서버에 `Middleware`를 추가하는 것으로 충분하다.  
나머지 API 서비스들에 미들웨어를 추가하는 것은 아래와 같다.  

=== "cinder-api"
    ``` ini title="/etc/cinder/api-paste.ini" linenums="1"
    ...
    [composite:openstack_volume_api_v3]
    use = call:cinder.api.middleware.auth:pipeline_factory
    noauth = request_id cors http_proxy_to_wsgi faultwrap sizelimit osprofiler noauth requestshook apiv3
    noauth_include_project_id = request_id cors http_proxy_to_wsgi faultwrap sizelimit osprofiler noauth_include_project_id requestshook apiv3
    keystone = request_id cors http_proxy_to_wsgi faultwrap sizelimit osprofiler authtoken keystonecontext requestshook apiv3
    keystone_nolimit = request_id cors http_proxy_to_wsgi faultwrap sizelimit osprofiler authtoken keystonecontext requestshook apiv3    
    ...
    [filter:requestshook]
    paste.filter_factory = requestshook:RequestsHookMiddleware.factory
    ...
    ```

    ``` bash title="restart service"
    # service devstack@c-vol restart
    # service devstack@c-sch restart
    # service devstack@c-api restart
    ```

=== "nova-api"
    ``` ini title="/etc/nova/api-paste.ini" linenums="1"
    ...
    [composite:openstack_compute_api_v21]
    use = call:nova.api.auth:pipeline_factory_v21
    keystone = cors http_proxy_to_wsgi compute_req_id faultwrap request_log sizelimit osprofiler authtoken keystonecontext requestshook osapi_compute_app_v21
    # DEPRECATED: The [api]auth_strategy conf option is deprecated and will be
    # removed in a subsequent release, whereupon this pipeline will be unreachable.
    noauth2 = cors http_proxy_to_wsgi compute_req_id faultwrap request_log sizelimit osprofiler noauth2 requestshook osapi_compute_app_v21
    ...
    [composite:openstack_compute_api_v21_legacy_v2_compatible]
    use = call:nova.api.auth:pipeline_factory_v21
    keystone = cors http_proxy_to_wsgi compute_req_id faultwrap request_log sizelimit osprofiler authtoken keystonecontext legacy_v2_compatible requestshook osapi_compute_app_v21
    # DEPRECATED: The [api]auth_strategy conf option is deprecated and will be
    # removed in a subsequent release, whereupon this pipeline will be unreachable.
    noauth2 = cors http_proxy_to_wsgi compute_req_id faultwrap request_log sizelimit osprofiler noauth2 legacy_v2_compatible requestshook osapi_compute_app_v21    
    ...
    [filter:requestshook]
    paste.filter_factory = requestshook:RequestsHookMiddleware.factory    
    ...
    ```

    ``` bash title="restart service"
    # service devstack@n-cond restart
    # service devstack@n-novnc restart
    # service devstack@n-sch restart
    # service devstack@n-cpu restart
    # service devstack@n-api-meta restart
    # service devstack@n-api restart
    ```

=== "neutron-server"
    ``` ini title="/etc/neutron/api-paste.ini" linenums="1"
    ...
    [composite:neutronapi_v2_0]
    use = call:neutron.auth:pipeline_factory
    noauth = cors http_proxy_to_wsgi request_id fake_project_id catch_errors osprofiler extensions requestshook neutronapiapp_v2_0
    keystone = cors http_proxy_to_wsgi request_id catch_errors osprofiler authtoken keystonecontext extensions requestshook neutronapiapp_v2_0
    ...
    [filter:requestshook]
    paste.filter_factory = requestshook:RequestsHookMiddleware.factory
    ...
    ```

    ``` bash title="restart service"
    # service devstack@q-ovn-metadata-agent restart
    # service devstack@q-svc restart
    ```

=== "trove-api"
    ``` ini title="/etc/trove/api-paste.ini" linenums="1"
    ...
    [pipeline:troveapi]
    pipeline = cors http_proxy_to_wsgi faultwrapper osprofiler authtoken authorization contextwrapper ratelimit extensions requestshook troveapp
    #pipeline = debug extensions troveapp
    ...
    #requestshook logger middleware
    [filter:requestshook]
    paste.filter_factory = requestshook:RequestsHookMiddleware.factory
    ...
    ```

    ``` bash title="restart service"
    # service devstack@tr-cond restart
    # service devstack@tr-tmgr restart
    # service apache2 restart
    ```

=== "placement-api"
    ``` py title="/opt/stack/placement/placement/deploy.py" linenums="1" hl_lines="9 10 13"
    ...
    context_middleware = auth.PlacementKeystoneContext
    microversion_middleware = mp_middleware.MicroversionMiddleware
    fault_middleware = fault_wrap.FaultWrapper
    request_log = requestlog.RequestLog
    http_proxy_to_wsgi = oslo_middleware.HTTPProxyToWSGI
    ...
    # requestshook middleware
    import requestshook
    requestshook_middleware = requestshook.RequestsHookMiddleware
    ...
    for middleware in (
                       requestshook_middleware,
                       fault_middleware,
                       context_middleware,
                       auth_middleware,
                       cors_middleware,
                       request_log,
                       http_proxy_to_wsgi,
                       osprofiler_middleware,
                       ):
        if middleware:
            application = middleware(application)
    ```

    ``` bash title="restart service"
    # service devstack@placement-api restart
    ```

### should_not_hook.json 설정


``` json title="/etc/requestshook/should_not_hook.json"
{
    "mappings": {
        "{uuid}": "([a-fA-F0-9-]+)",
        "{version}": "(v[0-9.]+)",
        "{name}": "(.+?)",
        "{endpoint_id}": "([a-fA-F0-9]+)"
    },
    "filters": [
        {
            "from": "nova-compute",
            "to": "placement-api",
            "method": "GET",
            "urls": [
                "/placement/resource_providers",
                "/placement/resource_providers/{uuid}/inventories",
                "/placement/resource_providers/{uuid}/aggregates",
                "/placement/resource_providers/{uuid}/allocations",
                "/placement/resource_providers/{uuid}/traits"
            ]
        },
        {
            "from": "placement-api",
            "to": "keystone",
            "urls": [
                "/identity/"
            ]
        },
        {
            "from": "Swift",
            "to": "swift-proxy-server",
            "method": "HEAD"
        },
        {
            "from": "glance-api",
            "to": "keystone",
            "method": "GET",
            "urls": [
                "/identity/{version}/limits",
                "/identity/{version}/registered_limits",
                "/identity/{version}/endpoints/{endpoint_id}"
            ]
        }
    ]
}
```

주기적으로 발생하는 요청이나, 로그에서 제외하고 싶은 요청을 `should_not_hook.json` 설정 파일에 등록하여 시퀀스 로그에서 제거할 수 있다.  
미들웨어가 실행될 때마다(요청을 받을 때마다) 매번 설정을 로드하므로, 설정을 수정하면 즉시 반영된다.

### 시퀀스 로그 확인

시퀀스 로그는 `/var/log/requestshook/` 경로에서 확인할 수 있다.  
`diagram.md` 파일은 시퀀스 다이어그램에 사용할 내용이 기록되어 있고, 마크다운 문서에 아래와 같이 추가할 수 있다.  
(아래 예제들에서는 외부 문서 포함 문자 `--8<--` 에 백틱이 포함되어 있는데, 백틱은 제거해야 한다.)  

```` markdown title="시퀀스 다이어그램 추가"
``` mermaid
sequenceDiagram
  autonumber
  `--8<--` "diagram.md"
```
````

`body.md` 파일에는 시퀀스 문서에 추가할 `Request`, `Response` 내용이 기록되어 있고, 마크다운 문서에 아래와 같이 추가할 수 있다.  

```` markdown title="Request/Response 문서 추가"
## Request/Reponse 
`--8<--` "body.md"
````

`requestshook.log` 파일에는 마크다운 포맷이 아닌 일반 로그 포맷으로 Request/Response 로그가 기록되어 있다.
```` markdown title="log를 문서에 추가"
``` text "requestshook.log"
`--8<--` "requestshook.log"
```
````

이 시퀀스 로그를 이용하여, 다음의 CLI 명령에 대해 시퀀스 다이어그램 및 Request/Response 덤프를 작성할 것이다.

* openstack image create
* openstack image list
* openstack image show
* openstack image save
* openstack image add project
* openstack image member list
* openstack image remove project
* openstack image set
* openstack image unset
* openstack image delete

