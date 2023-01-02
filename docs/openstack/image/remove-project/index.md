# openstack image remove project

`add project`, `remove project`, `member list` 커맨드는 이미지 공유와 관련된 기능이다.  
이미지는 `visibility=shared` 일때만, 이미지 공유가 가능하며, 공유 단위는 프로젝트 단위이다.  

| 커맨드 | 설명 |
| :---: | :----: |
| `add project` | 이미지를 사용할 수 있는 멤버 목록에 프로젝트를 추가한다 |
| `remove project` | 이미지를 사용할 수 있는 멤버 목록에서 프로젝트를 제거한다 |
| `member list` | 이미지를 사용할 수 있는 멤버 목록을 출력한다 |

!!! tip "CLI 참조"
    [openstack image remove project](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-remove-project)

## OpenStack Client Command
``` bash title="python3-openstackclient command"
# cirros-0.6.1-x86_64-disk 이미지에서 demo 프로젝트를 멤버에서 제거
$ openstack image remove project a42bfade-78ec-4c95-b7b4-272ba265072c cdb477d9329c450e996cae2d02a2c44f
```

??? note ".vscode/launch.json"
    ``` json title="configuration .vscode/launch.json"
    {
        "name": "Python: openstack image remove project",
        "type": "python",
        "request": "launch",
        "program": "Scripts/openstack.exe",
        "args": ["image", "remove", "project", "a42bfade-78ec-4c95-b7b4-272ba265072c", "cdb477d9329c450e996cae2d02a2c44f"],
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
    }
    ```

위 커맨드를 실행했을 때의 시퀀스 다이어그램 및 HTTP Request/Response 내용은 아래와 같다.  

## Sequence Diagram

``` mermaid
sequenceDiagram
    autonumber
    --8<-- "openstack/image/remove-project/diagram.md"
```

각 과정에 대한 간략한 설명은 다음과 같다.   

- `openstack-client`가 `keystone` 서비스에 인증 정보를 보내 인증 토큰 발급 및 서비스 카탈로그를 수신한다. `(1-4)`

## Request / Response

!!! note
    `Header` 에 포함된 `X-Requestshook-Request-Id`, `X-Requestshook-Request-From` 항목은 API Sequence 추적을 위해 `requestshook`에서 추가한 항목이며, 오픈스택에서 제공하는 정보가 아니므로 무시한다.  

--8<-- "openstack/image/remove-project/body.md"

## Output

``` bash title="openstack image remove project a42bfade-78ec-4c95-b7b4-272ba265072c cdb477d9329c450e996cae2d02a2c44f"
none
```

??? quote "/var/log/requests.log"
    ``` text title="" linenums="1"
    --8<-- "openstack/image/remove-project/log.md"
    ```
