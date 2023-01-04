# openstack image show

이미지 상세 정보를 조회하는 `openstack image show` 커맨드를 이용하여 이미지 상세 정보를 조회, 그 과정에서 발생하는 API 요청 시퀀스 다이어그램을 작성해보고 Request/Response를 분석해 본다.  

* `id` 또는 `name`으로 이미지 정보를 조회(여기서는 `id`로 조회)

## Openstack CLI Command & Output

??? example "openstack image show a42bfade-78ec-4c95-b7b4-272ba265072c --format json"
    !!! tip ""
        :material-console:{ .md-cli } [openstack image show](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-show)
    ``` json title="Console Output" linenums="1"
    {
      "checksum": "0c839612eb3f2469420f2ccae990827f",
      "container_format": "bare",
      "created_at": "2023-01-02T06:29:17Z",
      "disk_format": "qcow2",
      "file": "/v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file",
      "id": "a42bfade-78ec-4c95-b7b4-272ba265072c",
      "min_disk": 0,
      "min_ram": 0,
      "name": "cirros-0.6.1-x86_64-disk",
      "owner": "de5af600557d44d0996e667499376dbb",
      "properties": {
        "os_hidden": false,
        "os_hash_algo": "sha512",
        "os_hash_value": "df88bac2791254f68941229792539621516bd480aa3d6fe4c0ca16057393d024a4944d644959f323dc01a25e3417c0b581776ab3c8db8da542039f2a67230579",
        "owner_specified.openstack.md5": "",
        "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-disk",
        "owner_specified.openstack.sha256": ""
      },
      "protected": false,
      "schema": "/v2/schemas/image",
      "size": 21233664,
      "status": "active",
      "tags": [],
      "updated_at": "2023-01-02T06:29:33Z",
      "virtual_size": 117440512,
      "visibility": "public"
    }
    ```

## Sequence Diagram

`openstack image show ...` 커맨드를 이용한 이미지 상세 정보 조회 과정은 아래의 시퀀스 다이어그램으로 표현할 수 있다.  

``` mermaid
sequenceDiagram
    autonumber
    --8<-- "openstack/image/show/diagram.md"
```

각 과정에 대한 간략한 설명은 다음과 같다.   

- `openstack-client`가 `keystone` 서비스에 인증 정보(`credential:password`)를 보내 인증 토큰 발급 및 서비스 카탈로그를 수신한다. `(1-4)`
- `a42bfade-78ec-4c95-b7b4-272ba265072c` `id`로 이미지 상세 정보를 요청한다. `(5)`
- `(5)` 요청에 대해 사용자 인증 토큰을 체크한다. `(6-7)`
- `a42bfade-78ec-4c95-b7b4-272ba265072c` 이미지의 상세 정보를 응답한다. `(8)`

!!! note "이미지 이름으로 조회를 요청하면..."
    만약 이미지의 `id`가 아닌 `name`으로 요청하게 되면(`cirros-0.6.1-x86_64-disk`) `(5)` 과정에서 `GET /v2/images/cirros-0.6.1-x86_64-disk` 로 요청을 보내고
    이 요청은 `404 Not Found` 에러를 응답받게 된다.  
    이때 `openstack-client`는 입력 값을 `name`으로 인식하여 `GET /v2/images?name=cirros-0.6.1-x86_64-disk` 으로 요청한다.  
    즉, `openstack-client`는 입력 받은 이미지를 `id`로 우선 인식하여 요청하고, 실패하면 `name`으로 인식하여 요청한다.  

## Request / Response
--8<-- "openstack/image/show/body.md"

## Full Logs

??? quote "/var/log/requestshook/requestshook.log"
    ``` text title="" linenums="1"
    --8<-- "openstack/image/show/log.md"
    ```
