# openstack image create

이미지를 생성하고 업로드한다.

OpenStack Command Line Client 참고: [openstack image create](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-create)



## OpenStack Client Command

``` bash title="python3-openstackclient command"
$ openstack image create \
  --disk-format qcow2 \
  --file cirros-0.6.1-x86_64-disk.qcow2 \
  --public \
  cirros-0.6.1-x86_64-disk
```

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
  client->>glance: POST /image/v2/images
  glance-->>client: Response: 201 Created
  Note right of glance: status: queued
  client->>glance: PUT /image/v2/images/{image_id}/file
  glance-->>client: Response: 204 No Content
  Note right of glance: status: active
```

이미지 서비스에 qcow2 포맷의 로컬 이미지 파일 등록 요청을 보낼 때의 시퀀스 다이어그램이다.  

각 과정에 대한 간략한 설명은 다음과 같다.   

- (1),(2)번 과정은 Identity 서비스의 버전별 EndPoint 목록을 요청하고 수신하는 과정이다.  
- (3),(4)번 과정은 Identity 서비스에 Access Token 발급 및 서비스 EndPoint의 카탈로그를 요청하고 수신하는 과정이다.  
- (5),(6)번 과정은 Image 서비스에 버전별 EndPoint 목록을 요청하고 수신하는 과정이다.  
- (7),(8)번 과정은 Image 서비스에 새로운 이미지 생성을 요청하고, 결과를 수신하는 과정이다. 이때는 아직 이미지 파일은 업로드 하지 않음  
- (9),(10)번 과정은 (7),(8)번 과정에서 생성한 이미지에 대해 실제 파일을 업로드 하는 과정이다.  

!!! note
    `devstack-debug`는 로컬머신의 호스트에 등록된 호스트 이름이고, `182.161.114.101`은 EndPoint에 등록된 URL이며 두 아이피는 동일하다.  

!!! note
    (1),(2)번 과정은 Identity 서비스의 버전별 EndPoint 목록을 요청하는 과정이고, (5),(6)번 과정은 Image 서비스의 버전별 EndPoint 목록을 요청하는 과정이다.  
    만약, 두 EndPoint URL을 정확히 알고 있다면, (1),(2), (5),(6) 과정은 생략해도 무방해 보인다.

## Request/Response

### (1) GET /identity

환경변수 `OS_AUTH_URL` 에 정의된 URL(`http://devstack-debug/identity`)로 Identity 서비스의 버전별 EndPoint 목록을 요청한다.  
이 요청에 대한 결과로 받은 EndPoint 중 적당한 EndPoint를 선택하여 Access Token 발급 및 서비스 API 카탈로그를 요청하게 된다.  

=== "Header"
    ``` http title="GET http://devstack-debug/identity"
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    ```
    
=== "Body"
    ``` json title=""
    none
    ```


### (2) 300 MULTIPLE CHOICES /identity

(1)번 요청에 대한 응답이다.  
`Body`의 내용을 통해 Identity 서비스의 EndPoint 는 현재 `v3.14` 버전이며, url은 `http://182.161.114.101/identity/v3/` 인 것을 확인할 수 있다.  

=== "Header"
    ``` http title="300 MULTIPLE CHOICES http://devstack-debug/identity"
    Date: Mon, 12 Dec 2022 01:50:37 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 274
    Location: http://182.161.114.101/identity/v3/
    Vary: X-Auth-Token
    x-openstack-request-id: req-89b1fc00-a931-4115-921a-f380c0eb3a5e
    Connection: close
    ```

=== "Body"
    ``` json title="" hl_lines="5 11"
    DATA={
        "versions": {
          "values": [
            {
              "id": "v3.14",
              "status": "stable",
              "updated": "2020-04-07T00:00:00Z",
              "links": [
                {
                  "rel": "self",
                  "href": "http://182.161.114.101/identity/v3/"
                }
              ],
              "media-types": [
                {
                  "base": "application/json",
                  "type": "application/vnd.openstack.identity-v3+json"
                }
              ]
            }
          ]
        }
      }
    ```


### (3) POST /identity/v3/auth/tokens

`Access Token` 발급 및 `서비스 카탈로그` 요청한다.  
`Body`는 `admin` 사용자가 `admin` 프로젝트 스코프로 `패스워드` 방식으로(패스워드=`asdf`) 인증 요청을 담고 있다.  

=== "Header"
    ``` http title="POST http://devstack-debug/identity/v3/auth/tokens"
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 213
    ```

=== "Body"
    ``` json title="" hl_lines="5 9 10 19"
    DATA={
        "auth": {
          "identity": {
            "methods": [
              "password"
            ],
            "password": {
              "user": {
                "password": "asdf",
                "name": "admin",
                "domain": {
                  "name": "Default"
                }
              }
            }
          },
          "scope": {
            "project": {
              "name": "admin",
              "domain": {
                "name": "Default"
              }
            }
          }
        }
      }
    ```

!!! question
    (1),(2) 과정에서 얻은 EndPoint인 `http://182.161.114.101/identity/v3/` 를 사용하지 않고 `http://devstack-debug/identity/v3`를 사용하고 있다.  
    `OS_AUTH_URL`, `OS_IDENTITY_API_VERSION` 환경변수를 이용해서 조합할 수 있는데, 굳이 왜???


### (4) 201 CREATED /identity/v3/auth/tokens

토큰 발급 요청이 성공하면, Response Header에 `X-Subject-Token` 이름으로 Access Token이 발급된다.  
`Body`에는 `user` 정보, `project` 정보, `roles` 정보, `catalog` 정보가 포함되어 있다.  

=== "Header"
    ``` http title="201 CREATED http://devstack-debug/identity/v3/auth/tokens" hl_lines="5"
    Date: Mon, 12 Dec 2022 01:50:37 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 3952
    X-Subject-Token: gAAAAABjlojt_5WhRbMxsZ-XWUAJH1TVQ2KWPevN05_(...생략...)_U1u3Fw4z0MjW0NkiS-9vPYG3-plbIbI
    Vary: X-Auth-Token
    x-openstack-request-id: req-3e2c9470-8d63-4fba-a379-230a81ad41a2
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1" hl_lines="43 92 97"
    DATA={
        "token": {
          "methods": [
            "password"
          ],
          "user": {
            "domain": {
              "id": "default",
              "name": "Default"
            },
            "id": "8221f17fbf934d309ba96cf2218be3ff",
            "name": "admin",
            "password_expires_at": null
          },
          "audit_ids": [
            "SS_kCBN4T96bD_C7FCdSxw"
          ],
          "expires_at": "2022-12-12T04:50:37.000000Z",
          "issued_at": "2022-12-12T01:50:37.000000Z",
          "project": {
            "domain": {
              "id": "default",
              "name": "Default"
            },
            "id": "a5362cbd04fd4783a038d5a342d58e87",
            "name": "admin"
          },
          "is_domain": false,
          "roles": [
            {
              "id": "9ec297ce89234ce6bf2813e5e0166e4d",
              "name": "member"
            },
            {
              "id": "dbf0266266eb4ea885528545e3eb59ec",
              "name": "reader"
            },
            {
              "id": "89efad03325b4fb9a021bd88e534bbad",
              "name": "admin"
            }
          ],
          "catalog": [
            {
              "endpoints": [
                {
                  "id": "06b2a46d96e349d08631686ab53d7e83",
                  "interface": "public",
                  "region_id": "RegionOne",
                  "url": "http://182.161.114.101/compute/v2/a5362cbd04fd4783a038d5a342d58e87",
                  "region": "RegionOne"
                }
              ],
              "id": "1ca87647ab754599b632a643e5b02c7c",
              "type": "compute_legacy",
              "name": "nova_legacy"
            },
            {
              "endpoints": [
                {
                  "id": "254257a27e574069b9510cc4f218afa1",
                  "interface": "public",
                  "region_id": "RegionOne",
                  "url": "http://182.161.114.101/identity",
                  "region": "RegionOne"
                }
              ],
              "id": "2241c852ef204ee5bd4f4092ae9b5c7d",
              "type": "identity",
              "name": "keystone"
            },
            {
              "endpoints": [
                {
                  "id": "a49d989ec6dd4e8f9399cf8a5caf519b",
                  "interface": "public",
                  "region_id": "RegionOne",
                  "url": "http://182.161.114.101/volume/v3/a5362cbd04fd4783a038d5a342d58e87",
                  "region": "RegionOne"
                }
              ],
              "id": "2baac711c03b4da1abaabe4e0f0f3575",
              "type": "volumev3",
              "name": "cinderv3"
            },
            {
              "endpoints": [
                {
                  "id": "3195d06aa49541009838146ab9072997",
                  "interface": "public",
                  "region_id": "RegionOne",
                  "url": "http://182.161.114.101/image",
                  "region": "RegionOne"
                }
              ],
              "id": "4134c089d54f40c4bff6629c9b3c8b17",
              "type": "image",
              "name": "glance"
            },
            {
              "endpoints": [
                {
                  "id": "be657c3c268e49c08bb0d31aa7b79b01",
                  "interface": "public",
                  "region_id": "RegionOne",
                  "url": "http://182.161.114.101:9696/networking",
                  "region": "RegionOne"
                }
              ],
              "id": "59d326ea519d4ad58dcc784330c372a4",
              "type": "network",
              "name": "neutron"
            },
            {
              "endpoints": [
                {
                  "id": "64319e2274594aca8b7ff17be26f1306",
                  "interface": "admin",
                  "region_id": "RegionOne",
                  "url": "http://182.161.114.101:8080",
                  "region": "RegionOne"
                },
                {
                  "id": "721a5750cf0448729c85f21749859ec0",
                  "interface": "public",
                  "region_id": "RegionOne",
                  "url": "http://182.161.114.101:8080/v1/AUTH_a5362cbd04fd4783a038d5a342d58e87",
                  "region": "RegionOne"
                }
              ],
              "id": "5b4f3dd567054612914e94f37e396d05",
              "type": "object-store",
              "name": "swift"
            },
            {
              "endpoints": [
                {
                  "id": "dac7532e7f2547d59c42be1309388076",
                  "interface": "public",
                  "region_id": "RegionOne",
                  "url": "http://182.161.114.101/placement",
                  "region": "RegionOne"
                }
              ],
              "id": "5f8648439aa0443588164675566362a4",
              "type": "placement",
              "name": "placement"
            },
            {
              "endpoints": [
                {
                  "id": "0d3a0c91848845ddb1794791ceeed1db",
                  "interface": "public",
                  "region_id": "RegionOne",
                  "url": "http://182.161.114.101:8779/v1.0/a5362cbd04fd4783a038d5a342d58e87",
                  "region": "RegionOne"
                },
                {
                  "id": "d4e369995c8847d9aaeeab1824dc3a02",
                  "interface": "admin",
                  "region_id": "RegionOne",
                  "url": "http://182.161.114.101:8779/v1.0/a5362cbd04fd4783a038d5a342d58e87",
                  "region": "RegionOne"
                },
                {
                  "id": "de625690480c40878f484c10f0cc21c3",
                  "interface": "internal",
                  "region_id": "RegionOne",
                  "url": "http://182.161.114.101:8779/v1.0/a5362cbd04fd4783a038d5a342d58e87",
                  "region": "RegionOne"
                }
              ],
              "id": "985cf9347e11431bbbc8640d3c73e064",
              "type": "database",
              "name": "trove"
            },
            {
              "endpoints": [
                {
                  "id": "ce7d3f34c48d4c1a877222ca8403bcbc",
                  "interface": "public",
                  "region_id": "RegionOne",
                  "url": "http://182.161.114.101/volume/v3/a5362cbd04fd4783a038d5a342d58e87",
                  "region": "RegionOne"
                }
              ],
              "id": "ec5120d847b7457485bbbafc555df0af",
              "type": "block-storage",
              "name": "cinder"
            },
            {
              "endpoints": [
                {
                  "id": "82bfd276ae734c3788bc66159b0c6d39",
                  "interface": "public",
                  "region_id": "RegionOne",
                  "url": "http://182.161.114.101/compute/v2.1",
                  "region": "RegionOne"
                }
              ],
              "id": "fa5e4dfaffbe476c88be86bbc10f092e",
              "type": "compute",
              "name": "nova"
            }
          ]
        }
      }
    ```

서비스 `catalog` 중, 원하는 서비스 EndPoint URL을 선택하여 해당 URL로 요청을 전송하게 된다.  
`type`이 `image`인 endpoint `http://182.161.114.101/image` 를 이용하여 이미지 생성 요청을 보낼 것이다.  

### (5) GET /image

(4)과정에서 얻은 `http://182.161.114.101/image` API URL로 이미지 서비스의 버전별 API EndPoint 목록을 요청한다.  
( 이미지 서비스 API는 현재 v2.0이고, v1.0은 deprecated 되었다 )    

=== "Header"
    ``` http title="GET http://182.161.114.101/image"
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    ```

=== "Body"
    ``` json title=""
    none
    ```

### (6) 300 Multiple Choices /image

이미지 서비스의 API 버전 및 EndPoint 목록을 얻는다.  
`Body`를 통해 현재 버전이 `v2.16`이고, url은 `http://182.161.114.101/image/v2/` 임을 확인할 수 있다.  
또한, `v2.15`, `v2.14`, `v2.9`, `v2.7`, `v2.6`, `v2.5`, `v2.4`, `v2.3`, `v2.2`, `v2.1`, `v2.0` 까지 지원하고 있음을 확인할 수 있다.  

=== "Header"
    ``` http title="300 Multiple Choices http://182.161.114.101/image"
    Date: Mon, 12 Dec 2022 01:50:37 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 1347
    Connection: close
    ```

=== "Body"
    ``` json title="" hl_lines="5 9"
    DATA={
        "versions": [
          {
            "id": "v2.16",
            "status": "CURRENT",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/image/v2/"
              }
            ]
          },
          {
            "id": "v2.15",
            "status": "SUPPORTED",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/image/v2/"
              }
            ]
          },
          {
            "id": "v2.14",
            "status": "SUPPORTED",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/image/v2/"
              }
            ]
          },
          {
            "id": "v2.9",
            "status": "SUPPORTED",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/image/v2/"
              }
            ]
          },
          {
            "id": "v2.7",
            "status": "SUPPORTED",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/image/v2/"
              }
            ]
          },
          {
            "id": "v2.6",
            "status": "SUPPORTED",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/image/v2/"
              }
            ]
          },
          {
            "id": "v2.5",
            "status": "SUPPORTED",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/image/v2/"
              }
            ]
          },
          {
            "id": "v2.4",
            "status": "SUPPORTED",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/image/v2/"
              }
            ]
          },
          {
            "id": "v2.3",
            "status": "SUPPORTED",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/image/v2/"
              }
            ]
          },
          {
            "id": "v2.2",
            "status": "SUPPORTED",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/image/v2/"
              }
            ]
          },
          {
            "id": "v2.1",
            "status": "SUPPORTED",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/image/v2/"
              }
            ]
          },
          {
            "id": "v2.0",
            "status": "SUPPORTED",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/image/v2/"
              }
            ]
          }
        ]
      }
    ```


### (7) POST /image/v2/images

발급 받은 `Access Token`을 Header의 `X-Auth-Token` 항목으로 입력하여 이미지 생성을 요청한다.  
`Body`에는 `disk_format=qcow2`, `container_format=bare`, `visibility=public`, `name=cirros-0.6.1-x86_64-disk` 와 같은 이미지 정보를 포함한다.  
`container_format`은 커맨드 입력시 입력되지 않았지만, `python3-openstackclient`의 기본값인 `bare`가 자동으로 지정된다.  
이 요청은 데이터베이스에 이미지 항목을 생성한다. (id 등...) 실제 이미지 파일 업로드는 아래의 (9),(10)과정을 통해서 진행된다.   

=== "Header"
    ``` http title="POST http://182.161.114.101/image/v2/images" hl_lines="5"
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjlojt_5WhRbMxsZ-XWUAJH1TVQ2KWPevN05_(...생략...)_U1u3Fw4z0MjW0NkiS-9vPYG3-plbIbI
    Content-Type: application/json
    Content-Length: 260
    ```

=== "Body"
    ``` json title=""
    DATA={
      "disk_format": "qcow2",
      "container_format": "bare",
      "name": "cirros-0.6.1-x86_64-disk",
      "visibility": "public",
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.sha256": "",
      "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-disk"
    }
    ```

### (8) 201 Created /image/v2/images

(7)번 이미지 생성 요청에 대한 응답이다.  
`Body`에는 이미지에 대한 정보를 포함하고 있고, `status`가 `queued` 상태임을 확인할 수 있다.  

=== "Header"
    ``` http title="201 Created http://182.161.114.101/image/v2/images"
    Date: Mon, 12 Dec 2022 01:50:37 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Length: 781
    Content-Type: application/json
    Location: http://127.0.0.1:60999/v2/images/c36393e2-6f61-433f-8ead-66e932948d98
    OpenStack-image-import-methods: glance-direct,web-download,copy-image
    x-openstack-request-id: req-f38e8cb3-5c32-41c3-9ca0-78a58c42f37c
    Connection: close
    ```

=== "Body"
    ``` json title="" hl_lines="11 25"
    DATA={
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.sha256": "",
      "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-disk",
      "name": "cirros-0.6.1-x86_64-disk",
      "disk_format": "qcow2",
      "container_format": "bare",
      "visibility": "public",
      "size": null,
      "virtual_size": null,
      "status": "queued",
      "checksum": null,
      "protected": false,
      "min_ram": 0,
      "min_disk": 0,
      "owner": "a5362cbd04fd4783a038d5a342d58e87",
      "os_hidden": false,
      "os_hash_algo": null,
      "os_hash_value": null,
      "id": "c36393e2-6f61-433f-8ead-66e932948d98",
      "created_at": "2022-12-12T01:50:39Z",
      "updated_at": "2022-12-12T01:50:39Z",
      "tags": [],
      "self": "/v2/images/c36393e2-6f61-433f-8ead-66e932948d98",
      "file": "/v2/images/c36393e2-6f61-433f-8ead-66e932948d98/file",
      "schema": "/v2/schemas/image"
    }
    ```
`status`가 `queued` 상태에서 `file` 접근 경로 `/v2/images/c36393e2-6f61-433f-8ead-66e932948d98/file` URL을 통해 이미지 파일을 업로드 할 수 있다.  


### (9) PUT /image/v2/images/{image_id}/file

`Identity` 서비스 EndPoint와 (8)과정에서 얻은 파일 접근 경로 `/v2/images/c36393e2-6f61-433f-8ead-66e932948d98/file` 를 이용하여, `PUT` 메소드로 이미지 파일을 업로드한다.  
이 과정에서 인증 토큰이 필요하고, 파일 업로드를 위해 `Content-Type`을 `application/octet-stream`으로 요청한다.  

=== "Header"
    ``` http title="PUT http://182.161.114.101/image/v2/images/c36393e2-6f61-433f-8ead-66e932948d98/file" hl_lines="5 6"
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: 
    Connection: keep-alive
    Content-Type: application/octet-stream
    X-Auth-Token: gAAAAABjlojt_5WhRbMxsZ-XWUAJH1TVQ2KWPevN05_(...생략...)_U1u3Fw4z0MjW0NkiS-9vPYG3-plbIbI
    Content-Length: 21233664
    ```

=== "Body"
    ``` http title=""
    DATA=<_io.BufferedReader name='cirros-0.6.1-x86_64-disk.qcow2'>
    ```

`body`는 `requests` 패키지의 `PreparedRequest`를 통해 파일을 업로드하고 있음을 확인할 수 있다.(파일명만 표시)  


### (10) 204 No Content /image/v2/images/{image_id}/file

파일 업로드가 성공하면 `204 No Content` 응답을 전송 받는다.  
이 과정이 완료되면, 이미지의 `status` 가 `active` 상태가 된다.  
다만, 이때 업로드된 파일의 `disk_format` 체크라거나, 올바른 이미지 형식인지 등은 별도로 검사하지 않는다.  

=== "Header"
    ``` http title="204 No Content http://182.161.114.101/image/v2/images/c36393e2-6f61-433f-8ead-66e932948d98/file"
    Date: Mon, 12 Dec 2022 01:50:38 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: text/html; charset=UTF-8
    x-openstack-request-id: req-f55c7e8d-0dd3-4e14-9f02-4c5b163bbe9d
    Connection: close
    ```

=== "Body"
    ``` http title=""
    none
    ```

`DevStack`을 `Swift`와 함께 설치한 경우, `glance-store`의 기본값은 `swift`이고, 이미지 파일은 오브젝트 스토리지에 저장된다.