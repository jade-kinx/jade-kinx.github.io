# openstack image delete

`id` 또는 `name`으로 이미지를 삭제한다.  

OpenStack Command Line Client 참고: [openstack image delete](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-delete)

## OpenStack Client Command

``` bash title="python3-openstackclient command"
$ openstack image delete cirros-0.6.1-x86_64-disk
```

``` json title="configuration .vscode/launch.json"
{
    "name": "Python: openstack image delete",
    "type": "python",
    "request": "launch",
    "program": "Scripts/openstack.exe",
    "args": ["image", "delete", "cirros-0.6.1-x86_64-disk"],
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
  client->>keystone: GET http://devstack-debug/identity
  keystone-->>client: Response: 300 MULTIPLE CHOICES
  client->>keystone: POST http://devstack-debug/identity/v3/auth/tokens
  keystone-->>client: Response: 201 CREATED
  client->>glance: GET http://182.161.114.101/image
  glance-->>client: Response: 300 Multiple Choices
  client->>glance: GET http://182.161.114.101/image/v2/images/cirros-0.6.1-x86_64-disk
  glance-->>client: Response: 404 Not Found
  client->>glance: GET http://182.161.114.101/image/v2/images?name=cirros-0.6.1-x86_64-disk
  glance-->>client: Response: 200 OK
  client->>glance: DELETE http://182.161.114.101/image/v2/images/057e34b9-720e-4e1d-903d-5ecfdc67aa77
  glance-->>client: Response: 204 No Content
```

이미지 삭제 요청을 보낼 때의 시퀀스 다이어그램이다.  


각 과정에 대한 간략한 설명은 다음과 같다.  
(1),(2)번 과정은 Identity 서비스의 버전별 EndPoint 목록을 요청하고 수신하는 과정이다.  
(3),(4)번 과정은 Identity 서비스에 Access Token 발급 및 서비스 EndPoint의 카탈로그를 요청하고 수신하는 과정이다.  
(5),(6)번 과정은 Image 서비스에 버전별 EndPoint 목록을 요청하고 수신하는 과정이다.  
(7),(8)번 과정은 이미지 정보를 확인하는 과정이다. 입력 인자로 이미지 `name` 을 사용하였기 때문에, 여기서는 `404 Not Found`가 발생한다.  
(9),(10)번 과정은 (7),(8)번 과정이 실패하였기 때문에, `name`으로 이미지 정보를 다시 한번 확인한다.  
(11),(12)번 과정은 Image 서비스에 이미지 삭제를 요청하고, 결과를 수신하는 과정이다.  

## Request/Response

!!! note
    (1)-(6)의 과정은 [image create](./create.md) 과정과 동일하므로, 여기서는 생략한다.


### (7) GET http://182.161.114.101/image/v2/images/cirros-0.6.1-x86_64-disk

입력 인자로 받은 값`<image>`은 기본적으로 `id`로 간주되고, 해당 URL로 이미지 정보를 요청한다.  

=== "Header"
    ``` http title=""
    GET http://182.161.114.101/image/v2/images/cirros-0.6.1-x86_64-disk
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjltW6TCmwMOoAr6Q3DtT_(...생략...)_qDYAjHewUkFwEWk8UfjVmk
    ```
    
=== "Body"
    ``` http title=""
    none
    ```

### (8) 404 Not Found

입력 인자로 이미지의 `name` 속성을 사용하였으므로, 이 요청은 실패하고, 404 Not Found를 반환한다.

=== "Header"
    ``` http title=""
    404 Not Found http://182.161.114.101/image/v2/images/cirros-0.6.1-x86_64-disk
    Date: Mon, 12 Dec 2022 07:18:19 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Length: 169
    Content-Type: text/html; charset=UTF-8
    x-openstack-request-id: req-43031954-e6cc-483c-b16f-2bcc9539d4e2
    Connection: close
    ```
    
=== "Body"
    ``` html title=""
    <html>
    <head>
    <title>404 Not Found</title>
    </head>
    <body>
    <h1>404 Not Found</h1>
    No image found with ID cirros-0.6.1-x86_64-disk<br /><br />



    </body>
    </html>
    ```

### (9) GET http://182.161.114.101/image/v2/images?name=cirros-0.6.1-x86_64-disk

`id` 속성으로 실패한 경우, `name` 속성으로 다시 한번 요청한다.  

=== "Header"
    ``` http title=""
    GET http://182.161.114.101/image/v2/images?name=cirros-0.6.1-x86_64-disk
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Auth-Token: gAAAAABjltW6TCmwMOoAr6Q3DtT_(...생략...)_qDYAjHewUkFwEWk8UfjVmk
    ```
    
=== "Body"
    ``` html title=""
    none
    ```

### (10) 200 OK

`Body`에 이미지 파일의 정보(`id`, `file` 등)가 잘 수신되었음을 확인할 수 있다.  

=== "Header"
    ``` http title=""
    200 OK http://182.161.114.101/image/v2/images?name=cirros-0.6.1-x86_64-disk
    Date: Mon, 12 Dec 2022 07:18:19 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Length: 1049
    Content-Type: application/json
    x-openstack-request-id: req-10f2204c-a2b0-470b-8db0-cbf23ae37880
    Connection: close
    ```
    
=== "Body"
    ``` json title="" linenums="1" hl_lines="22"
    {
    "images": [
        {
        "owner_specified.openstack.md5": "",
        "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-disk",
        "owner_specified.openstack.sha256": "",
        "name": "cirros-0.6.1-x86_64-disk",
        "disk_format": "qcow2",
        "container_format": "bare",
        "visibility": "public",
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
        "id": "057e34b9-720e-4e1d-903d-5ecfdc67aa77",
        "created_at": "2022-12-12T01:51:58Z",
        "updated_at": "2022-12-12T01:52:01Z",
        "tags": [],
        "self": "/v2/images/057e34b9-720e-4e1d-903d-5ecfdc67aa77",
        "file": "/v2/images/057e34b9-720e-4e1d-903d-5ecfdc67aa77/file",
        "schema": "/v2/schemas/image"
        }
    ],
    "first": "/v2/images?name=cirros-0.6.1-x86_64-disk",
    "schema": "/v2/schemas/images"
    }
    ```

### (11) DELETE http://182.161.114.101/image/v2/images/057e34b9-720e-4e1d-903d-5ecfdc67aa77

`DELETE` 메소드를 이용하여, 이미지 삭제 요청을 보낸다.   

=== "Header"
    ``` http title=""
    DELETE http://182.161.114.101/image/v2/images/057e34b9-720e-4e1d-903d-5ecfdc67aa77
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjltW6TCmwMOoAr6Q3DtT_(...생략...)_qDYAjHewUkFwEWk8UfjVmk
    Content-Length: 0
    ```
    
=== "Body"
    ``` http title=""
    none
    ```


### (12) 204 No Content

=== "Header"
    ``` http title=""
    204 No Content http://182.161.114.101/image/v2/images/057e34b9-720e-4e1d-903d-5ecfdc67aa77
    Date: Mon, 12 Dec 2022 07:18:19 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: text/html; charset=UTF-8
    x-openstack-request-id: req-69382d31-4acf-4f42-b5af-a972b6e161f1
    Connection: close
    ```
    
=== "Body"
    ``` http title=""
    none
    ```

이미지 삭제 요청이 정상적으로 처리되었고, 이미지 파일은 `glance-store`에서도 삭제된다.(이 경우는 `Swift`)
