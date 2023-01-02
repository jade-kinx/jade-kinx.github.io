# openstack image create

이미지를 생성하고 업로드한다.

!!! tip "CLI 참조"
    [openstack image create](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-create)

## OpenStack Client Command
``` bash title="python3-openstackclient command"
$ openstack image create \
  --disk-format qcow2 \
  --file cirros-0.6.1-x86_64-disk.qcow2 \
  --public \
  --format json
  cirros-0.6.1-x86_64-disk
```

??? note ".vscode/launch.json"
    ``` json title="configuration .vscode/launch.json"
    {
        "name": "Python: openstack image create",
        "type": "python",
        "request": "launch",
        "program": "Scripts/openstack.exe",
        "args": ["image", "create", 
            "--disk-format", "qcow2", 
            "--file", "cirros-0.6.1-x86_64-disk.qcow2", 
            "--public", 
            "--format", "json"],
            "cirros-0.6.1-x86_64-disk", 
        "env": {
            "OS_AUTH_URL": "http://devstack-debug/identity",
            "OS_IDENTITY_API_VERSION": "3",
            "OS_USERNAME": "admin",
            "OS_PASSWORD": "asdf",
            "OS_PROJECT_NAME": "admin",
            "OS_USER_DOMAIN_NAME": "Default",
            "OS_PROJECT_DOMAIN_NAME": "Default"
        },
        "console": "integratedTerminal",
        "justMyCode": false
    },
    ```

위 커맨드를 실행했을 때의 시퀀스 다이어그램 및 HTTP Request/Response 내용은 아래와 같다.  

## Sequence Diagram

``` mermaid
sequenceDiagram
    autonumber
    --8<-- "openstack/image/create/diagram.md"
```

!!! note
    `{image_id}`: `a42bfade-78ec-4c95-b7b4-272ba265072c`  
    `{account}`: `7c4cda7e4807414bbdfcb22b535a9802`  

이미지 서비스에 qcow2 포맷의 로컬 이미지 파일 등록 요청을 보낼 때의 시퀀스 다이어그램이다.  

각 과정에 대한 간략한 설명은 다음과 같다.   

- `openstack-client`가 `keystone` 서비스에 인증 정보를 보내 인증 토큰 발급 및 서비스 카탈로그를 수신한다. `(1-4)`
- `openstack-client`가 `glance` 서비스에 이미지 생성을 요청한다. `(5)` 
- 이 과정에서 `glance` 서비스는 `keystone`에 인증 토큰 검증을 수행한다. `(6-11)`
- 이미지 생성 완료 응답`(12)`을 받았지만 이미지 레코드만 생성된 상태이므로, 이미지 파일 `endpoint`에 `PUT` 메소드로 이미지 파일을 업로드 한다. `(13)`
- 이미지 파일 업로드 요청을 받은 `glance` 서비스는 `swift` 서비스에 파일 업로드를 하기 위해 `keystone` 서비스에 토큰 발급을 요청한다. `(14-15)`
- `glance` 서비스는 `swift` 서비스에 이미지 파일을 업로드할 컨테이너(`glance`) 메타데이터 정보를 요청한다. `(16)`
- `swift` 서비스는 `(16)` 번 요청에 대해서 인증 토큰을 확인한다. `(17-18)`
- `swift` 서비스는 `glance` 서비스에 컨테이너 메타데이터 정보를 전달한다. `(19)`
- `glance` 서비스는 `(13)` 요청에서 수신한 이미지 파일을 `PUT` 메소드로 `swift` 서비스에 업로드한다. `(20-21)`
- `glance` 서비스가 `openstack-client`에 최종적으로 이미지 파일 업로드를 완료했다고 결과를 통보한다. `(22)`

???+ note "생략된 시퀀스"

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
    
    * `glance-api`에서 `keystone`으로 쿼터 관련 정보를 요청하는 부분은 위 `should_not_hook.json` 설정에 의해서 제외되었다.(너무 많아서...)  

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

    * `nova-compute`에서 `placement-api`로 일정 주기로 요청하는 API 요청은 위 설정에 의해서 제외되었다.
    * `requestshook` 미들웨어를 `glance-api` 파이프라인의 `versionnegotiation` 미들웨어 뒤에 놓아 `version negotiation` 관련 시퀀스가 생략되었다.  

## Request / Response

!!! note
    `Header` 에 포함된 `X-Requestshook-Request-Id`, `X-Requestshook-Request-From` 항목은 API Sequence 추적을 위해 `requestshook`에서 추가한 항목이며, 오픈스택에서 제공하는 정보가 아니므로 무시한다.  

--8<-- "openstack/image/create/body.md"

## Output

``` json title="openstack image create --disk-format qcow2 --file cirros-0.6.1-x86_64-disk.img --public --format json cirros-0.6.1-x86_64-disk"
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

??? quote "/var/log/requests.log"
    ``` text title="" linenums="1"
    --8<-- "openstack/image/create/log.md"
    ```
