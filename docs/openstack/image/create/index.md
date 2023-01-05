# openstack image create

이미지를 생성하고 업로드하는 `openstack image create` CLI 커맨드를 이용하여 이미지를 등록, 그 과정에서 발생하는 API 시퀀스 다이어그램을 작성해보고 Request/Response를 분석해본다.  

* `qcow2` 디스크 타입의 [cirros-0.6.1-x86_64-disk.img](http://download.cirros-cloud.net/0.6.1/cirros-0.6.1-x86_64-disk.img)  
* 생성된 이미지는 아래 설정에 의해 오브젝트 스토리지에 저장된다.  
``` ini title="/etc/glance/glance-api.conf" hl_lines="7"
...
[glance_store]
stores = file, http, swift
default_swift_reference = ref1
swift_store_config_file = /etc/glance/glance-swift-store.conf
swift_store_create_container_on_put = True
default_store = swift
filesystem_store_datadir = /opt/stack/data/glance/images/
...
```

## Openstack CLI Command & Output

!!! reference "CLI 참조"
    [openstack image create](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-create)

??? example "openstack image create --disk-format qcow2 --file cirros-0.6.1-x86_64-disk.img --public --format json cirros-0.6.1-x86_64-disk"
    ``` json title="Console Output" linenums="1" hl_lines="19"
    {
      "container_format": "bare",
      "created_at": "2022-12-30T01:38:06Z",
      "disk_format": "qcow2",
      "file": "/v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c",
      "id": "a42bfade-78ec-4c95-b7b4-272ba265072c",
      "min_disk": 0,
      "min_ram": 0,
      "name": "cirros-0.6.1-x86_64-disk",
      "owner": "de5af600557d44d0996e667499376dbb",
      "properties": {
          "os_hidden": false,
          "owner_specified.openstack.md5": "",
          "owner_specified.openstack.sha256": "",
          "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-disk"
      },
      "protected": false,
      "schema": "/v2/schemas/image",
      "status": "queued",
      "tags": [],
      "updated_at": "2022-12-30T01:38:06Z",
      "visibility": "public"
    }
    ```
    ???+ question "결과 출력에서 `status`가 `queued`인 이유?"
        `(13)` 이미지 파일 업로드 요청에 대해 `(22)` 응답에서 이미지의 `status` 관련 정보를 응답하지 않으므로, `(12)` 응답에서 수집된 `status` = `queued`를 그대로 이용하는 듯 하다.  
        이미지 상태를 확인하기 위해서는 `openstack image show {image_id}` 커맨드 또는 `GET /v2/images/{image_id}` API 등을 통해 직접 확인해야 한다.  


## Sequence Diagram

`openstack image create` 커맨드를 이용한 이미지 생성 과정은 아래의 시퀀스 다이어그램으로 표현할 수 있다.  

``` mermaid
sequenceDiagram
    autonumber
    --8<-- "openstack/image/create/diagram.md"
```

| variables | values |
|-----------|--------|
| `image_id` | a42bfade-78ec-4c95-b7b4-272ba265072c |
| `account` | AUTH_7c4cda7e4807414bbdfcb22b535a9802 |

각 과정을 간략히 요약하면 다음과 같다.  

* `openstack-client`가 `keystone` 서비스에 `credential` 정보를 보내 인증 토큰 발급 및 서비스 카탈로그를 수신한다. `(1-4)`
* `openstack-client`가 `glance` 서비스에 이미지 생성을 요청한다. `(5)` 
* `openstack-client`의 이미지 생성 요청에 대해 `glance` 서비스는 `keystone`에 인증 토큰 검증을 수행한다. `(6-11)`
* 이미지 생성 완료 응답`(12)`을 받고, 이미지 파일 `endpoint`에 `PUT` 메소드로 이미지 파일을 업로드 한다. `(13)`
* `glance` 서비스는 `swift` 서비스에 이미지 파일을 업로드 하기 위한 인증 토큰을 발급한다. `(14-15)`
* `glance` 서비스는 `swift` 서비스에 이미지 파일을 업로드할 컨테이너(`glance`) 메타데이터 정보를 요청한다. `(16)`
* `swift` 서비스는 `(16)` 번 요청에 대해서 인증 토큰을 확인한다. `(17-18)`
* `swift` 서비스는 `glance` 서비스에 컨테이너 메타데이터 정보를 전달한다. `(19)`
* `glance` 서비스는 `(13)` 요청에서 수신한 이미지 파일을 `PUT` 메소드로 `swift` 서비스에 업로드한다. `(20-21)`
* `glance` 서비스는 `(13)` 요청에 대한 응답으로 이미지 파일 업로드 완료를 통보한다. `(22)`

!!! note 
    `(6-9)` 과정은 `glance-api`가 사용할 인증 토큰을 발급 받지 않았거나, 만료된 경우에 발생한다.  
    만약, `glance-api`가 만료되지 않은 인증 토큰을 보유하고 있는 경우, `(6-9)` 과정은 발생하지 않는다.   

??? warning "생략된 시퀀스"

    ``` json title="should_not_hook.json"
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
    ```
    
    * `glance-api`에서 `keystone`으로 쿼터 관련 정보를 요청하는 부분은 위 `should_not_hook.json` 설정에 의해서 제외하였다. (너무 많고 길어져서...)  

    ``` json title="should_not_hook.json"
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
    }
    ```

    * `nova-compute`가 `placement-api`에 주기적으로 요청하는 API 요청은 위 설정에 의해 제외되었다.  
    * `requestshook` 미들웨어를 `glance-api` 파이프라인의 `versionnegotiation` 미들웨어 뒤에 놓아 `version negotiation` 관련 시퀀스가 생략되었다.  

## Request / Response

??? warning "X-Requestshook-Request-* 헤더"
    `Header` 에 포함된 `X-Requestshook-Request-Id`, `X-Requestshook-Request-From` 항목은 API Sequence 추적을 위해 `requestshook`에서 추가한 항목이며, 오픈스택에서 제공하는 정보가 아니라는 점을 주의한다.    

--8<-- "openstack/image/create/body.md"

## Full Log

??? quote "/var/log/requestshook/requestshook.log"
    ``` text title="" linenums="1"
    --8<-- "openstack/image/create/log.md"
    ```
