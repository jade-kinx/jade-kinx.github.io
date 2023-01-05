# openstack image unset

`openstack image unset` 커맨드를 이용하여 이미지 `tag` 정보를 삭제해 보고, 그 과정을 API 시퀀스 다이어그램으로 도출하고 `Request`, `Response`를 분석해 본다.  

* `openstack image unset` 커맨드는 `tag` 정보와 `property` 정보를 삭제할 수 있다.  
* 여기서는 `tag` 정보를 삭제하여 본다. 

## Openstack CLI Command & Output

!!! reference "CLI 참조"
    [openstack image unset](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-unset)

??? example "openstack image unset --tag cirros a42bfade-78ec-4c95-b7b4-272ba265072c"
    ``` console title="Console Output" linenums="1" hl_lines="19"
    $ openstack image unset --tag cirros a42bfade-78ec-4c95-b7b4-272ba265072c
    $
    ```
    출력 결과 없음

## Sequence Diagram

``` mermaid
sequenceDiagram
    autonumber
    --8<-- "openstack/image/unset/diagram.md"
```

각 과정에 대한 간략한 설명은 다음과 같다.   

- 사용자 인증 토큰 발급 및 서비스 카탈로그를 수신한다. `(1-4)`
- 이미지 `id`로 이미지 상세 정보를 얻는다. `(5-8)`
- 이미지의 태그 정보를 제거한다. `(9-10)`


## Request / Response

??? warning "X-Requestshook-Request-* 헤더"
    `Header` 에 포함된 `X-Requestshook-Request-Id`, `X-Requestshook-Request-From` 항목은 API Sequence 추적을 위해 `requestshook`에서 추가한 항목이며, 오픈스택에서 제공하는 정보가 아니라는 점을 주의한다.    

--8<-- "openstack/image/unset/body.md"

## Full Log

??? quote "/var/log/requestshook/requestshook.log"
    ``` text title="" linenums="1"
    --8<-- "openstack/image/unset/log.md"
    ```
