# jade-kinx document repository

This is sample document repository with mkdocs-material.

## admonitions

!!! note
    기본 노트

!!! note ""
    제목없는 노트 admonitions

!!! note "제목있는 노트"
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae, quod!

    ``` title=""
    !!! note "note"
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae, quod!
    ```

???- note "확장 가능한 노트"
    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quaerat autem obcaecati quod vitae magnam iusto quae earum praesentium quos eveniet.

???+ note "확장된 노트"
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem consequuntur facere quia, magnam cum ipsa repellendus cumque possimus similique ducimus?

!!! abstract "abstract"
    
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque mollitia quidem exercitationem reiciendis ab totam, itaque similique inventore porro asperiores pariatur commodi iusto ducimus, voluptatibus suscipit voluptas eligendi nisi. Praesentium.

???- info "information with expandable"

    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi similique eveniet cum maiores nesciunt laudantium minus fugit, quaerat tenetur ipsum nobis, mollitia optio praesentium, accusantium ratione cupiditate culpa? Distinctio sed doloremque neque velit provident, repudiandae quod animi praesentium architecto quia.

???+ warning "warning with expanded"

    Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta earum doloremque possimus minima excepturi distinctio eum corporis vel deleniti nam quam, maxime corrupti quia maiores voluptas, sed harum quis. Ea soluta harum autem voluptatibus earum amet quibusdam culpa expedita explicabo!


## Code blocks

``` py
import tensorflow as tf # (1)!
```

1.  this is annotation

``` py title="bubble_sort.py"

def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```


```bash title="bash code highlighting with linunumbers" hl_lines="4 10 15"
root@controller:~# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.42.1    0.0.0.0         UG    0      0        0 ens3 # (1)!
169.254.169.254 192.168.42.1    255.255.255.255 UGH   0      0        0 ens3
192.168.42.0    0.0.0.0         255.255.255.0   U     0      0        0 ens3
192.168.42.128  0.0.0.0         255.255.255.128 U     0      0        0 br-ex
192.168.122.0   0.0.0.0         255.255.255.0   U     0      0        0 virbr0
root@controller:~# ip netns
qrouter-43a1b81b-93fa-4ddc-8f32-469c3dc8e7c7 # (2)!
qdhcp-267c5fb7-bcf4-4f42-bc70-ee89c88cb15f
root@controller:~# ip netns exec qrouter-43a1b81b-93fa-4ddc-8f32-469c3dc8e7c7 route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.42.129  0.0.0.0         UG    0      0        0 qg-7f32c975-1f # (3)!
172.16.0.0      0.0.0.0         255.255.255.192 U     0      0        0 qr-b856e3ac-ee
192.168.42.128  0.0.0.0         255.255.255.128 U     0      0        0 qg-7f32c975-1f
root@controller:~#
```

1.  호스트의 디폴트 게이트웨이
2.  가상 라우터 네임스페이스
3.  가상 라우터 디폴트 게이트웨이

KEYSTONE 은 인증 서비스 컴포넌트입니다.

HTML is a Hyper Text Markup Language

## Content Tabs

!!! quote "Hello World!" 
    === "C"
        ``` c
        #include <stdio.h>

        int main(void) {
        printf("Hello world!\n");
        return 0;
        }
        ```

    === "C++"

        ``` c++
        #include <iostream>

        int main(void) {
        std::cout << "Hello world!" << std::endl;
        return 0;
        }
        ```
