# openstack image remove project

`add project`, `remove project`, `member list` 커맨드는 이미지 공유와 관련된 기능이다.  
이미지는 `visibility=shared` 일때만, 이미지 공유가 가능하며, 공유 단위는 프로젝트 단위이다.  

| 커맨드 | 설명 |
| :---: | :----: |
| `add project` | 이미지를 사용할 수 있는 멤버 목록에 프로젝트를 추가한다 |
| `remove project` | 이미지를 사용할 수 있는 멤버 목록에서 프로젝트를 제거한다 |
| `member list` | 이미지를 사용할 수 있는 멤버 목록을 출력한다 |

OpenStack Command Line Client 참고: [openstack image remove project](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-remove-project)

!!! note
    * 프로젝트 `demo`의 ID는 `d34b18d2e5934d7d84900220483ad8b7`
    * 이미지 `cirros-0.6.1-x86_64-disk`의 ID는 `9faa6fd5-b254-4184-80c0-66b7c062315e`
    * `ID` 대신 `name` 값을 사용해도 되지만, `ID`를 우선으로 조회하기 때문에 불필요한 시퀀스 방지를 위해 여기서는 `ID`를 사용한다.

## OpenStack Client Command

``` bash title="python3-openstackclient command"
# cirros-0.6.1-x86_64-disk 이미지에서 demo 프로젝트를 멤버에서 제거
$ openstack image remove project 9faa6fd5-b254-4184-80c0-66b7c062315e d34b18d2e5934d7d84900220483ad8b7
```

``` json title="configuration .vscode/launch.json"
{
    "name": "Python: openstack image remove project",
    "type": "python",
    "request": "launch",
    "program": "Scripts/openstack.exe",
    "args": ["image", "remove", "project", "9faa6fd5-b254-4184-80c0-66b7c062315e", "d34b18d2e5934d7d84900220483ad8b7"],
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
  client->>keystone: GET /identity
  keystone-->>client: Response: 300 MULTIPLE CHOICES
  client->>keystone: GET /identity/v3/projects/{project_id}
  keystone-->>client: Response: 200 OK
  client->>glance: GET /image/v2/images/{image_id}
  glance-->client: 200 OK
  client->glance: DELETE /image/v2/images/{image_id}/members/{project_id}
  glance-->client: 204 No Content

```

`cirros-0.6.1-x86_64-disk` 이미지에서 `demo` 프로젝트를 멤버에서 제거했을때의 과정이다.  

각 과정에 대한 간략한 설명은 다음과 같다.   

- (1),(2)번 과정은 Identity 서비스의 버전별 EndPoint 목록을 요청하고 수신하는 과정이다.  
- (3),(4)번 과정은 Identity 서비스에 Access Token 발급 및 서비스 EndPoint의 카탈로그를 요청하고 수신하는 과정이다.  
- (5),(6)번 과정은 Image 서비스에 버전별 EndPoint 목록을 요청하고 수신하는 과정이다.  
- (7),(8)번 과정은 Identity 서비스의 버전별 EndPoint 목록을 요청하고 수신하는 과정이다.  
- (9),(10)번 과정은 Identity 서비스로부터 프로젝트 정보를 확인하는 과정이다.  
- (11),(12)번 과정은 Image 서비스로부터 이미지 정보를 확인하는 과정이다.  
- (13),(14)번 과정은 이미지 멤버 목록에서 프로젝트를 삭제하는 과정이다.  


!!! question
    (7),(8) 과정은 (1),(2)번 과정과 동일한데 왜 수행하는 거지?  


## Request/Response

!!! note
    (1)-(6)의 과정은 [image create](./create.md) 과정과 동일하므로, 여기서는 생략한다.  
    (7),(8) 과정은 (1),(2) 과정과 동일하므로 생략한다.  


### (9) GET /identity/v3/projects/{project_id}

주어진 프로젝트 `ID`로 프로젝트 정보를 조회한다.  

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/projects/d34b18d2e5934d7d84900220483ad8b7"
    User-Agent: python-keystoneclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Auth-Token: gAAAAABjmTZSBJRg_(...생략...)-lZI7uxwrih92g
    ```
    
=== "Body"
    ``` json title=""
    none
    ```

### (10) 200 OK /identity/v3/projects/{project_id}

`demo` 프로젝트의 상세 정보를 수신.  

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/projects/d34b18d2e5934d7d84900220483ad8b7"
    Date: Wed, 14 Dec 2022 02:34:58 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 302
    Vary: X-Auth-Token
    x-openstack-request-id: req-c93ce954-2452-429b-866c-cf2e85ca8116
    Connection: close
    ```
    
=== "Body"
    ``` json title=""
    {
      "project": {
          "id": "d34b18d2e5934d7d84900220483ad8b7",
          "name": "demo",
          "domain_id": "default",
          "description": "",
          "enabled": true,
          "parent_id": "default",
          "is_domain": false,
          "tags": [],
          "options": {},
          "links": {
          "self": "http://182.161.114.101/identity/v3/projects/d34b18d2e5934d7d84900220483ad8b7"
          }
      }
    }
    ```

### (11) GET /image/v2/images/{image_id}

주어진 이미지 `ID`로 이미지 상세 정보를 조회한다.  

=== "Header"
    ``` http title="GET http://182.161.114.101/image/v2/images/9faa6fd5-b254-4184-80c0-66b7c062315e"
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjmTZSBJRg_(...생략...)-lZI7uxwrih92g
    ```
    
=== "Body"
    ``` json title=""
    none
    ```

### (12) 200 OK /image/v2/images/{image_id}

`cirros-0.6.1-x86_64-disk` 이미지의 상세 정보를 수신.  

=== "Header"
    ``` http title="200 OK http://182.161.114.101/image/v2/images/9faa6fd5-b254-4184-80c0-66b7c062315e"
    Date: Wed, 14 Dec 2022 02:34:58 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Length: 950
    Content-Type: application/json
    x-openstack-request-id: req-ff09fb96-591b-468d-b81f-bed52127682f
    Connection: close
    ```
    
=== "Body"
    ``` json title="" hl_lines="4"
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
      "owner": "d34b18d2e5934d7d84900220483ad8b7",
      "os_hidden": false,
      "os_hash_algo": "sha512",
      "os_hash_value": "df88bac2791254f68941229792539621516bd480aa3d6fe4c0ca16057393d024a4944d644959f323dc01a25e3417c0b581776ab3c8db8da542039f2a67230579",
      "id": "9faa6fd5-b254-4184-80c0-66b7c062315e",
      "created_at": "2022-12-13T08:35:27Z",
      "updated_at": "2022-12-14T01:28:31Z",
      "tags": [],
      "self": "/v2/images/9faa6fd5-b254-4184-80c0-66b7c062315e",
      "file": "/v2/images/9faa6fd5-b254-4184-80c0-66b7c062315e/file",
      "schema": "/v2/schemas/image"
    }
    ```

### (13) DELETE /image/v2/images/{image_id}/members/{project_id}

`9faa6fd5-b254-4184-80c0-66b7c062315e` 이미지(`cirros-0.6.1-x86_64-disk`)에서, `d34b18d2e5934d7d84900220483ad8b7` 프로젝트(`demo`)를 멤버에서 삭제 요청한다.  


=== "Header"
    ``` http title="DELETE http://182.161.114.101/image/v2/images/9faa6fd5-b254-4184-80c0-66b7c062315e/members/d34b18d2e5934d7d84900220483ad8b7"
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjmTZSBJRg_(...생략...)-lZI7uxwrih92g
    Content-Length: 0
    ```
    
=== "Body"
    ``` json title=""
    none
    ```

### (14) 204 No Content /image/v2/images/{image_id}/members/{project_id}

정상적으로 삭제되면, 204 No Content 상태값을 반환한다.    

=== "Header"
    ``` http title="204 No Content http://182.161.114.101/image/v2/images/9faa6fd5-b254-4184-80c0-66b7c062315e/members/d34b18d2e5934d7d84900220483ad8b7"
    Date: Wed, 14 Dec 2022 02:34:58 GMT
    Server: Apache/2.4.41 (Ubuntu)
    x-openstack-request-id: req-694ecd46-14fd-4259-a0dd-1dae0a4ab1c6
    Connection: close
    ```
    
=== "Body"
    ``` json title=""
    none
    ```


## Output

``` bash title=""
none
```
