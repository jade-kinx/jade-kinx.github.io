# openstack image add project

`add project`, `remove project`, `member list` 커맨드는 이미지 공유와 관련된 기능이다.  
이미지는 `visibility=shared` 일때만 이미지 공유가 가능하며, 공유 단위는 프로젝트 단위이다.  

| 커맨드 | 설명 |
| --- | ---- |
| `add project` | 이미지를 사용할 수 있는 멤버 목록에 프로젝트를 추가한다 |
| `remove project` | 이미지를 사용할 수 있는 멤버 목록에서 프로젝트를 제거한다 |
| `member list` | 이미지를 사용할 수 있는 멤버 목록을 출력한다 |

`openstack image add project` 커맨드를 이용하여 이미지에 프로젝트를 멤버로 추가해 보고, 과정을 API 시퀀스 다이어그램으로 도출하고 Request/Response를 분석해본다.  

* 여기서는 이미지 `id`와 프로젝트 `name`을 이용하여 요청을 전송해 본다.  

??? warning "이미지의 `visibility`가 `shared`가 아니면"
    이미지의 `visibility`가 `shared`가 아닌 경우, 아래와 같은 에러 메세지와 함께 요청이 실패할 수 있다.  
    ``` title=""
    HttpException: 403: Client Error for url: http://182.161.114.101/image/v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/members, Not allowed to create members for image a42bfade-78ec-4c95-b7b4-272ba265072c.: 403 Forbidden
    ```

## Openstack CLI Command & Output

!!! reference "CLI 참조"
    [openstack image add project](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-add-project)

??? example "openstack image add project a42bfade-78ec-4c95-b7b4-272ba265072c demo"
    ``` console title="cirros-0.6.1-x86_64-disk 이미지(a42bfade-78ec-4c95-b7b4-272ba265072c)에 demo 프로젝트를 멤버로 추가" linenums="1" hl_lines="6 7 9"
    $ openstack image add project a42bfade-78ec-4c95-b7b4-272ba265072c demo
    +------------+--------------------------------------+
    | Field      | Value                                |
    +------------+--------------------------------------+
    | created_at | 2023-01-02T08:16:50Z                 |
    | image_id   | a42bfade-78ec-4c95-b7b4-272ba265072c |
    | member_id  | cdb477d9329c450e996cae2d02a2c44f     |
    | schema     | /v2/schemas/member                   |
    | status     | pending                              |
    | updated_at | 2023-01-02T08:16:50Z                 |
    +------------+--------------------------------------+
    ```
    !!! note
        `a42bfade-78ec-4c95-b7b4-272ba265072c` 이미지(`cirros-0.6.1-x86_64-disk`)에 대해, `cdb477d9329c450e996cae2d02a2c44f` 프로젝트(`demo`)가 멤버로 추가되었지만 `status`가 `pending` 상태임을 확인할 수 있다.  
        프로젝트 소유자가 `openstack image set --accept {image}` 커맨드를 통해 공유 요청을 수락하거나, `PUT /v2/images/{image_id}/members/{member_id}` API를 이용하여 `status`를 `accepted` 상태로 변경해야 해당 프로젝트에서 이미지를 사용할 수 있게 된다.  


## Sequence Diagram

`openstack image add project ...` 커맨드를 이용한 이미지 멤버 추가 과정은 아래의 시퀀스 다이어그램으로 표현할 수 있다.  

``` mermaid
sequenceDiagram
    autonumber
    --8<-- "openstack/image/add-project/diagram.md"
```

각 과정에 대한 간략한 설명은 다음과 같다.   

- 사용자 인증 토큰 발급 및 서비스 카탈로그를 수신한다. `(1-4)`
- `id` 또는 `name`으로 프로젝트 상세 정보를 얻는다. `(5-8)`
- `id` 또는 `name`으로 이미지 상세 정보를 얻는다. `(9-12)`
- 이미지에 프로젝트를 멤버로 추가한다. `(13-14)`

## Request / Response

??? warning "X-Requestshook-Request-* 헤더"
    `Header` 에 포함된 `X-Requestshook-Request-Id`, `X-Requestshook-Request-From` 항목은 API Sequence 추적을 위해 `requestshook`에서 추가한 항목이며, 오픈스택에서 제공하는 정보가 아니라는 점을 주의한다.    

--8<-- "openstack/image/add-project/body.md"

## Full Log

??? quote "/var/log/requestshook/requestshook.log"
    ``` text title="" linenums="1"
    --8<-- "openstack/image/add-project/log.md"
    ```

