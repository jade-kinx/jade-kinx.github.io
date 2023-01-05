
### (1) GET /identity/
`openstack` --> `keystone`

환경변수 `OS_AUTH_URL` 에 정의된 URL로 `이미지` 서비스의 버전별 EndPoint 목록을 요청한다.  
`(1-2)` 과정은 `version negotiation` 과정으로 볼 수 있다.  
이 요청에 대한 결과로 받은 EndPoint 중 적당한 EndPoint를 선택하여 Access Token 발급 및 서비스 API 카탈로그를 요청하게 된다.

=== "Header"
    ``` http title="GET /identity/" linenums="1"
    Host: 182.161.114.101
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Requestshook-Request-Id: db99482beaf54a05982bdc1f47687afd
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="GET /identity/" linenums="1"
    none
    ```


### (2) 300 MULTIPLE CHOICES /identity/
`openstack` <-- `keystone`

`(1)` 요청에 대한 응답이다.  
`Body`의 내용을 통해 `Identity` 서비스의 EndPoint 는 현재 `v3.14` 버전이며, url은 `http://182.161.114.101/identity/v3/` 인 것을 확인할 수 있다.

=== "Header"
    ``` http title="300 MULTIPLE CHOICES /identity/" linenums="1"
    Content-Type: application/json
    Content-Length: 274
    Location: http://182.161.114.101/identity/v3/
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: db99482beaf54a05982bdc1f47687afd
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="300 MULTIPLE CHOICES /identity/" linenums="1" hl_lines="5 11"
    {
      "versions": {
        "values": [
          {
            "id": "v3.14",
            "status": "stable",
            "updated": "2020-04-07T00:00:00Z",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/identity/v3/"
              }
            ],
            "media-types": [
              {
                "base": "application/json",
                "type": "application/vnd.openstack.identity-v3+json"
              }
            ]
          }
        ]
      }
    }
    ```


### (3) POST /identity/v3/auth/tokens
`openstack` --> `keystone`

!!! reference "API 참조"
    [Password authentication with scoped authorization](https://docs.openstack.org/api-ref/identity/v3/index.html?expanded=password-authentication-with-scoped-authorization-detail#password-authentication-with-scoped-authorization)

`Access Token` 발급 및 `서비스 카탈로그` 요청한다.  
`Body`는 `admin` 사용자가 `admin` 프로젝트 스코프로 `패스워드` 방식으로(패스워드=`asdf`) 인증 요청을 담고 있다.  

=== "Header"
    ``` http title="POST /identity/v3/auth/tokens" linenums="1"
    Host: 182.161.114.101
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 209
    X-Requestshook-Request-Id: 77b63da6e8304573a0673f43a48857cb
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="POST /identity/v3/auth/tokens" linenums="1" hl_lines="5 9 10 19"
    {
      "auth": {
        "identity": {
          "methods": [
            "password"
          ],
          "password": {
            "user": {
              "password": "asdf",
              "name": "admin",
              "domain": {
                "id": "default"
              }
            }
          }
        },
        "scope": {
          "project": {
            "name": "admin",
            "domain": {
              "id": "default"
            }
          }
        }
      }
    }
    ```


### (4) 201 CREATED /identity/v3/auth/tokens
`openstack` <-- `keystone`

토큰 발급 요청이 성공하면, `Response.Header`에 `X-Subject-Token` 이름으로 Access Token이 발급된다.  
`Body`에는 `user` 정보, `project` 정보, `roles` 정보, `catalog` 정보가 포함되어 있다.  

=== "Header"
    ``` http title="201 CREATED /identity/v3/auth/tokens" linenums="1" "hl_lines="3"
    Content-Type: application/json
    Content-Length: 3952
    X-Subject-Token: gAAAAABjrkD9cqBlaLtF1_FlWZfHjo2u7cJvLXX1HNPG-aFEylyLg7rBQwXEckDcnO__Yjj7akLG-xtxDVRk3zfTJPFdMYJ1MjeZJLaLbOD_Cbx4_D57F_EBR7g-QEmJdvXqN8GADYgNslbXm8cxCBhl3ww4_VJQBWEVQtav4_vVRW_E9vKAkxc
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 77b63da6e8304573a0673f43a48857cb
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="201 CREATED /identity/v3/auth/tokens" linenums="1" hl_lines="106 111"
    {
      "token": {
        "methods": [
          "password"
        ],
        "user": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "f7a842b4104247debd7589051c5321fc",
          "name": "admin",
          "password_expires_at": null
        },
        "audit_ids": [
          "9U94bbR7Tu6vPiWuThd6Gg"
        ],
        "expires_at": "2022-12-30T04:38:05.000000Z",
        "issued_at": "2022-12-30T01:38:05.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "de5af600557d44d0996e667499376dbb",
          "name": "admin"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "3e1adda493764db8921e97d68a5c8bc7",
            "name": "admin"
          },
          {
            "id": "5f0594b46c8346d2996759ed1f5014f4",
            "name": "member"
          },
          {
            "id": "28dea0246b6f47df9d99b5b33b423c8b",
            "name": "reader"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "6fbbbec7587e4989a4de6e7a43c7205f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "10304edc7ec942d282567b8c4f5610d6",
            "type": "placement",
            "name": "placement"
          },
          {
            "endpoints": [
              {
                "id": "366c8616c77243d38971272e0eaf4a9f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "117766093c004578b95a185ecf2a5bbf",
            "type": "compute",
            "name": "nova"
          },
          {
            "endpoints": [
              {
                "id": "0c0d6e47d833442f8da165ada8ad43a3",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              },
              {
                "id": "9440e2831cc84d4da9f7d20c7b42638e",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              },
              {
                "id": "c812ae1a5a3e40449f3c61edae4a6bcb",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              }
            ],
            "id": "22844f546aa941798f06e4978be9ab94",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "fad6bb86523b4f3aba4a6a6fb25cda0e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "3b7aead421ce4611a82e684ab8c2ad2f",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "82c559324ad244beacb2fd0406f0298b",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              },
              {
                "id": "d1029ab4d5bf4cd6843a5b819966c2ea",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              }
            ],
            "id": "628d3cea8d3b4615a4b047bae6112d0e",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "a7eecf5314434aca81e5feaa8bf7521e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "7055978143b74523b826bae1a9c0aabf",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "30dd85ebed584c54ba849ca0e2a4c825",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "b3b850a4ec574d16a0cbece3c172a701",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "871e0e3393974f9b9071342b59f62090",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              }
            ],
            "id": "cb1921a9c779492484907683bb447e84",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "b6a779acd3e04ed480847d4cb99ca710",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              }
            ],
            "id": "d5345b92210c49aa975a873d04921780",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "8c624f7ed1e44096b8f0413866a11b1b",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              }
            ],
            "id": "e559802e75824163a070bd92dd143476",
            "type": "volumev3",
            "name": "cinderv3"
          }
        ]
      }
    }
    ```

서비스 `catalog` 중, 원하는 서비스 EndPoint URL을 선택하여 해당 URL로 요청을 전송하게 된다.  
이 경우에는 `type`이 `image`인 endpoint `http://182.161.114.101/image`를 이용하여 이미지 생성 요청을 보낼 것이다.  


### (5) POST /v2/images
`openstack` --> `glance-api`

!!! reference "API 참조"
    [Create image](https://docs.openstack.org/api-ref/image/v2/index.html?expanded=create-image-detail#create-image)

발급 받은 `access token`을 `Header`의 `X-Auth-Token` 값으로 추가하여 이미지 생성을 요청한다.  
`Body`에는 `disk_format=qcow2`, `container_format=bare`, `visibility=public`, `name=cirros-0.6.1-x86_64-disk`와 같은 이미지 정보를 포함한다.  
`container_format`은 커맨드로부터 입력되지 않았으나, `openstack-client` 기본값인 `bare`가 자동으로 설정되었다.  
이 요청은 데이터베이스 등에 이미지 정보를 생성하는 요청이며, 실제 파일 업로드는 `(13)` `PUT /v2/images/{image_id}/file` 요청에 의해서 업로드 된다.  

!!! note
    `openstack-client`는 `http://182.161.114.101/image/v2/images/` EndPoint로 요청을 보냈지만, `apache-wsgi-proxy`에 의해 `glance-api` 서비스가 구동중인 `127.0.0.1:60999`로 포워딩 되었다. 
    ``` http title="/etc/apache2/sites-enabled/glance-wsgi-api.conf"
    ProxyPass "/image" "http://127.0.0.1:60999" retry=0
    ```

=== "Header"
    ``` http title="POST /v2/images" linenums="1" hl_lines="5"
    Host: 127.0.0.1:60999
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    X-Auth-Token: gAAAAABjrkD9cqBlaLtF1_FlWZfHjo2u7cJvLXX1HNPG-aFEylyLg7rBQwXEckDcnO__Yjj7akLG-xtxDVRk3zfTJPFdMYJ1MjeZJLaLbOD_Cbx4_D57F_EBR7g-QEmJdvXqN8GADYgNslbXm8cxCBhl3ww4_VJQBWEVQtav4_vVRW_E9vKAkxc
    Content-Type: application/json
    X-Requestshook-Request-Id: 3ab3d14d95bf4be1bad368dbe46a773a
    X-Requestshook-Request-From: openstack
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Content-Length: 260
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="POST /v2/images" linenums="1"
    {
      "container_format": "bare",
      "visibility": "public",
      "disk_format": "qcow2",
      "name": "cirros-0.6.1-x86_64-disk",
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.sha256": "",
      "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-disk"
    }
    ```

### (6) GET /identity/
`glance-api` --> `keystone`

사용자의 인증 토큰을 `keystone`에 보내 검증 하기 위해서는 `glance-api` 서비스의 인증 토큰도 필요하다.  
`(6)-(9)` 과정은 `glance-api` 서비스가 `keystone` 서비스로 API 요청을 보낼 때 사용할 인증 토큰을 발급(또는 재발급) 받는 과정이다.  
인증 토큰이 생성되지 않았거나, 만료되었을 때 인증 토큰을 (재)발급 받게 된다.  
사용 가능한 인증 토큰을 이미 보유하고 있다면 `(6)-(9)` 과정은 생략된다.  

=== "Header"
    ``` http title="GET /identity/" linenums="1"
    Host: 182.161.114.101
    User-Agent: glance/25.0.1.dev4 keystonemiddleware.auth_token/10.1.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Requestshook-Request-Id: 76d74b23313c4e57884048d860486320
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="GET /identity/" linenums="1"
    none
    ```


### (7) 300 MULTIPLE CHOICES /identity/
`glance-api` <-- `keystone`

=== "Header"
    ``` http title="300 MULTIPLE CHOICES /identity/" linenums="1"
    Content-Type: application/json
    Content-Length: 274
    Location: http://182.161.114.101/identity/v3/
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 76d74b23313c4e57884048d860486320
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="300 MULTIPLE CHOICES /identity/" linenums="1"
    {
      "versions": {
        "values": [
          {
            "id": "v3.14",
            "status": "stable",
            "updated": "2020-04-07T00:00:00Z",
            "links": [
              {
                "rel": "self",
                "href": "http://182.161.114.101/identity/v3/"
              }
            ],
            "media-types": [
              {
                "base": "application/json",
                "type": "application/vnd.openstack.identity-v3+json"
              }
            ]
          }
        ]
      }
    }
    ```


### (8) POST /identity/v3/auth/tokens
`glance-api` --> `keystone`

=== "Header"
    ``` http title="POST /identity/v3/auth/tokens" linenums="1"
    Host: 182.161.114.101
    User-Agent: glance/25.0.1.dev4 keystonemiddleware.auth_token/10.1.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 216
    X-Requestshook-Request-Id: 86b015c3843b4f779436cf402cfa17dc
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="POST /identity/v3/auth/tokens" linenums="1"
    {
      "auth": {
        "identity": {
          "methods": [
            "password"
          ],
          "password": {
            "user": {
              "password": "asdf",
              "name": "glance",
              "domain": {
                "name": "Default"
              }
            }
          }
        },
        "scope": {
          "project": {
            "name": "service",
            "domain": {
              "name": "Default"
            }
          }
        }
      }
    }
    ```


### (9) 201 CREATED /identity/v3/auth/tokens
`glance-api` <-- `keystone`

`glance-api`가 사용할 인증 토큰을 발급 받았다.  

=== "Header"
    ``` http title="201 CREATED /identity/v3/auth/tokens" linenums="1" hl_lines="3"
    Content-Type: application/json
    Content-Length: 3833
    X-Subject-Token: gAAAAABjrkD9tCni_jA0hswR8965Hg5cRQxRe2cGhOniDRLEUEmRQxBC-JAqhVkPyuvpyYOoVOGEg8Keb8P5JRmqes6F3eHkt2dDJd5E66TCFDpbWnNMjHfzzp9j2UCD-uVcwz30bKCrIbQUGSW_-VFDdDrHnbApFBKazs7_U8HR4YB3Hj8hWHA
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 86b015c3843b4f779436cf402cfa17dc
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="201 CREATED /identity/v3/auth/tokens" linenums="1"
    {
      "token": {
        "methods": [
          "password"
        ],
        "user": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "e65d5173dc4c4883a9f3a7252d6c007c",
          "name": "glance",
          "password_expires_at": null
        },
        "audit_ids": [
          "20tUnWnaQ6ScGFzUNIjAlQ"
        ],
        "expires_at": "2022-12-30T04:38:05.000000Z",
        "issued_at": "2022-12-30T01:38:05.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "7c4cda7e4807414bbdfcb22b535a9802",
          "name": "service"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "8305567cb70b4087babffa9c7e9a185f",
            "name": "service"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "6fbbbec7587e4989a4de6e7a43c7205f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "10304edc7ec942d282567b8c4f5610d6",
            "type": "placement",
            "name": "placement"
          },
          {
            "endpoints": [
              {
                "id": "366c8616c77243d38971272e0eaf4a9f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "117766093c004578b95a185ecf2a5bbf",
            "type": "compute",
            "name": "nova"
          },
          {
            "endpoints": [
              {
                "id": "0c0d6e47d833442f8da165ada8ad43a3",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              },
              {
                "id": "9440e2831cc84d4da9f7d20c7b42638e",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              },
              {
                "id": "c812ae1a5a3e40449f3c61edae4a6bcb",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              }
            ],
            "id": "22844f546aa941798f06e4978be9ab94",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "fad6bb86523b4f3aba4a6a6fb25cda0e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "3b7aead421ce4611a82e684ab8c2ad2f",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "82c559324ad244beacb2fd0406f0298b",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              },
              {
                "id": "d1029ab4d5bf4cd6843a5b819966c2ea",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              }
            ],
            "id": "628d3cea8d3b4615a4b047bae6112d0e",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "a7eecf5314434aca81e5feaa8bf7521e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "7055978143b74523b826bae1a9c0aabf",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "30dd85ebed584c54ba849ca0e2a4c825",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "b3b850a4ec574d16a0cbece3c172a701",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "871e0e3393974f9b9071342b59f62090",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              }
            ],
            "id": "cb1921a9c779492484907683bb447e84",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "b6a779acd3e04ed480847d4cb99ca710",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              }
            ],
            "id": "d5345b92210c49aa975a873d04921780",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "8c624f7ed1e44096b8f0413866a11b1b",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              }
            ],
            "id": "e559802e75824163a070bd92dd143476",
            "type": "volumev3",
            "name": "cinderv3"
          }
        ]
      }
    }
    ```


### (10) GET /identity/v3/auth/tokens
`glance-api` --> `keystone`

!!! reference "API 참조"
    [Validate and show information for token](https://docs.openstack.org/api-ref/identity/v3/index.html?expanded=validate-and-show-information-for-token-detail#validate-and-show-information-for-token)

`(5)` 요청에 대해 `keystone` 서비스에 사용자 인증 토큰 검증을 요청한다.  
이 과정에서 사용자의 인증 토큰은 `X-Subject-Token`, `glance-api`의 인증 토큰은 `X-Auth-Token` 값으로 헤더에 포함하여 요청한다.  

=== "Header"
    ``` http title="GET /identity/v3/auth/tokens" linenums="1" hl_lines="6 8"
    Host: 182.161.114.101
    User-Agent: python-keystoneclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Subject-Token: gAAAAABjrkD9cqBlaLtF1_FlWZfHjo2u7cJvLXX1HNPG-aFEylyLg7rBQwXEckDcnO__Yjj7akLG-xtxDVRk3zfTJPFdMYJ1MjeZJLaLbOD_Cbx4_D57F_EBR7g-QEmJdvXqN8GADYgNslbXm8cxCBhl3ww4_VJQBWEVQtav4_vVRW_E9vKAkxc
    Openstack-Identity-Access-Rules: 1
    X-Auth-Token: gAAAAABjrkD9tCni_jA0hswR8965Hg5cRQxRe2cGhOniDRLEUEmRQxBC-JAqhVkPyuvpyYOoVOGEg8Keb8P5JRmqes6F3eHkt2dDJd5E66TCFDpbWnNMjHfzzp9j2UCD-uVcwz30bKCrIbQUGSW_-VFDdDrHnbApFBKazs7_U8HR4YB3Hj8hWHA
    X-Requestshook-Request-Id: 283b65bcbcc242589f994cfc2017b35c
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="GET /identity/v3/auth/tokens" linenums="1"
    none
    ```


### (11) 200 OK /identity/v3/auth/tokens
`glance-api` <-- `keystone`

`keystone`으로부터 사용자 인증 토큰에 대한 인증 및 서비스 카탈로그를 수신한다.  
사용자 인증 토큰이 `Header`의 `X-Subject-Token` 값으로, `Body`에는 서비스 카탈로그를 포함하고 있는 것을 확인할 수 있다.  

=== "Header"
    ``` http title="200 OK /identity/v3/auth/tokens" linenums="1" hl_lines="3"
    Content-Type: application/json
    Content-Length: 3952
    X-Subject-Token: gAAAAABjrkD9cqBlaLtF1_FlWZfHjo2u7cJvLXX1HNPG-aFEylyLg7rBQwXEckDcnO__Yjj7akLG-xtxDVRk3zfTJPFdMYJ1MjeZJLaLbOD_Cbx4_D57F_EBR7g-QEmJdvXqN8GADYgNslbXm8cxCBhl3ww4_VJQBWEVQtav4_vVRW_E9vKAkxc
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 283b65bcbcc242589f994cfc2017b35c
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="200 OK /identity/v3/auth/tokens" linenums="1"
    {
      "token": {
        "methods": [
          "password"
        ],
        "user": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "f7a842b4104247debd7589051c5321fc",
          "name": "admin",
          "password_expires_at": null
        },
        "audit_ids": [
          "9U94bbR7Tu6vPiWuThd6Gg"
        ],
        "expires_at": "2022-12-30T04:38:05.000000Z",
        "issued_at": "2022-12-30T01:38:05.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "de5af600557d44d0996e667499376dbb",
          "name": "admin"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "3e1adda493764db8921e97d68a5c8bc7",
            "name": "admin"
          },
          {
            "id": "5f0594b46c8346d2996759ed1f5014f4",
            "name": "member"
          },
          {
            "id": "28dea0246b6f47df9d99b5b33b423c8b",
            "name": "reader"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "6fbbbec7587e4989a4de6e7a43c7205f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "10304edc7ec942d282567b8c4f5610d6",
            "type": "placement",
            "name": "placement"
          },
          {
            "endpoints": [
              {
                "id": "366c8616c77243d38971272e0eaf4a9f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "117766093c004578b95a185ecf2a5bbf",
            "type": "compute",
            "name": "nova"
          },
          {
            "endpoints": [
              {
                "id": "0c0d6e47d833442f8da165ada8ad43a3",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              },
              {
                "id": "9440e2831cc84d4da9f7d20c7b42638e",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              },
              {
                "id": "c812ae1a5a3e40449f3c61edae4a6bcb",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              }
            ],
            "id": "22844f546aa941798f06e4978be9ab94",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "fad6bb86523b4f3aba4a6a6fb25cda0e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "3b7aead421ce4611a82e684ab8c2ad2f",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "82c559324ad244beacb2fd0406f0298b",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              },
              {
                "id": "d1029ab4d5bf4cd6843a5b819966c2ea",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              }
            ],
            "id": "628d3cea8d3b4615a4b047bae6112d0e",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "a7eecf5314434aca81e5feaa8bf7521e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "7055978143b74523b826bae1a9c0aabf",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "30dd85ebed584c54ba849ca0e2a4c825",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "b3b850a4ec574d16a0cbece3c172a701",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "871e0e3393974f9b9071342b59f62090",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              }
            ],
            "id": "cb1921a9c779492484907683bb447e84",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "b6a779acd3e04ed480847d4cb99ca710",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              }
            ],
            "id": "d5345b92210c49aa975a873d04921780",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "8c624f7ed1e44096b8f0413866a11b1b",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/de5af600557d44d0996e667499376dbb",
                "region": "RegionOne"
              }
            ],
            "id": "e559802e75824163a070bd92dd143476",
            "type": "volumev3",
            "name": "cinderv3"
          }
        ]
      }
    }
    ```


### (12) 201 Created /v2/images
`openstack` <-- `glance-api`

사용자의 인증 토큰이 성공적으로 검증 되었으므로, 사용자 요청에 따른 이미지 생성 요청을 처리하고, 그 결과를 사용자에게 전송한다.  
`Header`의 `OpenStack-image-import-methods` 항목은 이미지를 import할 수 있는 방법을 포함한다.  
`Body`에는 생성된 이미지에 대한 정보가 포함되어 있다. `status` 항목이 `queued` 인 것을 확인할 수 있다.  

=== "Header"
    ``` http title="201 Created /v2/images" linenums="1" hl_lines="4"
    Content-Length: 781
    Content-Type: application/json
    Location: http://127.0.0.1:60999/v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c
    OpenStack-image-import-methods: glance-direct,web-download,copy-image
    x-openstack-request-id: req-d15c0fbc-c5c3-44b5-af20-005b8b7d96e8
    X-Requestshook-Request-Id: 3ab3d14d95bf4be1bad368dbe46a773a
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="201 Created /v2/images" linenums="1" hl_lines="11"
    {
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.sha256": "",
      "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-disk",
      "name": "cirros-0.6.1-x86_64-disk",
      "disk_format": "qcow2",
      "container_format": "bare",
      "visibility": "public",
      "size": null,
      "virtual_size": null,
      "status": "queued",
      "checksum": null,
      "protected": false,
      "min_ram": 0,
      "min_disk": 0,
      "owner": "de5af600557d44d0996e667499376dbb",
      "os_hidden": false,
      "os_hash_algo": null,
      "os_hash_value": null,
      "id": "a42bfade-78ec-4c95-b7b4-272ba265072c",
      "created_at": "2022-12-30T01:38:06Z",
      "updated_at": "2022-12-30T01:38:06Z",
      "tags": [],
      "self": "/v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c",
      "file": "/v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file",
      "schema": "/v2/schemas/image"
    }
    ```


### (13) PUT /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file
`openstack` --> `glance-api`

!!! reference "API 참조"
    [Upload binary image data](https://docs.openstack.org/api-ref/image/v2/index.html?expanded=upload-binary-image-data-detail#upload-binary-image-data)

이미지가 생성되었고(레코드만), `status`가 `queued` 상태이므로 이미지 파일을 업로드 할 수 있다.  
`PUT` 메소드를 이용하여, 파일을 업로드한다.  
`Content-Type`이 `application/octet-stream`, `Body`에는 파일의 바이너리 데이터가 포함된다.  
`X-Auth-Token`에는 `openstack-client`가 발급 받은 인증 토큰을 사용한다.  

!!! question "`(13)` 요청의 인증 토큰을 검증하지 않는 이유?"
    `(10-11)` 과정을 통해 이미 검증한 토큰에 대해서는 캐싱하고 있으면서 토큰 만료(`expires_at`)까지 재검증 하지 않는 것으로 보인다.  
    그리고, 이러한 정책은 다른 과정에서 모두 동일할 것으로 추정된다. (`(20)` 요청에 대해서도 검증하지 않음)  

=== "Header"
    ``` http title="PUT /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file" linenums="1" hl_lines="5 6"
    Host: 127.0.0.1:60999
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: 
    Content-Type: application/octet-stream
    X-Auth-Token: gAAAAABjrkD9cqBlaLtF1_FlWZfHjo2u7cJvLXX1HNPG-aFEylyLg7rBQwXEckDcnO__Yjj7akLG-xtxDVRk3zfTJPFdMYJ1MjeZJLaLbOD_Cbx4_D57F_EBR7g-QEmJdvXqN8GADYgNslbXm8cxCBhl3ww4_VJQBWEVQtav4_vVRW_E9vKAkxc
    X-Requestshook-Request-Id: e4c3be3fe42a47e4a3b3558cec50fe75
    X-Requestshook-Request-From: openstack
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Content-Length: 21233664
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="PUT /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file" linenums="1"
    b'QFI\xfb\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x07\x00\x00\x00'...
    ```
    (여기서는 바이너리 일부만 표현)

### (14) POST /identity/v3/auth/tokens
`glance-api` --> `keystone`

`(14-15)` 과정은 `glance-api`가 `object-store(swift)` 서비스에 사용할 인증 토큰을 발급 받는 과정이다.  
만료되지 않은 인증 토큰을 보유하고 있다면, 이 과정은 생략될 수 있다.  
`Body`의 `auth.identity.password.user.name`이 `glance-swift`인 것을 확인할 수 있다.  

=== "Header"
    ``` http title="POST /identity/v3/auth/tokens" linenums="1"
    Host: 182.161.114.101
    User-Agent: uwsgi keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 218
    X-Requestshook-Request-Id: dd6c58c6ef2542148b682bd4c0588d58
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="POST /identity/v3/auth/tokens" linenums="1" hl_lines="10"
    {
      "auth": {
        "identity": {
          "methods": [
            "password"
          ],
          "password": {
            "user": {
              "password": "asdf",
              "name": "glance-swift",
              "domain": {
                "id": "default"
              }
            }
          }
        },
        "scope": {
          "project": {
            "name": "service",
            "domain": {
              "id": "default"
            }
          }
        }
      }
    }
    ```


### (15) 201 CREATED /identity/v3/auth/tokens
`glance-api` <-- `keystone`

`glance-api` 서비스가 `object-store` 서비스(`swift`)에 요청할 인증 토큰을 발급 받았다.  
`Body`의 `catalog` 에서 `object-store` 타입 서비스(`swift`)의 endpoint가 `http://182.161.114.101:8080/v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802`임을 확인할 수 있다.  

=== "Header"
    ``` http title="201 CREATED /identity/v3/auth/tokens" linenums="1" hl_lines="3"
    Content-Type: application/json
    Content-Length: 3908
    X-Subject-Token: gAAAAABjrkD_e5s9lpQ1vHif6SROJFWbCUa7ySvxD0YfrBS2P3BwgwC-AhPppfXs5uRQoknWTZHWrnm5x2sC5C-B9JUyIgsUDKlQvE3PT5ro7Xm9MdhSpjkYfSu_5YNLizd26s9Zfm7Ctoi7OKG5vpx30vORbQHqtAHx09wbko5g-QSDNSjSIM8
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: dd6c58c6ef2542148b682bd4c0588d58
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="201 CREATED /identity/v3/auth/tokens" linenums="1" hl_lines="123"
    {
      "token": {
        "methods": [
          "password"
        ],
        "user": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "e4cc1d4770e748e985de1fef90bdca3b",
          "name": "glance-swift",
          "password_expires_at": null
        },
        "audit_ids": [
          "OPHYuaAhRvCBHzKKmJku7A"
        ],
        "expires_at": "2022-12-30T04:38:07.000000Z",
        "issued_at": "2022-12-30T01:38:07.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "7c4cda7e4807414bbdfcb22b535a9802",
          "name": "service"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "fb02fd084500496fad9b29fd8c376f65",
            "name": "ResellerAdmin"
          },
          {
            "id": "8305567cb70b4087babffa9c7e9a185f",
            "name": "service"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "6fbbbec7587e4989a4de6e7a43c7205f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "10304edc7ec942d282567b8c4f5610d6",
            "type": "placement",
            "name": "placement"
          },
          {
            "endpoints": [
              {
                "id": "366c8616c77243d38971272e0eaf4a9f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "117766093c004578b95a185ecf2a5bbf",
            "type": "compute",
            "name": "nova"
          },
          {
            "endpoints": [
              {
                "id": "0c0d6e47d833442f8da165ada8ad43a3",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              },
              {
                "id": "9440e2831cc84d4da9f7d20c7b42638e",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              },
              {
                "id": "c812ae1a5a3e40449f3c61edae4a6bcb",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              }
            ],
            "id": "22844f546aa941798f06e4978be9ab94",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "fad6bb86523b4f3aba4a6a6fb25cda0e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "3b7aead421ce4611a82e684ab8c2ad2f",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "82c559324ad244beacb2fd0406f0298b",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              },
              {
                "id": "d1029ab4d5bf4cd6843a5b819966c2ea",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              }
            ],
            "id": "628d3cea8d3b4615a4b047bae6112d0e",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "a7eecf5314434aca81e5feaa8bf7521e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "7055978143b74523b826bae1a9c0aabf",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "30dd85ebed584c54ba849ca0e2a4c825",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "b3b850a4ec574d16a0cbece3c172a701",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "871e0e3393974f9b9071342b59f62090",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              }
            ],
            "id": "cb1921a9c779492484907683bb447e84",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "b6a779acd3e04ed480847d4cb99ca710",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              }
            ],
            "id": "d5345b92210c49aa975a873d04921780",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "8c624f7ed1e44096b8f0413866a11b1b",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/7c4cda7e4807414bbdfcb22b535a9802",
                "region": "RegionOne"
              }
            ],
            "id": "e559802e75824163a070bd92dd143476",
            "type": "volumev3",
            "name": "cinderv3"
          }
        ]
      }
    }
    ```

### (16) HEAD /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance
`glance-api` --> `swift-proxy-server`

!!! reference "API 참조"
    [Show container metadata](https://docs.openstack.org/api-ref/object-store/?expanded=show-container-metadata-detail#show-container-metadata)

`(15)` 요청에서 받은 `object-store` 의 endpoint로 컨테이너 메타데이터 정보를 요청한다.  
(존재하는지, 사용 가능한지 등의 확인 목적으로 추정된다.)  

=== "Header"
    ``` http title="HEAD /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance" linenums="1"
    Content-Type: 
    Host: 182.161.114.101:8080
    Accept-Encoding: identity
    X-Auth-Token: gAAAAABjrkD_e5s9lpQ1vHif6SROJFWbCUa7ySvxD0YfrBS2P3BwgwC-AhPppfXs5uRQoknWTZHWrnm5x2sC5C-B9JUyIgsUDKlQvE3PT5ro7Xm9MdhSpjkYfSu_5YNLizd26s9Zfm7Ctoi7OKG5vpx30vORbQHqtAHx09wbko5g-QSDNSjSIM8
    User-Agent: python-swiftclient-4.1.0
    X-Requestshook-Request-Id: d533cebd33bb49ddacbf735bdd6b2556
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="HEAD /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance" linenums="1"
    none
    ```


### (17) GET /identity/v3/auth/tokens
`swift-proxy-server` --> `keystone`

`(17-18)` 과정은 `glance-api` 요청에 대해 인증 토큰을 검증 하는 과정이다.  
`swift-proxy-server`는 만료되지 않은 인증 토큰 `gAAAAABjrjJGaF5Q7tx3oVja4UAOY53wgd7ltBWA...`을 보유하고 있으므로 `keystone`에 인증 토큰 발급을 요청하지 않는다.  
만약, `swift-proxy-server`의 인증 토큰이 만료되었다면, `(6-9)` 과정과 같이 인증 토큰을 먼저 발급 받고 검증을 요청한다.    

=== "Header"
    ``` http title="GET /identity/v3/auth/tokens" linenums="1" hl_lines="6 8"
    Host: 182.161.114.101
    User-Agent: python-keystoneclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Subject-Token: gAAAAABjrkD_e5s9lpQ1vHif6SROJFWbCUa7ySvxD0YfrBS2P3BwgwC-AhPppfXs5uRQoknWTZHWrnm5x2sC5C-B9JUyIgsUDKlQvE3PT5ro7Xm9MdhSpjkYfSu_5YNLizd26s9Zfm7Ctoi7OKG5vpx30vORbQHqtAHx09wbko5g-QSDNSjSIM8
    Openstack-Identity-Access-Rules: 1
    X-Auth-Token: gAAAAABjrjJGaF5Q7tx3oVja4UAOY53wgd7ltBWAfsYXHJH3w4XwhdecBvGgfQR5qtuFW3PbnACXZKs_t9XgYG0q9cCCXOllAkzAMgbPkAHknHuINTQ3t0sPKEoJLawZ95y1jznIFcb-oQGXqGQKScS6qKwToz3Qc39csvxir7YStSBYOTw4E1U
    X-Requestshook-Request-Id: 2674b060812d401681587747ba23f2fc
    X-Requestshook-Request-From: swift-proxy-server
    ```

=== "Body"
    ``` json title="GET /identity/v3/auth/tokens" linenums="1"
    none
    ```


### (18) 200 OK /identity/v3/auth/tokens
`swift-proxy-server` <-- `keystone`

`(16)` 요청에 대해 인증 토큰 검증 완료하고, 해당 토큰에 대한 서비스 카탈로그를 수신하였다.  

=== "Header"
    ``` http title="200 OK /identity/v3/auth/tokens" linenums="1"
    Content-Type: application/json
    Content-Length: 604
    X-Subject-Token: gAAAAABjrkD_e5s9lpQ1vHif6SROJFWbCUa7ySvxD0YfrBS2P3BwgwC-AhPppfXs5uRQoknWTZHWrnm5x2sC5C-B9JUyIgsUDKlQvE3PT5ro7Xm9MdhSpjkYfSu_5YNLizd26s9Zfm7Ctoi7OKG5vpx30vORbQHqtAHx09wbko5g-QSDNSjSIM8
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 2674b060812d401681587747ba23f2fc
    X-Requestshook-Request-From: swift-proxy-server
    ```

=== "Body"
    ``` json title="200 OK /identity/v3/auth/tokens" linenums="1"
    {
      "token": {
        "methods": [
          "password"
        ],
        "user": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "e4cc1d4770e748e985de1fef90bdca3b",
          "name": "glance-swift",
          "password_expires_at": null
        },
        "audit_ids": [
          "OPHYuaAhRvCBHzKKmJku7A"
        ],
        "expires_at": "2022-12-30T04:38:07.000000Z",
        "issued_at": "2022-12-30T01:38:07.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "7c4cda7e4807414bbdfcb22b535a9802",
          "name": "service"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "fb02fd084500496fad9b29fd8c376f65",
            "name": "ResellerAdmin"
          },
          {
            "id": "8305567cb70b4087babffa9c7e9a185f",
            "name": "service"
          }
        ]
      }
    }
    ```


### (19) 204 No Content /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance
`glance-api` <-- `swift-proxy-server`

`glance-api`의 `container` 메타데이터 정보 요청에 대해 응답한다.  
`Header`에 메타데이터 정보가 포함된다.  

=== "Header"
    ``` http title="204 No Content /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance" linenums="1"
    Content-Type: text/plain; charset=utf-8
    X-Backend-Timestamp: 1671683363.84851
    X-Backend-Put-Timestamp: 1671683363.83052
    X-Backend-Delete-Timestamp: 0000000000.00000
    X-Backend-Status-Changed-At: 1671683363.83052
    X-Backend-Storage-Policy-Index: 0
    X-Container-Object-Count: 6
    X-Container-Bytes-Used: 1134410240
    X-Timestamp: 1671683363.84851
    X-Backend-Sharding-State: unsharded
    Last-Modified: Thu, 22 Dec 2022 04:29:24 GMT
    Accept-Ranges: bytes
    X-Storage-Policy: Policy-0
    X-Backend-Recheck-Container-Existence: 60
    X-Container-Sharding: False
    Vary: Accept
    X-Requestshook-Request-Id: d533cebd33bb49ddacbf735bdd6b2556
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="204 No Content /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance" linenums="1"
    none
    ```


### (20) PUT /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/a42bfade-78ec-4c95-b7b4-272ba265072c
`glance-api` --> `swift-proxy-server`

!!! reference "API 참조"
    [Create or replace object](https://docs.openstack.org/api-ref/object-store/?expanded=create-or-replace-object-detail#create-or-replace-object)

`(13)` `PUT /v2/images/{image_id}/file` 요청을 통해 받은 이미지 파일을 오브젝트 스토리지로 업로드한다.  
`glance-api`와 다르게 `swift-proxy-server`는 `content-type`을 지정하지 않아도 되나보다.  
`(13)` 요청과 마찬가지로 이미 검증한 토큰이므로 캐싱 토큰과 비교하고 `keystone`으로 검증 요청을 하지 않는다.  

=== "Header"
    ``` http title="PUT /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/a42bfade-78ec-4c95-b7b4-272ba265072c" linenums="1"
    Content-Type: 
    Content-Length: 21233664
    Host: 182.161.114.101:8080
    Accept-Encoding: identity
    X-Auth-Token: gAAAAABjrkD_e5s9lpQ1vHif6SROJFWbCUa7ySvxD0YfrBS2P3BwgwC-AhPppfXs5uRQoknWTZHWrnm5x2sC5C-B9JUyIgsUDKlQvE3PT5ro7Xm9MdhSpjkYfSu_5YNLizd26s9Zfm7Ctoi7OKG5vpx30vORbQHqtAHx09wbko5g-QSDNSjSIM8
    User-Agent: python-swiftclient-4.1.0
    X-Requestshook-Request-Id: 47c57e9898a4482487b3509f0c1499b4
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="PUT /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/a42bfade-78ec-4c95-b7b4-272ba265072c" linenums="1"
    b'QFI\xfb\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x07\x00\x00\x00'...
    ```


### (21) 201 Created /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/a42bfade-78ec-4c95-b7b4-272ba265072c
`glance-api` <-- `swift-proxy-server`

오브젝트 스토리지로 파일 업로드 성공! 응답한다.  

=== "Header"
    ``` http title="201 Created /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/a42bfade-78ec-4c95-b7b4-272ba265072c" linenums="1"
    Content-Type: text/html; charset=UTF-8
    Content-Length: 0
    Etag: 0c839612eb3f2469420f2ccae990827f
    Last-Modified: Fri, 30 Dec 2022 01:38:09 GMT
    X-Requestshook-Request-Id: 47c57e9898a4482487b3509f0c1499b4
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="201 Created /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/a42bfade-78ec-4c95-b7b4-272ba265072c" linenums="1"
    none
    ```


### (22) 204 No Content /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file
`openstack` <-- `glance-api`

`(13)` 요청에 대해 이미지 파일 업로드 성공 응답(`status=204`)을 전송한다.  

=== "Header"
    ``` http title="204 No Content /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file" linenums="1"
    Content-Type: text/html; charset=UTF-8
    Content-Length: 0
    x-openstack-request-id: req-74f0320e-e525-48c8-b989-5366de6d304b
    X-Requestshook-Request-Id: e4c3be3fe42a47e4a3b3558cec50fe75
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="204 No Content /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file" linenums="1"
    none
    ```

