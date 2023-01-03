
### (1) GET /identity/
`openstack` --> `keystone`

=== "Header"
    ``` http title="GET /identity/" linenums="1"
    Host: 182.161.114.101
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    X-Requestshook-Request-Id: 1db6ad752cca483facdfc12a69d28876
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
    X-Requestshook-Request-Id: 1db6ad752cca483facdfc12a69d28876
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
    X-Requestshook-Request-Id: 3804cb0ea7134da9aa83bea5e5c8d560
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
    X-Subject-Token: gAAAAABjspx1DTolfmi1UKixnxPvZiIPNhKyrDbDcK2O3pCAVfWobD6l224XbtGK3aGN_GlqFR4fXO8rjYFoEeamp62klqQATvNsbd1k-VoG2nnK3HLMWlLxKc-0dEE-h1owxeC-X5LulGti8ehy2UPYdv24LH3TOv5FNa1PsXRwkmnEl5ax_ns
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 3804cb0ea7134da9aa83bea5e5c8d560
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
          "cn7BsshFTxKQopJTR4Nkmw"
        ],
        "expires_at": "2023-01-02T11:57:25.000000Z",
        "issued_at": "2023-01-02T08:57:25.000000Z",
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


### (5) GET /v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e
`openstack` --> `glance-api`

=== "Header"
    ``` http title="GET /v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    Host: 127.0.0.1:60999
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    X-Auth-Token: gAAAAABjspx1DTolfmi1UKixnxPvZiIPNhKyrDbDcK2O3pCAVfWobD6l224XbtGK3aGN_GlqFR4fXO8rjYFoEeamp62klqQATvNsbd1k-VoG2nnK3HLMWlLxKc-0dEE-h1owxeC-X5LulGti8ehy2UPYdv24LH3TOv5FNa1PsXRwkmnEl5ax_ns
    X-Requestshook-Request-Id: 561e78aa05794efd804f1fa7aa1542af
    X-Requestshook-Request-From: openstack
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="GET /v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
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
    X-Subject-Token: gAAAAABjspx1DTolfmi1UKixnxPvZiIPNhKyrDbDcK2O3pCAVfWobD6l224XbtGK3aGN_GlqFR4fXO8rjYFoEeamp62klqQATvNsbd1k-VoG2nnK3HLMWlLxKc-0dEE-h1owxeC-X5LulGti8ehy2UPYdv24LH3TOv5FNa1PsXRwkmnEl5ax_ns
    Openstack-Identity-Access-Rules: 1
    X-Auth-Token: gAAAAABjsngzWyVGDHbiSj5O8qRegJFlrF6uhymf73wRY30-fdJy6Z5__WEEU_v9HN2B1fKW4tjnkh673cmzR2781Rz8taI2YJh8vI_0zgDRvwUxWzGGIhUCh7554NDMLnvCrcvVGvIdBVONzHpcKBc2cEwaU0KQIAunm5Mk4kOXkl8pN32scro
    X-Requestshook-Request-Id: 19d28ac95c814764bfa2e82d546597ec
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
    X-Subject-Token: gAAAAABjspx1DTolfmi1UKixnxPvZiIPNhKyrDbDcK2O3pCAVfWobD6l224XbtGK3aGN_GlqFR4fXO8rjYFoEeamp62klqQATvNsbd1k-VoG2nnK3HLMWlLxKc-0dEE-h1owxeC-X5LulGti8ehy2UPYdv24LH3TOv5FNa1PsXRwkmnEl5ax_ns
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 19d28ac95c814764bfa2e82d546597ec
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
          "cn7BsshFTxKQopJTR4Nkmw"
        ],
        "expires_at": "2023-01-02T11:57:25.000000Z",
        "issued_at": "2023-01-02T08:57:25.000000Z",
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


### (8) 200 OK /v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e
`openstack` <-- `glance-api`

=== "Header"
    ``` http title="200 OK /v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    Content-Length: 950
    Content-Type: application/json
    x-openstack-request-id: req-2468cafe-dfa5-435f-952d-9fa9fbc6375f
    X-Requestshook-Request-Id: 561e78aa05794efd804f1fa7aa1542af
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="200 OK /v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    {
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-test",
      "owner_specified.openstack.sha256": "",
      "name": "cirros-0.6.1-x86_64-test",
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
      "id": "04cd3672-1f97-4e98-bfe0-0d4801d88a8e",
      "created_at": "2023-01-02T08:56:13Z",
      "updated_at": "2023-01-02T08:56:16Z",
      "tags": [],
      "self": "/v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e",
      "file": "/v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e/file",
      "schema": "/v2/schemas/image"
    }
    ```


### (9) DELETE /v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e
`openstack` --> `glance-api`

=== "Header"
    ``` http title="DELETE /v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    Host: 127.0.0.1:60999
    User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
    Accept-Encoding: gzip, deflate
    Accept: */*
    X-Auth-Token: gAAAAABjspx1DTolfmi1UKixnxPvZiIPNhKyrDbDcK2O3pCAVfWobD6l224XbtGK3aGN_GlqFR4fXO8rjYFoEeamp62klqQATvNsbd1k-VoG2nnK3HLMWlLxKc-0dEE-h1owxeC-X5LulGti8ehy2UPYdv24LH3TOv5FNa1PsXRwkmnEl5ax_ns
    X-Requestshook-Request-Id: 35652d6381fa4d069c2ada94e19c0bd1
    X-Requestshook-Request-From: openstack
    X-Forwarded-For: 182.161.114.101
    X-Forwarded-Host: 182.161.114.101
    X-Forwarded-Server: 127.0.0.1
    Content-Length: 0
    Connection: Keep-Alive
    ```

=== "Body"
    ``` json title="DELETE /v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    none
    ```


### (10) POST /identity/v3/auth/tokens
`glance-api` --> `keystone`

=== "Header"
    ``` http title="POST /identity/v3/auth/tokens" linenums="1"
    Host: 182.161.114.101
    User-Agent: python-keystoneclient
    Accept-Encoding: gzip, deflate
    Accept: application/json
    Connection: keep-alive
    Content-Type: application/json
    Content-Length: 218
    X-Requestshook-Request-Id: f85968d4bdcf46c6bb8d8ff84b67176e
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
    X-Subject-Token: gAAAAABjspx2bYIpv8B0LX9k_ZPSkXrrMWMRKLVWVOG5VzqhRzLNJTfDYL5Gi0ikunp_b11hXheYclkxWaZbtTvlGYvAKfnzye_Rrmrza6nOj7mko0ec3OV6jsMQeJI8s2KXYOCSt6wEQpBlFjx6WhxW-PVaZqbDTQooGEGJ-XHf6s_HbM7Qjk4
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: f85968d4bdcf46c6bb8d8ff84b67176e
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
          "01I3jNBBRE-HXUHdqyhFPg"
        ],
        "expires_at": "2023-01-02T11:57:26.000000Z",
        "issued_at": "2023-01-02T08:57:26.000000Z",
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


### (12) HEAD /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/04cd3672-1f97-4e98-bfe0-0d4801d88a8e
`glance-api` --> `swift-proxy-server`

=== "Header"
    ``` http title="HEAD /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    Content-Type: 
    Host: 182.161.114.101:8080
    Accept-Encoding: identity
    X-Auth-Token: gAAAAABjspx2bYIpv8B0LX9k_ZPSkXrrMWMRKLVWVOG5VzqhRzLNJTfDYL5Gi0ikunp_b11hXheYclkxWaZbtTvlGYvAKfnzye_Rrmrza6nOj7mko0ec3OV6jsMQeJI8s2KXYOCSt6wEQpBlFjx6WhxW-PVaZqbDTQooGEGJ-XHf6s_HbM7Qjk4
    User-Agent: python-swiftclient-4.1.0
    X-Requestshook-Request-Id: 8a285aef3735457983b7f1c5cccad4e8
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="HEAD /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
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
    X-Subject-Token: gAAAAABjspx2bYIpv8B0LX9k_ZPSkXrrMWMRKLVWVOG5VzqhRzLNJTfDYL5Gi0ikunp_b11hXheYclkxWaZbtTvlGYvAKfnzye_Rrmrza6nOj7mko0ec3OV6jsMQeJI8s2KXYOCSt6wEQpBlFjx6WhxW-PVaZqbDTQooGEGJ-XHf6s_HbM7Qjk4
    Openstack-Identity-Access-Rules: 1
    X-Auth-Token: gAAAAABjsnnI948eHZWtPSl7u52IntTMCHg6VqXZUTFEYmIX9_imlt30fJUYRJ16vwgnUVHibxshwZd9PlrS8Wwn9EnA2DkpM5xxyhYM_w9nVcSdUgJavA13KfoO815p7OP_hOIKal4k9xRurbuF6H2DhVRhowrBhG_VIUPb_y3DjqLErhqjTp4
    X-Requestshook-Request-Id: 72e695dc4ec04a78befa863c0b017fea
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
    X-Subject-Token: gAAAAABjspx2bYIpv8B0LX9k_ZPSkXrrMWMRKLVWVOG5VzqhRzLNJTfDYL5Gi0ikunp_b11hXheYclkxWaZbtTvlGYvAKfnzye_Rrmrza6nOj7mko0ec3OV6jsMQeJI8s2KXYOCSt6wEQpBlFjx6WhxW-PVaZqbDTQooGEGJ-XHf6s_HbM7Qjk4
    Vary: X-Auth-Token
    X-Requestshook-Request-Id: 72e695dc4ec04a78befa863c0b017fea
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
          "01I3jNBBRE-HXUHdqyhFPg"
        ],
        "expires_at": "2023-01-02T11:57:26.000000Z",
        "issued_at": "2023-01-02T08:57:26.000000Z",
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


### (15) 200 OK /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/04cd3672-1f97-4e98-bfe0-0d4801d88a8e
`glance-api` <-- `swift-proxy-server`

=== "Header"
    ``` http title="200 OK /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    Content-Type: application/octet-stream
    Etag: 0c839612eb3f2469420f2ccae990827f
    Last-Modified: Mon, 02 Jan 2023 08:56:16 GMT
    X-Timestamp: 1672649775.23372
    X-Backend-Timestamp: 1672649775.23372
    X-Backend-Data-Timestamp: 1672649775.23372
    X-Backend-Durable-Timestamp: 1672649775.23372
    Accept-Ranges: bytes
    Content-Length: 21233664
    X-Requestshook-Request-Id: 8a285aef3735457983b7f1c5cccad4e8
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="200 OK /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    none
    ```


### (16) DELETE /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/04cd3672-1f97-4e98-bfe0-0d4801d88a8e
`glance-api` --> `swift-proxy-server`

=== "Header"
    ``` http title="DELETE /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    Content-Type: 
    Content-Length: 0
    Host: 182.161.114.101:8080
    Accept-Encoding: identity
    X-Auth-Token: gAAAAABjspx2bYIpv8B0LX9k_ZPSkXrrMWMRKLVWVOG5VzqhRzLNJTfDYL5Gi0ikunp_b11hXheYclkxWaZbtTvlGYvAKfnzye_Rrmrza6nOj7mko0ec3OV6jsMQeJI8s2KXYOCSt6wEQpBlFjx6WhxW-PVaZqbDTQooGEGJ-XHf6s_HbM7Qjk4
    User-Agent: python-swiftclient-4.1.0
    X-Requestshook-Request-Id: decb7adc6c5441ae8709b44fcedcd26f
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="DELETE /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    none
    ```


### (17) 204 No Content /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/04cd3672-1f97-4e98-bfe0-0d4801d88a8e
`glance-api` <-- `swift-proxy-server`

=== "Header"
    ``` http title="204 No Content /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    Content-Type: text/html; charset=UTF-8
    Content-Length: 0
    X-Backend-Timestamp: 1672649846.32414
    X-Backend-Content-Type: application/octet-stream
    X-Requestshook-Request-Id: decb7adc6c5441ae8709b44fcedcd26f
    X-Requestshook-Request-From: glance-api
    ```

=== "Body"
    ``` json title="204 No Content /v1/AUTH_7c4cda7e4807414bbdfcb22b535a9802/glance/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    none
    ```


### (18) 204 No Content /v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e
`openstack` <-- `glance-api`

=== "Header"
    ``` http title="204 No Content /v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    Content-Type: text/html; charset=UTF-8
    Content-Length: 0
    x-openstack-request-id: req-00821f6e-c515-4746-b155-b3e33a96f39f
    X-Requestshook-Request-Id: 35652d6381fa4d069c2ada94e19c0bd1
    X-Requestshook-Request-From: openstack
    ```

=== "Body"
    ``` json title="204 No Content /v2/images/04cd3672-1f97-4e98-bfe0-0d4801d88a8e" linenums="1"
    none
    ```

