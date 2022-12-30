# openstack image create ( with requestshook )

이미지를 생성하고 업로드한다.

!!! tip ""
    CLI 참조: [openstack image create](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-create)

## OpenStack Client Command
``` bash title="python3-openstackclient command"
$ openstack image create \
  --disk-format qcow2 \
  --file cirros-0.6.1-x86_64-disk.qcow2 \
  --public \
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
            "cirros-0.6.1-x86_64-disk"],
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

위 커맨드를 실행했을 때의 시퀀스 다이어그램 및 HTTP Request/Response 내용은 다음과 같다.  

## Sequence Diagram

``` mermaid
sequenceDiagram
    autonumber
    --8<-- "openstack/sequence/image/logs/create-diagram.md"
```

## Request / Response

--8<-- "openstack/sequence/image/logs/create-contents.md"

## Logs

??? quote "openstack image create logs"
    ``` log title="/var/log/requestshook/requestshook.log" linenums="1"
    --8<-- "openstack/sequence/image/logs/openstack-image-create-with-requestshook.log"
    ```
