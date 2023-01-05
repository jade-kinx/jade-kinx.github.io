# openstack image save

이미지 `id` 또는 `name`으로 이미지 파일을 다운로드하는 `openstack image save` CLI 커맨드를 이용하여 이미지를 다운로드, 그 과정에서 발생하는 API 시퀀스 다이어그램을 작성해보고 Request/Response를 분석해본다.  

* 여기서는 이미지의 `id`인 `a42bfade-78ec-4c95-b7b4-272ba265072c`를 이용하여 이미지를 다운로드한다.


## Openstack CLI Command & Output

!!! reference "CLI 참조"
    [openstack image save](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-save)

??? example "openstack image save --file cirros-0.6.1-x86_64-download.img a42bfade-78ec-4c95-b7b4-272ba265072c"
    ``` bash title="Console Output" linenums="1" hl_lines="6"
    $ openstack image save --file cirros-0.6.1-x86_64-download.img a42bfade-78ec-4c95-b7b4-272ba265072c
    $ ls -al
    total 20744
    drwxrwxr-x 2 ubuntu ubuntu     4096 Jan  5 11:46 .
    drwxr-xr-x 5 ubuntu ubuntu     4096 Jan  5 11:45 ..
    -rw-rw-r-- 1 ubuntu ubuntu 21233664 Jan  5 11:46 cirros-0.6.1-x86_64-download.img
    $
    ```
    화면 출력은 없고, `--file`로 지정한 이름(`cirros-0.6.1-x86_64-download.img`)으로 이미지 파일을 다운로드 받았다.  

## Sequence Diagram

``` mermaid
sequenceDiagram
    autonumber
    --8<-- "openstack/image/save/diagram.md"
```

각 과정에 대한 간략한 설명은 다음과 같다.   

- `openstack-client`가 `keystone` 서비스에 인증 정보를 보내 인증 토큰 발급 및 서비스 카탈로그를 수신한다. `(1-4)`  
- 입력 인자로 받은 이미지 `id`를 이용하여, 이미지 상세 정보를 요청한다. `(5)`  
- 이미지 상세 정보 요청에 대한 인증 토큰을 검증한다. `(6-7)`  
- 이미지 상세 정보를 `openstack-client`에 전달한다. `(8)`  
- 이미지 상세 정보의 다운로드 EndPoint로 이미지 파일 다운로드를 요청한다. `(9)`  
- `glance-api`가 `swift-proxy-server`에 요청하기 위한 인증 토큰을 발급 받는다. `(10-11)`  
- `glance-api`가 `swift-proxy-server`로 이미지 파일 다운로드를 요청한다. `(12)`  
- `glance-api`의 이미지 파일 다운로드 요청에 대한 인증 토큰을 검증한다. `(13-14)`  
- `swift-proxy-server` --> `glance-api` --> `openstack-client` 의 경로로 이미지 파일을 전달한다. `(15-16)`  

!!! note
    `(10-11)` 과정에서 `glance-api`가 `swift-proxy-server`에 요청할 인증 토큰을 보유하고 있다면, 이 과정은 생략된다.  


## Request / Response

!!! warning
    `Header` 에 포함된 `X-Requestshook-Request-Id`, `X-Requestshook-Request-From` 항목은 API Sequence 추적을 위해 `requestshook`에서 추가한 항목이며, 오픈스택에서 제공하는 정보가 아니라는 점을 주의한다.    

--8<-- "openstack/image/save/body.md"

## Full Log

??? quote "/var/log/requestshook/requestshook.log"
    ``` text title="" linenums="1"
    --8<-- "openstack/image/save/log.md"
    ```
