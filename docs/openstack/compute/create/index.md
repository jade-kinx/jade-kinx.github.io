# openstack server create

`openstack server create` 커맨드를 이용하여 VM을 생성하여 보고, 그 과정을 API 시퀀스 다이어그램으로 도출하고, `Request`, `Response`를 분석해 본다.  

## Openstack CLI Command & Output

!!! reference "CLI 참조"
    [openstack server create](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/server.html#server-create)

??? example "openstack server create ..."
    ``` console title="Console Output" linenums="1"
    $ openstack server create --flavor c1 --image da9259d0-b57f-4230-a2cf-e5bc6cedf19e --network 4529570d-57bf-4ec8-8d67-937f13b1d9ae --security-group eff69e1a-958f-4d8f-9db5-7b117f42e14d --key-name jade-public-key cirros-instance
    +-------------------------------------+-----------------------------------------------------------------+
    | Field                               | Value                                                           |
    +-------------------------------------+-----------------------------------------------------------------+
    | OS-DCF:diskConfig                   | MANUAL                                                          |
    | OS-EXT-AZ:availability_zone         |                                                                 |
    | OS-EXT-SRV-ATTR:host                | None                                                            |
    | OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                            |
    | OS-EXT-SRV-ATTR:instance_name       |                                                                 |
    | OS-EXT-STS:power_state              | NOSTATE                                                         |
    | OS-EXT-STS:task_state               | scheduling                                                      |
    | OS-EXT-STS:vm_state                 | building                                                        |
    | OS-SRV-USG:launched_at              | None                                                            |
    | OS-SRV-USG:terminated_at            | None                                                            |
    | accessIPv4                          |                                                                 |
    | accessIPv6                          |                                                                 |
    | addresses                           |                                                                 |
    | adminPass                           | kNNSdm96W6ma                                                    |
    | config_drive                        |                                                                 |
    | created                             | 2023-01-06T00:15:11Z                                            |
    | flavor                              | cirros256 (c1)                                                  |
    | hostId                              |                                                                 |
    | id                                  | 6dc2e525-a218-4814-9dc5-4cfcf2332268                            |
    | image                               | cirros-0.5.2-x86_64-disk (da9259d0-b57f-4230-a2cf-e5bc6cedf19e) |
    | key_name                            | jade-public-key                                                 |
    | name                                | cirros-instance                                                 |
    | progress                            | 0                                                               |
    | project_id                          | 67b814b10c624269b605ea8c571decdc                                |
    | properties                          |                                                                 |
    | security_groups                     | name='eff69e1a-958f-4d8f-9db5-7b117f42e14d'                     |
    | status                              | BUILD                                                           |
    | updated                             | 2023-01-06T00:15:11Z                                            |
    | user_id                             | 4349d516240540dda214bae62ae5ff48                                |
    | volumes_attached                    |                                                                 |
    +-------------------------------------+-----------------------------------------------------------------+
    ```


## Sequence Diagram

``` mermaid
sequenceDiagram
    autonumber
    --8<-- "openstack/compute/create/diagram.md"
```


!!! note 
    너무 작아서 안 보인다. 어떡할까? 쪼갤까?

## Request / Response

??? warning "X-Requestshook-Request-* 헤더"
    `Header` 에 포함된 `X-Requestshook-Request-Id`, `X-Requestshook-Request-From` 항목은 API Sequence 추적을 위해 `requestshook`에서 추가한 항목이며, 오픈스택에서 제공하는 정보가 아니라는 점을 주의한다.    

--8<-- "openstack/compute/create/body.md"

## Full Log

??? quote "/var/log/requestshook/requestshook.log"
    ``` text title="" linenums="1"
    --8<-- "openstack/compute/create/log.md"
    ```
