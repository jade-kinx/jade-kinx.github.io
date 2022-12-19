# openstack image create

이미지를 생성하고 업로드한다.

!!! tip ""
    CLI 참조: [openstack image create](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-create)

## OpenStack Client Command
``` bash title="python3-openstackclient command"
$ openstack image create \
  --disk-format qcow2 \
  --file cirros-0.6.1-x86_64-disk.qcow2 \
  --public \
  cirros-0.6.1-x86_64-disk
```

??? note ".vscode/launch.json"
    ``` json title="configuration .vscode/launch.json"
    {
        "name": "Python: openstack image create",
        "type": "python",
        "request": "launch",
        "program": "Scripts/openstack.exe",
        "args": ["image", "create", 
            "--disk-format", "qcow2", 
            "--file", "cirros-0.6.1-x86_64-disk.qcow2", 
            "--public", 
            "cirros-0.6.1-x86_64-disk"],
        "env": {
            "OS_AUTH_URL": "http://devstack-debug/identity",
            "OS_IDENTITY_API_VERSION": "3",
            "OS_USERNAME": "admin",
            "OS_PASSWORD": "asdf",
            "OS_PROJECT_NAME": "admin",
            "OS_USER_DOMAIN_NAME": "Default",
            "OS_PROJECT_DOMAIN_NAME": "Default"
        },
        "console": "integratedTerminal",
        "justMyCode": false
    },
    ```

위 커맨드를 실행했을 때의 시퀀스 다이어그램 및 HTTP Request/Response 내용은 다음과 같다.  

## Sequence Diagram

!!! note "variables"
    `image_id`: `e6167145-7865-4d3d-ad19-2a59fb3f1870`  
    `image_endpoint_id`: `3195d06aa49541009838146ab9072997`  
    `service_id`: `3a16cadd069e4a70b95f71316ec6f3e8`  

``` mermaid
sequenceDiagram
  autonumber
  participant osc as openstack-client
  participant keystone as keystone-api
  participant glance as glance-api
  participant swift as swift-proxy-server

  osc->>keystone: GET /identity
  keystone-->>osc: 300 MULTIPLE CHOICES /identity
  osc->>keystone: POST /identity/v3/auth/tokens
  keystone-->>osc: 201 CREATED /identity/v3/auth/tokens
  osc->>glance: GET /image
  glance-->>osc: 300 Multiple Choices /image
  osc->>glance: POST /image/v2/images
  glance->>keystone: GET /identity
  keystone-->>glance: 300 MULTIPLE CHOICES /identity
  glance->>keystone: POST /identity/v3/auth/tokens
  keystone-->>glance: 201 CREATED /identity/v3/auth/tokens
  glance->>keystone: GET /identity/v3/auth/tokens
  keystone-->>glance: 200 OK /identity/v3/auth/tokens
  glance->>keystone: GET /identity
  keystone-->>glance: 300 MULTIPLE CHOICES /identity
  glance->>keystone: POST /identity/v3/auth/tokens
  keystone-->>glance: 201 CREATED /identity/v3/auth/tokens
  glance->>keystone: GET /identity/v3/limits/model
  keystone-->>glance: 200 OK /identity/v3/limits/model
  glance->>keystone: GET /identity/v3/endpoints/{image_endpoint_id}
  keystone-->>glance: 200 OK /identity/v3/endpoints/{image_endpoint_id}
  glance->>keystone: GET /identity/v3/limits
  keystone-->>glance: 200 OK /identity/v3/limits
  glance->>keystone: GET /identity/v3/registered_limits
  keystone-->>glance: 200 OK /identity/v3/registered_limits
  glance-->>osc: 201 Created /image/v2/images
  osc->>glance: PUT /image/v2/images/{image_id}/file
  glance->>keystone: GET /identity/v3/limits/model
  keystone-->>glance: 200 OK /identity/v3/limits/model
  glance->>keystone: GET /identity/v3/endpoints/{image_endpoint_id}
  keystone-->>glance: 200 OK /identity/v3/endpoints/{image_endpoint_id}
  glance->>keystone: GET /identity/v3/limits
  keystone-->>glance: 200 OK /identity/v3/limits
  glance->>keystone: GET /identity/v3/registered_limits
  keystone-->>glance: 200 OK /identity/v3/registered_limits
  glance->>keystone: GET /identity/v3/limits/model
  keystone-->>glance: 200 OK /identity/v3/limits/model
  glance->>keystone: GET /identity/v3/endpoints/{image_endpoint_id}
  keystone-->>glance: 200 OK /identity/v3/endpoints/{image_endpoint_id}
  glance->>keystone: GET /identity/v3/limits
  keystone-->>glance: 200 OK /identity/v3/limits
  glance->>keystone: GET /identity/v3/registered_limits
  keystone-->>glance: 200 OK /identity/v3/registered_limits
  glance->>keystone: POST /identity/v3/auth/tokens
  keystone-->>glance: 201 CREATED /identity/v3/auth/tokens
  glance->>swift: HEAD /v1/AUTH_{service_id}/glance
  swift-->>glance: 204 No Content /v1/AUTH_{service_id}/glance
  glance->>swift: PUT /v1/AUTH_{service_id}/glance/{image_id}
  swift-->>glance: 201 Created /v1/AUTH_{service_id}/glance/{image_id}
  glance-->>osc: 204 No Content /image/v2/images/{image_id}/file
```

이미지 서비스(`glance`)에 `cirros-0.6.1-x86_64-disk.qcow2` 이미지 파일 생성 요청에 대한 시퀀스 다이어그램 요약본이다. (쿼터 부분 제외)  
보다 상세한 시퀀스 다이어그램은 [Sequence Diagram(with limits)](#sequence-diagram-with-limits) 확인할 수 있다.  

!!! info
    시퀀스 다이어그램을 간략하게 요약하면 아래와 같다.  

    * `Identity` 서비스에 `credential`을 제공하여 사용자 `access token` 발급 및 서비스 카탈로그 수신(`Image` 서비스 EndPoint)
    * `Image` 서비스에 이미지 생성 요청
    * `Image` 서비스가 사용자 `access token` 검증 (to `Identity` 서비스)
    * 사용자가 `Image` 서비스에 이미지 파일 업로드
    * `Image` 서비스가 `object-store` 서비스 요청에 사용할 `access token` 발급
    * 사용자가 업로드 한 이미지 파일을 `object-store`에 등록
    * 사용자에게 이미지 등록 성공 응답


### (1) GET /identity

=== "Header"
    ``` http title="GET http://182.161.114.101/identity"
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (2) 300 MULTIPLE CHOICES /identity

=== "Header"
    ``` http title="300 MULTIPLE CHOICES http://182.161.114.101/identity"
    Date: Mon, 19 Dec 2022 09:51:26 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 274
    Location: http://182.161.114.101/identity/v3/
    Vary: X-Auth-Token
    x-openstack-request-id: req-f25a8398-94e5-40f6-9cb4-98c822604674
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
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

=== "Header"
    ``` http title="POST http://182.161.114.101/identity/v3/auth/tokens"
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 209
    ```

=== "Body"
    ``` json title="" linenums="1"
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

=== "Header"
    ``` http title="201 CREATED http://182.161.114.101/identity/v3/auth/tokens"
    Date: Mon, 19 Dec 2022 09:51:26 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 3952
    X-Subject-Token: gAAAAABjoDQeumRrUWzsXDWpG2h6Q3lrRNlkJuuzll_i60p4u3V2yoe_5n2CZi5O1EZnvsD40w72bhDpuTPe1ZSQMPOO19Jtkq5cckilgQnO1XSmesyBZrupbA2xqiB2S2esNiC0fhBPQC5bbQzMDVYwio1n7oBYng9e9Z-FOAcTy9xz78Ukj_0
    Vary: X-Auth-Token
    x-openstack-request-id: req-45332e6e-c3c8-4b1a-a687-6b3bc9927c8f
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
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
          "id": "8221f17fbf934d309ba96cf2218be3ff",
          "name": "admin",
          "password_expires_at": null
        },
        "audit_ids": [
          "xk5jCmWBThmVkA2wQKFTKA"
        ],
        "expires_at": "2022-12-19T12:51:26.000000Z",
        "issued_at": "2022-12-19T09:51:26.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "a5362cbd04fd4783a038d5a342d58e87",
          "name": "admin"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "9ec297ce89234ce6bf2813e5e0166e4d",
            "name": "member"
          },
          {
            "id": "dbf0266266eb4ea885528545e3eb59ec",
            "name": "reader"
          },
          {
            "id": "89efad03325b4fb9a021bd88e534bbad",
            "name": "admin"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "06b2a46d96e349d08631686ab53d7e83",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              }
            ],
            "id": "1ca87647ab754599b632a643e5b02c7c",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "254257a27e574069b9510cc4f218afa1",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "2241c852ef204ee5bd4f4092ae9b5c7d",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "a49d989ec6dd4e8f9399cf8a5caf519b",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              }
            ],
            "id": "2baac711c03b4da1abaabe4e0f0f3575",
            "type": "volumev3",
            "name": "cinderv3"
          },
          {
            "endpoints": [
              {
                "id": "3195d06aa49541009838146ab9072997",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "4134c089d54f40c4bff6629c9b3c8b17",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "be657c3c268e49c08bb0d31aa7b79b01",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "59d326ea519d4ad58dcc784330c372a4",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "64319e2274594aca8b7ff17be26f1306",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              },
              {
                "id": "721a5750cf0448729c85f21749859ec0",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              }
            ],
            "id": "5b4f3dd567054612914e94f37e396d05",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "dac7532e7f2547d59c42be1309388076",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "5f8648439aa0443588164675566362a4",
            "type": "placement",
            "name": "placement"
          },
          {
            "endpoints": [
              {
                "id": "0d3a0c91848845ddb1794791ceeed1db",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              },
              {
                "id": "d4e369995c8847d9aaeeab1824dc3a02",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              },
              {
                "id": "de625690480c40878f484c10f0cc21c3",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              }
            ],
            "id": "985cf9347e11431bbbc8640d3c73e064",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "ce7d3f34c48d4c1a877222ca8403bcbc",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              }
            ],
            "id": "ec5120d847b7457485bbbafc555df0af",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "82bfd276ae734c3788bc66159b0c6d39",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "fa5e4dfaffbe476c88be86bbc10f092e",
            "type": "compute",
            "name": "nova"
          }
        ]
      }
    }
    ```


### (5) GET /image

=== "Header"
    ``` http title="GET http://182.161.114.101/image"
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (6) 300 Multiple Choices /image

=== "Header"
    ``` http title="300 Multiple Choices http://182.161.114.101/image"
    Date: Mon, 19 Dec 2022 09:51:27 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 1347
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    {
      "versions": [
        {
          "id": "v2.16",
          "status": "CURRENT",
          "links": [
            {
              "rel": "self",
              "href": "http://182.161.114.101/image/v2/"
            }
          ]
        },
        {
          "id": "v2.15",
          "status": "SUPPORTED",
          "links": [
            {
              "rel": "self",
              "href": "http://182.161.114.101/image/v2/"
            }
          ]
        },
        {
          "id": "v2.14",
          "status": "SUPPORTED",
          "links": [
            {
              "rel": "self",
              "href": "http://182.161.114.101/image/v2/"
            }
          ]
        },
        {
          "id": "v2.9",
          "status": "SUPPORTED",
          "links": [
            {
              "rel": "self",
              "href": "http://182.161.114.101/image/v2/"
            }
          ]
        },
        {
          "id": "v2.7",
          "status": "SUPPORTED",
          "links": [
            {
              "rel": "self",
              "href": "http://182.161.114.101/image/v2/"
            }
          ]
        },
        {
          "id": "v2.6",
          "status": "SUPPORTED",
          "links": [
            {
              "rel": "self",
              "href": "http://182.161.114.101/image/v2/"
            }
          ]
        },
        {
          "id": "v2.5",
          "status": "SUPPORTED",
          "links": [
            {
              "rel": "self",
              "href": "http://182.161.114.101/image/v2/"
            }
          ]
        },
        {
          "id": "v2.4",
          "status": "SUPPORTED",
          "links": [
            {
              "rel": "self",
              "href": "http://182.161.114.101/image/v2/"
            }
          ]
        },
        {
          "id": "v2.3",
          "status": "SUPPORTED",
          "links": [
            {
              "rel": "self",
              "href": "http://182.161.114.101/image/v2/"
            }
          ]
        },
        {
          "id": "v2.2",
          "status": "SUPPORTED",
          "links": [
            {
              "rel": "self",
              "href": "http://182.161.114.101/image/v2/"
            }
          ]
        },
        {
          "id": "v2.1",
          "status": "SUPPORTED",
          "links": [
            {
              "rel": "self",
              "href": "http://182.161.114.101/image/v2/"
            }
          ]
        },
        {
          "id": "v2.0",
          "status": "SUPPORTED",
          "links": [
            {
              "rel": "self",
              "href": "http://182.161.114.101/image/v2/"
            }
          ]
        }
      ]
    }
    ```


### (7) POST /image/v2/images

=== "Header"
    ``` http title="POST http://182.161.114.101/image/v2/images"
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjoDQeumRrUWzsXDWpG2h6Q3lrRNlkJuuzll_i60p4u3V2yoe_5n2CZi5O1EZnvsD40w72bhDpuTPe1ZSQMPOO19Jtkq5cckilgQnO1XSmesyBZrupbA2xqiB2S2esNiC0fhBPQC5bbQzMDVYwio1n7oBYng9e9Z-FOAcTy9xz78Ukj_0
    Content-Type: application/json
    Content-Length: 260
    ```

=== "Body"
    ``` json title="" linenums="1"
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


### (8) GET /identity

=== "Header"
    ``` http title="GET http://182.161.114.101/identity"
    User-Agent: glance/25.0.1.dev4 keystonemiddleware.auth_token/10.1.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (9) 300 MULTIPLE CHOICES /identity

=== "Header"
    ``` http title="300 MULTIPLE CHOICES http://182.161.114.101/identity"
    Date: Mon, 19 Dec 2022 09:51:27 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 274
    Location: http://182.161.114.101/identity/v3/
    Vary: X-Auth-Token
    x-openstack-request-id: req-0cfea7ac-2639-452e-98ff-df6c5559f6f5
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
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


### (10) POST /identity/v3/auth/tokens

=== "Header"
    ``` http title="POST http://182.161.114.101/identity/v3/auth/tokens"
    User-Agent: glance/25.0.1.dev4 keystonemiddleware.auth_token/10.1.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 216
    ```

=== "Body"
    ``` json title="" linenums="1"
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


### (11) 201 CREATED /identity/v3/auth/tokens

=== "Header"
    ``` http title="201 CREATED http://182.161.114.101/identity/v3/auth/tokens"
    Date: Mon, 19 Dec 2022 09:51:27 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 3833
    X-Subject-Token: gAAAAABjoDQfrGmFjnYo58OFrsx_voPKDiWGp2sT1K6-kVSHnBNL5hIOAeGoPkqNOnpChKrUTSW5pgV065lkpnZh24ZrC7vcjtVpqKTwE7dlfZYTZpJehU35KUDgE02fU52MwQN-qZDLLTLlT6Hk-3nlf3SzWcRJLMfxK3_rCa9m35T8rQoYcuY
    Vary: X-Auth-Token
    x-openstack-request-id: req-0b8e3b7e-e7db-4f03-9346-1c93f45dee44
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
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
          "id": "e154ddd315034334b04ae767862bfac0",
          "name": "glance",
          "password_expires_at": null
        },
        "audit_ids": [
          "KEjbUeBgReOhG2G8ikeQPQ"
        ],
        "expires_at": "2022-12-19T12:51:27.000000Z",
        "issued_at": "2022-12-19T09:51:27.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "3a16cadd069e4a70b95f71316ec6f3e8",
          "name": "service"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "13c44153bc6a47f0b4fd116b3b4128fe",
            "name": "service"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "06b2a46d96e349d08631686ab53d7e83",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              }
            ],
            "id": "1ca87647ab754599b632a643e5b02c7c",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "254257a27e574069b9510cc4f218afa1",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "2241c852ef204ee5bd4f4092ae9b5c7d",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "a49d989ec6dd4e8f9399cf8a5caf519b",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              }
            ],
            "id": "2baac711c03b4da1abaabe4e0f0f3575",
            "type": "volumev3",
            "name": "cinderv3"
          },
          {
            "endpoints": [
              {
                "id": "3195d06aa49541009838146ab9072997",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "4134c089d54f40c4bff6629c9b3c8b17",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "be657c3c268e49c08bb0d31aa7b79b01",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "59d326ea519d4ad58dcc784330c372a4",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "64319e2274594aca8b7ff17be26f1306",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              },
              {
                "id": "721a5750cf0448729c85f21749859ec0",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              }
            ],
            "id": "5b4f3dd567054612914e94f37e396d05",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "dac7532e7f2547d59c42be1309388076",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "5f8648439aa0443588164675566362a4",
            "type": "placement",
            "name": "placement"
          },
          {
            "endpoints": [
              {
                "id": "0d3a0c91848845ddb1794791ceeed1db",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              },
              {
                "id": "d4e369995c8847d9aaeeab1824dc3a02",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              },
              {
                "id": "de625690480c40878f484c10f0cc21c3",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              }
            ],
            "id": "985cf9347e11431bbbc8640d3c73e064",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "ce7d3f34c48d4c1a877222ca8403bcbc",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              }
            ],
            "id": "ec5120d847b7457485bbbafc555df0af",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "82bfd276ae734c3788bc66159b0c6d39",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "fa5e4dfaffbe476c88be86bbc10f092e",
            "type": "compute",
            "name": "nova"
          }
        ]
      }
    }
    ```


### (12) GET /identity/v3/auth/tokens

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/auth/tokens"
    User-Agent: python-keystoneclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Subject-Token: gAAAAABjoDQeumRrUWzsXDWpG2h6Q3lrRNlkJuuzll_i60p4u3V2yoe_5n2CZi5O1EZnvsD40w72bhDpuTPe1ZSQMPOO19Jtkq5cckilgQnO1XSmesyBZrupbA2xqiB2S2esNiC0fhBPQC5bbQzMDVYwio1n7oBYng9e9Z-FOAcTy9xz78Ukj_0
    OpenStack-Identity-Access-Rules: 1
    X-Auth-Token: gAAAAABjoDQfrGmFjnYo58OFrsx_voPKDiWGp2sT1K6-kVSHnBNL5hIOAeGoPkqNOnpChKrUTSW5pgV065lkpnZh24ZrC7vcjtVpqKTwE7dlfZYTZpJehU35KUDgE02fU52MwQN-qZDLLTLlT6Hk-3nlf3SzWcRJLMfxK3_rCa9m35T8rQoYcuY
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (13) 200 OK /identity/v3/auth/tokens

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/auth/tokens"
    Date: Mon, 19 Dec 2022 09:51:27 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 3952
    X-Subject-Token: gAAAAABjoDQeumRrUWzsXDWpG2h6Q3lrRNlkJuuzll_i60p4u3V2yoe_5n2CZi5O1EZnvsD40w72bhDpuTPe1ZSQMPOO19Jtkq5cckilgQnO1XSmesyBZrupbA2xqiB2S2esNiC0fhBPQC5bbQzMDVYwio1n7oBYng9e9Z-FOAcTy9xz78Ukj_0
    Vary: X-Auth-Token
    x-openstack-request-id: req-c11df686-7089-486f-83f5-6c9e7cba9c0b
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
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
          "id": "8221f17fbf934d309ba96cf2218be3ff",
          "name": "admin",
          "password_expires_at": null
        },
        "audit_ids": [
          "xk5jCmWBThmVkA2wQKFTKA"
        ],
        "expires_at": "2022-12-19T12:51:26.000000Z",
        "issued_at": "2022-12-19T09:51:26.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "a5362cbd04fd4783a038d5a342d58e87",
          "name": "admin"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "9ec297ce89234ce6bf2813e5e0166e4d",
            "name": "member"
          },
          {
            "id": "dbf0266266eb4ea885528545e3eb59ec",
            "name": "reader"
          },
          {
            "id": "89efad03325b4fb9a021bd88e534bbad",
            "name": "admin"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "06b2a46d96e349d08631686ab53d7e83",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              }
            ],
            "id": "1ca87647ab754599b632a643e5b02c7c",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "254257a27e574069b9510cc4f218afa1",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "2241c852ef204ee5bd4f4092ae9b5c7d",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "a49d989ec6dd4e8f9399cf8a5caf519b",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              }
            ],
            "id": "2baac711c03b4da1abaabe4e0f0f3575",
            "type": "volumev3",
            "name": "cinderv3"
          },
          {
            "endpoints": [
              {
                "id": "3195d06aa49541009838146ab9072997",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "4134c089d54f40c4bff6629c9b3c8b17",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "be657c3c268e49c08bb0d31aa7b79b01",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "59d326ea519d4ad58dcc784330c372a4",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "64319e2274594aca8b7ff17be26f1306",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              },
              {
                "id": "721a5750cf0448729c85f21749859ec0",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              }
            ],
            "id": "5b4f3dd567054612914e94f37e396d05",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "dac7532e7f2547d59c42be1309388076",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "5f8648439aa0443588164675566362a4",
            "type": "placement",
            "name": "placement"
          },
          {
            "endpoints": [
              {
                "id": "0d3a0c91848845ddb1794791ceeed1db",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              },
              {
                "id": "d4e369995c8847d9aaeeab1824dc3a02",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              },
              {
                "id": "de625690480c40878f484c10f0cc21c3",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              }
            ],
            "id": "985cf9347e11431bbbc8640d3c73e064",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "ce7d3f34c48d4c1a877222ca8403bcbc",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/a5362cbd04fd4783a038d5a342d58e87",
                "region": "RegionOne"
              }
            ],
            "id": "ec5120d847b7457485bbbafc555df0af",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "82bfd276ae734c3788bc66159b0c6d39",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "fa5e4dfaffbe476c88be86bbc10f092e",
            "type": "compute",
            "name": "nova"
          }
        ]
      }
    }
    ```


### (14) GET /identity

=== "Header"
    ``` http title="GET http://182.161.114.101/identity"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (15) 300 MULTIPLE CHOICES /identity

=== "Header"
    ``` http title="300 MULTIPLE CHOICES http://182.161.114.101/identity"
    Date: Mon, 19 Dec 2022 09:51:28 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 274
    Location: http://182.161.114.101/identity/v3/
    Vary: X-Auth-Token
    x-openstack-request-id: req-e9761c37-3bcf-4df1-a2a0-2bf81f6df463
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
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


### (16) POST /identity/v3/auth/tokens

=== "Header"
    ``` http title="POST http://182.161.114.101/identity/v3/auth/tokens"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 178
    ```

=== "Body"
    ``` json title="" linenums="1"
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
          "system": {
            "all": true
          }
        }
      }
    }
    ```


### (17) 201 CREATED /identity/v3/auth/tokens

=== "Header"
    ``` http title="201 CREATED http://182.161.114.101/identity/v3/auth/tokens"
    Date: Mon, 19 Dec 2022 09:51:28 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 2374
    X-Subject-Token: gAAAAABjoDQgyKt9jacLcgtWnxShO2lT_slnGqIzg2Q8L0h3TimXFnvkN8y-XYXQrRk-twcEjY41O-U8kPsUVVpZQNpiTWIspvJYFV_V3_LgmUPR9S9HfnUJfWs8CaGGb_tZdQPLGjXuUKZuiEq6HCFtd1yc7DcdSg
    Vary: X-Auth-Token
    x-openstack-request-id: req-75626f8f-0227-40d2-b599-248d0df2e58d
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
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
          "id": "e154ddd315034334b04ae767862bfac0",
          "name": "glance",
          "password_expires_at": null
        },
        "audit_ids": [
          "ZVyW-FZBSquhFnG3l-ng8A"
        ],
        "expires_at": "2022-12-19T12:51:28.000000Z",
        "issued_at": "2022-12-19T09:51:28.000000Z",
        "roles": [
          {
            "id": "dbf0266266eb4ea885528545e3eb59ec",
            "name": "reader"
          }
        ],
        "system": {
          "all": true
        },
        "catalog": [
          {
            "endpoints": [],
            "id": "1ca87647ab754599b632a643e5b02c7c",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "254257a27e574069b9510cc4f218afa1",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "2241c852ef204ee5bd4f4092ae9b5c7d",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [],
            "id": "2baac711c03b4da1abaabe4e0f0f3575",
            "type": "volumev3",
            "name": "cinderv3"
          },
          {
            "endpoints": [
              {
                "id": "3195d06aa49541009838146ab9072997",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "4134c089d54f40c4bff6629c9b3c8b17",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "be657c3c268e49c08bb0d31aa7b79b01",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "59d326ea519d4ad58dcc784330c372a4",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "64319e2274594aca8b7ff17be26f1306",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              }
            ],
            "id": "5b4f3dd567054612914e94f37e396d05",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "dac7532e7f2547d59c42be1309388076",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "5f8648439aa0443588164675566362a4",
            "type": "placement",
            "name": "placement"
          },
          {
            "endpoints": [],
            "id": "985cf9347e11431bbbc8640d3c73e064",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [],
            "id": "ec5120d847b7457485bbbafc555df0af",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "82bfd276ae734c3788bc66159b0c6d39",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "fa5e4dfaffbe476c88be86bbc10f092e",
            "type": "compute",
            "name": "nova"
          }
        ]
      }
    }
    ```


### (18) GET /identity/v3/limits/model

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/limits/model"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjoDQgyKt9jacLcgtWnxShO2lT_slnGqIzg2Q8L0h3TimXFnvkN8y-XYXQrRk-twcEjY41O-U8kPsUVVpZQNpiTWIspvJYFV_V3_LgmUPR9S9HfnUJfWs8CaGGb_tZdQPLGjXuUKZuiEq6HCFtd1yc7DcdSg
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (19) 200 OK /identity/v3/limits/model

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/limits/model"
    Date: Mon, 19 Dec 2022 09:51:28 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 131
    Vary: X-Auth-Token
    x-openstack-request-id: req-8540a05a-248c-48f9-915c-ce8705916036
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    {
      "model": {
        "name": "flat",
        "description": "Limit enforcement and validation does not take project hierarchy into consideration."
      }
    }
    ```


### (20) GET /identity/v3/endpoints/{image_endpoint_id}

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjoDQgyKt9jacLcgtWnxShO2lT_slnGqIzg2Q8L0h3TimXFnvkN8y-XYXQrRk-twcEjY41O-U8kPsUVVpZQNpiTWIspvJYFV_V3_LgmUPR9S9HfnUJfWs8CaGGb_tZdQPLGjXuUKZuiEq6HCFtd1yc7DcdSg
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (21) 200 OK /identity/v3/endpoints/{image_endpoint_id}

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997"
    Date: Mon, 19 Dec 2022 09:51:28 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 335
    Vary: X-Auth-Token
    x-openstack-request-id: req-c38b23b1-a66b-491a-bef4-e33b018351b1
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    {
      "endpoint": {
        "id": "3195d06aa49541009838146ab9072997",
        "interface": "public",
        "region_id": "RegionOne",
        "service_id": "4134c089d54f40c4bff6629c9b3c8b17",
        "url": "http://182.161.114.101/image",
        "enabled": true,
        "region": "RegionOne",
        "links": {
          "self": "http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997"
        }
      }
    }
    ```


### (22) GET /identity/v3/limits

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_total&project_id=a5362cbd04fd4783a038d5a342d58e87"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Auth-Token: gAAAAABjoDQgyKt9jacLcgtWnxShO2lT_slnGqIzg2Q8L0h3TimXFnvkN8y-XYXQrRk-twcEjY41O-U8kPsUVVpZQNpiTWIspvJYFV_V3_LgmUPR9S9HfnUJfWs8CaGGb_tZdQPLGjXuUKZuiEq6HCFtd1yc7DcdSg
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (23) 200 OK /identity/v3/limits

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_total&project_id=a5362cbd04fd4783a038d5a342d58e87"
    Date: Mon, 19 Dec 2022 09:51:28 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 251
    Vary: X-Auth-Token
    x-openstack-request-id: req-1e6cb7ba-7a5f-453c-bcae-64ece3245340
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    {
      "limits": [],
      "links": {
        "next": null,
        "self": "http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_total&project_id=a5362cbd04fd4783a038d5a342d58e87",
        "previous": null
      }
    }
    ```


### (24) GET /identity/v3/registered_limits

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_total"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Auth-Token: gAAAAABjoDQgyKt9jacLcgtWnxShO2lT_slnGqIzg2Q8L0h3TimXFnvkN8y-XYXQrRk-twcEjY41O-U8kPsUVVpZQNpiTWIspvJYFV_V3_LgmUPR9S9HfnUJfWs8CaGGb_tZdQPLGjXuUKZuiEq6HCFtd1yc7DcdSg
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (25) 200 OK /identity/v3/registered_limits

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_total"
    Date: Mon, 19 Dec 2022 09:51:28 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 536
    Vary: X-Auth-Token
    x-openstack-request-id: req-c613cc00-89eb-45a1-ba0c-30516f8c56de
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    {
      "registered_limits": [
        {
          "id": "947b046d15744348860246b59fbe412e",
          "service_id": "4134c089d54f40c4bff6629c9b3c8b17",
          "region_id": "RegionOne",
          "resource_name": "image_count_total",
          "default_limit": 100,
          "description": null,
          "links": {
            "self": "http://182.161.114.101/identity/v3/registered_limits/947b046d15744348860246b59fbe412e"
          }
        }
      ],
      "links": {
        "next": null,
        "self": "http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_total",
        "previous": null
      }
    }
    ```


### (26) 201 Created /image/v2/images

=== "Header"
    ``` http title="201 Created http://182.161.114.101/image/v2/images"
    Date: Mon, 19 Dec 2022 09:51:29 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Length: 781
    Content-Type: application/json
    Location: http://127.0.0.1:60999/v2/images/e6167145-7865-4d3d-ad19-2a59fb3f1870
    Openstack-Image-Import-Methods: glance-direct,web-download,copy-image
    X-Openstack-Request-Id: req-c29110cd-469e-4eb0-90ee-2d529dd78f36
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
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
      "owner": "a5362cbd04fd4783a038d5a342d58e87",
      "os_hidden": false,
      "os_hash_algo": null,
      "os_hash_value": null,
      "id": "e6167145-7865-4d3d-ad19-2a59fb3f1870",
      "created_at": "2022-12-19T09:51:29Z",
      "updated_at": "2022-12-19T09:51:29Z",
      "tags": [],
      "self": "/v2/images/e6167145-7865-4d3d-ad19-2a59fb3f1870",
      "file": "/v2/images/e6167145-7865-4d3d-ad19-2a59fb3f1870/file",
      "schema": "/v2/schemas/image"
    }
    ```


### (27) PUT /image/v2/images/{image_id}/file

=== "Header"
    ``` http title="PUT http://182.161.114.101/image/v2/images/e6167145-7865-4d3d-ad19-2a59fb3f1870/file"
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: 
    Connection: keep-alive
    Content-Type: application/octet-stream
    X-Auth-Token: gAAAAABjoDQeumRrUWzsXDWpG2h6Q3lrRNlkJuuzll_i60p4u3V2yoe_5n2CZi5O1EZnvsD40w72bhDpuTPe1ZSQMPOO19Jtkq5cckilgQnO1XSmesyBZrupbA2xqiB2S2esNiC0fhBPQC5bbQzMDVYwio1n7oBYng9e9Z-FOAcTy9xz78Ukj_0
    Content-Length: 21233664
    ```

=== "Body"
    ``` json title="" linenums="1"
    <_io.BufferedReader name='cirros-0.6.1-x86_64-disk.img'>
    ```


### (28) GET /identity/v3/limits/model

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/limits/model"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjoDQgyKt9jacLcgtWnxShO2lT_slnGqIzg2Q8L0h3TimXFnvkN8y-XYXQrRk-twcEjY41O-U8kPsUVVpZQNpiTWIspvJYFV_V3_LgmUPR9S9HfnUJfWs8CaGGb_tZdQPLGjXuUKZuiEq6HCFtd1yc7DcdSg
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (29) 200 OK /identity/v3/limits/model

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/limits/model"
    Date: Mon, 19 Dec 2022 09:51:29 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 131
    Vary: X-Auth-Token
    x-openstack-request-id: req-0b414c30-bad5-4e3d-a2bb-15dac76798b6
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    {
      "model": {
        "name": "flat",
        "description": "Limit enforcement and validation does not take project hierarchy into consideration."
      }
    }
    ```


### (30) GET /identity/v3/endpoints/{image_endpoint_id}

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjoDQgyKt9jacLcgtWnxShO2lT_slnGqIzg2Q8L0h3TimXFnvkN8y-XYXQrRk-twcEjY41O-U8kPsUVVpZQNpiTWIspvJYFV_V3_LgmUPR9S9HfnUJfWs8CaGGb_tZdQPLGjXuUKZuiEq6HCFtd1yc7DcdSg
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (31) 200 OK /identity/v3/endpoints/{image_endpoint_id}

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997"
    Date: Mon, 19 Dec 2022 09:51:29 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 335
    Vary: X-Auth-Token
    x-openstack-request-id: req-c42949dd-c96f-4d78-8c04-8067e9a45dd7
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    {
      "endpoint": {
        "id": "3195d06aa49541009838146ab9072997",
        "interface": "public",
        "region_id": "RegionOne",
        "service_id": "4134c089d54f40c4bff6629c9b3c8b17",
        "url": "http://182.161.114.101/image",
        "enabled": true,
        "region": "RegionOne",
        "links": {
          "self": "http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997"
        }
      }
    }
    ```


### (32) GET /identity/v3/limits

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_size_total&project_id=a5362cbd04fd4783a038d5a342d58e87"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Auth-Token: gAAAAABjoDQgyKt9jacLcgtWnxShO2lT_slnGqIzg2Q8L0h3TimXFnvkN8y-XYXQrRk-twcEjY41O-U8kPsUVVpZQNpiTWIspvJYFV_V3_LgmUPR9S9HfnUJfWs8CaGGb_tZdQPLGjXuUKZuiEq6HCFtd1yc7DcdSg
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (33) 200 OK /identity/v3/limits

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_size_total&project_id=a5362cbd04fd4783a038d5a342d58e87"
    Date: Mon, 19 Dec 2022 09:51:29 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 250
    Vary: X-Auth-Token
    x-openstack-request-id: req-be9d2e42-3d65-421a-ace8-3e8e70bebb61
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    {
      "limits": [],
      "links": {
        "next": null,
        "self": "http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_size_total&project_id=a5362cbd04fd4783a038d5a342d58e87",
        "previous": null
      }
    }
    ```


### (34) GET /identity/v3/registered_limits

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_size_total"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Auth-Token: gAAAAABjoDQgyKt9jacLcgtWnxShO2lT_slnGqIzg2Q8L0h3TimXFnvkN8y-XYXQrRk-twcEjY41O-U8kPsUVVpZQNpiTWIspvJYFV_V3_LgmUPR9S9HfnUJfWs8CaGGb_tZdQPLGjXuUKZuiEq6HCFtd1yc7DcdSg
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (35) 200 OK /identity/v3/registered_limits

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_size_total"
    Date: Mon, 19 Dec 2022 09:51:29 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 535
    Vary: X-Auth-Token
    x-openstack-request-id: req-ab2e3de2-8b0a-4900-a984-02276701773e
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    {
      "registered_limits": [
        {
          "id": "a05124bb153d4bccab75eaeef20b2564",
          "service_id": "4134c089d54f40c4bff6629c9b3c8b17",
          "region_id": "RegionOne",
          "resource_name": "image_size_total",
          "default_limit": 1000,
          "description": null,
          "links": {
            "self": "http://182.161.114.101/identity/v3/registered_limits/a05124bb153d4bccab75eaeef20b2564"
          }
        }
      ],
      "links": {
        "next": null,
        "self": "http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_size_total",
        "previous": null
      }
    }
    ```


### (36) GET /identity/v3/limits/model

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/limits/model"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjoDQgyKt9jacLcgtWnxShO2lT_slnGqIzg2Q8L0h3TimXFnvkN8y-XYXQrRk-twcEjY41O-U8kPsUVVpZQNpiTWIspvJYFV_V3_LgmUPR9S9HfnUJfWs8CaGGb_tZdQPLGjXuUKZuiEq6HCFtd1yc7DcdSg
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (37) 200 OK /identity/v3/limits/model

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/limits/model"
    Date: Mon, 19 Dec 2022 09:51:30 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 131
    Vary: X-Auth-Token
    x-openstack-request-id: req-f8833bee-3ee8-429b-a2b1-f206c817562e
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    {
      "model": {
        "name": "flat",
        "description": "Limit enforcement and validation does not take project hierarchy into consideration."
      }
    }
    ```


### (38) GET /identity/v3/endpoints/{image_endpoint_id}

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjoDQgyKt9jacLcgtWnxShO2lT_slnGqIzg2Q8L0h3TimXFnvkN8y-XYXQrRk-twcEjY41O-U8kPsUVVpZQNpiTWIspvJYFV_V3_LgmUPR9S9HfnUJfWs8CaGGb_tZdQPLGjXuUKZuiEq6HCFtd1yc7DcdSg
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (39) 200 OK /identity/v3/endpoints/{image_endpoint_id}

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997"
    Date: Mon, 19 Dec 2022 09:51:30 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 335
    Vary: X-Auth-Token
    x-openstack-request-id: req-242fb63d-9d68-4854-be03-14361aa1657b
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    {
      "endpoint": {
        "id": "3195d06aa49541009838146ab9072997",
        "interface": "public",
        "region_id": "RegionOne",
        "service_id": "4134c089d54f40c4bff6629c9b3c8b17",
        "url": "http://182.161.114.101/image",
        "enabled": true,
        "region": "RegionOne",
        "links": {
          "self": "http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997"
        }
      }
    }
    ```


### (40) GET /identity/v3/limits

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_uploading&project_id=a5362cbd04fd4783a038d5a342d58e87"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Auth-Token: gAAAAABjoDQgyKt9jacLcgtWnxShO2lT_slnGqIzg2Q8L0h3TimXFnvkN8y-XYXQrRk-twcEjY41O-U8kPsUVVpZQNpiTWIspvJYFV_V3_LgmUPR9S9HfnUJfWs8CaGGb_tZdQPLGjXuUKZuiEq6HCFtd1yc7DcdSg
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (41) 200 OK /identity/v3/limits

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_uploading&project_id=a5362cbd04fd4783a038d5a342d58e87"
    Date: Mon, 19 Dec 2022 09:51:30 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 255
    Vary: X-Auth-Token
    x-openstack-request-id: req-d4a551d6-2d1e-4972-8eea-1a92a34a4828
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    {
      "limits": [],
      "links": {
        "next": null,
        "self": "http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_uploading&project_id=a5362cbd04fd4783a038d5a342d58e87",
        "previous": null
      }
    }
    ```


### (42) GET /identity/v3/registered_limits

=== "Header"
    ``` http title="GET http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_uploading"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Auth-Token: gAAAAABjoDQgyKt9jacLcgtWnxShO2lT_slnGqIzg2Q8L0h3TimXFnvkN8y-XYXQrRk-twcEjY41O-U8kPsUVVpZQNpiTWIspvJYFV_V3_LgmUPR9S9HfnUJfWs8CaGGb_tZdQPLGjXuUKZuiEq6HCFtd1yc7DcdSg
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (43) 200 OK /identity/v3/registered_limits

=== "Header"
    ``` http title="200 OK http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_uploading"
    Date: Mon, 19 Dec 2022 09:51:30 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 544
    Vary: X-Auth-Token
    x-openstack-request-id: req-5a32ddc7-65d2-4478-98d1-0342a2704250
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    {
      "registered_limits": [
        {
          "id": "00d03c3ab2e54a9dbecc16794cd301ee",
          "service_id": "4134c089d54f40c4bff6629c9b3c8b17",
          "region_id": "RegionOne",
          "resource_name": "image_count_uploading",
          "default_limit": 100,
          "description": null,
          "links": {
            "self": "http://182.161.114.101/identity/v3/registered_limits/00d03c3ab2e54a9dbecc16794cd301ee"
          }
        }
      ],
      "links": {
        "next": null,
        "self": "http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_uploading",
        "previous": null
      }
    }
    ```


### (44) POST /identity/v3/auth/tokens

=== "Header"
    ``` http title="POST http://182.161.114.101/identity/v3/auth/tokens"
    User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 218
    ```

=== "Body"
    ``` json title="" linenums="1"
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


### (45) 201 CREATED /identity/v3/auth/tokens

=== "Header"
    ``` http title="201 CREATED http://182.161.114.101/identity/v3/auth/tokens"
    Date: Mon, 19 Dec 2022 09:51:31 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: application/json
    Content-Length: 3908
    X-Subject-Token: gAAAAABjoDQjYIaV2pexhwK0cX02IPQi_8HKs16hGQAAIlmw5fMpL7qG9lXL4ucih6AQSauf1BXRJxChYtjSviirRl3LfqdjxfP-ZIEcy8P52l63QsCEqSPwK_-N4oT_gcJ7tA37zT6UhrXlv3WjKXdE_8_38tBgCPafqOtaM3ALVcboAhiq-c4
    Vary: X-Auth-Token
    x-openstack-request-id: req-328c2527-403d-44bf-8bd2-cddedee4280f
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
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
          "id": "ab4a76f145da47358af69726f9f18354",
          "name": "glance-swift",
          "password_expires_at": null
        },
        "audit_ids": [
          "9FC1oZ99TR-I-9ng2GwXyw"
        ],
        "expires_at": "2022-12-19T12:51:31.000000Z",
        "issued_at": "2022-12-19T09:51:31.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "3a16cadd069e4a70b95f71316ec6f3e8",
          "name": "service"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "9ca87e2f3c074bab876f4574ca5ea89a",
            "name": "ResellerAdmin"
          },
          {
            "id": "13c44153bc6a47f0b4fd116b3b4128fe",
            "name": "service"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "06b2a46d96e349d08631686ab53d7e83",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              }
            ],
            "id": "1ca87647ab754599b632a643e5b02c7c",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "254257a27e574069b9510cc4f218afa1",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "2241c852ef204ee5bd4f4092ae9b5c7d",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "a49d989ec6dd4e8f9399cf8a5caf519b",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              }
            ],
            "id": "2baac711c03b4da1abaabe4e0f0f3575",
            "type": "volumev3",
            "name": "cinderv3"
          },
          {
            "endpoints": [
              {
                "id": "3195d06aa49541009838146ab9072997",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "4134c089d54f40c4bff6629c9b3c8b17",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "be657c3c268e49c08bb0d31aa7b79b01",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "59d326ea519d4ad58dcc784330c372a4",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "64319e2274594aca8b7ff17be26f1306",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              },
              {
                "id": "721a5750cf0448729c85f21749859ec0",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              }
            ],
            "id": "5b4f3dd567054612914e94f37e396d05",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "dac7532e7f2547d59c42be1309388076",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "5f8648439aa0443588164675566362a4",
            "type": "placement",
            "name": "placement"
          },
          {
            "endpoints": [
              {
                "id": "0d3a0c91848845ddb1794791ceeed1db",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              },
              {
                "id": "d4e369995c8847d9aaeeab1824dc3a02",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              },
              {
                "id": "de625690480c40878f484c10f0cc21c3",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              }
            ],
            "id": "985cf9347e11431bbbc8640d3c73e064",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "ce7d3f34c48d4c1a877222ca8403bcbc",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/3a16cadd069e4a70b95f71316ec6f3e8",
                "region": "RegionOne"
              }
            ],
            "id": "ec5120d847b7457485bbbafc555df0af",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "82bfd276ae734c3788bc66159b0c6d39",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "fa5e4dfaffbe476c88be86bbc10f092e",
            "type": "compute",
            "name": "nova"
          }
        ]
      }
    }
    ```


### (46) HEAD /v1/AUTH_{service_id}/glance

=== "Header"
    ``` http title="HEAD http://182.161.114.101:8080/v1/AUTH_3a16cadd069e4a70b95f71316ec6f3e8/glance"
    x-auth-token: b'gAAAAABjoDQjYIaV2pexhwK0cX02IPQi_8HKs16hGQAAIlmw5fMpL7qG9lXL4ucih6AQSauf1BXRJxChYtjSviirRl3LfqdjxfP-ZIEcy8P52l63QsCEqSPwK_-N4oT_gcJ7tA37zT6UhrXlv3WjKXdE_8_38tBgCPafqOtaM3ALVcboAhiq-c4'
    user-agent: python-swiftclient-4.1.0
    ```

=== "Body"
    ``` json title="" linenums="1"
    None
    ```


### (47) 204 No Content /v1/AUTH_{service_id}/glance

=== "Header"
    ``` http title="204 No Content http://182.161.114.101:8080/v1/AUTH_3a16cadd069e4a70b95f71316ec6f3e8/glance"
    Content-Type: text/plain; charset=utf-8
    X-Container-Object-Count: 2
    X-Container-Bytes-Used: 1049344512
    X-Timestamp: 1670302054.88139
    Last-Modified: Tue, 06 Dec 2022 04:47:35 GMT
    Accept-Ranges: bytes
    X-Storage-Policy: Policy-0
    X-Container-Sharding: False
    Vary: Accept
    Content-Length: 0
    X-Trans-Id: tx56c31b3334a34a3288c65-0063a03423
    X-Openstack-Request-Id: tx56c31b3334a34a3288c65-0063a03423
    Date: Mon, 19 Dec 2022 09:51:31 GMT
    ```

=== "Body"
    ``` json title="" linenums="1"
    
    ```


### (48) PUT /v1/AUTH_{service_id}/glance/{image_id}

=== "Header"
    ``` http title="PUT http://182.161.114.101:8080/v1/AUTH_3a16cadd069e4a70b95f71316ec6f3e8/glance/e6167145-7865-4d3d-ad19-2a59fb3f1870"
    x-auth-token: b'gAAAAABjoDQjYIaV2pexhwK0cX02IPQi_8HKs16hGQAAIlmw5fMpL7qG9lXL4ucih6AQSauf1BXRJxChYtjSviirRl3LfqdjxfP-ZIEcy8P52l63QsCEqSPwK_-N4oT_gcJ7tA37zT6UhrXlv3WjKXdE_8_38tBgCPafqOtaM3ALVcboAhiq-c4'
    Content-Length: 21233664
    user-agent: python-swiftclient-4.1.0
    ```

=== "Body"
    ``` json title="" linenums="1"
    <swiftclient.utils.LengthWrapper object at 0x7f1e3d78c6a0>
    ```


### (49) 201 Created /v1/AUTH_{service_id}/glance/{image_id}

=== "Header"
    ``` http title="201 Created http://182.161.114.101:8080/v1/AUTH_3a16cadd069e4a70b95f71316ec6f3e8/glance/e6167145-7865-4d3d-ad19-2a59fb3f1870"
    Content-Type: text/html; charset=UTF-8
    Content-Length: 0
    Etag: 0c839612eb3f2469420f2ccae990827f
    Last-Modified: Mon, 19 Dec 2022 09:51:32 GMT
    X-Trans-Id: tx9e05a6e35d7049148a064-0063a03423
    X-Openstack-Request-Id: tx9e05a6e35d7049148a064-0063a03423
    Date: Mon, 19 Dec 2022 09:51:34 GMT
    ```

=== "Body"
    ``` json title="" linenums="1"
    
    ```


### (50) 204 No Content /image/v2/images/{image_id}/file

=== "Header"
    ``` http title="204 No Content http://182.161.114.101/image/v2/images/e6167145-7865-4d3d-ad19-2a59fb3f1870/file"
    Date: Mon, 19 Dec 2022 09:51:34 GMT
    Server: Apache/2.4.41 (Ubuntu)
    Content-Type: text/html; charset=UTF-8
    X-Openstack-Request-Id: req-2e924dc5-ce29-479b-9563-7e5c1fe82468
    Connection: close
    ```

=== "Body"
    ``` json title="" linenums="1"
    
    ```


??? quote "openstack image create logs"
    ``` log title="/var/log/requests-observer/requests.log" linenums="1"
    --8<-- "openstack/sequence/image/logs/openstack-image-create-requests.log"
    ```



## Output

``` json title="openstack image create --disk-format qcow2 --file cirros-0.6.1-x86_64-disk.img --public cirros-0.6.1-x86_64-disk --format json"
{
  "container_format": "bare",
  "created_at": "2022-12-19T09:51:29Z",
  "disk_format": "qcow2",
  "file": "/v2/images/e6167145-7865-4d3d-ad19-2a59fb3f1870/file",
  "id": "e6167145-7865-4d3d-ad19-2a59fb3f1870",
  "min_disk": 0,
  "min_ram": 0,
  "name": "cirros-0.6.1-x86_64-disk",
  "owner": "a5362cbd04fd4783a038d5a342d58e87",
  "properties": {
    "os_hidden": false,
    "owner_specified.openstack.md5": "",
    "owner_specified.openstack.sha256": "",
    "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-disk"
  },
  "protected": false,
  "schema": "/v2/schemas/image",
  "status": "queued",
  "tags": [],
  "updated_at": "2022-12-19T09:51:29Z",
  "visibility": "public"
}
```