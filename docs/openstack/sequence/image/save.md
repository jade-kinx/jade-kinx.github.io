# openstack image save

`id` 또는 `name`에 해당하는 이미지를 다운로드한다.

OpenStack Command Line Client 참고: [openstack image save](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-save)



## OpenStack Client Command

``` bash title="python3-openstackclient command"
$ openstack image save --file cirros-0.5.2-x86_64-disk.img 9c31f2c6-f22c-440e-b670-d8d5a5cc0405
```

``` json title="configuration .vscode/launch.json"
{
    "name": "Python: openstack image save",
    "type": "python",
    "request": "launch",
    "program": "Scripts/openstack.exe",
    "args": ["image", "save", "--file", "cirros-0.5.2-x86_64-disk.img", "9c31f2c6-f22c-440e-b670-d8d5a5cc0405"],
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
  client->>glance: GET /image/v2/images/{image_id}
  glance-->>client: Response: 200 OK
  client->>glance: GET /image/v2/images/{image_id}/file
  glance-->>client: Response: 200 OK
```

이미지 다운로드 요청을 보낼 때의 시퀀스 다이어그램이다.  

각 과정에 대한 간략한 설명은 다음과 같다.   

- (1),(2)번 과정은 Identity 서비스의 버전별 EndPoint 목록을 요청하고 수신하는 과정이다.  
- (3),(4)번 과정은 Identity 서비스에 Access Token 발급 및 서비스 EndPoint의 카탈로그를 요청하고 수신하는 과정이다.  
- (5),(6)번 과정은 Image 서비스에 버전별 EndPoint 목록을 요청하고 수신하는 과정이다.  
- (7),(8)번 과정은 Image 서비스에 이미지 상세 정보를 요청하고 결과를 수신하는 과정이다.  
- (9),(10)번 과정은 Image 서비스로부터 이미지 파일을 다운로드 받는 과정이다.  

## Request/Response

!!! note
    (1)-(6)의 과정은 [image create](./create.md) 과정과 동일하므로, 여기서는 생략한다.


### (7) GET /image/v2/images/{image_id}

`GET` 메소드로 `/image/v2/images` API에 `id`로 이미지 목록을 요청한다.  

=== "Header"
    ``` http title="GET http://182.161.114.101/image/v2/images/9c31f2c6-f22c-440e-b670-d8d5a5cc0405"
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjlvK5ZQSdMNtA1Z-(...생략...)_N62NoeqgH9WpS5F1ObizzCsoGKDFeahEIzyZX9UZXYZh43A
    ```
    
=== "Body"
    ``` json title=""
    none
    ```

### (8) 200 OK /image/v2/images/{image_id}

`Body`에서 이미지 상세 정보를 확인할 수 있다.  

=== "Header"
    ``` http title="200 OK http://182.161.114.101/image/v2/images/9c31f2c6-f22c-440e-b670-d8d5a5cc0405"
    Date: Mon, 12 Dec 2022 09:22:02 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Length: 976
    Content-Type: application/json
    x-openstack-request-id: req-c8a97702-5a6b-42cc-a9d6-9dd678120668
    Connection: close
    ```
    
=== "Body"
    ``` json title="" hl_lines="26"
    {
    "hw_rng_model": "virtio",
    "owner_specified.openstack.md5": "",
    "owner_specified.openstack.object": "images/cirros-0.5.2-x86_64-disk",
    "owner_specified.openstack.sha256": "",
    "name": "cirros-0.5.2-x86_64-disk",
    "disk_format": "qcow2",
    "container_format": "bare",
    "visibility": "public",
    "size": 16300544,
    "virtual_size": 117440512,
    "status": "active",
    "checksum": "b874c39491a2377b8490f5f1e89761a4",
    "protected": false,
    "min_ram": 0,
    "min_disk": 0,
    "owner": "a5362cbd04fd4783a038d5a342d58e87",
    "os_hidden": false,
    "os_hash_algo": "sha512",
    "os_hash_value": "6b813aa46bb90b4da216a4d19376593fa3f4fc7e617f03a92b7fe11e9a3981cbe8f0959dbebe36225e5f53dc4492341a4863cac4ed1ee0909f3fc78ef9c3e869",
    "id": "9c31f2c6-f22c-440e-b670-d8d5a5cc0405",
    "created_at": "2022-12-06T04:47:33Z",
    "updated_at": "2022-12-06T04:47:36Z",
    "tags": [],
    "self": "/v2/images/9c31f2c6-f22c-440e-b670-d8d5a5cc0405",
    "file": "/v2/images/9c31f2c6-f22c-440e-b670-d8d5a5cc0405/file",
    "schema": "/v2/schemas/image"
    }    
    ```

### (9) GET /image/v2/images/{image_id}/file

=== "Header"
    ``` http title="GET http://182.161.114.101/image/v2/images/9c31f2c6-f22c-440e-b670-d8d5a5cc0405/file" hl_lines="1 5"
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjlvK5ZQSdMNtA1Z-(...생략...)_N62NoeqgH9WpS5F1ObizzCsoGKDFeahEIzyZX9UZXYZh43A
    ```
    
=== "Body"
    ``` http title=""
    none
    ```

(8)에서 얻은 `file` 접근 경로에 `GET`메소드로 파일 다운로드를 요청한다. (인증 토큰 필요)  


### (10) 200 OK /image/v2/images/{image_id}/file

=== "Header"
    ``` http title="200 OK http://182.161.114.101/image/v2/images/9c31f2c6-f22c-440e-b670-d8d5a5cc0405/file" hl_lines="3"
    Date: Mon, 12 Dec 2022 09:22:02 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/octet-stream
    Content-MD5: b874c39491a2377b8490f5f1e89761a4
    Content-Length: 16300544
    x-openstack-request-id: req-fbe22ca5-88c3-4b25-8a9c-5253c0ead030
    Connection: close
    ```
    
=== "Body"
    ``` http title=""
    {image file byte stream} (...여기서는 생략...)
    ```

`Content-Type`은 `octet-stream` 형식이고, `Body`에 이미지 파일 바이트 스트림이 포함되어 응답된다.

!!! note
    현재 환경은 `glance-store` back-end가 `Swift`로 구성되어 있다.  
    `glance-api`가 `Swift`로부터 이미지 파일을 다운로드 받아와서(혹은 캐싱?), 클라이언트에 전송하여 주는 것으로 보인다.  
    `glance-api` 디버깅을 통해 확인해 보자  

