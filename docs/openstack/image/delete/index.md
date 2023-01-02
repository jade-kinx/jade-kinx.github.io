# openstack image delete

`id` 또는 `name`으로 이미지를 삭제한다. 

!!! tip "CLI 참조"
    [openstack image delete](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-delete)

## OpenStack Client Command
``` bash title="python3-openstackclient command"
$ openstack image delete 04cd3672-1f97-4e98-bfe0-0d4801d88a8e
```

??? note ".vscode/launch.json"
    ``` json title="configuration .vscode/launch.json"
    {
        "name": "Python: openstack image delete",
        "type": "python",
        "request": "launch",
        "program": "Scripts/openstack.exe",
        "args": ["image", "delete", "04cd3672-1f97-4e98-bfe0-0d4801d88a8e"],
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
    --8<-- "openstack/image/delete/diagram.md"
```

!!! note
    `{image_id}`: `04cd3672-1f97-4e98-bfe0-0d4801d88a8e`  
    `{account}`: `7c4cda7e4807414bbdfcb22b535a9802`  

각 과정에 대한 간략한 설명은 다음과 같다.   

- `openstack-client`가 `keystone` 서비스에 인증 정보를 보내 인증 토큰 발급 및 서비스 카탈로그를 수신한다. `(1-4)`

## Request / Response

!!! note
    `Header` 에 포함된 `X-Requestshook-Request-Id`, `X-Requestshook-Request-From` 항목은 API Sequence 추적을 위해 `requestshook`에서 추가한 항목이며, 오픈스택에서 제공하는 정보가 아니므로 무시한다.  

--8<-- "openstack/image/delete/body.md"

## Output

``` bash title="openstack image delete 04cd3672-1f97-4e98-bfe0-0d4801d88a8e"
none
```

??? quote "/var/log/requests.log"
    ``` text title="" linenums="1"
    --8<-- "openstack/image/delete/log.md"
    ```
