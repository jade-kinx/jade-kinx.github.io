
### (1) GET /identity/
`openstack` --> `keystone`

=== "Header"
    ``` http title="GET /identity/" linenums="1"
    Host: 182.161.114.101
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Requestshook-Request-Id: fbb232c41ed24c67a1bdcf571f97f425
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="GET /identity/" linenums="1"
    none
    ```


### (2) 300 MULTIPLE CHOICES /identity/
`openstack` <-- `keystone`

=== "Header"
    ``` http title="300 MULTIPLE CHOICES /identity/" linenums="1"
    Content-Type: application/json
    Content-Length: 274
    Location: http://182.161.114.101/identity/v3/
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: fbb232c41ed24c67a1bdcf571f97f425
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


### (3) POST /identity/v3/auth/tokens
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
    X-Requestshook-Request-Id: 9684ef7cbf3f438385d25787fe764e1e
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


### (4) 201 CREATED /identity/v3/auth/tokens
`openstack` <-- `keystone`

=== "Header"
    ``` http title="201 CREATED /identity/v3/auth/tokens" linenums="1"
    Content-Type: application/json
    Content-Length: 3952
    X-Subject-Token: gAAAAABjsoJr7kmCgtOnnBLFPFUIe4__8XDcHmZmQ6Gxg2bf1_CUvVe7-B8uwnwX_H6qep9RcIII4Dc0MFaeh8xLGQIOjX73qedWUn89Jq8QcZRXq2lEcgNh1UCwXKiq74Bi0cGVxWbNTpvMxjaa9ufxrunb3kfQDXALPUwkHz3ZSRakJhBHH_g
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 9684ef7cbf3f438385d25787fe764e1e
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
          "m9p3HUFJSwa1Y45pUWZu4g"
        ],
        "expires_at": "2023-01-02T10:06:19.000000Z",
        "issued_at": "2023-01-02T07:06:19.000000Z",
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


### (5) GET /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c
`openstack` --> `glance-api`

!!! reference "API 참조"
    [Show Image](https://docs.openstack.org/api-ref/image/v2/index.html?expanded=show-image-detail#show-image) 

=== "Header"
    ``` http title="GET /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c" linenums="1"
    Host: 127.0.0.1:60999
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    X-Auth-Token: gAAAAABjsoJr7kmCgtOnnBLFPFUIe4__8XDcHmZmQ6Gxg2bf1_CUvVe7-B8uwnwX_H6qep9RcIII4Dc0MFaeh8xLGQIOjX73qedWUn89Jq8QcZRXq2lEcgNh1UCwXKiq74Bi0cGVxWbNTpvMxjaa9ufxrunb3kfQDXALPUwkHz3ZSRakJhBHH_g
    X-Requestshook-Request-Id: 2c9ad96808964908bf6bbcbb3e1cee46
    X-Requestshook-Request-From: openstack
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="GET /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c" linenums="1"
    none
    ```


### (6) GET /identity/v3/auth/tokens
`glance-api` --> `keystone`

=== "Header"
    ``` http title="GET /identity/v3/auth/tokens" linenums="1"
    Host: 182.161.114.101
    User-Agent: python-keystoneclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Subject-Token: gAAAAABjsoJr7kmCgtOnnBLFPFUIe4__8XDcHmZmQ6Gxg2bf1_CUvVe7-B8uwnwX_H6qep9RcIII4Dc0MFaeh8xLGQIOjX73qedWUn89Jq8QcZRXq2lEcgNh1UCwXKiq74Bi0cGVxWbNTpvMxjaa9ufxrunb3kfQDXALPUwkHz3ZSRakJhBHH_g
    Openstack-Identity-Access-Rules: 1
    X-Auth-Token: gAAAAABjsn215OxhShBEiueN9lpmbGY7XYuF0OWOxl1aCACn0y8gtECXMWBUOSB6Zp6d1xqtoXuiKNEdnb74y1Md4IfwFluzMhVRHBoJBZHByNdLJgY0P6fmY97CzYQf1tVnSZ0rIrcyh2po7kxlrMwxPVhYtkx12b6Jjtd8seYdaBW59vYGT8k
    X-Requestshook-Request-Id: 94623e7b795a44f4b81d1a21c3a36c48
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="GET /identity/v3/auth/tokens" linenums="1"
    none
    ```


### (7) 200 OK /identity/v3/auth/tokens
`glance-api` <-- `keystone`

=== "Header"
    ``` http title="200 OK /identity/v3/auth/tokens" linenums="1"
    Content-Type: application/json
    Content-Length: 3952
    X-Subject-Token: gAAAAABjsoJr7kmCgtOnnBLFPFUIe4__8XDcHmZmQ6Gxg2bf1_CUvVe7-B8uwnwX_H6qep9RcIII4Dc0MFaeh8xLGQIOjX73qedWUn89Jq8QcZRXq2lEcgNh1UCwXKiq74Bi0cGVxWbNTpvMxjaa9ufxrunb3kfQDXALPUwkHz3ZSRakJhBHH_g
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 94623e7b795a44f4b81d1a21c3a36c48
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
          "m9p3HUFJSwa1Y45pUWZu4g"
        ],
        "expires_at": "2023-01-02T10:06:19.000000Z",
        "issued_at": "2023-01-02T07:06:19.000000Z",
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


### (8) 200 OK /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c
`openstack` <-- `glance-api`

=== "Header"
    ``` http title="200 OK /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c" linenums="1"
    Content-Length: 950
    Content-Type: application/json
    x-openstack-request-id: req-d43d3d23-4045-4435-bfe7-5f2d2a21e925
    X-Requestshook-Request-Id: 2c9ad96808964908bf6bbcbb3e1cee46
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="200 OK /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c" linenums="1"
    {
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-disk",
      "owner_specified.openstack.sha256": "",
      "name": "cirros-0.6.1-x86_64-disk",
      "disk_format": "qcow2",
      "container_format": "bare",
      "visibility": "public",
      "size": 21233664,
      "virtual_size": 117440512,
      "status": "active",
      "checksum": "0c839612eb3f2469420f2ccae990827f",
      "protected": false,
      "min_ram": 0,
      "min_disk": 0,
      "owner": "de5af600557d44d0996e667499376dbb",
      "os_hidden": false,
      "os_hash_algo": "sha512",
      "os_hash_value": "df88bac2791254f68941229792539621516bd480aa3d6fe4c0ca16057393d024a4944d644959f323dc01a25e3417c0b581776ab3c8db8da542039f2a67230579",
      "id": "a42bfade-78ec-4c95-b7b4-272ba265072c",
      "created_at": "2023-01-02T06:29:17Z",
      "updated_at": "2023-01-02T06:29:33Z",
      "tags": [],
      "self": "/v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c",
      "file": "/v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file",
      "schema": "/v2/schemas/image"
    }
    ```

