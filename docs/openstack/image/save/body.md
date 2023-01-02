
### (1) GET /identity/
`openstack` --> `keystone`

=== "Header"
    ``` http title="GET /identity/" linenums="1"
    Host: 182.161.114.101
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Requestshook-Request-Id: 1a2e4a3d05ce482586b9219ea2be036d
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
    X-Requestshook-Request-Id: 1a2e4a3d05ce482586b9219ea2be036d
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
    X-Requestshook-Request-Id: cd4fc181804145b59d02e865561bbb13
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
    X-Subject-Token: gAAAAABjsoUBidK_dtSo6s04L6HQ5WB6XDcLhYyaRXYNAhH7A1bnXkF18BtoVGL7BP799R3yTWMzrtvmcCpzr3Rby-9BWnHZvmuv1lW2WCDI33aCKcodflbSqZ8eoTuT678mJr9nJYcFkWaf15uoavuuUe-kRYAz8LUwB6FSJEY-Hc12GmWM8uI
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: cd4fc181804145b59d02e865561bbb13
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
          "_JYCq7QHSdqgdyV6AbKC2Q"
        ],
        "expires_at": "2023-01-02T10:17:21.000000Z",
        "issued_at": "2023-01-02T07:17:21.000000Z",
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

=== "Header"
    ``` http title="GET /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c" linenums="1"
    Host: 127.0.0.1:60999
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    X-Auth-Token: gAAAAABjsoUBidK_dtSo6s04L6HQ5WB6XDcLhYyaRXYNAhH7A1bnXkF18BtoVGL7BP799R3yTWMzrtvmcCpzr3Rby-9BWnHZvmuv1lW2WCDI33aCKcodflbSqZ8eoTuT678mJr9nJYcFkWaf15uoavuuUe-kRYAz8LUwB6FSJEY-Hc12GmWM8uI
    X-Requestshook-Request-Id: c756180054df4538a81baad42bb509c1
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
    X-Subject-Token: gAAAAABjsoUBidK_dtSo6s04L6HQ5WB6XDcLhYyaRXYNAhH7A1bnXkF18BtoVGL7BP799R3yTWMzrtvmcCpzr3Rby-9BWnHZvmuv1lW2WCDI33aCKcodflbSqZ8eoTuT678mJr9nJYcFkWaf15uoavuuUe-kRYAz8LUwB6FSJEY-Hc12GmWM8uI
    Openstack-Identity-Access-Rules: 1
    X-Auth-Token: gAAAAABjsn215OxhShBEiueN9lpmbGY7XYuF0OWOxl1aCACn0y8gtECXMWBUOSB6Zp6d1xqtoXuiKNEdnb74y1Md4IfwFluzMhVRHBoJBZHByNdLJgY0P6fmY97CzYQf1tVnSZ0rIrcyh2po7kxlrMwxPVhYtkx12b6Jjtd8seYdaBW59vYGT8k
    X-Requestshook-Request-Id: abdc69882fb64248bc839e01b4719632
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
    X-Subject-Token: gAAAAABjsoUBidK_dtSo6s04L6HQ5WB6XDcLhYyaRXYNAhH7A1bnXkF18BtoVGL7BP799R3yTWMzrtvmcCpzr3Rby-9BWnHZvmuv1lW2WCDI33aCKcodflbSqZ8eoTuT678mJr9nJYcFkWaf15uoavuuUe-kRYAz8LUwB6FSJEY-Hc12GmWM8uI
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: abdc69882fb64248bc839e01b4719632
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
          "_JYCq7QHSdqgdyV6AbKC2Q"
        ],
        "expires_at": "2023-01-02T10:17:21.000000Z",
        "issued_at": "2023-01-02T07:17:21.000000Z",
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
    x-openstack-request-id: req-28c2ab3a-0012-4a6a-8875-ae048973164e
    X-Requestshook-Request-Id: c756180054df4538a81baad42bb509c1
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


### (9) GET /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file
`openstack` --> `glance-api`

=== "Header"
    ``` http title="GET /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file" linenums="1"
    Host: 127.0.0.1:60999
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    X-Auth-Token: gAAAAABjsoUBidK_dtSo6s04L6HQ5WB6XDcLhYyaRXYNAhH7A1bnXkF18BtoVGL7BP799R3yTWMzrtvmcCpzr3Rby-9BWnHZvmuv1lW2WCDI33aCKcodflbSqZ8eoTuT678mJr9nJYcFkWaf15uoavuuUe-kRYAz8LUwB6FSJEY-Hc12GmWM8uI
    X-Requestshook-Request-Id: e6be6c1066b543d9afac7cd0dd0f9bbd
    X-Requestshook-Request-From: openstack
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="GET /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file" linenums="1"
    none
    ```


### (10) POST /identity/v3/auth/tokens
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
    X-Requestshook-Request-Id: 790f5df968e6461e8802a08c97588db2
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


### (11) 201 CREATED /identity/v3/auth/tokens
`glance-api` <-- `keystone`

=== "Header"
    ``` http title="201 CREATED /identity/v3/auth/tokens" linenums="1"
    Content-Type: application/json
    Content-Length: 3908
    X-Subject-Token: gAAAAABjsoUC1ZzWGlzr7lNjt4yP3BmI_SvU14R0ivEsk_qydLBEy_4uuyJW55mDM_TNU-Gm8g_kmlLTga5XzBoy_mtWrHoiXfJk_H4W6nblb2Omsx4TXj7OQZB5TssyhLHD_Uwjo5Izp_vOmgWdtpMSX0r3pMtc7GKJIPy3t9wYMBK1bTuf3M8
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 790f5df968e6461e8802a08c97588db2
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
          "EOk4jHrXT0S-65HfV9sdcQ"
        ],
        "expires_at": "2023-01-02T10:17:22.000000Z",
        "issued_at": "2023-01-02T07:17:22.000000Z",
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


### (12) GET /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/a42bfade-78ec-4c95-b7b4-272ba265072c
`glance-api` --> `swift-proxy-server`

=== "Header"
    ``` http title="GET /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/a42bfade-78ec-4c95-b7b4-272ba265072c" linenums="1"
    Content-Type: 
    Host: 182.161.114.101:8080
    Accept-Encoding: identity
    X-Auth-Token: gAAAAABjsoUC1ZzWGlzr7lNjt4yP3BmI_SvU14R0ivEsk_qydLBEy_4uuyJW55mDM_TNU-Gm8g_kmlLTga5XzBoy_mtWrHoiXfJk_H4W6nblb2Omsx4TXj7OQZB5TssyhLHD_Uwjo5Izp_vOmgWdtpMSX0r3pMtc7GKJIPy3t9wYMBK1bTuf3M8
    User-Agent: python-swiftclient-4.1.0
    X-Requestshook-Request-Id: 1dcdd0ec3972444b957acd00adb3eb9a
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="GET /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/a42bfade-78ec-4c95-b7b4-272ba265072c" linenums="1"
    none
    ```


### (13) GET /identity/v3/auth/tokens
`swift-proxy-server` --> `keystone`

=== "Header"
    ``` http title="GET /identity/v3/auth/tokens" linenums="1"
    Host: 182.161.114.101
    User-Agent: python-keystoneclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Subject-Token: gAAAAABjsoUC1ZzWGlzr7lNjt4yP3BmI_SvU14R0ivEsk_qydLBEy_4uuyJW55mDM_TNU-Gm8g_kmlLTga5XzBoy_mtWrHoiXfJk_H4W6nblb2Omsx4TXj7OQZB5TssyhLHD_Uwjo5Izp_vOmgWdtpMSX0r3pMtc7GKJIPy3t9wYMBK1bTuf3M8
    Openstack-Identity-Access-Rules: 1
    X-Auth-Token: gAAAAABjsnnI948eHZWtPSl7u52IntTMCHg6VqXZUTFEYmIX9_imlt30fJUYRJ16vwgnUVHibxshwZd9PlrS8Wwn9EnA2DkpM5xxyhYM_w9nVcSdUgJavA13KfoO815p7OP_hOIKal4k9xRurbuF6H2DhVRhowrBhG_VIUPb_y3DjqLErhqjTp4
    X-Requestshook-Request-Id: 9159d4f1b6dc470eaa33afdddc5fa5a5
    X-Requestshook-Request-From: swift-proxy-server
    ```

=== "Body"
    ``` json title="GET /identity/v3/auth/tokens" linenums="1"
    none
    ```


### (14) 200 OK /identity/v3/auth/tokens
`swift-proxy-server` <-- `keystone`

=== "Header"
    ``` http title="200 OK /identity/v3/auth/tokens" linenums="1"
    Content-Type: application/json
    Content-Length: 604
    X-Subject-Token: gAAAAABjsoUC1ZzWGlzr7lNjt4yP3BmI_SvU14R0ivEsk_qydLBEy_4uuyJW55mDM_TNU-Gm8g_kmlLTga5XzBoy_mtWrHoiXfJk_H4W6nblb2Omsx4TXj7OQZB5TssyhLHD_Uwjo5Izp_vOmgWdtpMSX0r3pMtc7GKJIPy3t9wYMBK1bTuf3M8
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 9159d4f1b6dc470eaa33afdddc5fa5a5
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
          "EOk4jHrXT0S-65HfV9sdcQ"
        ],
        "expires_at": "2023-01-02T10:17:22.000000Z",
        "issued_at": "2023-01-02T07:17:22.000000Z",
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


### (15) 200 OK /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/a42bfade-78ec-4c95-b7b4-272ba265072c
`glance-api` <-- `swift-proxy-server`

=== "Header"
    ``` http title="200 OK /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/a42bfade-78ec-4c95-b7b4-272ba265072c" linenums="1"
    Content-Type: application/octet-stream
    Etag: 0c839612eb3f2469420f2ccae990827f
    Last-Modified: Mon, 02 Jan 2023 06:29:30 GMT
    X-Timestamp: 1672640969.23035
    X-Backend-Timestamp: 1672640969.23035
    X-Backend-Data-Timestamp: 1672640969.23035
    X-Backend-Durable-Timestamp: 1672640969.23035
    Accept-Ranges: bytes
    Content-Length: 21233664
    X-Requestshook-Request-Id: 1dcdd0ec3972444b957acd00adb3eb9a
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="200 OK /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/a42bfade-78ec-4c95-b7b4-272ba265072c" linenums="1"
    b'QFI\xfb\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x07\x00\x00\x00'...
    ```


### (16) 200 OK /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file
`openstack` <-- `glance-api`

=== "Header"
    ``` http title="200 OK /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file" linenums="1"
    Content-Type: application/octet-stream
    Content-MD5: 0c839612eb3f2469420f2ccae990827f
    x-openstack-request-id: req-376866e1-2795-4d38-b104-47f2ec527369
    X-Requestshook-Request-Id: e6be6c1066b543d9afac7cd0dd0f9bbd
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="200 OK /v2/images/a42bfade-78ec-4c95-b7b4-272ba265072c/file" linenums="1"
    b'QFI\xfb\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x07\x00\x00\x00'...
    ```

