# openstack image list

입력 조건에 맞는 이미지 목록을 출력한다.

OpenStack Command Line Client 참고: [openstack image list](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-list)



## OpenStack Client Command

``` bash title="python3-openstackclient command"
$ openstack image list --all
```

``` json title="configuration .vscode/launch.json"
{
    "name": "Python: openstack image list",
    "type": "python",
    "request": "launch",
    "program": "Scripts/openstack.exe",
    "args": ["image", "list", "--all"],
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
  client->>glance: GET http://182.161.114.101/image/v2/images?visibility=all
  glance-->>client: Response: 200 OK
```

이미지 목록 요청을 보낼 때의 시퀀스 다이어그램이다.  

각 과정에 대한 간략한 설명은 다음과 같다.   
(1),(2)번 과정은 Identity 서비스의 버전별 EndPoint 목록을 요청하고 수신하는 과정이다.  
(3),(4)번 과정은 Identity 서비스에 Access Token 발급 및 서비스 EndPoint의 카탈로그를 요청하고 수신하는 과정이다.  
(5),(6)번 과정은 Image 서비스에 버전별 EndPoint 목록을 요청하고 수신하는 과정이다.  
(7),(8)번 과정은 Image 서비스에 이미지 목록을 요청하고 결과를 수신하는 과정이다.

## Request/Response

!!! note
    (1)-(6)의 과정은 [image create](./create.md) 과정과 동일하므로, 여기서는 생략한다.


### (7) GET http://182.161.114.101/image/v2/images?visibility=all

`GET` 메소드로 `/image/v2/images` API 에 요청하여 이미지 목록을 요청한다.  
이미지 목록 조회 조건은 [image list API](https://docs.openstack.org/api-ref/image/v2/index.html?expanded=list-images-detail#list-images) 에서 자세히 확인할 수 있다.  

=== "Header"
    ``` http title=""
    GET http://182.161.114.101/image/v2/images?visibility=all
    User-Agent: openstacksdk/0.103.0 keystoneauth1/5.1.0 python-requests/2.28.1 CPython/3.11.0
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Auth-Token: gAAAAABjluGzMFdSPZP0yZ1iDNPCDP51zsAlKUtw4h-(...생략...)_SQ7ggcw6BATS6rbi_4
    ```
    
=== "Body"
    ``` http title=""
    none
    ```

### (8) 200 OK

`Body`에서 `cirros-0.5.1-x86_64-disk`, `cirros-0.5.2-x86_64-disk`, `trove-guest-ubuntu-focal` 3개의 이미지가 등록된 것을 확인할 수 있다.  

=== "Header"
    ``` http title=""
    200 OK http://182.161.114.101/image/v2/images?visibility=all
    Date: Mon, 12 Dec 2022 08:09:23 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Length: 3000
    Content-Type: application/json
    x-openstack-request-id: req-d0178a61-46a8-4b61-bd57-71013b1babd4
    Connection: close
    ```
    
=== "Body"
    ``` json title=""
    {
    "images": [
        {
        "owner_specified.openstack.md5": "",
        "owner_specified.openstack.object": "images/cirros-0.5.1-x86_64-disk",
        "owner_specified.openstack.sha256": "",
        "name": "cirros-0.5.1-x86_64-disk",
        "disk_format": "qcow2",
        "container_format": "bare",
        "visibility": "public",
        "size": 16338944,
        "virtual_size": 117440512,
        "status": "active",
        "checksum": "1d3062cd89af34e419f7100277f38b2b",
        "protected": false,
        "min_ram": 0,
        "min_disk": 0,
        "owner": "a5362cbd04fd4783a038d5a342d58e87",
        "os_hidden": false,
        "os_hash_algo": "sha512",
        "os_hash_value": "553d220ed58cfee7dafe003c446a9f197ab5edf8ffc09396c74187cf83873c877e7ae041cb80f3b91489acf687183adcd689b53b38e3ddd22e627e7f98a09c46",
        "id": "a3f1a9d6-0c54-47f7-96ca-641786ea5d68",
        "created_at": "2022-12-07T02:33:29Z",
        "updated_at": "2022-12-07T02:33:31Z",
        "tags": [],
        "self": "/v2/images/a3f1a9d6-0c54-47f7-96ca-641786ea5d68",
        "file": "/v2/images/a3f1a9d6-0c54-47f7-96ca-641786ea5d68/file",
        "schema": "/v2/schemas/image"
        },
        {
        "hw_rng_model": "virtio",
        "owner_specified.openstack.md5": "",
        "owner_specified.openstack.object": "images/trove-guest-ubuntu-focal",
        "owner_specified.openstack.sha256": "",
        "name": "trove-guest-ubuntu-focal",
        "disk_format": "qcow2",
        "container_format": "bare",
        "visibility": "shared",
        "size": 1033043968,
        "virtual_size": 5368709120,
        "status": "active",
        "checksum": "a68f5d086d6dd6cbe341dee9911412c8",
        "protected": false,
        "min_ram": 0,
        "min_disk": 0,
        "owner": "3a16cadd069e4a70b95f71316ec6f3e8",
        "os_hidden": false,
        "os_hash_algo": "sha512",
        "os_hash_value": "50e0e621db571157f5962cefeb9181cf93e9007ff023dbac31d66bf5eb50d51ba53c5634d4dfaf78fbdba631413f0b81cc216d26640c2d540aeedb6a59b839b4",
        "id": "53713cd4-241d-4b87-8dee-7619615f05e3",
        "created_at": "2022-12-06T05:20:41Z",
        "updated_at": "2022-12-06T05:22:31Z",
        "tags": [
            "trove"
        ],
        "self": "/v2/images/53713cd4-241d-4b87-8dee-7619615f05e3",
        "file": "/v2/images/53713cd4-241d-4b87-8dee-7619615f05e3/file",
        "schema": "/v2/schemas/image"
        },
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
    ],
    "first": "/v2/images?visibility=all",
    "schema": "/v2/schemas/images"
    }
    ```

## Output

``` text title="table format"
+--------------------------------------+--------------------------+--------+
| ID                                   | Name                     | Status |
+--------------------------------------+--------------------------+--------+
| a3f1a9d6-0c54-47f7-96ca-641786ea5d68 | cirros-0.5.1-x86_64-disk | active |
| 9c31f2c6-f22c-440e-b670-d8d5a5cc0405 | cirros-0.5.2-x86_64-disk | active |
| 53713cd4-241d-4b87-8dee-7619615f05e3 | trove-guest-ubuntu-focal | active |
+--------------------------------------+--------------------------+--------+
```
