# openstack image delete

이미지를 삭제하는 `openstack image delete` CLI 커맨드를 이용하여 이미지를 삭제하여 보고, 그 과정에서 발생하는 API 시퀀스 다이어그램을 작성해보고 `Request`, `Response`를 분석해본다.  

## Openstack CLI Command & Output

!!! reference "CLI 참조"
    [openstack image delete](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-delete)

??? example "openstack image delete 04cd3672-1f97-4e98-bfe0-0d4801d88a8e"
    ``` console title="Console Output" linenums="1" hl_lines="19"
    $ openstack image delete 04cd3672-1f97-4e98-bfe0-0d4801d88a8e
    $
    ```
    출력 결과 없음

## Sequence Diagram

``` mermaid
sequenceDiagram
    autonumber
    --8<-- "openstack/image/delete/diagram.md"
```

!!! note
    `{image_id}`: `04cd3672-1f97-4e98-bfe0-0d4801d88a8e`  
    `{account}`: `AUTH_7c4cda7e4807414bbdfcb22b535a9802`  

각 과정에 대한 간략한 설명은 다음과 같다.   

- 사용자 인증 토큰 발급 및 서비스 카탈로그를 수신한다. `(1-4)`  
- 이미지 `id`로 이미지 상제 정보를 조회한다. `(5-8)`  
- 사용자가 `glance-api`로 이미지 삭제 요청을 보낸다. `(9)`  
- `glance-api`가 `swift` 서비스에 요청할 인증 토큰을 발급 받는다. `(10-11)`
- 컨테이너 메타데이터 정보를 요청한다. `(12-15)`  
- `glance-api`의 요청으로 `swift` 서비스에 있는 이미지 파일 오브젝트를 삭제한다. `(16-17)`
- 사용자(`openstack-client`)에게 이미지가 삭제 요청 결과를 응답한다. `(18)`


## Request / Response

??? warning "X-Requestshook-Request-* 헤더"
    `Header` 에 포함된 `X-Requestshook-Request-Id`, `X-Requestshook-Request-From` 항목은 API Sequence 추적을 위해 `requestshook`에서 추가한 항목이며, 오픈스택에서 제공하는 정보가 아니라는 점을 주의한다.    

--8<-- "openstack/image/delete/body.md"

## Full Log

??? quote "/var/log/requestshook/requestshook.log"
    ``` text title="" linenums="1"
    --8<-- "openstack/image/delete/log.md"
    ```
