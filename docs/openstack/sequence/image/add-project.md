# openstack image add project

`add project`, `remove project`, `member list` 커맨드는 이미지 공유와 관련된 기능이다.  
이미지는 `visibility=shared` 일때만, 이미지 공유가 가능하며, 공유 단위는 프로젝트 단위이다.  

| 커맨드 | 설명 |
| :---: | :----: |
| `add project` | 이미지를 사용할 수 있는 멤버 목록에 프로젝트를 추가한다 |
| `remove project` | 이미지를 사용할 수 있는 멤버 목록에서 프로젝트를 제거한다 |
| `member list` | 이미지를 사용할 수 있는 멤버 목록을 출력한다 |

OpenStack Command Line Client 참고: [openstack image add project](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-add-project)

!!! note
    * 프로젝트 `demo`의 ID는 `d34b18d2e5934d7d84900220483ad8b7`
    * 이미지 `cirros-0.6.1-x86_64-disk`의 ID는 `9faa6fd5-b254-4184-80c0-66b7c062315e`
    * `ID` 대신 `name` 값을 사용해도 되지만, `ID`를 우선으로 조회하기 때문에 불필요한 시퀀스 방지를 위해 여기서는 `ID`를 사용한다.

!!! note
    대상 이미지의 `visibility`가 `shared` 상태가 아니라면, `403 Forbidden: Not allowed to create members for image ...` 등의 에러 메세지와 함께 실패한다. 

## OpenStack Client Command

``` bash title="python3-openstackclient command"
# cirros-0.6.1-x86_64-disk 이미지에 demo 프로젝트를 멤버로 추가
$ openstack image add project 9faa6fd5-b254-4184-80c0-66b7c062315e d34b18d2e5934d7d84900220483ad8b7
```

``` json title="configuration .vscode/launch.json"
{
    "name": "Python: openstack image add project",
    "type": "python",
    "request": "launch",
    "program": "Scripts/openstack.exe",
    "args": ["image", "add", "project", "9faa6fd5-b254-4184-80c0-66b7c062315e", "d34b18d2e5934d7d84900220483ad8b7"],
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

위 명령어를 실행했을 때의 Request/Response Sequence Diagram 및 내용은 다음과 같다.

## Sequence Diagram

``` mermaid
sequenceDiagram
  autonumber
  participant client as openstack-client
  participant keystone as keystone-api
  participant glance as glance-api
  client->>keystone: GET /identity
  keystone-->>client: Response: 300 MULTIPLE CHOICES
  client->>keystone: POST /identity/v3/auth/tokens
  keystone-->>client: Response: 201 CREATED
  client->>glance: GET /image
  glance-->>client: Response: 300 Multiple Choices
  %% 여기까진 거의 동일
  client->>glance: GET /image/v2/images/{image_id}
  glance-->>client: Response: 200 OK
  client->>glance: POST /image/v2/images/{image_id}/members
  glance-->>client: Response: 200 OK
```

`cirros-0.6.1-x86_64-disk` 이미지를 `demo` 프로젝트가 사용할 수 있도록 멤버 추가했을때의 과정이다.  

각 과정에 대한 간략한 설명은 다음과 같다.   

- (1),(2)번 과정은 Identity 서비스의 버전별 EndPoint 목록을 요청하고 수신하는 과정이다.  
- (3),(4)번 과정은 Identity 서비스에 Access Token 발급 및 서비스 EndPoint의 카탈로그를 요청하고 수신하는 과정이다.  
- (5),(6)번 과정은 Image 서비스에 버전별 EndPoint 목록을 요청하고 수신하는 과정이다.  
- (7),(8)번 과정은 이미지 정보를 확인하는 과정이다.  
- (9),(10)번 과정은 이미지를 프로젝트가 사용할 수 있도록 멤버 추가하는 과정이다.  

!!! info
    만약, Image API `EndPoint`, `project id`, `image id` 정보 등을 모두 알고 있다면, (1)-(8) 과정은 생략하고, 바로 (9),(10) 단계를 수행해도 무방하다.

## Request/Response

!!! note
    (1)-(6)의 과정은 [image create](./create.md) 과정과 동일하므로, 여기서는 생략한다.

### (7) GET /image/v2/images/{image_id}

주어진 이미지 `ID`로 이미지 정보를 조회한다.  
`python-openstackclient`가 이 과정을 수행하는 이유는 주어진 값이 `ID`값인지 확인하기 위한 용도로 보인다.  
`ID`값을 명확하게 알고 있다면, 이 과정은 생략하고 (9),(10)번 과정을 바로 수행해도 무방해 보인다.  

=== "Header"
    ``` http title="GET http://182.161.114.101/image/v2/images/9faa6fd5-b254-4184-80c0-66b7c062315e"
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjmQ2DBOk_(...생략...)_vl8aIernRwlZm4DP5YH8dtnBIFTzMKjXDygQNIjUSYouzqk3hFjMBh5Dr0E9XqM4Bj8S7O0
    ```
    
=== "Body"
    ``` json title=""
    none
    ```

### (8) 200 OK /image/v2/images/{image_id}

`cirros-0.6.1-x86_64-disk` 이미지의 상세 정보를 수신.  
주어진 값이 `ID`값이라는 것을 확인( 만약, 커맨드 인자에 `name`값이 주어지면 이 요청은 실패하고, `/v2/images?name={name}`으로 `ID`를 조회하고 이 과정을 다시 한번 거친다 )

=== "Header"
    ``` http title="200 OK http://182.161.114.101/image/v2/images/9faa6fd5-b254-4184-80c0-66b7c062315e"
    Date: Tue, 13 Dec 2022 23:40:51 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Length: 950
    Content-Type: application/json
    x-openstack-request-id: req-a016d11c-0b5a-44ce-9cc1-a49706586120
    Connection: close
    ```
    
=== "Body"
    ``` json title="" hl_lines="8 20"
    {
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-disk",
      "owner_specified.openstack.sha256": "",
      "name": "cirros-0.6.1-x86_64-disk",
      "disk_format": "qcow2",
      "container_format": "bare",
      "visibility": "shared",
      "size": 21233664,
      "virtual_size": 117440512,
      "status": "active",
      "checksum": "0c839612eb3f2469420f2ccae990827f",
      "protected": false,
      "min_ram": 0,
      "min_disk": 0,
      "owner": "a5362cbd04fd4783a038d5a342d58e87",
      "os_hidden": false,
      "os_hash_algo": "sha512",
      "os_hash_value": "df88bac2791254f68941229792539621516bd480aa3d6fe4c0ca16057393d024a4944d644959f323dc01a25e3417c0b581776ab3c8db8da542039f2a67230579",
      "id": "9faa6fd5-b254-4184-80c0-66b7c062315e",
      "created_at": "2022-12-13T08:35:27Z",
      "updated_at": "2022-12-13T23:40:26Z",
      "tags": [],
      "self": "/v2/images/9faa6fd5-b254-4184-80c0-66b7c062315e",
      "file": "/v2/images/9faa6fd5-b254-4184-80c0-66b7c062315e/file",
      "schema": "/v2/schemas/image"
    }
    ```

### (9) POST /image/v2/images/{image_id}/members

이미지에 프로젝트를 사용자로 추가  
`Body`에 `demo` 프로젝트 `ID` 를 입력하고 있는 것을 확인할 수 있다.  

=== "Header"
    ``` http title="POST http://182.161.114.101/image/v2/images/9faa6fd5-b254-4184-80c0-66b7c062315e/members"
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjmQ2DBOk_(...생략...)_vl8aIernRwlZm4DP5YH8dtnBIFTzMKjXDygQNIjUSYouzqk3hFjMBh5Dr0E9XqM4Bj8S7O0
    Content-Type: application/json
    Content-Length: 46
    ```
    
=== "Body"
    ``` json title=""
    {
      "member": "d34b18d2e5934d7d84900220483ad8b7"
    }    
    ```

### (10) 200 OK /image/v2/images/{image_id}/members

성공적으로 추가된 경우 `200 OK`  
`Body`에는 `image_id`, `member_id`, `status` 항목이 포함되어 있다.  


=== "Header"
    ``` http title="200 OK http://182.161.114.101/image/v2/images/9faa6fd5-b254-4184-80c0-66b7c062315e/members"
    Date: Tue, 13 Dec 2022 23:40:52 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Length: 230
    Content-Type: application/json
    x-openstack-request-id: req-4b7b5ea0-2900-4ee7-b2bc-97f6469ade4b
    Connection: close
    ```
    
=== "Body"
    ``` json title="" hl_lines="4"
    {
      "member_id": "d34b18d2e5934d7d84900220483ad8b7",
      "image_id": "9faa6fd5-b254-4184-80c0-66b7c062315e",
      "status": "pending",
      "created_at": "2022-12-13T23:40:52Z",
      "updated_at": "2022-12-13T23:40:52Z",
      "schema": "/v2/schemas/member"
    }
    ```



## Output

``` text title="table format"
+------------+--------------------------------------+
| Field      | Value                                |
+------------+--------------------------------------+
| created_at | 2022-12-13T23:40:52Z                 |
| image_id   | 9faa6fd5-b254-4184-80c0-66b7c062315e |
| member_id  | d34b18d2e5934d7d84900220483ad8b7     |
| schema     | /v2/schemas/member                   |
| status     | pending                              |
| updated_at | 2022-12-13T23:40:52Z                 |
+------------+--------------------------------------+
```


!!! note
    이미지에 멤버를 추가하면, `status`는 `pending` 상태이다.  
    이때, 해당 프로젝트의 소유자가 `openstack image set --accept <image>` 커맨드를 통해 공유 요청에 대한 수락을 해야 `status`가 `accepted` 상태가 되고, 해당 프로젝트에서 사용가능해 진다.      