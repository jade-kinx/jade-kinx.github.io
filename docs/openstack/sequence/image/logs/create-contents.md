
### GET /identity/
`openstack` --> `keystone`

=== "Header"
    ``` http title="GET /identity/"
    Host: 182.161.114.101
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Requestshook-Request-Id: bd8861449bbd4ff78724c573aca698eb
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="GET /identity/"
    none
    ```


### 300 MULTIPLE CHOICES /identity/
`openstack` <-- `keystone`

=== "Header"
    ``` http title="300 MULTIPLE CHOICES /identity/"
    Content-Type: application/json
    Content-Length: 274
    Location: http://182.161.114.101/identity/v3/
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: bd8861449bbd4ff78724c573aca698eb
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="300 MULTIPLE CHOICES /identity/"
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
    ``` http title="POST /identity/v3/auth/tokens"
    Host: 182.161.114.101
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 209
    X-Requestshook-Request-Id: e5fea907875c4e31b59fecc030f9b0b8
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="POST /identity/v3/auth/tokens"
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
    ``` http title="201 CREATED /identity/v3/auth/tokens"
    Content-Type: application/json
    Content-Length: 3952
    X-Subject-Token: gAAAAABjrjJbrJkxv18r_0YcvIUS4uouQw7Bi4Arabj64vdPInQyx17qN6mvVEf4K-ePxB8W2KoqCFCBeXc5LWDuGM845zefDyorO0nXbEBIFozb3cfETTA73g5faLJC6DG6Oi7Yui6MbuQGv2liiCYLAmmTPtyhdtPcsUirvgoqO3jaVUaWHiw
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: e5fea907875c4e31b59fecc030f9b0b8
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="201 CREATED /identity/v3/auth/tokens"
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
          "4gRmt1QuRniUTGbTi6uKAA"
        ],
        "expires_at": "2022-12-30T03:35:39.000000Z",
        "issued_at": "2022-12-30T00:35:39.000000Z",
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
            "id": "28dea0246b6f47df9d99b5b33b423c8b",
            "name": "reader"
          },
          {
            "id": "5f0594b46c8346d2996759ed1f5014f4",
            "name": "member"
          },
          {
            "id": "3e1adda493764db8921e97d68a5c8bc7",
            "name": "admin"
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


### GET /
`openstack` --> `glance-api`

=== "Header"
    ``` http title="GET /"
    Host: 127.0.0.1:60999
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    X-Requestshook-Request-Id: f6ff05c41e4e4371ba0589e1fbfe80a5
    X-Requestshook-Request-From: openstack
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="GET /"
    none
    ```


### 300 Multiple Choices None
`openstack` <-- `glance-api`

=== "Header"
    ``` http title="300 Multiple Choices None"
    Content-Type: application/json
    Content-Length: 1347
    X-Requestshook-Request-Id: f6ff05c41e4e4371ba0589e1fbfe80a5
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="300 Multiple Choices None"
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


### POST /v2/images
`openstack` --> `glance-api`

=== "Header"
    ``` http title="POST /v2/images"
    Host: 127.0.0.1:60999
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    X-Auth-Token: gAAAAABjrjJbrJkxv18r_0YcvIUS4uouQw7Bi4Arabj64vdPInQyx17qN6mvVEf4K-ePxB8W2KoqCFCBeXc5LWDuGM845zefDyorO0nXbEBIFozb3cfETTA73g5faLJC6DG6Oi7Yui6MbuQGv2liiCYLAmmTPtyhdtPcsUirvgoqO3jaVUaWHiw
    Content-Type: application/json
    X-Requestshook-Request-Id: 43d35ca1fc1547b082b5671c6690a4e1
    X-Requestshook-Request-From: openstack
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Content-Length: 260
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="POST /v2/images"
    {
      "name": "cirros-0.6.1-x86_64-test",
      "visibility": "public",
      "disk_format": "qcow2",
      "container_format": "bare",
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.sha256": "",
      "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-test"
    }
    ```


### GET /identity/
`glance-api` --> `keystone`

=== "Header"
    ``` http title="GET /identity/"
    Host: 182.161.114.101
    User-Agent: glance/25.0.1.dev4 keystonemiddleware.auth_token/10.1.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Requestshook-Request-Id: 0e87bc67fbe54e91a00ec7a1092b7f24
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="GET /identity/"
    none
    ```


### 300 MULTIPLE CHOICES /identity/
`glance-api` <-- `keystone`

=== "Header"
    ``` http title="300 MULTIPLE CHOICES /identity/"
    Content-Type: application/json
    Content-Length: 274
    Location: http://182.161.114.101/identity/v3/
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 0e87bc67fbe54e91a00ec7a1092b7f24
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="300 MULTIPLE CHOICES /identity/"
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
    ``` http title="POST /identity/v3/auth/tokens"
    Host: 182.161.114.101
    User-Agent: glance/25.0.1.dev4 keystonemiddleware.auth_token/10.1.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 216
    X-Requestshook-Request-Id: c2ab8aac5e1a4eba99db03a014d27bae
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="POST /identity/v3/auth/tokens"
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
    ``` http title="201 CREATED /identity/v3/auth/tokens"
    Content-Type: application/json
    Content-Length: 3833
    X-Subject-Token: gAAAAABjrjJbEb1YKTShFI7_H0577y5pGsub1ADX1KDROFs0EeM6zA__nEHCuYI6w3u7ODW7KMKkdBbhzXaVaLHUgVkXVdeidAL1w-1Tu-6PaHPh9-6LyxCANvbCuJWvrZDgMJ9AuPsl3yCBIFakE-L32eMLlDVtIRinGsDgUGaUuDSMQZR7gUo
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: c2ab8aac5e1a4eba99db03a014d27bae
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="201 CREATED /identity/v3/auth/tokens"
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
          "i56OJuoaSM6IU63ack_gbw"
        ],
        "expires_at": "2022-12-30T03:35:39.000000Z",
        "issued_at": "2022-12-30T00:35:39.000000Z",
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

=== "Header"
    ``` http title="GET /identity/v3/auth/tokens"
    Host: 182.161.114.101
    User-Agent: python-keystoneclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Subject-Token: gAAAAABjrjJbrJkxv18r_0YcvIUS4uouQw7Bi4Arabj64vdPInQyx17qN6mvVEf4K-ePxB8W2KoqCFCBeXc5LWDuGM845zefDyorO0nXbEBIFozb3cfETTA73g5faLJC6DG6Oi7Yui6MbuQGv2liiCYLAmmTPtyhdtPcsUirvgoqO3jaVUaWHiw
    Openstack-Identity-Access-Rules: 1
    X-Auth-Token: gAAAAABjrjJbEb1YKTShFI7_H0577y5pGsub1ADX1KDROFs0EeM6zA__nEHCuYI6w3u7ODW7KMKkdBbhzXaVaLHUgVkXVdeidAL1w-1Tu-6PaHPh9-6LyxCANvbCuJWvrZDgMJ9AuPsl3yCBIFakE-L32eMLlDVtIRinGsDgUGaUuDSMQZR7gUo
    X-Requestshook-Request-Id: ded35940789a44368494383f42832b28
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="GET /identity/v3/auth/tokens"
    none
    ```


### 200 OK /identity/v3/auth/tokens
`glance-api` <-- `keystone`

=== "Header"
    ``` http title="200 OK /identity/v3/auth/tokens"
    Content-Type: application/json
    Content-Length: 3952
    X-Subject-Token: gAAAAABjrjJbrJkxv18r_0YcvIUS4uouQw7Bi4Arabj64vdPInQyx17qN6mvVEf4K-ePxB8W2KoqCFCBeXc5LWDuGM845zefDyorO0nXbEBIFozb3cfETTA73g5faLJC6DG6Oi7Yui6MbuQGv2liiCYLAmmTPtyhdtPcsUirvgoqO3jaVUaWHiw
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: ded35940789a44368494383f42832b28
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="200 OK /identity/v3/auth/tokens"
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
          "4gRmt1QuRniUTGbTi6uKAA"
        ],
        "expires_at": "2022-12-30T03:35:39.000000Z",
        "issued_at": "2022-12-30T00:35:39.000000Z",
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
            "id": "28dea0246b6f47df9d99b5b33b423c8b",
            "name": "reader"
          },
          {
            "id": "5f0594b46c8346d2996759ed1f5014f4",
            "name": "member"
          },
          {
            "id": "3e1adda493764db8921e97d68a5c8bc7",
            "name": "admin"
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


### GET /identity/
`glance-api` --> `keystone`

=== "Header"
    ``` http title="GET /identity/"
    Host: 182.161.114.101
    User-Agent: uwsgi keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Requestshook-Request-Id: 7e7ca67d40654b1e9fc1db1cb6d8d589
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="GET /identity/"
    none
    ```


### 300 MULTIPLE CHOICES /identity/
`glance-api` <-- `keystone`

=== "Header"
    ``` http title="300 MULTIPLE CHOICES /identity/"
    Content-Type: application/json
    Content-Length: 274
    Location: http://182.161.114.101/identity/v3/
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 7e7ca67d40654b1e9fc1db1cb6d8d589
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="300 MULTIPLE CHOICES /identity/"
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
    ``` http title="POST /identity/v3/auth/tokens"
    Host: 182.161.114.101
    User-Agent: uwsgi keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 178
    X-Requestshook-Request-Id: 9f1af1f25bb242baa7317c8d99a2f2a9
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="POST /identity/v3/auth/tokens"
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


### 201 CREATED /identity/v3/auth/tokens
`glance-api` <-- `keystone`

=== "Header"
    ``` http title="201 CREATED /identity/v3/auth/tokens"
    Content-Type: application/json
    Content-Length: 2374
    X-Subject-Token: gAAAAABjrjJc23Udmqva6JJRB62q3g4HVpXOCOo14AxDUbpb-9_ldNZ5yZzFvW7ke-h-GlkUFxG2gQA-o3INE2xhccyi5S5DJ98mCZIGi3rWm5_QeufuWYszUEOOvuoEaOBdwN5weo8fiRNMcylEyUsinwcNPRalkA
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 9f1af1f25bb242baa7317c8d99a2f2a9
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="201 CREATED /identity/v3/auth/tokens"
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
          "yONZp34qRXC3DoOOFrNqbQ"
        ],
        "expires_at": "2022-12-30T03:35:40.000000Z",
        "issued_at": "2022-12-30T00:35:40.000000Z",
        "roles": [
          {
            "id": "28dea0246b6f47df9d99b5b33b423c8b",
            "name": "reader"
          }
        ],
        "system": {
          "all": true
        },
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
            "endpoints": [],
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
            "endpoints": [],
            "id": "cb1921a9c779492484907683bb447e84",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [],
            "id": "d5345b92210c49aa975a873d04921780",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [],
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
    ``` http title="201 Created /v2/images"
    Content-Length: 781
    Content-Type: application/json
    Location: http://127.0.0.1:60999/v2/images/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee
    OpenStack-image-import-methods: glance-direct,web-download,copy-image
    x-openstack-request-id: req-f0d48b86-4f6f-404c-ba13-d960d953b0d9
    X-Requestshook-Request-Id: 43d35ca1fc1547b082b5671c6690a4e1
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="201 Created /v2/images"
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
      "id": "2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee",
      "created_at": "2022-12-30T00:35:41Z",
      "updated_at": "2022-12-30T00:35:41Z",
      "tags": [],
      "self": "/v2/images/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee",
      "file": "/v2/images/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee/file",
      "schema": "/v2/schemas/image"
    }
    ```


### PUT /v2/images/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee/file
`openstack` --> `glance-api`

=== "Header"
    ``` http title="PUT /v2/images/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee/file"
    Host: 127.0.0.1:60999
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: 
    Content-Type: application/octet-stream
    X-Auth-Token: gAAAAABjrjJbrJkxv18r_0YcvIUS4uouQw7Bi4Arabj64vdPInQyx17qN6mvVEf4K-ePxB8W2KoqCFCBeXc5LWDuGM845zefDyorO0nXbEBIFozb3cfETTA73g5faLJC6DG6Oi7Yui6MbuQGv2liiCYLAmmTPtyhdtPcsUirvgoqO3jaVUaWHiw
    X-Requestshook-Request-Id: 232ecaa0ad424ea3aa20171b8939afd8
    X-Requestshook-Request-From: openstack
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Content-Length: 21233664
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="PUT /v2/images/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee/file"
    b'QFI\xfb\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x07\x00\x00\x00'...
    ```


### GET /identity/
`glance-api` --> `keystone`

=== "Header"
    ``` http title="GET /identity/"
    Host: 182.161.114.101
    User-Agent: uwsgi keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Requestshook-Request-Id: 75fbfdd667be47eab77009eed3590575
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="GET /identity/"
    none
    ```


### 300 MULTIPLE CHOICES /identity/
`glance-api` <-- `keystone`

=== "Header"
    ``` http title="300 MULTIPLE CHOICES /identity/"
    Content-Type: application/json
    Content-Length: 274
    Location: http://182.161.114.101/identity/v3/
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 75fbfdd667be47eab77009eed3590575
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="300 MULTIPLE CHOICES /identity/"
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
    ``` http title="POST /identity/v3/auth/tokens"
    Host: 182.161.114.101
    User-Agent: uwsgi keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 178
    X-Requestshook-Request-Id: 60c1a6a1edd3445490cb6baf2359cdbb
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="POST /identity/v3/auth/tokens"
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


### 201 CREATED /identity/v3/auth/tokens
`glance-api` <-- `keystone`

=== "Header"
    ``` http title="201 CREATED /identity/v3/auth/tokens"
    Content-Type: application/json
    Content-Length: 2374
    X-Subject-Token: gAAAAABjrjJdY2IEZaO7qcMaLfg3kqRvk0ZwbQPhEYA3xMX1csWx1MV_lCd4eG8Q75orz3trNI4_t1L7rOX4WtfcH63Dt1lhdTdyb_1rBjUFmgVygjOgsL2RTOmKYbNkmugL7dfRsmOkeevHKM3CNopfiwN1M4sV4w
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 60c1a6a1edd3445490cb6baf2359cdbb
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="201 CREATED /identity/v3/auth/tokens"
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
          "tql4zuisT6m2iA9MCtEbng"
        ],
        "expires_at": "2022-12-30T03:35:41.000000Z",
        "issued_at": "2022-12-30T00:35:41.000000Z",
        "roles": [
          {
            "id": "28dea0246b6f47df9d99b5b33b423c8b",
            "name": "reader"
          }
        ],
        "system": {
          "all": true
        },
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
            "endpoints": [],
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
            "endpoints": [],
            "id": "cb1921a9c779492484907683bb447e84",
            "type": "compute_legacy",
            "name": "nova_legacy"
          },
          {
            "endpoints": [],
            "id": "d5345b92210c49aa975a873d04921780",
            "type": "block-storage",
            "name": "cinder"
          },
          {
            "endpoints": [],
            "id": "e559802e75824163a070bd92dd143476",
            "type": "volumev3",
            "name": "cinderv3"
          }
        ]
      }
    }
    ```


### POST /identity/v3/auth/tokens
`glance-api` --> `keystone`

=== "Header"
    ``` http title="POST /identity/v3/auth/tokens"
    Host: 182.161.114.101
    User-Agent: uwsgi keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 218
    X-Requestshook-Request-Id: ec14c9b3fe664de7b267cf4ad3994d1d
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="POST /identity/v3/auth/tokens"
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
    ``` http title="201 CREATED /identity/v3/auth/tokens"
    Content-Type: application/json
    Content-Length: 3908
    X-Subject-Token: gAAAAABjrjJfX0L-tsJzGsa5uMI9WaLKbfxReLljfe4_7EMGB2onC_ec1l7fzI5md4JjoAhV8ooGkCq8nTHZSf9zfY5lxJD98vqf03JaB1XehGIKWQbr0uFUCNBvopR_PtMg5iUPKK2g3Ei8lnz2OXnpVpKxfWloSaudoRU4cbJVXM8YSHG0mFA
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: ec14c9b3fe664de7b267cf4ad3994d1d
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="201 CREATED /identity/v3/auth/tokens"
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
          "qJaa3yuATauj32cVGn7ggA"
        ],
        "expires_at": "2022-12-30T03:35:43.000000Z",
        "issued_at": "2022-12-30T00:35:43.000000Z",
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

=== "Header"
    ``` http title="HEAD /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance"
    Content-Type: 
    Host: 182.161.114.101:8080
    Accept-Encoding: identity
    X-Auth-Token: gAAAAABjrjJfX0L-tsJzGsa5uMI9WaLKbfxReLljfe4_7EMGB2onC_ec1l7fzI5md4JjoAhV8ooGkCq8nTHZSf9zfY5lxJD98vqf03JaB1XehGIKWQbr0uFUCNBvopR_PtMg5iUPKK2g3Ei8lnz2OXnpVpKxfWloSaudoRU4cbJVXM8YSHG0mFA
    User-Agent: python-swiftclient-4.1.0
    X-Requestshook-Request-Id: 3212723b0d884bf88145c69862effdea
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="HEAD /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance"
    none
    ```


### GET /identity/v3/auth/tokens
`swift-proxy-server` --> `keystone`

=== "Header"
    ``` http title="GET /identity/v3/auth/tokens"
    Host: 182.161.114.101
    User-Agent: python-keystoneclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Subject-Token: gAAAAABjrjJfX0L-tsJzGsa5uMI9WaLKbfxReLljfe4_7EMGB2onC_ec1l7fzI5md4JjoAhV8ooGkCq8nTHZSf9zfY5lxJD98vqf03JaB1XehGIKWQbr0uFUCNBvopR_PtMg5iUPKK2g3Ei8lnz2OXnpVpKxfWloSaudoRU4cbJVXM8YSHG0mFA
    Openstack-Identity-Access-Rules: 1
    X-Auth-Token: gAAAAABjrjJGaF5Q7tx3oVja4UAOY53wgd7ltBWAfsYXHJH3w4XwhdecBvGgfQR5qtuFW3PbnACXZKs_t9XgYG0q9cCCXOllAkzAMgbPkAHknHuINTQ3t0sPKEoJLawZ95y1jznIFcb-oQGXqGQKScS6qKwToz3Qc39csvxir7YStSBYOTw4E1U
    X-Requestshook-Request-Id: 73c7870a00084f2593c3aa37c31e216f
    X-Requestshook-Request-From: swift-proxy-server
    ```

=== "Body"
    ``` json title="GET /identity/v3/auth/tokens"
    none
    ```


### 200 OK /identity/v3/auth/tokens
`swift-proxy-server` <-- `keystone`

=== "Header"
    ``` http title="200 OK /identity/v3/auth/tokens"
    Content-Type: application/json
    Content-Length: 604
    X-Subject-Token: gAAAAABjrjJfX0L-tsJzGsa5uMI9WaLKbfxReLljfe4_7EMGB2onC_ec1l7fzI5md4JjoAhV8ooGkCq8nTHZSf9zfY5lxJD98vqf03JaB1XehGIKWQbr0uFUCNBvopR_PtMg5iUPKK2g3Ei8lnz2OXnpVpKxfWloSaudoRU4cbJVXM8YSHG0mFA
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 73c7870a00084f2593c3aa37c31e216f
    X-Requestshook-Request-From: swift-proxy-server
    ```

=== "Body"
    ``` json title="200 OK /identity/v3/auth/tokens"
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
          "qJaa3yuATauj32cVGn7ggA"
        ],
        "expires_at": "2022-12-30T03:35:43.000000Z",
        "issued_at": "2022-12-30T00:35:43.000000Z",
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
    ``` http title="204 No Content /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance"
    Content-Type: text/plain; charset=utf-8
    X-Backend-Timestamp: 1671683363.84851
    X-Backend-Put-Timestamp: 1671683363.83052
    X-Backend-Delete-Timestamp: 0000000000.00000
    X-Backend-Status-Changed-At: 1671683363.83052
    X-Backend-Storage-Policy-Index: 0
    X-Container-Object-Count: 4
    X-Container-Bytes-Used: 1091942912
    X-Timestamp: 1671683363.84851
    X-Backend-Sharding-State: unsharded
    Last-Modified: Thu, 22 Dec 2022 04:29:24 GMT
    Accept-Ranges: bytes
    X-Storage-Policy: Policy-0
    X-Backend-Recheck-Container-Existence: 60
    X-Container-Sharding: False
    Vary: Accept
    X-Requestshook-Request-Id: 3212723b0d884bf88145c69862effdea
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="204 No Content /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance"
    none
    ```


### PUT /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee
`glance-api` --> `swift-proxy-server`

=== "Header"
    ``` http title="PUT /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee"
    Content-Type: 
    Content-Length: 21233664
    Host: 182.161.114.101:8080
    Accept-Encoding: identity
    X-Auth-Token: gAAAAABjrjJfX0L-tsJzGsa5uMI9WaLKbfxReLljfe4_7EMGB2onC_ec1l7fzI5md4JjoAhV8ooGkCq8nTHZSf9zfY5lxJD98vqf03JaB1XehGIKWQbr0uFUCNBvopR_PtMg5iUPKK2g3Ei8lnz2OXnpVpKxfWloSaudoRU4cbJVXM8YSHG0mFA
    User-Agent: python-swiftclient-4.1.0
    X-Requestshook-Request-Id: a10e01b2569b424fb96576d4c8863e80
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="PUT /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee"
    b'QFI\xfb\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x07\x00\x00\x00'...
    ```


### 201 Created /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee
`glance-api` <-- `swift-proxy-server`

=== "Header"
    ``` http title="201 Created /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee"
    Content-Type: text/html; charset=UTF-8
    Content-Length: 0
    Etag: 0c839612eb3f2469420f2ccae990827f
    Last-Modified: Fri, 30 Dec 2022 00:35:44 GMT
    X-Requestshook-Request-Id: a10e01b2569b424fb96576d4c8863e80
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="201 Created /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee"
    none
    ```


### 204 No Content /v2/images/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee/file
`openstack` <-- `glance-api`

=== "Header"
    ``` http title="204 No Content /v2/images/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee/file"
    Content-Type: text/html; charset=UTF-8
    Content-Length: 0
    x-openstack-request-id: req-724a98b0-01ec-4de3-8dde-6acd0fb6cd11
    X-Requestshook-Request-Id: 232ecaa0ad424ea3aa20171b8939afd8
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="204 No Content /v2/images/2ff4bb2a-e291-4052-b5d3-8c7cdb6f91ee/file"
    none
    ```

