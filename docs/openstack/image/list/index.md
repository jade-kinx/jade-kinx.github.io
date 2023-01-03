# openstack image list

조건에 해당하는 이미지 목록을 조회하는 `openstack image list` CLI 커맨드를 이용하여 이미지 목록을 조회, 그 과정에서 발생하는 API 요청들의 시퀀스 다이어그램을 작성하고, Request / Response 내용을 분석해 본다.  

* `openstack image list --all` 커맨드를 이용하여 모든 이미지를 출력

[:material-console: openstack image list](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-list)
``` bash title=""
$ openstack image list --all
```

## Sequence Diagram

`openstack image list --all` 커맨드를 실행했을 때의 이미지 목록 조회 과정은 아래의 시퀀스 다이어그램으로 표현할 수 있다.  

``` mermaid
sequenceDiagram
    autonumber
    --8<-- "openstack/image/list/diagram.md"
```

각 과정에 대한 간략한 설명은 다음과 같다.   

* `openstack-client`가 `keystone` 서비스에 인증 정보를 보내 인증 토큰 발급 및 서비스 카탈로그를 수신한다. `(1-4)`
* `openstack-client`가 `glance-api` 서비스에 이미지 목록 요청을 보낸다. `(5)`
* `glance-api`의 인증 토큰이 없거나 만료된 경우, `keystone` 서비스로부터 인증 토큰을 발급 받는다. 인증 토큰을 보유하고 있는 경우, 이 과정은 생략된다. `(6-9)`  
* `(5)` 요청에 대한 사용자 인증 토큰의 검증을 요청한다. `(10-11)`
* 조회 조건을 만족하는 이미지 목록을 `openstack-client`로 응답한다. `(12)`

## Request / Response

--8<-- "openstack/image/list/body.md"

## Output

`openstack image list --all` 커맨드 실행 결과는 다음과 같다.  

``` bash title="openstack image list --all"
+--------------------------------------+--------------------------+--------+
| ID                                   | Name                     | Status |
+--------------------------------------+--------------------------+--------+
| 98b68b53-2939-474e-aab1-64a49c57e941 | cirros-0.5.2-x86_64-disk | active |
| a42bfade-78ec-4c95-b7b4-272ba265072c | cirros-0.6.1-x86_64-disk | active |
| 52223e76-ba72-46d1-b11e-89e4bce4414a | trove-guest-ubuntu-focal | active |
+--------------------------------------+--------------------------+--------+
```

??? quote "`requestshook.log` 확인"
    ``` text title="/var/log/requestshook/requestshook.log" linenums="1"
    --8<-- "openstack/image/list/log.md"
    ```
