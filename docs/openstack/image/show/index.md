# openstack image show

이미지 상세 정보를 조회하는 `openstack image show` 커맨드를 이용하여 이미지 상세 정보를 조회, 그 과정에서 발생하는 API 요청 시퀀스 다이어그램을 작성해보고 Request/Response를 분석해 본다.  

* `id` 또는 `name`으로 이미지 정보를 조회(여기서는 `id`로 조회)

[:material-console: openstack image show](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-show)
``` bash title=""
$ openstack image show a42bfade-78ec-4c95-b7b4-272ba265072c --format json
```

## Sequence Diagram

`openstack image show a42bfade-78ec-4c95-b7b4-272ba265072c --format json` 커맨드를 이용한 이미지 상세 정보 조회 과정은 아래의 시퀀스 다이어그램으로 표현할 수 있다.  

``` mermaid
sequenceDiagram
    autonumber
    --8<-- "openstack/image/show/diagram.md"
```

각 과정에 대한 간략한 설명은 다음과 같다.   

- `openstack-client`가 `keystone` 서비스에 인증 정보(`credential:password`)를 보내 인증 토큰 발급 및 서비스 카탈로그를 수신한다. `(1-4)`

## Request / Response

!!! note
    `Header` 에 포함된 `X-Requestshook-Request-Id`, `X-Requestshook-Request-From` 항목은 API Sequence 추적을 위해 `requestshook`에서 추가한 항목이며, 오픈스택에서 제공하는 정보가 아니므로 무시한다.  

--8<-- "openstack/image/show/body.md"

## Output

``` json title="openstack image show a42bfade-78ec-4c95-b7b4-272ba265072c --format json"
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

??? quote "/var/log/requests.log"
    ``` text title="" linenums="1"
    --8<-- "openstack/image/show/log.md"
    ```
