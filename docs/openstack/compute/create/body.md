
### GET /identity/
`openstack` --> `keystone`

=== "Header"
    ``` http title="GET /identity/" linenums="1"
    Host: 182.161.114.101
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Requestshook-Request-Id: 49f1590ac45343b8a89620d38380c697
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
    X-Requestshook-Request-Id: 49f1590ac45343b8a89620d38380c697
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

=== "Header"
    ``` http title="POST /identity/v3/auth/tokens" linenums="1"
    Host: 182.161.114.101
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 209
    X-Requestshook-Request-Id: ba6607e0964242fbbfc9baf17647fdff
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
    X-Subject-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: ba6607e0964242fbbfc9baf17647fdff
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
          "id": "4349d516240540dda214bae62ae5ff48",
          "name": "admin",
          "password_expires_at": null
        },
        "audit_ids": [
          "MFdgRMXZSQi7so17ctW18A"
        ],
        "expires_at": "2023-01-06T03:15:09.000000Z",
        "issued_at": "2023-01-06T00:15:09.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "67b814b10c624269b605ea8c571decdc",
          "name": "admin"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "75d867a6e38a4cd285ecc64939524c16",
            "name": "reader"
          },
          {
            "id": "86342910cc6b4ba6b6e4ce8ac447446f",
            "name": "member"
          },
          {
            "id": "c4440177d2db458885abc8134ca0243f",
            "name": "admin"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "456e6128da8948cd8fb5e2fe3e772939",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              },
              {
                "id": "5b6780a2505b4b7db70c0db262b80897",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              },
              {
                "id": "d7f04b50eff14b0cbc870095da43943c",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              }
            ],
            "id": "04cf066fa76f4bd5bfd5796a071f2fd6",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "1329ab1a0521406da241d89adfae5601",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              }
            ],
            "id": "21c71be3212d493f8279556794a302f6",
            "type": "volumev3",
            "name": "cinderv3"
          },
          {
            "endpoints": [
              {
                "id": "5f6d83606f714d77af10534906128714",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "34f7de6ca0bf48cfb2e86bca160ed66d",
            "type": "compute",
            "name": "nova"
          },
          {
            "endpoints": [
              {
                "id": "350d9b3e30ef4b659e0202fca46d103d",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              }
            ],
            "id": "38d6b27def0b4268925e032a830fe0c6",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "67b6ef09389645449932c8b1af59719e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "5301196fc0ed4f0eac37faaca7853571",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "883afb6c55ce446ea09f064028fb9dad",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "5f5a1d71d526491bab6838d014cc9b90",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "a14d5c89766747848e1592cf1f333a22",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "7c26339166754f59a033acd1ee1da4b2",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "ec8390af2bae4f238a0fc2067c393b8f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              }
            ],
            "id": "9a7a984c396d4a64a25331682e95710a",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "1fdcfa22b4bc407e9f6b33c46682a894",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              },
              {
                "id": "c6cf2bf0313b48ed97a87d1a631a6ec7",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              }
            ],
            "id": "d5469a89da224de999a688a968d10dbf",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "1b7cc23f6e0e4f5bbd585483df2074be",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "e80ee55e11564ad68e3cde46b42b9174",
            "type": "placement",
            "name": "placement"
          }
        ]
      }
    }
    ```


### GET /
`openstack` --> `glance-api`

=== "Header"
    ``` http title="GET /" linenums="1"
    Host: 127.0.0.1:60999
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    X-Requestshook-Request-Id: eda87a9d24334d14bc5d8b916027e4fe
    X-Requestshook-Request-From: openstack
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="GET /" linenums="1"
    none
    ```


### 300 Multiple Choices None
`openstack` <-- `glance-api`

=== "Header"
    ``` http title="300 Multiple Choices None" linenums="1"
    Content-Type: application/json
    Content-Length: 1347
    X-Requestshook-Request-Id: eda87a9d24334d14bc5d8b916027e4fe
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="300 Multiple Choices None" linenums="1"
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


### GET /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e
`openstack` --> `glance-api`

=== "Header"
    ``` http title="GET /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e" linenums="1"
    Host: 127.0.0.1:60999
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    X-Requestshook-Request-Id: 7be95d26edfc48c5aa28fcc034ac2070
    X-Requestshook-Request-From: openstack
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="GET /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e" linenums="1"
    none
    ```


### GET /identity/
`glance-api` --> `keystone`

=== "Header"
    ``` http title="GET /identity/" linenums="1"
    Host: 182.161.114.101
    User-Agent: glance/25.0.1.dev5 keystonemiddleware.auth_token/10.1.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Requestshook-Request-Id: 27b93e1deb86403a8118a74d75a854c7
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
    X-Requestshook-Request-Id: 27b93e1deb86403a8118a74d75a854c7
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
    User-Agent: glance/25.0.1.dev5 keystonemiddleware.auth_token/10.1.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 216
    X-Requestshook-Request-Id: 67f83f05c47946bfa53906e800c82ca5
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
    X-Subject-Token: gAAAAABjt2gOzifTA1cdzgZ0ACeeEJsUx2ssiX-ycw25tv2k9egU93vArV_P9Kw8kYlimsRc6-nLXfx_UfW78kiRNjEd61zMlp_EOIixw9F9EMu0efZUiqNMG_yfB3m2_v-_mn1j0svp3PjZZGlqdkqADUvy-rAudV3rJ4AmwpLBRGA-BfCPGl8
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 67f83f05c47946bfa53906e800c82ca5
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
          "id": "1639f8a0f96740db928d4e6fa8d5ffb4",
          "name": "glance",
          "password_expires_at": null
        },
        "audit_ids": [
          "eQOmlR90SjCCsQaLs9WyiA"
        ],
        "expires_at": "2023-01-06T03:15:10.000000Z",
        "issued_at": "2023-01-06T00:15:10.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "8e9b3373fd3c4f40b07eb3491b23aad5",
          "name": "service"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "9337768beffd44aba230cf6281265629",
            "name": "service"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "456e6128da8948cd8fb5e2fe3e772939",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              },
              {
                "id": "5b6780a2505b4b7db70c0db262b80897",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              },
              {
                "id": "d7f04b50eff14b0cbc870095da43943c",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "04cf066fa76f4bd5bfd5796a071f2fd6",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "1329ab1a0521406da241d89adfae5601",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "21c71be3212d493f8279556794a302f6",
            "type": "volumev3",
            "name": "cinderv3"
          },
          {
            "endpoints": [
              {
                "id": "5f6d83606f714d77af10534906128714",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "34f7de6ca0bf48cfb2e86bca160ed66d",
            "type": "compute",
            "name": "nova"
          },
          {
            "endpoints": [
              {
                "id": "350d9b3e30ef4b659e0202fca46d103d",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "38d6b27def0b4268925e032a830fe0c6",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "67b6ef09389645449932c8b1af59719e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "5301196fc0ed4f0eac37faaca7853571",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "883afb6c55ce446ea09f064028fb9dad",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "5f5a1d71d526491bab6838d014cc9b90",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "a14d5c89766747848e1592cf1f333a22",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "7c26339166754f59a033acd1ee1da4b2",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "ec8390af2bae4f238a0fc2067c393b8f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "9a7a984c396d4a64a25331682e95710a",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "1fdcfa22b4bc407e9f6b33c46682a894",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              },
              {
                "id": "c6cf2bf0313b48ed97a87d1a631a6ec7",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              }
            ],
            "id": "d5469a89da224de999a688a968d10dbf",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "1b7cc23f6e0e4f5bbd585483df2074be",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "e80ee55e11564ad68e3cde46b42b9174",
            "type": "placement",
            "name": "placement"
          }
        ]
      }
    }
    ```


### GET /identity/v3/auth/tokens
`glance-api` --> `keystone`

=== "Header"
    ``` http title="GET /identity/v3/auth/tokens" linenums="1"
    Host: 182.161.114.101
    User-Agent: python-keystoneclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Subject-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    Openstack-Identity-Access-Rules: 1
    X-Auth-Token: gAAAAABjt2gOzifTA1cdzgZ0ACeeEJsUx2ssiX-ycw25tv2k9egU93vArV_P9Kw8kYlimsRc6-nLXfx_UfW78kiRNjEd61zMlp_EOIixw9F9EMu0efZUiqNMG_yfB3m2_v-_mn1j0svp3PjZZGlqdkqADUvy-rAudV3rJ4AmwpLBRGA-BfCPGl8
    X-Requestshook-Request-Id: 61e2cff98c2b4e878433ad47463a5f16
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
    X-Subject-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 61e2cff98c2b4e878433ad47463a5f16
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
          "id": "4349d516240540dda214bae62ae5ff48",
          "name": "admin",
          "password_expires_at": null
        },
        "audit_ids": [
          "MFdgRMXZSQi7so17ctW18A"
        ],
        "expires_at": "2023-01-06T03:15:09.000000Z",
        "issued_at": "2023-01-06T00:15:09.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "67b814b10c624269b605ea8c571decdc",
          "name": "admin"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "75d867a6e38a4cd285ecc64939524c16",
            "name": "reader"
          },
          {
            "id": "86342910cc6b4ba6b6e4ce8ac447446f",
            "name": "member"
          },
          {
            "id": "c4440177d2db458885abc8134ca0243f",
            "name": "admin"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "456e6128da8948cd8fb5e2fe3e772939",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              },
              {
                "id": "5b6780a2505b4b7db70c0db262b80897",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              },
              {
                "id": "d7f04b50eff14b0cbc870095da43943c",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              }
            ],
            "id": "04cf066fa76f4bd5bfd5796a071f2fd6",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "1329ab1a0521406da241d89adfae5601",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              }
            ],
            "id": "21c71be3212d493f8279556794a302f6",
            "type": "volumev3",
            "name": "cinderv3"
          },
          {
            "endpoints": [
              {
                "id": "5f6d83606f714d77af10534906128714",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "34f7de6ca0bf48cfb2e86bca160ed66d",
            "type": "compute",
            "name": "nova"
          },
          {
            "endpoints": [
              {
                "id": "350d9b3e30ef4b659e0202fca46d103d",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              }
            ],
            "id": "38d6b27def0b4268925e032a830fe0c6",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "67b6ef09389645449932c8b1af59719e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "5301196fc0ed4f0eac37faaca7853571",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "883afb6c55ce446ea09f064028fb9dad",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "5f5a1d71d526491bab6838d014cc9b90",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "a14d5c89766747848e1592cf1f333a22",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "7c26339166754f59a033acd1ee1da4b2",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "ec8390af2bae4f238a0fc2067c393b8f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              }
            ],
            "id": "9a7a984c396d4a64a25331682e95710a",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "1fdcfa22b4bc407e9f6b33c46682a894",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_67b814b10c624269b605ea8c571decdc",
                "region": "RegionOne"
              },
              {
                "id": "c6cf2bf0313b48ed97a87d1a631a6ec7",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              }
            ],
            "id": "d5469a89da224de999a688a968d10dbf",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "1b7cc23f6e0e4f5bbd585483df2074be",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "e80ee55e11564ad68e3cde46b42b9174",
            "type": "placement",
            "name": "placement"
          }
        ]
      }
    }
    ```


### 200 OK /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e
`openstack` <-- `glance-api`

=== "Header"
    ``` http title="200 OK /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e" linenums="1"
    Content-Length: 976
    Content-Type: application/json
    x-openstack-request-id: req-82240617-44be-46de-b9d9-f2e5ab0d7706
    X-Requestshook-Request-Id: 7be95d26edfc48c5aa28fcc034ac2070
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="200 OK /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e" linenums="1"
    {
      "hw_rng_model": "virtio",
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.object": "images/cirros-0.5.2-x86_64-disk",
      "owner_specified.openstack.sha256": "",
      "name": "cirros-0.5.2-x86_64-disk",
      "disk_format": "qcow2",
      "container_format": "bare",
      "visibility": "public",
      "size": 16300544,
      "virtual_size": 117440512,
      "status": "active",
      "checksum": "b874c39491a2377b8490f5f1e89761a4",
      "protected": false,
      "min_ram": 0,
      "min_disk": 0,
      "owner": "67b814b10c624269b605ea8c571decdc",
      "os_hidden": false,
      "os_hash_algo": "sha512",
      "os_hash_value": "6b813aa46bb90b4da216a4d19376593fa3f4fc7e617f03a92b7fe11e9a3981cbe8f0959dbebe36225e5f53dc4492341a4863cac4ed1ee0909f3fc78ef9c3e869",
      "id": "da9259d0-b57f-4230-a2cf-e5bc6cedf19e",
      "created_at": "2023-01-04T03:27:02Z",
      "updated_at": "2023-01-04T03:27:05Z",
      "tags": [],
      "self": "/v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e",
      "file": "/v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e/file",
      "schema": "/v2/schemas/image"
    }
    ```


### GET /compute/v2.1/flavors/c1
`openstack` --> `nova-api`

=== "Header"
    ``` http title="GET /compute/v2.1/flavors/c1" linenums="1"
    Host: 182.161.114.101
    User-Agent: python-novaclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Nova-Api-Version: 2.1
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    X-Requestshook-Request-Id: 218a99e275a740a49ff126a0a9ecb08c
    X-Requestshook-Request-From: openstack
    X-Identity-Status: Confirmed
    X-Roles: reader,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 67b814b10c624269b605ea8c571decdc
    X-Project-Name: admin
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 4349d516240540dda214bae62ae5ff48
    X-User-Name: admin
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,member,admin
    X-User: admin
    X-Tenant-Id: 67b814b10c624269b605ea8c571decdc
    X-Tenant-Name: admin
    X-Tenant: admin
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "internalURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "publicURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/67b814b10c624269b605ea8c571decdc"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_67b814b10c624269b605ea8c571decdc", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /compute/v2.1/flavors/c1" linenums="1"
    none
    ```


### 200 OK /compute/v2.1/flavors/c1
`openstack` <-- `nova-api`

=== "Header"
    ``` http title="200 OK /compute/v2.1/flavors/c1" linenums="1"
    Content-Length: 375
    Content-Type: application/json
    OpenStack-API-Version: compute 2.1
    X-OpenStack-Nova-API-Version: 2.1
    Vary: OpenStack-API-Version
    Vary: X-OpenStack-Nova-API-Version
    X-Requestshook-Request-Id: 218a99e275a740a49ff126a0a9ecb08c
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="200 OK /compute/v2.1/flavors/c1" linenums="1"
    {
      "flavor": {
        "id": "c1",
        "name": "cirros256",
        "ram": 256,
        "disk": 1,
        "swap": "",
        "OS-FLV-EXT-DATA:ephemeral": 0,
        "OS-FLV-DISABLED:disabled": false,
        "vcpus": 1,
        "os-flavor-access:is_public": true,
        "rxtx_factor": 1.0,
        "links": [
          {
            "rel": "self",
            "href": "http://182.161.114.101/compute/v2.1/flavors/c1"
          },
          {
            "rel": "bookmark",
            "href": "http://182.161.114.101/compute/flavors/c1"
          }
        ]
      }
    }
    ```


### GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`openstack` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: keep-alive
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    X-Requestshook-Request-Id: 0be7640e371f495aa91b38692f6e3650
    X-Requestshook-Request-From: openstack
    X-Identity-Status: Confirmed
    X-Roles: reader,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 67b814b10c624269b605ea8c571decdc
    X-Project-Name: admin
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 4349d516240540dda214bae62ae5ff48
    X-User-Name: admin
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,member,admin
    X-User: admin
    X-Tenant-Id: 67b814b10c624269b605ea8c571decdc
    X-Tenant-Name: admin
    X-Tenant: admin
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "internalURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "publicURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/67b814b10c624269b605ea8c571decdc"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_67b814b10c624269b605ea8c571decdc", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`openstack` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: application/json
    Content-Length: 660
    X-Requestshook-Request-Id: 0be7640e371f495aa91b38692f6e3650
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    {
      "network": {
        "id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
        "name": "shared",
        "tenant_id": "67b814b10c624269b605ea8c571decdc",
        "admin_state_up": true,
        "mtu": 1442,
        "status": "ACTIVE",
        "subnets": [
          "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609"
        ],
        "shared": true,
        "availability_zone_hints": [],
        "availability_zones": [],
        "ipv4_address_scope": null,
        "ipv6_address_scope": null,
        "router:external": false,
        "description": "",
        "port_security_enabled": true,
        "tags": [],
        "created_at": "2023-01-04T03:52:11Z",
        "updated_at": "2023-01-04T03:52:14Z",
        "revision_number": 2,
        "project_id": "67b814b10c624269b605ea8c571decdc",
        "provider:network_type": "geneve",
        "provider:physical_network": null,
        "provider:segmentation_id": 59003
      }
    }
    ```


### POST /compute/v2.1/servers
`openstack` --> `nova-api`

=== "Header"
    ``` http title="POST /compute/v2.1/servers" linenums="1"
    Host: 182.161.114.101
    User-Agent: python-novaclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Nova-Api-Version: 2.1
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    Content-Type: application/json
    Content-Length: 308
    X-Requestshook-Request-Id: f23fee6f10054acd9c660344b2297c63
    X-Requestshook-Request-From: openstack
    X-Identity-Status: Confirmed
    X-Roles: reader,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 67b814b10c624269b605ea8c571decdc
    X-Project-Name: admin
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 4349d516240540dda214bae62ae5ff48
    X-User-Name: admin
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,member,admin
    X-User: admin
    X-Tenant-Id: 67b814b10c624269b605ea8c571decdc
    X-Tenant-Name: admin
    X-Tenant: admin
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "internalURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "publicURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/67b814b10c624269b605ea8c571decdc"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_67b814b10c624269b605ea8c571decdc", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="POST /compute/v2.1/servers" linenums="1"
    {
      "server": {
        "name": "cirros-instance",
        "imageRef": "da9259d0-b57f-4230-a2cf-e5bc6cedf19e",
        "flavorRef": "c1",
        "key_name": "jade-public-key",
        "min_count": 1,
        "max_count": 1,
        "security_groups": [
          {
            "name": "eff69e1a-958f-4d8f-9db5-7b117f42e14d"
          }
        ],
        "networks": [
          {
            "uuid": "4529570d-57bf-4ec8-8d67-937f13b1d9ae"
          }
        ]
      }
    }
    ```


### GET /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e
`nova-api` --> `glance-api`

=== "Header"
    ``` http title="GET /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e" linenums="1"
    Host: 127.0.0.1:60999
    User-Agent: python-glanceclient
    Accept-Encoding: gzip, deflate
    Accept: */*
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    Content-Type: application/octet-stream
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    X-Service-Token: gAAAAABjt2ej1oYS5TZrRo2Rha7nd9exIyFuE4BPiHsrxSS_avKE4PBI8mOzcysJEk5xvRbPDEqcrHE2GF9_rURu0uXdaHBQf64lyeWXYhVHDmKOeoQdHC0vrhHMj1O7-sRzr_y4CqBNBYv0yJ240xCv6EoO_riMHaUrlJmLvhN0NjKtu0XTt7Q
    X-Requestshook-Request-Id: 3fa85a2d34a8407399988037d2eeca39
    X-Requestshook-Request-From: nova-api
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="GET /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e" linenums="1"
    none
    ```


### 200 OK /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e
`nova-api` <-- `glance-api`

=== "Header"
    ``` http title="200 OK /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e" linenums="1"
    Content-Length: 976
    Content-Type: application/json
    x-openstack-request-id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Requestshook-Request-Id: 3fa85a2d34a8407399988037d2eeca39
    X-Requestshook-Request-From: nova-api
    ```

=== "Body"
    ``` json title="200 OK /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e" linenums="1"
    {
      "hw_rng_model": "virtio",
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.object": "images/cirros-0.5.2-x86_64-disk",
      "owner_specified.openstack.sha256": "",
      "name": "cirros-0.5.2-x86_64-disk",
      "disk_format": "qcow2",
      "container_format": "bare",
      "visibility": "public",
      "size": 16300544,
      "virtual_size": 117440512,
      "status": "active",
      "checksum": "b874c39491a2377b8490f5f1e89761a4",
      "protected": false,
      "min_ram": 0,
      "min_disk": 0,
      "owner": "67b814b10c624269b605ea8c571decdc",
      "os_hidden": false,
      "os_hash_algo": "sha512",
      "os_hash_value": "6b813aa46bb90b4da216a4d19376593fa3f4fc7e617f03a92b7fe11e9a3981cbe8f0959dbebe36225e5f53dc4492341a4863cac4ed1ee0909f3fc78ef9c3e869",
      "id": "da9259d0-b57f-4230-a2cf-e5bc6cedf19e",
      "created_at": "2023-01-04T03:27:02Z",
      "updated_at": "2023-01-04T03:27:05Z",
      "tags": [],
      "self": "/v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e",
      "file": "/v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e/file",
      "schema": "/v2/schemas/image"
    }
    ```


### GET /v2/schemas/image
`nova-api` --> `glance-api`

=== "Header"
    ``` http title="GET /v2/schemas/image" linenums="1"
    Host: 127.0.0.1:60999
    User-Agent: python-glanceclient
    Accept-Encoding: gzip, deflate
    Accept: */*
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    Content-Type: application/octet-stream
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    X-Service-Token: gAAAAABjt2ej1oYS5TZrRo2Rha7nd9exIyFuE4BPiHsrxSS_avKE4PBI8mOzcysJEk5xvRbPDEqcrHE2GF9_rURu0uXdaHBQf64lyeWXYhVHDmKOeoQdHC0vrhHMj1O7-sRzr_y4CqBNBYv0yJ240xCv6EoO_riMHaUrlJmLvhN0NjKtu0XTt7Q
    X-Requestshook-Request-Id: e11269daea0342ed864809a8b06740bb
    X-Requestshook-Request-From: nova-api
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="GET /v2/schemas/image" linenums="1"
    none
    ```


### 200 OK /v2/schemas/image
`nova-api` <-- `glance-api`

=== "Header"
    ``` http title="200 OK /v2/schemas/image" linenums="1"
    Content-Type: application/json
    Content-Length: 6083
    x-openstack-request-id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Requestshook-Request-Id: e11269daea0342ed864809a8b06740bb
    X-Requestshook-Request-From: nova-api
    ```

=== "Body"
    ``` json title="200 OK /v2/schemas/image" linenums="1"
    {
      "name": "image",
      "properties": {
        "id": {
          "type": "string",
          "description": "An identifier for the image",
          "pattern": "^([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}$"
        },
        "name": {
          "type": [
            "null",
            "string"
          ],
          "description": "Descriptive name for the image",
          "maxLength": 255
        },
        "status": {
          "type": "string",
          "readOnly": true,
          "description": "Status of the image",
          "enum": [
            "queued",
            "saving",
            "active",
            "killed",
            "deleted",
            "uploading",
            "importing",
            "pending_delete",
            "deactivated"
          ]
        },
        "visibility": {
          "type": "string",
          "description": "Scope of image accessibility",
          "enum": [
            "community",
            "public",
            "private",
            "shared"
          ]
        },
        "protected": {
          "type": "boolean",
          "description": "If true, image will not be deletable."
        },
        "os_hidden": {
          "type": "boolean",
          "description": "If true, image will not appear in default image list response."
        },
        "checksum": {
          "type": [
            "null",
            "string"
          ],
          "readOnly": true,
          "description": "md5 hash of image contents.",
          "maxLength": 32
        },
        "os_hash_algo": {
          "type": [
            "null",
            "string"
          ],
          "readOnly": true,
          "description": "Algorithm to calculate the os_hash_value",
          "maxLength": 64
        },
        "os_hash_value": {
          "type": [
            "null",
            "string"
          ],
          "readOnly": true,
          "description": "Hexdigest of the image contents using the algorithm specified by the os_hash_algo",
          "maxLength": 128
        },
        "owner": {
          "type": [
            "null",
            "string"
          ],
          "description": "Owner of the image",
          "maxLength": 255
        },
        "size": {
          "type": [
            "null",
            "integer"
          ],
          "readOnly": true,
          "description": "Size of image file in bytes"
        },
        "virtual_size": {
          "type": [
            "null",
            "integer"
          ],
          "readOnly": true,
          "description": "Virtual size of image in bytes"
        },
        "container_format": {
          "type": [
            "null",
            "string"
          ],
          "description": "Format of the container",
          "enum": [
            null,
            "ami",
            "ari",
            "aki",
            "bare",
            "ovf",
            "ova",
            "docker",
            "compressed"
          ]
        },
        "disk_format": {
          "type": [
            "null",
            "string"
          ],
          "description": "Format of the disk",
          "enum": [
            null,
            "ami",
            "ari",
            "aki",
            "vhd",
            "vhdx",
            "vmdk",
            "raw",
            "qcow2",
            "vdi",
            "iso",
            "ploop"
          ]
        },
        "created_at": {
          "type": "string",
          "readOnly": true,
          "description": "Date and time of image registration"
        },
        "updated_at": {
          "type": "string",
          "readOnly": true,
          "description": "Date and time of the last image modification"
        },
        "tags": {
          "type": "array",
          "description": "List of strings related to the image",
          "items": {
            "type": "string",
            "maxLength": 255
          }
        },
        "direct_url": {
          "type": "string",
          "readOnly": true,
          "description": "URL to access the image file kept in external store"
        },
        "min_ram": {
          "type": "integer",
          "description": "Amount of ram (in MB) required to boot image."
        },
        "min_disk": {
          "type": "integer",
          "description": "Amount of disk space (in GB) required to boot image."
        },
        "self": {
          "type": "string",
          "readOnly": true,
          "description": "An image self url"
        },
        "file": {
          "type": "string",
          "readOnly": true,
          "description": "An image file url"
        },
        "stores": {
          "type": "string",
          "readOnly": true,
          "description": "Store in which image data resides.  Only present when the operator has enabled multiple stores.  May be a comma-separated list of store identifiers."
        },
        "schema": {
          "type": "string",
          "readOnly": true,
          "description": "An image schema url"
        },
        "locations": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "url": {
                "type": "string",
                "maxLength": 255
              },
              "metadata": {
                "type": "object"
              },
              "validation_data": {
                "description": "Values to be used to populate the corresponding image properties. If the image status is not 'queued', values must exactly match those already contained in the image properties.",
                "type": "object",
                "writeOnly": true,
                "additionalProperties": false,
                "properties": {
                  "checksum": {
                    "type": "string",
                    "minLength": 32,
                    "maxLength": 32
                  },
                  "os_hash_algo": {
                    "type": "string",
                    "maxLength": 64
                  },
                  "os_hash_value": {
                    "type": "string",
                    "maxLength": 128
                  }
                },
                "required": [
                  "os_hash_algo",
                  "os_hash_value"
                ]
              }
            },
            "required": [
              "url",
              "metadata"
            ]
          },
          "description": "A set of URLs to access the image file kept in external store"
        },
        "kernel_id": {
          "type": [
            "null",
            "string"
          ],
          "pattern": "^([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}$",
          "description": "ID of image stored in Glance that should be used as the kernel when booting an AMI-style image.",
          "is_base": false
        },
        "ramdisk_id": {
          "type": [
            "null",
            "string"
          ],
          "pattern": "^([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}$",
          "description": "ID of image stored in Glance that should be used as the ramdisk when booting an AMI-style image.",
          "is_base": false
        },
        "instance_uuid": {
          "type": "string",
          "description": "Metadata which can be used to record which instance this image is associated with. (Informational only, does not create an instance snapshot.)",
          "is_base": false
        },
        "architecture": {
          "description": "Operating system architecture as specified in https://docs.openstack.org/python-glanceclient/latest/cli/property-keys.html",
          "type": "string",
          "is_base": false
        },
        "os_distro": {
          "description": "Common name of operating system distribution as specified in https://docs.openstack.org/python-glanceclient/latest/cli/property-keys.html",
          "type": "string",
          "is_base": false
        },
        "os_version": {
          "description": "Operating system version as specified by the distributor.",
          "type": "string",
          "is_base": false
        },
        "description": {
          "description": "A human-readable string describing this image.",
          "type": "string",
          "is_base": false
        },
        "cinder_encryption_key_id": {
          "description": "Identifier in the OpenStack Key Management Service for the encryption key for the Block Storage Service to use when mounting a volume created from this image",
          "type": "string",
          "is_base": false
        },
        "cinder_encryption_key_deletion_policy": {
          "description": "States the condition under which the Image Service will delete the object associated with the 'cinder_encryption_key_id' image property.  If this property is missing, the Image Service will take no action",
          "type": "string",
          "enum": [
            "on_image_deletion",
            "do_not_delete"
          ],
          "is_base": false
        }
      },
      "additionalProperties": {
        "type": "string"
      },
      "links": [
        {
          "rel": "self",
          "href": "{self}"
        },
        {
          "rel": "enclosure",
          "href": "{file}"
        },
        {
          "rel": "describedby",
          "href": "{schema}"
        }
      ]
    }
    ```


### GET /networking/v2.0/networks
`nova-api` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/networks" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    X-Service-Token: gAAAAABjt2ej1oYS5TZrRo2Rha7nd9exIyFuE4BPiHsrxSS_avKE4PBI8mOzcysJEk5xvRbPDEqcrHE2GF9_rURu0uXdaHBQf64lyeWXYhVHDmKOeoQdHC0vrhHMj1O7-sRzr_y4CqBNBYv0yJ240xCv6EoO_riMHaUrlJmLvhN0NjKtu0XTt7Q
    X-Requestshook-Request-Id: a1654c781da842a3826d3a40c3a8a886
    X-Requestshook-Request-From: nova-api
    X-Service-Identity-Status: Confirmed
    X-Identity-Status: Confirmed
    X-Roles: reader,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 67b814b10c624269b605ea8c571decdc
    X-Project-Name: admin
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 4349d516240540dda214bae62ae5ff48
    X-User-Name: admin
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,member,admin
    X-User: admin
    X-Tenant-Id: 67b814b10c624269b605ea8c571decdc
    X-Tenant-Name: admin
    X-Tenant: admin
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "internalURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "publicURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/67b814b10c624269b605ea8c571decdc"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_67b814b10c624269b605ea8c571decdc", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    X-Service-Roles: ResellerAdmin,member,admin,service,reader
    X-Service-Domain-Id: None
    X-Service-Domain-Name: None
    X-Service-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Service-Project-Name: service
    X-Service-Project-Domain-Id: default
    X-Service-Project-Domain-Name: Default
    X-Service-User-Id: e677cd9f6af84957942be2c2ec9f8fd7
    X-Service-User-Name: nova
    X-Service-User-Domain-Id: default
    X-Service-User-Domain-Name: Default
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/networks" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/networks
`nova-api` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/networks" linenums="1"
    Content-Type: application/json
    Content-Length: 663
    X-Requestshook-Request-Id: a1654c781da842a3826d3a40c3a8a886
    X-Requestshook-Request-From: nova-api
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/networks" linenums="1"
    {
      "networks": [
        {
          "id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
          "name": "shared",
          "tenant_id": "67b814b10c624269b605ea8c571decdc",
          "admin_state_up": true,
          "mtu": 1442,
          "status": "ACTIVE",
          "subnets": [
            "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609"
          ],
          "shared": true,
          "availability_zone_hints": [],
          "availability_zones": [],
          "ipv4_address_scope": null,
          "ipv6_address_scope": null,
          "router:external": false,
          "description": "",
          "port_security_enabled": true,
          "tags": [],
          "created_at": "2023-01-04T03:52:11Z",
          "updated_at": "2023-01-04T03:52:14Z",
          "revision_number": 2,
          "project_id": "67b814b10c624269b605ea8c571decdc",
          "provider:network_type": "geneve",
          "provider:physical_network": null,
          "provider:segmentation_id": 59003
        }
      ]
    }
    ```


### GET /networking/v2.0/ports
`nova-api` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/ports" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    X-Service-Token: gAAAAABjt2ej1oYS5TZrRo2Rha7nd9exIyFuE4BPiHsrxSS_avKE4PBI8mOzcysJEk5xvRbPDEqcrHE2GF9_rURu0uXdaHBQf64lyeWXYhVHDmKOeoQdHC0vrhHMj1O7-sRzr_y4CqBNBYv0yJ240xCv6EoO_riMHaUrlJmLvhN0NjKtu0XTt7Q
    X-Requestshook-Request-Id: 448092c0390043f1a52a0fa0d03950bd
    X-Requestshook-Request-From: nova-api
    X-Service-Identity-Status: Confirmed
    X-Identity-Status: Confirmed
    X-Roles: reader,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 67b814b10c624269b605ea8c571decdc
    X-Project-Name: admin
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 4349d516240540dda214bae62ae5ff48
    X-User-Name: admin
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,member,admin
    X-User: admin
    X-Tenant-Id: 67b814b10c624269b605ea8c571decdc
    X-Tenant-Name: admin
    X-Tenant: admin
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "internalURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "publicURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/67b814b10c624269b605ea8c571decdc"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_67b814b10c624269b605ea8c571decdc", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    X-Service-Roles: ResellerAdmin,member,admin,service,reader
    X-Service-Domain-Id: None
    X-Service-Domain-Name: None
    X-Service-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Service-Project-Name: service
    X-Service-Project-Domain-Id: default
    X-Service-Project-Domain-Name: Default
    X-Service-User-Id: e677cd9f6af84957942be2c2ec9f8fd7
    X-Service-User-Name: nova
    X-Service-User-Domain-Id: default
    X-Service-User-Domain-Name: Default
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/ports" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/ports
`nova-api` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/ports" linenums="1"
    Content-Type: application/json
    Content-Length: 103
    X-Requestshook-Request-Id: 448092c0390043f1a52a0fa0d03950bd
    X-Requestshook-Request-From: nova-api
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/ports" linenums="1"
    {
      "ports": [
        {
          "id": "78973ec1-1271-446a-8f7b-f494e4c5cff9"
        },
        {
          "id": "80a2d5ee-4027-4f29-bcf5-0b506ad06a11"
        }
      ]
    }
    ```


### GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-api` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Auth-Token: gAAAAABjt2ekHnn52olAPqjEu77c-cZy5bZhuzaiDUnqdenJJQtp11E1_MZpvngr7CHM3s5F9c1HcAn26QHZNVOTTRPMRrNlZ9HVE1tr3nhXLYd0Rh8skyPUZAQOwb386fSt6lOSbatXSTj3J6YSgBKWyL5tNNEE5RtkOohsPjb1C7crx8hSqnQ
    X-Requestshook-Request-Id: e3b7b004f4ad451b8b511d25fe5834fe
    X-Requestshook-Request-From: nova-api
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-api` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: application/json
    Content-Length: 14
    X-Requestshook-Request-Id: e3b7b004f4ad451b8b511d25fe5834fe
    X-Requestshook-Request-From: nova-api
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    {
      "network": {}
    }
    ```


### GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-api` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Auth-Token: gAAAAABjt2ekHnn52olAPqjEu77c-cZy5bZhuzaiDUnqdenJJQtp11E1_MZpvngr7CHM3s5F9c1HcAn26QHZNVOTTRPMRrNlZ9HVE1tr3nhXLYd0Rh8skyPUZAQOwb386fSt6lOSbatXSTj3J6YSgBKWyL5tNNEE5RtkOohsPjb1C7crx8hSqnQ
    X-Requestshook-Request-Id: 1287fa08ee774942811db7e08bb729e7
    X-Requestshook-Request-From: nova-api
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-api` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: application/json
    Content-Length: 79
    X-Requestshook-Request-Id: 1287fa08ee774942811db7e08bb729e7
    X-Requestshook-Request-From: nova-api
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    {
      "network": {
        "provider:network_type": "geneve",
        "provider:physical_network": null
      }
    }
    ```


### 202 Accepted /compute/v2.1/servers
`openstack` <-- `nova-api`

=== "Header"
    ``` http title="202 Accepted /compute/v2.1/servers" linenums="1"
    Content-Length: 417
    location: http://182.161.114.101/compute/v2.1/servers/6dc2e525-a218-4814-9dc5-4cfcf2332268
    Content-Type: application/json
    OpenStack-API-Version: compute 2.1
    X-OpenStack-Nova-API-Version: 2.1
    Vary: OpenStack-API-Version
    Vary: X-OpenStack-Nova-API-Version
    X-Requestshook-Request-Id: f23fee6f10054acd9c660344b2297c63
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="202 Accepted /compute/v2.1/servers" linenums="1"
    {
      "server": {
        "id": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
        "links": [
          {
            "rel": "self",
            "href": "http://182.161.114.101/compute/v2.1/servers/6dc2e525-a218-4814-9dc5-4cfcf2332268"
          },
          {
            "rel": "bookmark",
            "href": "http://182.161.114.101/compute/servers/6dc2e525-a218-4814-9dc5-4cfcf2332268"
          }
        ],
        "OS-DCF:diskConfig": "MANUAL",
        "security_groups": [
          {
            "name": "eff69e1a-958f-4d8f-9db5-7b117f42e14d"
          }
        ],
        "adminPass": "kNNSdm96W6ma"
      }
    }
    ```


### GET /compute/v2.1/servers/6dc2e525-a218-4814-9dc5-4cfcf2332268
`openstack` --> `nova-api`

=== "Header"
    ``` http title="GET /compute/v2.1/servers/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    Host: 182.161.114.101
    User-Agent: python-novaclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Nova-Api-Version: 2.1
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    X-Requestshook-Request-Id: 441da5500a324726908d63fa6d9a2192
    X-Requestshook-Request-From: openstack
    X-Identity-Status: Confirmed
    X-Roles: reader,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 67b814b10c624269b605ea8c571decdc
    X-Project-Name: admin
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 4349d516240540dda214bae62ae5ff48
    X-User-Name: admin
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,member,admin
    X-User: admin
    X-Tenant-Id: 67b814b10c624269b605ea8c571decdc
    X-Tenant-Name: admin
    X-Tenant: admin
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "internalURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "publicURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/67b814b10c624269b605ea8c571decdc"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_67b814b10c624269b605ea8c571decdc", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /compute/v2.1/servers/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    none
    ```


### POST /identity/v3/auth/tokens
`nova-scheduler` --> `keystone`

=== "Header"
    ``` http title="POST /identity/v3/auth/tokens" linenums="1"
    Host: 182.161.114.101
    User-Agent: nova-scheduler keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 219
    X-Requestshook-Request-Id: 33fe448eb9f7496083388541a6c840d2
    X-Requestshook-Request-From: nova-scheduler
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
              "name": "placement",
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


### GET /networking/v2.0/ports
`nova-api` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/ports" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-44c6e5ef-d7df-4140-9f98-abe30f3a309e
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    X-Service-Token: gAAAAABjt2ek-4Tk5IsxiDBT3AHFIsypJXoKuZrFlkS3yMeDzq7H7BiPhU3-_VbirJDVvJ3BWocgJupjVh1XhBauuaHSL-l0BhbM-gF4I82sF3pStERGFyPyIx7S-NHJH_GuntVFRxKJlu7tpGyDPw6pacD1yX3rRXHVDmEFn2LNIPcksIePzLQ
    X-Requestshook-Request-Id: f122c1ac434e4eef892c1ca6d9c1449a
    X-Requestshook-Request-From: nova-api
    X-Service-Identity-Status: Confirmed
    X-Identity-Status: Confirmed
    X-Roles: reader,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 67b814b10c624269b605ea8c571decdc
    X-Project-Name: admin
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 4349d516240540dda214bae62ae5ff48
    X-User-Name: admin
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,member,admin
    X-User: admin
    X-Tenant-Id: 67b814b10c624269b605ea8c571decdc
    X-Tenant-Name: admin
    X-Tenant: admin
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "internalURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "publicURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/67b814b10c624269b605ea8c571decdc"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_67b814b10c624269b605ea8c571decdc", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    X-Service-Roles: ResellerAdmin,member,admin,service,reader
    X-Service-Domain-Id: None
    X-Service-Domain-Name: None
    X-Service-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Service-Project-Name: service
    X-Service-Project-Domain-Id: default
    X-Service-Project-Domain-Name: Default
    X-Service-User-Id: e677cd9f6af84957942be2c2ec9f8fd7
    X-Service-User-Name: nova
    X-Service-User-Domain-Id: default
    X-Service-User-Domain-Name: Default
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/ports" linenums="1"
    none
    ```


### 201 CREATED /identity/v3/auth/tokens
`nova-scheduler` <-- `keystone`

=== "Header"
    ``` http title="201 CREATED /identity/v3/auth/tokens" linenums="1"
    Content-Type: application/json
    Content-Length: 4021
    X-Subject-Token: gAAAAABjt2gP4S_lK1U7db8feJ1p2IeAQW10Iy3yzFJJRf5KQx3cE7DF7MhZTJv8d0fWsDmlCkl94T8B2ribVkn2RvLYIiIG7ACtoQbBmzMTWbZ1P2Z-IHUzNes5KEyE359tdOKhkHcB_k-Na9XAxpp67hnWMHp9_A8DIfl87OgHAK7GVEUXVm4
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 33fe448eb9f7496083388541a6c840d2
    X-Requestshook-Request-From: nova-scheduler
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
          "id": "c8efc1ef99c64c70ac4745f91551294a",
          "name": "placement",
          "password_expires_at": null
        },
        "audit_ids": [
          "3jHpMyP9QVWy0EZtc4oEHQ"
        ],
        "expires_at": "2023-01-06T03:15:11.000000Z",
        "issued_at": "2023-01-06T00:15:11.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "8e9b3373fd3c4f40b07eb3491b23aad5",
          "name": "service"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "75d867a6e38a4cd285ecc64939524c16",
            "name": "reader"
          },
          {
            "id": "9337768beffd44aba230cf6281265629",
            "name": "service"
          },
          {
            "id": "86342910cc6b4ba6b6e4ce8ac447446f",
            "name": "member"
          },
          {
            "id": "c4440177d2db458885abc8134ca0243f",
            "name": "admin"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "456e6128da8948cd8fb5e2fe3e772939",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              },
              {
                "id": "5b6780a2505b4b7db70c0db262b80897",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              },
              {
                "id": "d7f04b50eff14b0cbc870095da43943c",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "04cf066fa76f4bd5bfd5796a071f2fd6",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "1329ab1a0521406da241d89adfae5601",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "21c71be3212d493f8279556794a302f6",
            "type": "volumev3",
            "name": "cinderv3"
          },
          {
            "endpoints": [
              {
                "id": "5f6d83606f714d77af10534906128714",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "34f7de6ca0bf48cfb2e86bca160ed66d",
            "type": "compute",
            "name": "nova"
          },
          {
            "endpoints": [
              {
                "id": "350d9b3e30ef4b659e0202fca46d103d",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "38d6b27def0b4268925e032a830fe0c6",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "67b6ef09389645449932c8b1af59719e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "5301196fc0ed4f0eac37faaca7853571",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "883afb6c55ce446ea09f064028fb9dad",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "5f5a1d71d526491bab6838d014cc9b90",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "a14d5c89766747848e1592cf1f333a22",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "7c26339166754f59a033acd1ee1da4b2",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "ec8390af2bae4f238a0fc2067c393b8f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "9a7a984c396d4a64a25331682e95710a",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "1fdcfa22b4bc407e9f6b33c46682a894",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              },
              {
                "id": "c6cf2bf0313b48ed97a87d1a631a6ec7",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              }
            ],
            "id": "d5469a89da224de999a688a968d10dbf",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "1b7cc23f6e0e4f5bbd585483df2074be",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "e80ee55e11564ad68e3cde46b42b9174",
            "type": "placement",
            "name": "placement"
          }
        ]
      }
    }
    ```


### 200 OK /networking/v2.0/ports
`nova-api` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/ports" linenums="1"
    Content-Type: application/json
    Content-Length: 12
    X-Requestshook-Request-Id: f122c1ac434e4eef892c1ca6d9c1449a
    X-Requestshook-Request-From: nova-api
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/ports" linenums="1"
    {
      "ports": []
    }
    ```


### 200 OK /compute/v2.1/servers/6dc2e525-a218-4814-9dc5-4cfcf2332268
`openstack` <-- `nova-api`

=== "Header"
    ``` http title="200 OK /compute/v2.1/servers/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    Content-Length: 1322
    Content-Type: application/json
    OpenStack-API-Version: compute 2.1
    X-OpenStack-Nova-API-Version: 2.1
    Vary: OpenStack-API-Version
    Vary: X-OpenStack-Nova-API-Version
    X-Requestshook-Request-Id: 441da5500a324726908d63fa6d9a2192
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="200 OK /compute/v2.1/servers/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    {
      "server": {
        "id": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
        "name": "cirros-instance",
        "status": "BUILD",
        "tenant_id": "67b814b10c624269b605ea8c571decdc",
        "user_id": "4349d516240540dda214bae62ae5ff48",
        "metadata": {},
        "hostId": "",
        "image": {
          "id": "da9259d0-b57f-4230-a2cf-e5bc6cedf19e",
          "links": [
            {
              "rel": "bookmark",
              "href": "http://182.161.114.101/compute/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e"
            }
          ]
        },
        "flavor": {
          "id": "c1",
          "links": [
            {
              "rel": "bookmark",
              "href": "http://182.161.114.101/compute/flavors/c1"
            }
          ]
        },
        "created": "2023-01-06T00:15:11Z",
        "updated": "2023-01-06T00:15:11Z",
        "addresses": {},
        "accessIPv4": "",
        "accessIPv6": "",
        "links": [
          {
            "rel": "self",
            "href": "http://182.161.114.101/compute/v2.1/servers/6dc2e525-a218-4814-9dc5-4cfcf2332268"
          },
          {
            "rel": "bookmark",
            "href": "http://182.161.114.101/compute/servers/6dc2e525-a218-4814-9dc5-4cfcf2332268"
          }
        ],
        "OS-DCF:diskConfig": "MANUAL",
        "progress": 0,
        "OS-EXT-AZ:availability_zone": "",
        "config_drive": "",
        "key_name": "jade-public-key",
        "OS-SRV-USG:launched_at": null,
        "OS-SRV-USG:terminated_at": null,
        "OS-EXT-SRV-ATTR:host": null,
        "OS-EXT-SRV-ATTR:instance_name": "",
        "OS-EXT-SRV-ATTR:hypervisor_hostname": null,
        "OS-EXT-STS:task_state": "scheduling",
        "OS-EXT-STS:vm_state": "building",
        "OS-EXT-STS:power_state": 0,
        "os-extended-volumes:volumes_attached": []
      }
    }
    ```


### GET /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e
`openstack` --> `glance-api`

=== "Header"
    ``` http title="GET /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e" linenums="1"
    Host: 127.0.0.1:60999
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    X-Requestshook-Request-Id: 5d242fbbe5a443a4a7af6eca417f29ba
    X-Requestshook-Request-From: openstack
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="GET /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e" linenums="1"
    none
    ```


### 200 OK /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e
`openstack` <-- `glance-api`

=== "Header"
    ``` http title="200 OK /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e" linenums="1"
    Content-Length: 976
    Content-Type: application/json
    x-openstack-request-id: req-61283bef-0e24-443d-8792-1a4af7c0c1bf
    X-Requestshook-Request-Id: 5d242fbbe5a443a4a7af6eca417f29ba
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="200 OK /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e" linenums="1"
    {
      "hw_rng_model": "virtio",
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.object": "images/cirros-0.5.2-x86_64-disk",
      "owner_specified.openstack.sha256": "",
      "name": "cirros-0.5.2-x86_64-disk",
      "disk_format": "qcow2",
      "container_format": "bare",
      "visibility": "public",
      "size": 16300544,
      "virtual_size": 117440512,
      "status": "active",
      "checksum": "b874c39491a2377b8490f5f1e89761a4",
      "protected": false,
      "min_ram": 0,
      "min_disk": 0,
      "owner": "67b814b10c624269b605ea8c571decdc",
      "os_hidden": false,
      "os_hash_algo": "sha512",
      "os_hash_value": "6b813aa46bb90b4da216a4d19376593fa3f4fc7e617f03a92b7fe11e9a3981cbe8f0959dbebe36225e5f53dc4492341a4863cac4ed1ee0909f3fc78ef9c3e869",
      "id": "da9259d0-b57f-4230-a2cf-e5bc6cedf19e",
      "created_at": "2023-01-04T03:27:02Z",
      "updated_at": "2023-01-04T03:27:05Z",
      "tags": [],
      "self": "/v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e",
      "file": "/v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e/file",
      "schema": "/v2/schemas/image"
    }
    ```


### GET /compute/v2.1/flavors/c1
`openstack` --> `nova-api`

=== "Header"
    ``` http title="GET /compute/v2.1/flavors/c1" linenums="1"
    Host: 182.161.114.101
    User-Agent: python-novaclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Nova-Api-Version: 2.1
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    X-Requestshook-Request-Id: 9a873562012a460ba89296753e37e390
    X-Requestshook-Request-From: openstack
    X-Identity-Status: Confirmed
    X-Roles: reader,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 67b814b10c624269b605ea8c571decdc
    X-Project-Name: admin
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 4349d516240540dda214bae62ae5ff48
    X-User-Name: admin
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,member,admin
    X-User: admin
    X-Tenant-Id: 67b814b10c624269b605ea8c571decdc
    X-Tenant-Name: admin
    X-Tenant: admin
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "internalURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "publicURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/67b814b10c624269b605ea8c571decdc"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_67b814b10c624269b605ea8c571decdc", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /compute/v2.1/flavors/c1" linenums="1"
    none
    ```


### 200 OK /compute/v2.1/flavors/c1
`openstack` <-- `nova-api`

=== "Header"
    ``` http title="200 OK /compute/v2.1/flavors/c1" linenums="1"
    Content-Length: 375
    Content-Type: application/json
    OpenStack-API-Version: compute 2.1
    X-OpenStack-Nova-API-Version: 2.1
    Vary: OpenStack-API-Version
    Vary: X-OpenStack-Nova-API-Version
    X-Requestshook-Request-Id: 9a873562012a460ba89296753e37e390
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="200 OK /compute/v2.1/flavors/c1" linenums="1"
    {
      "flavor": {
        "id": "c1",
        "name": "cirros256",
        "ram": 256,
        "disk": 1,
        "swap": "",
        "OS-FLV-EXT-DATA:ephemeral": 0,
        "OS-FLV-DISABLED:disabled": false,
        "vcpus": 1,
        "os-flavor-access:is_public": true,
        "rxtx_factor": 1.0,
        "links": [
          {
            "rel": "self",
            "href": "http://182.161.114.101/compute/v2.1/flavors/c1"
          },
          {
            "rel": "bookmark",
            "href": "http://182.161.114.101/compute/flavors/c1"
          }
        ]
      }
    }
    ```


### GET /placement/allocation_candidates
`nova-scheduler` --> `placement-api`

=== "Header"
    ``` http title="GET /placement/allocation_candidates" linenums="1"
    Host: 182.161.114.101
    User-Agent: nova-scheduler keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Openstack-Api-Version: placement 1.36
    X-Auth-Token: gAAAAABjt2gP4S_lK1U7db8feJ1p2IeAQW10Iy3yzFJJRf5KQx3cE7DF7MhZTJv8d0fWsDmlCkl94T8B2ribVkn2RvLYIiIG7ACtoQbBmzMTWbZ1P2Z-IHUzNes5KEyE359tdOKhkHcB_k-Na9XAxpp67hnWMHp9_A8DIfl87OgHAK7GVEUXVm4
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Requestshook-Request-Id: 2ce5e2e0c47a4749be0484b628696075
    X-Requestshook-Request-From: nova-scheduler
    X-Identity-Status: Confirmed
    X-Roles: reader,service,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: c8efc1ef99c64c70ac4745f91551294a
    X-User-Name: placement
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,service,member,admin
    X-User: placement
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /placement/allocation_candidates" linenums="1"
    none
    ```


### 200 OK /placement/allocation_candidates
`nova-scheduler` <-- `placement-api`

=== "Header"
    ``` http title="200 OK /placement/allocation_candidates" linenums="1"
    Content-Length: 1844
    Content-Type: application/json
    Cache-Control: no-cache
    Last-Modified: Fri, 06 Jan 2023 00:15:11 GMT
    openstack-api-version: placement 1.36
    vary: openstack-api-version
    X-Requestshook-Request-Id: 2ce5e2e0c47a4749be0484b628696075
    X-Requestshook-Request-From: nova-scheduler
    ```

=== "Body"
    ``` json title="200 OK /placement/allocation_candidates" linenums="1"
    {
      "allocation_requests": [
        {
          "allocations": {
            "aa096077-e2a0-4c51-8436-5485d21038e8": {
              "resources": {
                "DISK_GB": 1,
                "MEMORY_MB": 256,
                "VCPU": 1
              }
            }
          },
          "mappings": {
            "": [
              "aa096077-e2a0-4c51-8436-5485d21038e8"
            ]
          }
        }
      ],
      "provider_summaries": {
        "aa096077-e2a0-4c51-8436-5485d21038e8": {
          "resources": {
            "DISK_GB": {
              "capacity": 193,
              "used": 0
            },
            "MEMORY_MB": {
              "capacity": 47404,
              "used": 0
            },
            "VCPU": {
              "capacity": 256,
              "used": 0
            }
          },
          "traits": [
            "COMPUTE_VOLUME_ATTACH_WITH_TAG",
            "COMPUTE_STORAGE_BUS_VIRTIO",
            "COMPUTE_IMAGE_TYPE_ARI",
            "COMPUTE_GRAPHICS_MODEL_NONE",
            "HW_CPU_X86_SSE42",
            "COMPUTE_GRAPHICS_MODEL_QXL",
            "COMPUTE_VIOMMU_MODEL_AUTO",
            "HW_CPU_X86_SSE2",
            "COMPUTE_VOLUME_MULTI_ATTACH",
            "COMPUTE_NET_VIF_MODEL_NE2K_PCI",
            "COMPUTE_STORAGE_BUS_SATA",
            "HW_CPU_X86_MMX",
            "COMPUTE_NET_VIF_MODEL_VIRTIO",
            "COMPUTE_STORAGE_BUS_FDC",
            "HW_CPU_X86_SSE",
            "COMPUTE_NET_VIF_MODEL_VMXNET3",
            "HW_CPU_X86_SSE41",
            "HW_CPU_X86_SSSE3",
            "COMPUTE_IMAGE_TYPE_QCOW2",
            "COMPUTE_NET_ATTACH_INTERFACE",
            "COMPUTE_IMAGE_TYPE_RAW",
            "COMPUTE_GRAPHICS_MODEL_VGA",
            "COMPUTE_STORAGE_BUS_SCSI",
            "COMPUTE_GRAPHICS_MODEL_VMVGA",
            "COMPUTE_STORAGE_BUS_IDE",
            "COMPUTE_GRAPHICS_MODEL_CIRRUS",
            "COMPUTE_DEVICE_TAGGING",
            "COMPUTE_STORAGE_BUS_USB",
            "COMPUTE_ACCELERATORS",
            "COMPUTE_GRAPHICS_MODEL_BOCHS",
            "COMPUTE_NET_VIF_MODEL_E1000",
            "COMPUTE_SOCKET_PCI_NUMA_AFFINITY",
            "COMPUTE_TRUSTED_CERTS",
            "COMPUTE_NET_ATTACH_INTERFACE_WITH_TAG",
            "COMPUTE_IMAGE_TYPE_ISO",
            "COMPUTE_RESCUE_BFV",
            "COMPUTE_GRAPHICS_MODEL_VIRTIO",
            "COMPUTE_NET_VIF_MODEL_SPAPR_VLAN",
            "COMPUTE_VOLUME_EXTEND",
            "COMPUTE_NODE",
            "COMPUTE_SECURITY_UEFI_SECURE_BOOT",
            "COMPUTE_VIOMMU_MODEL_INTEL",
            "COMPUTE_IMAGE_TYPE_AKI",
            "COMPUTE_NET_VIF_MODEL_E1000E",
            "COMPUTE_NET_VIF_MODEL_PCNET",
            "COMPUTE_NET_VIF_MODEL_RTL8139",
            "COMPUTE_IMAGE_TYPE_AMI"
          ],
          "parent_provider_uuid": null,
          "root_provider_uuid": "aa096077-e2a0-4c51-8436-5485d21038e8"
        }
      }
    }
    ```


### GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
`nova-scheduler` --> `placement-api`

=== "Header"
    ``` http title="GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    Host: 182.161.114.101
    User-Agent: nova-scheduler keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Openstack-Api-Version: placement 1.28
    X-Auth-Token: gAAAAABjt2gP4S_lK1U7db8feJ1p2IeAQW10Iy3yzFJJRf5KQx3cE7DF7MhZTJv8d0fWsDmlCkl94T8B2ribVkn2RvLYIiIG7ACtoQbBmzMTWbZ1P2Z-IHUzNes5KEyE359tdOKhkHcB_k-Na9XAxpp67hnWMHp9_A8DIfl87OgHAK7GVEUXVm4
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Requestshook-Request-Id: 3fd45389ed764159a93ec70a15d5e70b
    X-Requestshook-Request-From: nova-scheduler
    X-Identity-Status: Confirmed
    X-Roles: reader,service,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: c8efc1ef99c64c70ac4745f91551294a
    X-User-Name: placement
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,service,member,admin
    X-User: placement
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    none
    ```


### 200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
`nova-scheduler` <-- `placement-api`

=== "Header"
    ``` http title="200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    Content-Length: 19
    Content-Type: application/json
    Last-Modified: Fri, 06 Jan 2023 00:15:11 GMT
    Cache-Control: no-cache
    openstack-api-version: placement 1.28
    vary: openstack-api-version
    X-Requestshook-Request-Id: 3fd45389ed764159a93ec70a15d5e70b
    X-Requestshook-Request-From: nova-scheduler
    ```

=== "Body"
    ``` json title="200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    {
      "allocations": {}
    }
    ```


### PUT /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
`nova-scheduler` --> `placement-api`

=== "Header"
    ``` http title="PUT /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    Host: 182.161.114.101
    User-Agent: nova-scheduler keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Openstack-Api-Version: placement 1.36
    X-Auth-Token: gAAAAABjt2gP4S_lK1U7db8feJ1p2IeAQW10Iy3yzFJJRf5KQx3cE7DF7MhZTJv8d0fWsDmlCkl94T8B2ribVkn2RvLYIiIG7ACtoQbBmzMTWbZ1P2Z-IHUzNes5KEyE359tdOKhkHcB_k-Na9XAxpp67hnWMHp9_A8DIfl87OgHAK7GVEUXVm4
    Content-Type: application/json
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    Content-Length: 303
    X-Requestshook-Request-Id: 5cb8623fc71e41ceab658e6a10d0d81a
    X-Requestshook-Request-From: nova-scheduler
    X-Identity-Status: Confirmed
    X-Roles: reader,service,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: c8efc1ef99c64c70ac4745f91551294a
    X-User-Name: placement
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,service,member,admin
    X-User: placement
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="PUT /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    {
      "allocations": {
        "aa096077-e2a0-4c51-8436-5485d21038e8": {
          "resources": {
            "DISK_GB": 1,
            "MEMORY_MB": 256,
            "VCPU": 1
          }
        }
      },
      "mappings": {
        "": [
          "aa096077-e2a0-4c51-8436-5485d21038e8"
        ]
      },
      "project_id": "67b814b10c624269b605ea8c571decdc",
      "user_id": "4349d516240540dda214bae62ae5ff48",
      "consumer_generation": null
    }
    ```


### 204 No Content /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
`nova-scheduler` <-- `placement-api`

=== "Header"
    ``` http title="204 No Content /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    Content-Length: 0
    openstack-api-version: placement 1.36
    vary: openstack-api-version
    X-Requestshook-Request-Id: 5cb8623fc71e41ceab658e6a10d0d81a
    X-Requestshook-Request-From: nova-scheduler
    ```

=== "Body"
    ``` json title="204 No Content /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    none
    ```


### GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
`nova-compute` --> `placement-api`

=== "Header"
    ``` http title="GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    Host: 182.161.114.101
    User-Agent: nova-compute keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Openstack-Api-Version: placement 1.28
    X-Auth-Token: gAAAAABjt10YvKz--FZM8M6eddyAVOroHzPRKD57WPgguRG4pCQ96636aLMRiaszKEBocv5QMupc-Z09OjNLEl0vtR4Rg52_96L1CmuQU6P1vGlu0w7EnRwGdAeCvYGoLWO5Zs4ABuqefKg8O3LT5wWd6I-cfnNVwwZ4h9zjynJZzfT_1VAgCic
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Requestshook-Request-Id: b19370353a864d5f9991a04012e764d6
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: reader,service,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: c8efc1ef99c64c70ac4745f91551294a
    X-User-Name: placement
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,service,member,admin
    X-User: placement
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    none
    ```


### 200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
`nova-compute` <-- `placement-api`

=== "Header"
    ``` http title="200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    Content-Length: 257
    Content-Type: application/json
    Last-Modified: Fri, 06 Jan 2023 00:15:12 GMT
    Cache-Control: no-cache
    openstack-api-version: placement 1.28
    vary: openstack-api-version
    X-Requestshook-Request-Id: b19370353a864d5f9991a04012e764d6
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    {
      "allocations": {
        "aa096077-e2a0-4c51-8436-5485d21038e8": {
          "resources": {
            "VCPU": 1,
            "MEMORY_MB": 256,
            "DISK_GB": 1
          },
          "generation": 4
        }
      },
      "project_id": "67b814b10c624269b605ea8c571decdc",
      "user_id": "4349d516240540dda214bae62ae5ff48",
      "consumer_generation": 1
    }
    ```


### GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
`nova-compute` --> `placement-api`

=== "Header"
    ``` http title="GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    Host: 182.161.114.101
    User-Agent: nova-compute keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Openstack-Api-Version: placement 1.28
    X-Auth-Token: gAAAAABjt10YvKz--FZM8M6eddyAVOroHzPRKD57WPgguRG4pCQ96636aLMRiaszKEBocv5QMupc-Z09OjNLEl0vtR4Rg52_96L1CmuQU6P1vGlu0w7EnRwGdAeCvYGoLWO5Zs4ABuqefKg8O3LT5wWd6I-cfnNVwwZ4h9zjynJZzfT_1VAgCic
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Requestshook-Request-Id: f9c676eca7ff4ccaaae2647f76b27f93
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: reader,service,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: c8efc1ef99c64c70ac4745f91551294a
    X-User-Name: placement
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,service,member,admin
    X-User: placement
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    none
    ```


### 200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
`nova-compute` <-- `placement-api`

=== "Header"
    ``` http title="200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    Content-Length: 257
    Content-Type: application/json
    Last-Modified: Fri, 06 Jan 2023 00:15:12 GMT
    Cache-Control: no-cache
    openstack-api-version: placement 1.28
    vary: openstack-api-version
    X-Requestshook-Request-Id: f9c676eca7ff4ccaaae2647f76b27f93
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    {
      "allocations": {
        "aa096077-e2a0-4c51-8436-5485d21038e8": {
          "resources": {
            "VCPU": 1,
            "MEMORY_MB": 256,
            "DISK_GB": 1
          },
          "generation": 4
        }
      },
      "project_id": "67b814b10c624269b605ea8c571decdc",
      "user_id": "4349d516240540dda214bae62ae5ff48",
      "consumer_generation": 1
    }
    ```


### GET /networking/v2.0/networks
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/networks" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    X-Service-Token: gAAAAABjt2en0oLHS3iBdAr4de29mhtIg0StDDvJeMQs0M2wkuHM-dZSh5vWSHY9F34Fl8cUg27DRWFjndIbGAri3ciYnR5IGZZZFu4lXgSwVUETm13dyP1AzJD6FEllGI9IfZ7nrcpGKfj_mjQxp-B0C0B5QiLxZ2xiB8vDkhKPhJXdfHL9PJQ
    X-Requestshook-Request-Id: d22f430ac86745dc8d184075b889d392
    X-Requestshook-Request-From: nova-compute
    X-Service-Identity-Status: Confirmed
    X-Identity-Status: Confirmed
    X-Roles: reader,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 67b814b10c624269b605ea8c571decdc
    X-Project-Name: admin
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 4349d516240540dda214bae62ae5ff48
    X-User-Name: admin
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,member,admin
    X-User: admin
    X-Tenant-Id: 67b814b10c624269b605ea8c571decdc
    X-Tenant-Name: admin
    X-Tenant: admin
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "internalURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "publicURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/67b814b10c624269b605ea8c571decdc"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_67b814b10c624269b605ea8c571decdc", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    X-Service-Roles: ResellerAdmin,member,admin,service,reader
    X-Service-Domain-Id: None
    X-Service-Domain-Name: None
    X-Service-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Service-Project-Name: service
    X-Service-Project-Domain-Id: default
    X-Service-Project-Domain-Name: Default
    X-Service-User-Id: e677cd9f6af84957942be2c2ec9f8fd7
    X-Service-User-Name: nova
    X-Service-User-Domain-Id: default
    X-Service-User-Domain-Name: Default
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/networks" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/networks
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/networks" linenums="1"
    Content-Type: application/json
    Content-Length: 663
    X-Requestshook-Request-Id: d22f430ac86745dc8d184075b889d392
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/networks" linenums="1"
    {
      "networks": [
        {
          "id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
          "name": "shared",
          "tenant_id": "67b814b10c624269b605ea8c571decdc",
          "admin_state_up": true,
          "mtu": 1442,
          "status": "ACTIVE",
          "subnets": [
            "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609"
          ],
          "shared": true,
          "availability_zone_hints": [],
          "availability_zones": [],
          "ipv4_address_scope": null,
          "ipv6_address_scope": null,
          "router:external": false,
          "description": "",
          "port_security_enabled": true,
          "tags": [],
          "created_at": "2023-01-04T03:52:11Z",
          "updated_at": "2023-01-04T03:52:14Z",
          "revision_number": 2,
          "project_id": "67b814b10c624269b605ea8c571decdc",
          "provider:network_type": "geneve",
          "provider:physical_network": null,
          "provider:segmentation_id": 59003
        }
      ]
    }
    ```


### POST /networking/v2.0/ports
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="POST /networking/v2.0/ports" linenums="1"
    Content-Type: application/json
    Content-Length: 251
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Auth-Token: gAAAAABjt2gNxsKkWacQVQ5v40lp_4pNOU9XfE6D_PmB_sWYo70V6MBKDOC-CvrjVhgT_4RIX2_nGezZpL29z8JCfL1jQTRAAPDetquZ_1S0E0LGa1K0ov7hy9epXTpQlkYbEYCFlx4iCFOao0OSBLnpA9Xo7hLr6NvHSLlCGGWjEs3wjybqE30
    X-Service-Token: gAAAAABjt2en0oLHS3iBdAr4de29mhtIg0StDDvJeMQs0M2wkuHM-dZSh5vWSHY9F34Fl8cUg27DRWFjndIbGAri3ciYnR5IGZZZFu4lXgSwVUETm13dyP1AzJD6FEllGI9IfZ7nrcpGKfj_mjQxp-B0C0B5QiLxZ2xiB8vDkhKPhJXdfHL9PJQ
    X-Requestshook-Request-Id: b9255ed0a7ac4bf3a31f4ba3e50cad38
    X-Requestshook-Request-From: nova-compute
    X-Service-Identity-Status: Confirmed
    X-Identity-Status: Confirmed
    X-Roles: reader,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 67b814b10c624269b605ea8c571decdc
    X-Project-Name: admin
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 4349d516240540dda214bae62ae5ff48
    X-User-Name: admin
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,member,admin
    X-User: admin
    X-Tenant-Id: 67b814b10c624269b605ea8c571decdc
    X-Tenant-Name: admin
    X-Tenant: admin
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "internalURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc", "publicURL": "http://182.161.114.101:8779/v1.0/67b814b10c624269b605ea8c571decdc"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/67b814b10c624269b605ea8c571decdc"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/67b814b10c624269b605ea8c571decdc"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_67b814b10c624269b605ea8c571decdc", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    X-Service-Roles: ResellerAdmin,member,admin,service,reader
    X-Service-Domain-Id: None
    X-Service-Domain-Name: None
    X-Service-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Service-Project-Name: service
    X-Service-Project-Domain-Id: default
    X-Service-Project-Domain-Name: Default
    X-Service-User-Id: e677cd9f6af84957942be2c2ec9f8fd7
    X-Service-User-Name: nova
    X-Service-User-Domain-Id: default
    X-Service-User-Domain-Name: Default
    ```

=== "Body"
    ``` json title="POST /networking/v2.0/ports" linenums="1"
    {
      "port": {
        "device_id": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
        "network_id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
        "admin_state_up": true,
        "tenant_id": "67b814b10c624269b605ea8c571decdc",
        "security_groups": [
          "eff69e1a-958f-4d8f-9db5-7b117f42e14d"
        ]
      }
    }
    ```


### 201 Created /networking/v2.0/ports
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="201 Created /networking/v2.0/ports" linenums="1"
    Content-Type: application/json
    Content-Length: 829
    X-Requestshook-Request-Id: b9255ed0a7ac4bf3a31f4ba3e50cad38
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="201 Created /networking/v2.0/ports" linenums="1"
    {
      "port": {
        "id": "f2267b05-180b-4920-b1e5-a77d38f70c24",
        "name": "",
        "network_id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
        "tenant_id": "67b814b10c624269b605ea8c571decdc",
        "mac_address": "fa:16:3e:e7:64:91",
        "admin_state_up": true,
        "status": "DOWN",
        "device_id": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
        "device_owner": "",
        "fixed_ips": [
          {
            "subnet_id": "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609",
            "ip_address": "192.168.233.37"
          }
        ],
        "project_id": "67b814b10c624269b605ea8c571decdc",
        "port_security_enabled": true,
        "security_groups": [
          "eff69e1a-958f-4d8f-9db5-7b117f42e14d"
        ],
        "binding:vnic_type": "normal",
        "binding:profile": {},
        "binding:host_id": "",
        "binding:vif_type": "unbound",
        "binding:vif_details": {},
        "allowed_address_pairs": [],
        "extra_dhcp_opts": [],
        "description": "",
        "tags": [],
        "created_at": "2023-01-06T00:15:12Z",
        "updated_at": "2023-01-06T00:15:12Z",
        "revision_number": 1
      }
    }
    ```


### PUT /networking/v2.0/ports/f2267b05-180b-4920-b1e5-a77d38f70c24
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="PUT /networking/v2.0/ports/f2267b05-180b-4920-b1e5-a77d38f70c24" linenums="1"
    Content-Type: application/json
    Content-Length: 163
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: 6783799ea3244d6ead46ebfbd23867f3
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="PUT /networking/v2.0/ports/f2267b05-180b-4920-b1e5-a77d38f70c24" linenums="1"
    {
      "port": {
        "device_id": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
        "device_owner": "compute:nova",
        "binding:host_id": "devstack-debug",
        "dns_name": "cirros-instance"
      }
    }
    ```


### 200 OK /networking/v2.0/ports/f2267b05-180b-4920-b1e5-a77d38f70c24
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/ports/f2267b05-180b-4920-b1e5-a77d38f70c24" linenums="1"
    Content-Type: application/json
    Content-Length: 889
    X-Requestshook-Request-Id: 6783799ea3244d6ead46ebfbd23867f3
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/ports/f2267b05-180b-4920-b1e5-a77d38f70c24" linenums="1"
    {
      "port": {
        "id": "f2267b05-180b-4920-b1e5-a77d38f70c24",
        "name": "",
        "network_id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
        "tenant_id": "67b814b10c624269b605ea8c571decdc",
        "mac_address": "fa:16:3e:e7:64:91",
        "admin_state_up": true,
        "status": "DOWN",
        "device_id": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
        "device_owner": "compute:nova",
        "fixed_ips": [
          {
            "subnet_id": "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609",
            "ip_address": "192.168.233.37"
          }
        ],
        "allowed_address_pairs": [],
        "extra_dhcp_opts": [],
        "security_groups": [
          "eff69e1a-958f-4d8f-9db5-7b117f42e14d"
        ],
        "description": "",
        "binding:vnic_type": "normal",
        "binding:profile": {},
        "binding:host_id": "devstack-debug",
        "binding:vif_type": "ovs",
        "binding:vif_details": {
          "port_filter": true,
          "connectivity": "l2"
        },
        "port_security_enabled": true,
        "tags": [],
        "created_at": "2023-01-06T00:15:12Z",
        "updated_at": "2023-01-06T00:15:13Z",
        "revision_number": 2,
        "project_id": "67b814b10c624269b605ea8c571decdc"
      }
    }
    ```


### POST /compute/v2.1/os-server-external-events
`neutron-server` --> `nova-api`

=== "Header"
    ``` http title="POST /compute/v2.1/os-server-external-events" linenums="1"
    Host: 182.161.114.101
    User-Agent: python-novaclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Nova-Api-Version: 2.1
    X-Openstack-Request-Id: req-ee60a31a-7600-4047-9b15-e7d093446985
    X-Auth-Token: gAAAAABjt2epQ3rVuQvAHONhGXm4L-Nyq2clW9-lLe12rLWKJPNSy857mi0DRhWDJBOauTZFPL0sIBK_FTVorjkydAdXpfkbj50HU1_cRDh6t5UZ90TZ6fw2UGI0kZrz9LfRtg74fKMtP3a3Cgu86E_v6bTfq4fCDYoshjw39lJlZG2LS8_i4OM
    Content-Type: application/json
    Content-Length: 143
    X-Requestshook-Request-Id: 6be6b627b3244de6a738f5db450176cc
    X-Requestshook-Request-From: neutron-server
    X-Identity-Status: Confirmed
    X-Roles: ResellerAdmin,member,admin,service,reader
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: e677cd9f6af84957942be2c2ec9f8fd7
    X-User-Name: nova
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: ResellerAdmin,member,admin,service,reader
    X-User: nova
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="POST /compute/v2.1/os-server-external-events" linenums="1"
    {
      "events": [
        {
          "name": "network-changed",
          "server_uuid": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
          "tag": "f2267b05-180b-4920-b1e5-a77d38f70c24"
        }
      ]
    }
    ```


### GET /networking/v2.0/ports
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/ports" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: 96355d9d3393482cb43f080517f427e7
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/ports" linenums="1"
    none
    ```


### 200 OK /compute/v2.1/os-server-external-events
`neutron-server` <-- `nova-api`

=== "Header"
    ``` http title="200 OK /compute/v2.1/os-server-external-events" linenums="1"
    Content-Length: 179
    Content-Type: application/json
    OpenStack-API-Version: compute 2.1
    X-OpenStack-Nova-API-Version: 2.1
    Vary: OpenStack-API-Version
    Vary: X-OpenStack-Nova-API-Version
    X-Requestshook-Request-Id: 6be6b627b3244de6a738f5db450176cc
    X-Requestshook-Request-From: neutron-server
    ```

=== "Body"
    ``` json title="200 OK /compute/v2.1/os-server-external-events" linenums="1"
    {
      "events": [
        {
          "name": "network-changed",
          "server_uuid": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
          "tag": "f2267b05-180b-4920-b1e5-a77d38f70c24",
          "status": "completed",
          "code": 200
        }
      ]
    }
    ```


### 200 OK /networking/v2.0/ports
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/ports" linenums="1"
    Content-Type: application/json
    Content-Length: 920
    X-Requestshook-Request-Id: 96355d9d3393482cb43f080517f427e7
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/ports" linenums="1"
    {
      "ports": [
        {
          "id": "f2267b05-180b-4920-b1e5-a77d38f70c24",
          "name": "",
          "network_id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
          "tenant_id": "67b814b10c624269b605ea8c571decdc",
          "mac_address": "fa:16:3e:e7:64:91",
          "admin_state_up": true,
          "status": "DOWN",
          "device_id": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
          "device_owner": "compute:nova",
          "fixed_ips": [
            {
              "subnet_id": "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609",
              "ip_address": "192.168.233.37"
            }
          ],
          "allowed_address_pairs": [],
          "extra_dhcp_opts": [],
          "security_groups": [
            "eff69e1a-958f-4d8f-9db5-7b117f42e14d"
          ],
          "description": "",
          "binding:vnic_type": "normal",
          "binding:profile": {},
          "binding:host_id": "devstack-debug",
          "binding:vif_type": "ovs",
          "binding:vif_details": {
            "port_filter": true,
            "connectivity": "l2",
            "bound_drivers": {
              "0": "ovn"
            }
          },
          "port_security_enabled": true,
          "tags": [],
          "created_at": "2023-01-06T00:15:12Z",
          "updated_at": "2023-01-06T00:15:13Z",
          "revision_number": 3,
          "project_id": "67b814b10c624269b605ea8c571decdc"
        }
      ]
    }
    ```


### GET /networking/v2.0/subnets
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/subnets" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: 2454c09cfc604591b3e044823fb35643
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/subnets" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/subnets
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/subnets" linenums="1"
    Content-Type: application/json
    Content-Length: 644
    X-Requestshook-Request-Id: 2454c09cfc604591b3e044823fb35643
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/subnets" linenums="1"
    {
      "subnets": [
        {
          "id": "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609",
          "name": "shared-subnet",
          "tenant_id": "67b814b10c624269b605ea8c571decdc",
          "network_id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
          "ip_version": 4,
          "subnetpool_id": null,
          "enable_dhcp": true,
          "ipv6_ra_mode": null,
          "ipv6_address_mode": null,
          "gateway_ip": "192.168.233.1",
          "cidr": "192.168.233.0/24",
          "allocation_pools": [
            {
              "start": "192.168.233.2",
              "end": "192.168.233.254"
            }
          ],
          "host_routes": [],
          "dns_nameservers": [],
          "description": "shared-subnet",
          "service_types": [],
          "tags": [],
          "created_at": "2023-01-04T03:52:14Z",
          "updated_at": "2023-01-04T03:52:14Z",
          "revision_number": 0,
          "project_id": "67b814b10c624269b605ea8c571decdc"
        }
      ]
    }
    ```


### GET /networking/v2.0/ports
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/ports" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: cd7469fb7eb640fd9b1c9985f7940ed9
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/ports" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/ports
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/ports" linenums="1"
    Content-Type: application/json
    Content-Length: 12
    X-Requestshook-Request-Id: cd7469fb7eb640fd9b1c9985f7940ed9
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/ports" linenums="1"
    {
      "ports": []
    }
    ```


### GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: e084930f4ad84bc9bc9540a6e7e6162f
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: application/json
    Content-Length: 14
    X-Requestshook-Request-Id: e084930f4ad84bc9bc9540a6e7e6162f
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    {
      "network": {}
    }
    ```


### GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-9c0dd7d2-2994-47f8-bcf3-39c502f4827b
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: f4fef6687b7f4a7eaa68dc3685d30327
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: application/json
    Content-Length: 79
    X-Requestshook-Request-Id: f4fef6687b7f4a7eaa68dc3685d30327
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    {
      "network": {
        "provider:network_type": "geneve",
        "provider:physical_network": null
      }
    }
    ```


### GET /networking/v2.0/ports
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/ports" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-ee60a31a-7600-4047-9b15-e7d093446985
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: 1bfabc4530f843ffa414a2c7aacaca42
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/ports" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/ports
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/ports" linenums="1"
    Content-Type: application/json
    Content-Length: 920
    X-Requestshook-Request-Id: 1bfabc4530f843ffa414a2c7aacaca42
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/ports" linenums="1"
    {
      "ports": [
        {
          "id": "f2267b05-180b-4920-b1e5-a77d38f70c24",
          "name": "",
          "network_id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
          "tenant_id": "67b814b10c624269b605ea8c571decdc",
          "mac_address": "fa:16:3e:e7:64:91",
          "admin_state_up": true,
          "status": "DOWN",
          "device_id": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
          "device_owner": "compute:nova",
          "fixed_ips": [
            {
              "subnet_id": "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609",
              "ip_address": "192.168.233.37"
            }
          ],
          "allowed_address_pairs": [],
          "extra_dhcp_opts": [],
          "security_groups": [
            "eff69e1a-958f-4d8f-9db5-7b117f42e14d"
          ],
          "description": "",
          "binding:vnic_type": "normal",
          "binding:profile": {},
          "binding:host_id": "devstack-debug",
          "binding:vif_type": "ovs",
          "binding:vif_details": {
            "port_filter": true,
            "connectivity": "l2",
            "bound_drivers": {
              "0": "ovn"
            }
          },
          "port_security_enabled": true,
          "tags": [],
          "created_at": "2023-01-06T00:15:12Z",
          "updated_at": "2023-01-06T00:15:13Z",
          "revision_number": 3,
          "project_id": "67b814b10c624269b605ea8c571decdc"
        }
      ]
    }
    ```


### GET /networking/v2.0/networks
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/networks" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-ee60a31a-7600-4047-9b15-e7d093446985
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: 4e77df2ae49a4dee94a7d7e7e39e53bf
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/networks" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/networks
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/networks" linenums="1"
    Content-Type: application/json
    Content-Length: 663
    X-Requestshook-Request-Id: 4e77df2ae49a4dee94a7d7e7e39e53bf
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/networks" linenums="1"
    {
      "networks": [
        {
          "id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
          "name": "shared",
          "tenant_id": "67b814b10c624269b605ea8c571decdc",
          "admin_state_up": true,
          "mtu": 1442,
          "status": "ACTIVE",
          "subnets": [
            "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609"
          ],
          "shared": true,
          "availability_zone_hints": [],
          "availability_zones": [],
          "ipv4_address_scope": null,
          "ipv6_address_scope": null,
          "router:external": false,
          "description": "",
          "port_security_enabled": true,
          "tags": [],
          "created_at": "2023-01-04T03:52:11Z",
          "updated_at": "2023-01-04T03:52:14Z",
          "revision_number": 2,
          "project_id": "67b814b10c624269b605ea8c571decdc",
          "provider:network_type": "geneve",
          "provider:physical_network": null,
          "provider:segmentation_id": 59003
        }
      ]
    }
    ```


### GET /networking/v2.0/subnets
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/subnets" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-ee60a31a-7600-4047-9b15-e7d093446985
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: b2884bde6186416c9487e90cd95c7fc8
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/subnets" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/subnets
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/subnets" linenums="1"
    Content-Type: application/json
    Content-Length: 644
    X-Requestshook-Request-Id: b2884bde6186416c9487e90cd95c7fc8
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/subnets" linenums="1"
    {
      "subnets": [
        {
          "id": "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609",
          "name": "shared-subnet",
          "tenant_id": "67b814b10c624269b605ea8c571decdc",
          "network_id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
          "ip_version": 4,
          "subnetpool_id": null,
          "enable_dhcp": true,
          "ipv6_ra_mode": null,
          "ipv6_address_mode": null,
          "gateway_ip": "192.168.233.1",
          "cidr": "192.168.233.0/24",
          "allocation_pools": [
            {
              "start": "192.168.233.2",
              "end": "192.168.233.254"
            }
          ],
          "host_routes": [],
          "dns_nameservers": [],
          "description": "shared-subnet",
          "service_types": [],
          "tags": [],
          "created_at": "2023-01-04T03:52:14Z",
          "updated_at": "2023-01-04T03:52:14Z",
          "revision_number": 0,
          "project_id": "67b814b10c624269b605ea8c571decdc"
        }
      ]
    }
    ```


### GET /networking/v2.0/ports
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/ports" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-ee60a31a-7600-4047-9b15-e7d093446985
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: f0e84ac44f7346be9214e2eecd066e46
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/ports" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/ports
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/ports" linenums="1"
    Content-Type: application/json
    Content-Length: 12
    X-Requestshook-Request-Id: f0e84ac44f7346be9214e2eecd066e46
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/ports" linenums="1"
    {
      "ports": []
    }
    ```


### GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-ee60a31a-7600-4047-9b15-e7d093446985
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: b98bee58c8ac4faaa4247722ab2b4502
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: application/json
    Content-Length: 14
    X-Requestshook-Request-Id: b98bee58c8ac4faaa4247722ab2b4502
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    {
      "network": {}
    }
    ```


### GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-ee60a31a-7600-4047-9b15-e7d093446985
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: 06092cf9e5ca4a3a8b2c3b037aad8785
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: application/json
    Content-Length: 79
    X-Requestshook-Request-Id: 06092cf9e5ca4a3a8b2c3b037aad8785
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    {
      "network": {
        "provider:network_type": "geneve",
        "provider:physical_network": null
      }
    }
    ```


### GET /identity/
`neutron-server` --> `keystone`

=== "Header"
    ``` http title="GET /identity/" linenums="1"
    Host: 182.161.114.101
    User-Agent: neutron-server keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Requestshook-Request-Id: 7398ad079d4f4320965dbeb630f49d29
    X-Requestshook-Request-From: neutron-server
    ```

=== "Body"
    ``` json title="GET /identity/" linenums="1"
    none
    ```


### 300 MULTIPLE CHOICES /identity/
`neutron-server` <-- `keystone`

=== "Header"
    ``` http title="300 MULTIPLE CHOICES /identity/" linenums="1"
    Content-Type: application/json
    Content-Length: 274
    Location: http://182.161.114.101/identity/v3/
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 7398ad079d4f4320965dbeb630f49d29
    X-Requestshook-Request-From: neutron-server
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
`neutron-server` --> `keystone`

=== "Header"
    ``` http title="POST /identity/v3/auth/tokens" linenums="1"
    Host: 182.161.114.101
    User-Agent: neutron-server keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 214
    X-Requestshook-Request-Id: 773e25d47e3f456a95e3d9f5b98bb7e5
    X-Requestshook-Request-From: neutron-server
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
              "name": "nova",
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
`neutron-server` <-- `keystone`

=== "Header"
    ``` http title="201 CREATED /identity/v3/auth/tokens" linenums="1"
    Content-Type: application/json
    Content-Length: 4085
    X-Subject-Token: gAAAAABjt2gTpFX7IB805pEJ1I-2YV89DWQcsP3E5osdyGE-M9sPv8K1m_mgEmJTiAZZOszioNJMVwHj4WKjtBoK_ERQIJWfCmQZp12XnIhB5K9sfokNwrF8lXyZSloYbJfWCTa-PmsyXoV7DaHT0GJxlZ6bEd5715_m6wScHgfRnt9G0yC8i-M
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 773e25d47e3f456a95e3d9f5b98bb7e5
    X-Requestshook-Request-From: neutron-server
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
          "id": "e677cd9f6af84957942be2c2ec9f8fd7",
          "name": "nova",
          "password_expires_at": null
        },
        "audit_ids": [
          "aOGagWapTh6uE5Xg-_nqtA"
        ],
        "expires_at": "2023-01-06T03:15:15.000000Z",
        "issued_at": "2023-01-06T00:15:15.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "8e9b3373fd3c4f40b07eb3491b23aad5",
          "name": "service"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "df6670ead1724486a3e663603729e254",
            "name": "ResellerAdmin"
          },
          {
            "id": "86342910cc6b4ba6b6e4ce8ac447446f",
            "name": "member"
          },
          {
            "id": "c4440177d2db458885abc8134ca0243f",
            "name": "admin"
          },
          {
            "id": "9337768beffd44aba230cf6281265629",
            "name": "service"
          },
          {
            "id": "75d867a6e38a4cd285ecc64939524c16",
            "name": "reader"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "456e6128da8948cd8fb5e2fe3e772939",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              },
              {
                "id": "5b6780a2505b4b7db70c0db262b80897",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              },
              {
                "id": "d7f04b50eff14b0cbc870095da43943c",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "04cf066fa76f4bd5bfd5796a071f2fd6",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "1329ab1a0521406da241d89adfae5601",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "21c71be3212d493f8279556794a302f6",
            "type": "volumev3",
            "name": "cinderv3"
          },
          {
            "endpoints": [
              {
                "id": "5f6d83606f714d77af10534906128714",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "34f7de6ca0bf48cfb2e86bca160ed66d",
            "type": "compute",
            "name": "nova"
          },
          {
            "endpoints": [
              {
                "id": "350d9b3e30ef4b659e0202fca46d103d",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "38d6b27def0b4268925e032a830fe0c6",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "67b6ef09389645449932c8b1af59719e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "5301196fc0ed4f0eac37faaca7853571",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "883afb6c55ce446ea09f064028fb9dad",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "5f5a1d71d526491bab6838d014cc9b90",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "a14d5c89766747848e1592cf1f333a22",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "7c26339166754f59a033acd1ee1da4b2",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "ec8390af2bae4f238a0fc2067c393b8f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "9a7a984c396d4a64a25331682e95710a",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "1fdcfa22b4bc407e9f6b33c46682a894",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              },
              {
                "id": "c6cf2bf0313b48ed97a87d1a631a6ec7",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              }
            ],
            "id": "d5469a89da224de999a688a968d10dbf",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "1b7cc23f6e0e4f5bbd585483df2074be",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "e80ee55e11564ad68e3cde46b42b9174",
            "type": "placement",
            "name": "placement"
          }
        ]
      }
    }
    ```


### GET /identity/v3/auth/tokens
`nova-api` --> `keystone`

=== "Header"
    ``` http title="GET /identity/v3/auth/tokens" linenums="1"
    Host: 182.161.114.101
    User-Agent: python-keystoneclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Subject-Token: gAAAAABjt2gTpFX7IB805pEJ1I-2YV89DWQcsP3E5osdyGE-M9sPv8K1m_mgEmJTiAZZOszioNJMVwHj4WKjtBoK_ERQIJWfCmQZp12XnIhB5K9sfokNwrF8lXyZSloYbJfWCTa-PmsyXoV7DaHT0GJxlZ6bEd5715_m6wScHgfRnt9G0yC8i-M
    Openstack-Identity-Access-Rules: 1
    X-Auth-Token: gAAAAABjt2UK4VDlV7skdvIe3evqpw-4PYkoIwj8YQQ-RvT8ER0E8GU5hHbhxyqhYfnY6ZWjgik_4WllCyzr1tFRTD6SoBvXKUe866IxMK_IgnQHMHUmDVQPD0V4ygo4E_tdvv774e-woO5kXW9RHfnjAujuqaohFP1G9On1uuOybb0gIaE07oo
    X-Requestshook-Request-Id: 74ef597fb4244c81a9c56dfa59746622
    X-Requestshook-Request-From: nova-api
    ```

=== "Body"
    ``` json title="GET /identity/v3/auth/tokens" linenums="1"
    none
    ```


### 200 OK /identity/v3/auth/tokens
`nova-api` <-- `keystone`

=== "Header"
    ``` http title="200 OK /identity/v3/auth/tokens" linenums="1"
    Content-Type: application/json
    Content-Length: 4085
    X-Subject-Token: gAAAAABjt2gTpFX7IB805pEJ1I-2YV89DWQcsP3E5osdyGE-M9sPv8K1m_mgEmJTiAZZOszioNJMVwHj4WKjtBoK_ERQIJWfCmQZp12XnIhB5K9sfokNwrF8lXyZSloYbJfWCTa-PmsyXoV7DaHT0GJxlZ6bEd5715_m6wScHgfRnt9G0yC8i-M
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 74ef597fb4244c81a9c56dfa59746622
    X-Requestshook-Request-From: nova-api
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
          "id": "e677cd9f6af84957942be2c2ec9f8fd7",
          "name": "nova",
          "password_expires_at": null
        },
        "audit_ids": [
          "aOGagWapTh6uE5Xg-_nqtA"
        ],
        "expires_at": "2023-01-06T03:15:15.000000Z",
        "issued_at": "2023-01-06T00:15:15.000000Z",
        "project": {
          "domain": {
            "id": "default",
            "name": "Default"
          },
          "id": "8e9b3373fd3c4f40b07eb3491b23aad5",
          "name": "service"
        },
        "is_domain": false,
        "roles": [
          {
            "id": "df6670ead1724486a3e663603729e254",
            "name": "ResellerAdmin"
          },
          {
            "id": "86342910cc6b4ba6b6e4ce8ac447446f",
            "name": "member"
          },
          {
            "id": "c4440177d2db458885abc8134ca0243f",
            "name": "admin"
          },
          {
            "id": "9337768beffd44aba230cf6281265629",
            "name": "service"
          },
          {
            "id": "75d867a6e38a4cd285ecc64939524c16",
            "name": "reader"
          }
        ],
        "catalog": [
          {
            "endpoints": [
              {
                "id": "456e6128da8948cd8fb5e2fe3e772939",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              },
              {
                "id": "5b6780a2505b4b7db70c0db262b80897",
                "interface": "internal",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              },
              {
                "id": "d7f04b50eff14b0cbc870095da43943c",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "04cf066fa76f4bd5bfd5796a071f2fd6",
            "type": "database",
            "name": "trove"
          },
          {
            "endpoints": [
              {
                "id": "1329ab1a0521406da241d89adfae5601",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "21c71be3212d493f8279556794a302f6",
            "type": "volumev3",
            "name": "cinderv3"
          },
          {
            "endpoints": [
              {
                "id": "5f6d83606f714d77af10534906128714",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2.1",
                "region": "RegionOne"
              }
            ],
            "id": "34f7de6ca0bf48cfb2e86bca160ed66d",
            "type": "compute",
            "name": "nova"
          },
          {
            "endpoints": [
              {
                "id": "350d9b3e30ef4b659e0202fca46d103d",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "38d6b27def0b4268925e032a830fe0c6",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [
              {
                "id": "67b6ef09389645449932c8b1af59719e",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:9696/networking",
                "region": "RegionOne"
              }
            ],
            "id": "5301196fc0ed4f0eac37faaca7853571",
            "type": "network",
            "name": "neutron"
          },
          {
            "endpoints": [
              {
                "id": "883afb6c55ce446ea09f064028fb9dad",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/image",
                "region": "RegionOne"
              }
            ],
            "id": "5f5a1d71d526491bab6838d014cc9b90",
            "type": "image",
            "name": "glance"
          },
          {
            "endpoints": [
              {
                "id": "a14d5c89766747848e1592cf1f333a22",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/identity",
                "region": "RegionOne"
              }
            ],
            "id": "7c26339166754f59a033acd1ee1da4b2",
            "type": "identity",
            "name": "keystone"
          },
          {
            "endpoints": [
              {
                "id": "ec8390af2bae4f238a0fc2067c393b8f",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              }
            ],
            "id": "9a7a984c396d4a64a25331682e95710a",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [
              {
                "id": "1fdcfa22b4bc407e9f6b33c46682a894",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5",
                "region": "RegionOne"
              },
              {
                "id": "c6cf2bf0313b48ed97a87d1a631a6ec7",
                "interface": "admin",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101:8080",
                "region": "RegionOne"
              }
            ],
            "id": "d5469a89da224de999a688a968d10dbf",
            "type": "object-store",
            "name": "swift"
          },
          {
            "endpoints": [
              {
                "id": "1b7cc23f6e0e4f5bbd585483df2074be",
                "interface": "public",
                "region_id": "RegionOne",
                "url": "http://182.161.114.101/placement",
                "region": "RegionOne"
              }
            ],
            "id": "e80ee55e11564ad68e3cde46b42b9174",
            "type": "placement",
            "name": "placement"
          }
        ]
      }
    }
    ```


### POST /compute/v2.1/os-server-external-events
`neutron-server` --> `nova-api`

=== "Header"
    ``` http title="POST /compute/v2.1/os-server-external-events" linenums="1"
    Host: 182.161.114.101
    User-Agent: python-novaclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Nova-Api-Version: 2.1
    X-Openstack-Request-Id: req-922ad0ca-1696-43e3-bfe0-05faae6ff02c
    X-Auth-Token: gAAAAABjt2gTpFX7IB805pEJ1I-2YV89DWQcsP3E5osdyGE-M9sPv8K1m_mgEmJTiAZZOszioNJMVwHj4WKjtBoK_ERQIJWfCmQZp12XnIhB5K9sfokNwrF8lXyZSloYbJfWCTa-PmsyXoV7DaHT0GJxlZ6bEd5715_m6wScHgfRnt9G0yC8i-M
    Content-Type: application/json
    Content-Length: 170
    X-Requestshook-Request-Id: f00f06e6f24c4bdd810ddcfe10aa8495
    X-Requestshook-Request-From: neutron-server
    X-Identity-Status: Confirmed
    X-Roles: ResellerAdmin,member,admin,service,reader
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: e677cd9f6af84957942be2c2ec9f8fd7
    X-User-Name: nova
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: ResellerAdmin,member,admin,service,reader
    X-User: nova
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="POST /compute/v2.1/os-server-external-events" linenums="1"
    {
      "events": [
        {
          "server_uuid": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
          "name": "network-vif-plugged",
          "status": "completed",
          "tag": "f2267b05-180b-4920-b1e5-a77d38f70c24"
        }
      ]
    }
    ```


### 200 OK /compute/v2.1/os-server-external-events
`neutron-server` <-- `nova-api`

=== "Header"
    ``` http title="200 OK /compute/v2.1/os-server-external-events" linenums="1"
    Content-Length: 183
    Content-Type: application/json
    OpenStack-API-Version: compute 2.1
    X-OpenStack-Nova-API-Version: 2.1
    Vary: OpenStack-API-Version
    Vary: X-OpenStack-Nova-API-Version
    X-Requestshook-Request-Id: f00f06e6f24c4bdd810ddcfe10aa8495
    X-Requestshook-Request-From: neutron-server
    ```

=== "Body"
    ``` json title="200 OK /compute/v2.1/os-server-external-events" linenums="1"
    {
      "events": [
        {
          "server_uuid": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
          "name": "network-vif-plugged",
          "status": "completed",
          "tag": "f2267b05-180b-4920-b1e5-a77d38f70c24",
          "code": 200
        }
      ]
    }
    ```


### POST /compute/v2.1/os-server-external-events
`neutron-server` --> `nova-api`

=== "Header"
    ``` http title="POST /compute/v2.1/os-server-external-events" linenums="1"
    Host: 182.161.114.101
    User-Agent: python-novaclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Nova-Api-Version: 2.1
    X-Openstack-Request-Id: req-1343be16-5697-400e-a8a1-ecef37a67d99
    X-Auth-Token: gAAAAABjt2gTpFX7IB805pEJ1I-2YV89DWQcsP3E5osdyGE-M9sPv8K1m_mgEmJTiAZZOszioNJMVwHj4WKjtBoK_ERQIJWfCmQZp12XnIhB5K9sfokNwrF8lXyZSloYbJfWCTa-PmsyXoV7DaHT0GJxlZ6bEd5715_m6wScHgfRnt9G0yC8i-M
    Content-Type: application/json
    Content-Length: 170
    X-Requestshook-Request-Id: e3dab2ca42864f2398d5ea3c21048027
    X-Requestshook-Request-From: neutron-server
    X-Identity-Status: Confirmed
    X-Roles: ResellerAdmin,member,admin,service,reader
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: e677cd9f6af84957942be2c2ec9f8fd7
    X-User-Name: nova
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: ResellerAdmin,member,admin,service,reader
    X-User: nova
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="POST /compute/v2.1/os-server-external-events" linenums="1"
    {
      "events": [
        {
          "server_uuid": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
          "name": "network-vif-plugged",
          "status": "completed",
          "tag": "f2267b05-180b-4920-b1e5-a77d38f70c24"
        }
      ]
    }
    ```


### 200 OK /compute/v2.1/os-server-external-events
`neutron-server` <-- `nova-api`

=== "Header"
    ``` http title="200 OK /compute/v2.1/os-server-external-events" linenums="1"
    Content-Length: 183
    Content-Type: application/json
    OpenStack-API-Version: compute 2.1
    X-OpenStack-Nova-API-Version: 2.1
    Vary: OpenStack-API-Version
    Vary: X-OpenStack-Nova-API-Version
    X-Requestshook-Request-Id: e3dab2ca42864f2398d5ea3c21048027
    X-Requestshook-Request-From: neutron-server
    ```

=== "Body"
    ``` json title="200 OK /compute/v2.1/os-server-external-events" linenums="1"
    {
      "events": [
        {
          "server_uuid": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
          "name": "network-vif-plugged",
          "status": "completed",
          "tag": "f2267b05-180b-4920-b1e5-a77d38f70c24",
          "code": 200
        }
      ]
    }
    ```


### GET /networking/v2.0/ports
`nova-api` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/ports" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-4a043e77-eb57-4c0f-9e0d-f213c0d1d04b
    X-Auth-Token: gAAAAABjt2e8tW1JRgjUQKmpAUe_C98-V9Mo0JHj_vPeo7YeKlbukJ5AA-hfjby5fTMMOUb3z4jyBn658d-k_hQJ7l52AKdZtYnFd5X_3SQQgvZBb8hK-bSwRaT3lcbYTP0pZPg4boo6apSnmq4ao_RmnMq8nNqH3KC-5hLVmL-xcyEbioxedKs
    X-Requestshook-Request-Id: 16e10010c38241a082d52b2e8ecbf1e6
    X-Requestshook-Request-From: nova-api
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/ports" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/ports
`nova-api` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/ports" linenums="1"
    Content-Type: application/json
    Content-Length: 922
    X-Requestshook-Request-Id: 16e10010c38241a082d52b2e8ecbf1e6
    X-Requestshook-Request-From: nova-api
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/ports" linenums="1"
    {
      "ports": [
        {
          "id": "f2267b05-180b-4920-b1e5-a77d38f70c24",
          "name": "",
          "network_id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
          "tenant_id": "67b814b10c624269b605ea8c571decdc",
          "mac_address": "fa:16:3e:e7:64:91",
          "admin_state_up": true,
          "status": "ACTIVE",
          "device_id": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
          "device_owner": "compute:nova",
          "fixed_ips": [
            {
              "subnet_id": "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609",
              "ip_address": "192.168.233.37"
            }
          ],
          "allowed_address_pairs": [],
          "extra_dhcp_opts": [],
          "security_groups": [
            "eff69e1a-958f-4d8f-9db5-7b117f42e14d"
          ],
          "description": "",
          "binding:vnic_type": "normal",
          "binding:profile": {},
          "binding:host_id": "devstack-debug",
          "binding:vif_type": "ovs",
          "binding:vif_details": {
            "port_filter": true,
            "connectivity": "l2",
            "bound_drivers": {
              "0": "ovn"
            }
          },
          "port_security_enabled": true,
          "tags": [],
          "created_at": "2023-01-06T00:15:12Z",
          "updated_at": "2023-01-06T00:15:15Z",
          "revision_number": 4,
          "project_id": "67b814b10c624269b605ea8c571decdc"
        }
      ]
    }
    ```


### GET /networking/v2.0/ports
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/ports" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-0bfe96af-8abe-4a3f-a466-c48c6436fa84
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: 1f340433a17443049356e694bd0ecb67
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/ports" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/ports
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/ports" linenums="1"
    Content-Type: application/json
    Content-Length: 73
    X-Requestshook-Request-Id: 1f340433a17443049356e694bd0ecb67
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/ports" linenums="1"
    {
      "ports": [
        {
          "binding:host_id": "devstack-debug",
          "binding:vif_type": "ovs"
        }
      ]
    }
    ```


### GET /networking/v2.0/ports
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/ports" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-0bfe96af-8abe-4a3f-a466-c48c6436fa84
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: 84ece970803f4ae2a9e6f12953c4b3c4
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/ports" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/ports
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/ports" linenums="1"
    Content-Type: application/json
    Content-Length: 922
    X-Requestshook-Request-Id: 84ece970803f4ae2a9e6f12953c4b3c4
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/ports" linenums="1"
    {
      "ports": [
        {
          "id": "f2267b05-180b-4920-b1e5-a77d38f70c24",
          "name": "",
          "network_id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
          "tenant_id": "67b814b10c624269b605ea8c571decdc",
          "mac_address": "fa:16:3e:e7:64:91",
          "admin_state_up": true,
          "status": "ACTIVE",
          "device_id": "6dc2e525-a218-4814-9dc5-4cfcf2332268",
          "device_owner": "compute:nova",
          "fixed_ips": [
            {
              "subnet_id": "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609",
              "ip_address": "192.168.233.37"
            }
          ],
          "allowed_address_pairs": [],
          "extra_dhcp_opts": [],
          "security_groups": [
            "eff69e1a-958f-4d8f-9db5-7b117f42e14d"
          ],
          "description": "",
          "binding:vnic_type": "normal",
          "binding:profile": {},
          "binding:host_id": "devstack-debug",
          "binding:vif_type": "ovs",
          "binding:vif_details": {
            "port_filter": true,
            "connectivity": "l2",
            "bound_drivers": {
              "0": "ovn"
            }
          },
          "port_security_enabled": true,
          "tags": [],
          "created_at": "2023-01-06T00:15:12Z",
          "updated_at": "2023-01-06T00:15:15Z",
          "revision_number": 4,
          "project_id": "67b814b10c624269b605ea8c571decdc"
        }
      ]
    }
    ```


### GET /networking/v2.0/networks
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/networks" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-0bfe96af-8abe-4a3f-a466-c48c6436fa84
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: 8a3d9e932d9f4733a9acc25507005fbd
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/networks" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/networks
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/networks" linenums="1"
    Content-Type: application/json
    Content-Length: 663
    X-Requestshook-Request-Id: 8a3d9e932d9f4733a9acc25507005fbd
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/networks" linenums="1"
    {
      "networks": [
        {
          "id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
          "name": "shared",
          "tenant_id": "67b814b10c624269b605ea8c571decdc",
          "admin_state_up": true,
          "mtu": 1442,
          "status": "ACTIVE",
          "subnets": [
            "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609"
          ],
          "shared": true,
          "availability_zone_hints": [],
          "availability_zones": [],
          "ipv4_address_scope": null,
          "ipv6_address_scope": null,
          "router:external": false,
          "description": "",
          "port_security_enabled": true,
          "tags": [],
          "created_at": "2023-01-04T03:52:11Z",
          "updated_at": "2023-01-04T03:52:14Z",
          "revision_number": 2,
          "project_id": "67b814b10c624269b605ea8c571decdc",
          "provider:network_type": "geneve",
          "provider:physical_network": null,
          "provider:segmentation_id": 59003
        }
      ]
    }
    ```


### GET /networking/v2.0/subnets
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/subnets" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-0bfe96af-8abe-4a3f-a466-c48c6436fa84
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: 6d77dbd306bb4d7392807d9b2fd95aa8
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/subnets" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/subnets
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/subnets" linenums="1"
    Content-Type: application/json
    Content-Length: 644
    X-Requestshook-Request-Id: 6d77dbd306bb4d7392807d9b2fd95aa8
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/subnets" linenums="1"
    {
      "subnets": [
        {
          "id": "eba0a3fb-c4cf-4380-b1ad-39cadcdaf609",
          "name": "shared-subnet",
          "tenant_id": "67b814b10c624269b605ea8c571decdc",
          "network_id": "4529570d-57bf-4ec8-8d67-937f13b1d9ae",
          "ip_version": 4,
          "subnetpool_id": null,
          "enable_dhcp": true,
          "ipv6_ra_mode": null,
          "ipv6_address_mode": null,
          "gateway_ip": "192.168.233.1",
          "cidr": "192.168.233.0/24",
          "allocation_pools": [
            {
              "start": "192.168.233.2",
              "end": "192.168.233.254"
            }
          ],
          "host_routes": [],
          "dns_nameservers": [],
          "description": "shared-subnet",
          "service_types": [],
          "tags": [],
          "created_at": "2023-01-04T03:52:14Z",
          "updated_at": "2023-01-04T03:52:14Z",
          "revision_number": 0,
          "project_id": "67b814b10c624269b605ea8c571decdc"
        }
      ]
    }
    ```


### GET /networking/v2.0/ports
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/ports" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-0bfe96af-8abe-4a3f-a466-c48c6436fa84
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: 040d37df85b94bb4a0984a64bcc25f54
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/ports" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/ports
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/ports" linenums="1"
    Content-Type: application/json
    Content-Length: 12
    X-Requestshook-Request-Id: 040d37df85b94bb4a0984a64bcc25f54
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/ports" linenums="1"
    {
      "ports": []
    }
    ```


### GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-0bfe96af-8abe-4a3f-a466-c48c6436fa84
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: c4bdd06f284c44d6ab88f7dd0ae9a1bd
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: application/json
    Content-Length: 14
    X-Requestshook-Request-Id: c4bdd06f284c44d6ab88f7dd0ae9a1bd
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    {
      "network": {}
    }
    ```


### GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-compute` --> `neutron-server`

=== "Header"
    ``` http title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: text/plain
    Host: 182.161.114.101:9696
    User-Agent: python-neutronclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Openstack-Request-Id: req-0bfe96af-8abe-4a3f-a466-c48c6436fa84
    X-Auth-Token: gAAAAABjt2eogQjFpfQPYXuFQsw8jxLS54mFvVb302HfoDKtYz3H5H11fD5lvD1Cov9x-aAiL4VZikXGdADrAkRn0v4nneuw4TF1bpqfENGHY0oluBU_qsC4-fWTgu8XtgPLKTof4RZZPY9pYHWlC2Edr2vh1hT0UvZH_YOgvx6kJ2KsdTQPwpI
    X-Requestshook-Request-Id: c960c54d5a1b4995844e68d0ac5d3486
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: service
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: 7ec6b16003d44ce1afca419717942c75
    X-User-Name: neutron
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: service
    X-User: neutron
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    none
    ```


### 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
`nova-compute` <-- `neutron-server`

=== "Header"
    ``` http title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    Content-Type: application/json
    Content-Length: 79
    X-Requestshook-Request-Id: c960c54d5a1b4995844e68d0ac5d3486
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae" linenums="1"
    {
      "network": {
        "provider:network_type": "geneve",
        "provider:physical_network": null
      }
    }
    ```


### GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
`nova-compute` --> `placement-api`

=== "Header"
    ``` http title="GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    Host: 182.161.114.101
    User-Agent: nova-compute keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Openstack-Api-Version: placement 1.28
    X-Auth-Token: gAAAAABjt10YvKz--FZM8M6eddyAVOroHzPRKD57WPgguRG4pCQ96636aLMRiaszKEBocv5QMupc-Z09OjNLEl0vtR4Rg52_96L1CmuQU6P1vGlu0w7EnRwGdAeCvYGoLWO5Zs4ABuqefKg8O3LT5wWd6I-cfnNVwwZ4h9zjynJZzfT_1VAgCic
    X-Openstack-Request-Id: req-b161deb5-543f-4410-bbdf-e616025875a3
    X-Requestshook-Request-Id: 8eba640e9f4a45579e1a54d423350336
    X-Requestshook-Request-From: nova-compute
    X-Identity-Status: Confirmed
    X-Roles: reader,service,member,admin
    Openstack-System-Scope: None
    X-Domain-Id: None
    X-Domain-Name: None
    X-Project-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Project-Name: service
    X-Project-Domain-Id: default
    X-Project-Domain-Name: Default
    X-User-Id: c8efc1ef99c64c70ac4745f91551294a
    X-User-Name: placement
    X-User-Domain-Id: default
    X-User-Domain-Name: Default
    X-Is-Admin-Project: True
    X-Role: reader,service,member,admin
    X-User: placement
    X-Tenant-Id: 8e9b3373fd3c4f40b07eb3491b23aad5
    X-Tenant-Name: service
    X-Tenant: service
    X-Service-Catalog: [{"type": "database", "name": "trove", "endpoints": [{"region": "RegionOne", "adminURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "internalURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5", "publicURL": "http://182.161.114.101:8779/v1.0/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "volumev3", "name": "cinderv3", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "compute", "name": "nova", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2.1"}]}, {"type": "compute_legacy", "name": "nova_legacy", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/compute/v2/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "network", "name": "neutron", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:9696/networking"}]}, {"type": "image", "name": "glance", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/image"}]}, {"type": "identity", "name": "keystone", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/identity"}]}, {"type": "block-storage", "name": "cinder", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/volume/v3/8e9b3373fd3c4f40b07eb3491b23aad5"}]}, {"type": "object-store", "name": "swift", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101:8080/v1/AUTH_8e9b3373fd3c4f40b07eb3491b23aad5", "adminURL": "http://182.161.114.101:8080"}]}, {"type": "placement", "name": "placement", "endpoints": [{"region": "RegionOne", "publicURL": "http://182.161.114.101/placement"}]}]
    ```

=== "Body"
    ``` json title="GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    none
    ```


### 200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
`nova-compute` <-- `placement-api`

=== "Header"
    ``` http title="200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    Content-Length: 257
    Content-Type: application/json
    Last-Modified: Fri, 06 Jan 2023 00:15:12 GMT
    Cache-Control: no-cache
    openstack-api-version: placement 1.28
    vary: openstack-api-version
    X-Requestshook-Request-Id: 8eba640e9f4a45579e1a54d423350336
    X-Requestshook-Request-From: nova-compute
    ```

=== "Body"
    ``` json title="200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268" linenums="1"
    {
      "allocations": {
        "aa096077-e2a0-4c51-8436-5485d21038e8": {
          "resources": {
            "VCPU": 1,
            "MEMORY_MB": 256,
            "DISK_GB": 1
          },
          "generation": 4
        }
      },
      "project_id": "67b814b10c624269b605ea8c571decdc",
      "user_id": "4349d516240540dda214bae62ae5ff48",
      "consumer_generation": 1
    }
    ```

