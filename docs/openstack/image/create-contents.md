
### GET /identity/
`openstack` --> `keystone`

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


### 300 MULTIPLE CHOICES /identity/
`openstack` <-- `keystone`

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


### POST /identity/v3/auth/tokens
`openstack` --> `keystone`

!!! tip "API 참조"
    [Password authentication with scoped authorization](https://docs.openstack.org/api-ref/identity/v3/index.html#password-authentication-with-scoped-authorization)

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


### 201 CREATED /identity/v3/auth/tokens
`openstack` <-- `keystone`

=== "Header"
    ``` http title="201 CREATED /identity/v3/auth/tokens" linenums="1"
    Content-Type: application/json
    Content-Length: 3952
    X-Subject-Token: gAAAAABjrkD9cqBlaLtF1_FlWZfHjo2u7cJvLXX1HNPG-aFEylyLg7rBQwXEckDcnO__Yjj7akLG-xtxDVRk3zfTJPFdMYJ1MjeZJLaLbOD_Cbx4_D57F_EBR7g-QEmJdvXqN8GADYgNslbXm8cxCBhl3ww4_VJQBWEVQtav4_vVRW_E9vKAkxc
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 77b63da6e8304573a0673f43a48857cb
    X-Requestshook-Request-From: openstack
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


### POST /v2/images
`openstack` --> `glance-api`

!!! tip "API 참조"
    [Create image](https://docs.openstack.org/api-ref/image/v2/index.html#create-image)

=== "Header"
    ``` http title="POST /v2/images" linenums="1"
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
      "name": "cirros-0.6.1-x86_64-test",
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.sha256": "",
      "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-test"
    }
    ```


### GET /identity/
`glance-api` --> `keystone`

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


### 300 MULTIPLE CHOICES /identity/
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


### POST /identity/v3/auth/tokens
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


### 201 CREATED /identity/v3/auth/tokens
`glance-api` <-- `keystone`

=== "Header"
    ``` http title="201 CREATED /identity/v3/auth/tokens" linenums="1"
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


### GET /identity/v3/auth/tokens
`glance-api` --> `keystone`

!!! tip "API 참조"
    [Validate and show information for token](https://docs.openstack.org/api-ref/identity/v3/index.html#validate-and-show-information-for-token)

=== "Header"
    ``` http title="GET /identity/v3/auth/tokens" linenums="1"
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


### 200 OK /identity/v3/auth/tokens
`glance-api` <-- `keystone`

=== "Header"
    ``` http title="200 OK /identity/v3/auth/tokens" linenums="1"
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


### 201 Created /v2/images
`openstack` <-- `glance-api`

=== "Header"
    ``` http title="201 Created /v2/images" linenums="1"
    Content-Length: 781
    Content-Type: application/json
    Location: http://127.0.0.1:60999/v2/images/7d29b113-3248-4052-be42-aefdfa1758cf
    OpenStack-image-import-methods: glance-direct,web-download,copy-image
    x-openstack-request-id: req-d15c0fbc-c5c3-44b5-af20-005b8b7d96e8
    X-Requestshook-Request-Id: 3ab3d14d95bf4be1bad368dbe46a773a
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="201 Created /v2/images" linenums="1"
    {
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.sha256": "",
      "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-test",
      "name": "cirros-0.6.1-x86_64-test",
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
      "id": "7d29b113-3248-4052-be42-aefdfa1758cf",
      "created_at": "2022-12-30T01:38:06Z",
      "updated_at": "2022-12-30T01:38:06Z",
      "tags": [],
      "self": "/v2/images/7d29b113-3248-4052-be42-aefdfa1758cf",
      "file": "/v2/images/7d29b113-3248-4052-be42-aefdfa1758cf/file",
      "schema": "/v2/schemas/image"
    }
    ```


### PUT /v2/images/7d29b113-3248-4052-be42-aefdfa1758cf/file
`openstack` --> `glance-api`

!!! tip "API 참조"
    [Upload binary image data](https://docs.openstack.org/api-ref/image/v2/index.html#upload-binary-image-data)

=== "Header"
    ``` http title="PUT /v2/images/7d29b113-3248-4052-be42-aefdfa1758cf/file" linenums="1"
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
    ``` json title="PUT /v2/images/7d29b113-3248-4052-be42-aefdfa1758cf/file" linenums="1"
    b'QFI\xfb\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x07\x00\x00\x00'...
    ```


### POST /identity/v3/auth/tokens
`glance-api` --> `keystone`

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


### 201 CREATED /identity/v3/auth/tokens
`glance-api` <-- `keystone`

=== "Header"
    ``` http title="201 CREATED /identity/v3/auth/tokens" linenums="1"
    Content-Type: application/json
    Content-Length: 3908
    X-Subject-Token: gAAAAABjrkD_e5s9lpQ1vHif6SROJFWbCUa7ySvxD0YfrBS2P3BwgwC-AhPppfXs5uRQoknWTZHWrnm5x2sC5C-B9JUyIgsUDKlQvE3PT5ro7Xm9MdhSpjkYfSu_5YNLizd26s9Zfm7Ctoi7OKG5vpx30vORbQHqtAHx09wbko5g-QSDNSjSIM8
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: dd6c58c6ef2542148b682bd4c0588d58
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


### HEAD /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance
`glance-api` --> `swift-proxy-server`

!!! tip "API 참조"
    [Show container metadata](https://docs.openstack.org/api-ref/object-store/?expanded=show-container-metadata-detail#show-container-metadata)

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


### GET /identity/v3/auth/tokens
`swift-proxy-server` --> `keystone`

=== "Header"
    ``` http title="GET /identity/v3/auth/tokens" linenums="1"
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


### 200 OK /identity/v3/auth/tokens
`swift-proxy-server` <-- `keystone`

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


### 204 No Content /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance
`glance-api` <-- `swift-proxy-server`

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


### PUT /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/7d29b113-3248-4052-be42-aefdfa1758cf
`glance-api` --> `swift-proxy-server`

!!! tip "API 참조"
    [Create or replace object](https://docs.openstack.org/api-ref/object-store/?expanded=#create-or-replace-object)

=== "Header"
    ``` http title="PUT /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/7d29b113-3248-4052-be42-aefdfa1758cf" linenums="1"
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
    ``` json title="PUT /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/7d29b113-3248-4052-be42-aefdfa1758cf" linenums="1"
    b'QFI\xfb\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x07\x00\x00\x00'...
    ```


### 201 Created /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/7d29b113-3248-4052-be42-aefdfa1758cf
`glance-api` <-- `swift-proxy-server`

=== "Header"
    ``` http title="201 Created /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/7d29b113-3248-4052-be42-aefdfa1758cf" linenums="1"
    Content-Type: text/html; charset=UTF-8
    Content-Length: 0
    Etag: 0c839612eb3f2469420f2ccae990827f
    Last-Modified: Fri, 30 Dec 2022 01:38:09 GMT
    X-Requestshook-Request-Id: 47c57e9898a4482487b3509f0c1499b4
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="201 Created /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/7d29b113-3248-4052-be42-aefdfa1758cf" linenums="1"
    none
    ```


### 204 No Content /v2/images/7d29b113-3248-4052-be42-aefdfa1758cf/file
`openstack` <-- `glance-api`

=== "Header"
    ``` http title="204 No Content /v2/images/7d29b113-3248-4052-be42-aefdfa1758cf/file" linenums="1"
    Content-Type: text/html; charset=UTF-8
    Content-Length: 0
    x-openstack-request-id: req-74f0320e-e525-48c8-b989-5366de6d304b
    X-Requestshook-Request-Id: e4c3be3fe42a47e4a3b3558cec50fe75
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="204 No Content /v2/images/7d29b113-3248-4052-be42-aefdfa1758cf/file" linenums="1"
    none
    ```

