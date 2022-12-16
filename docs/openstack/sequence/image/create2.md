# openstack image create

이미지를 생성하고 업로드한다.

CLI 참조: [openstack image create](https://docs.openstack.org/python-openstackclient/zed/cli/command-objects/image-v2.html#image-create)

## OpenStack Client Command

``` bash title="python3-openstackclient command"
$ openstack image create \
  --disk-format qcow2 \
  --file cirros-0.6.1-x86_64-disk.qcow2 \
  --public \
  cirros-0.6.1-x86_64-disk
```

## Sequence Diagram

All Sequence Diagram

``` mermaid
sequenceDiagram
  autonumber
  participant osc as openstack-client
  participant keystone as keystone-api
  participant glance as glance-api
  participant object as swift-proxy-server

  osc->>keystone: GET /identity
  keystone-->>osc: 300 MULTIPLE CHOICES
  osc->>keystone: POST /identity/v3/auth/tokens
  keystone-->>osc: 201 CREATED
  osc->>glance: GET /image
  glance-->>osc: 300 Multiple Choices
  osc->>glance: POST /image/v2/images
  glance->>keystone: GET /identity/v3/auth/tokens
  keystone-->>glance: 200 OK
  glance->>keystone: GET /identity/v3/limits/model
  keystone-->>glance: 200 OK
  glance->>keystone: GET /identity/v3/endpoints/3195d06aa49541009838146ab9072997
  keystone-->>glance: 200 OK
  glance->>keystone: GET /identity/v3/limits?service_id=4134...
  keystone-->>glance: 200 OK
  glance->>keystone: GET /identity/v3/registered_limits?service_id=4134...
  keystone-->>glance: 200 OK
  glance-->>osc: 201 Created
  osc->>glance: PUT /image/v2/images/603867aa-6d27-4ac2-80c2-bcb8c864f354/file
  glance->>keystone: GET /identity/v3/limits/model
  keystone-->>glance: 200 OK
  glance->>keystone: GET /identity/v3/endpoints/3195d06aa49541009838146ab9072997
  keystone-->>glance: 200 OK
  glance->>keystone: GET /identity/v3/limits?service_id=4134...
  keystone->>glance: 200 OK
  glance->>keystone: GET /identity/v3/registered_limits?service_id=4134
  keystone-->>glance: 200 OK
  glance->>keystone: GET /identity/v3/limits/model
  keystone-->>glance: 200 OK
  glance->>keystone: GET /identity/v3/endpoints/3195d06aa49541009838146ab9072997
  keystone-->>glance: 200 OK
  glance->>keystone: GET /identity/v3/limits?service_id=4134
  keystone-->>glance: 200 OK
  glance->>keystone: GET /identity/v3/registered_limits?service_id=4134
  keystone-->>glance: 200 OK
  glance->>keystone: POST /identity/v3/auth/tokens
  keystone-->>glance: 201 CREATED
  glance->>object: HEAD /v1/AUTH_3a16cadd069e4a70b95f71316ec6f3e8/glance
  object-->>glance: 204 No Content
  glance->>object: PUT /v1/AUTH_3a16cadd069e4a70b95f71316ec6f3e8/glance/6038...
  object-->>glance: 201 Created
  glance-->>osc: 204 No Content
```


Compact Sequence Diagram

``` mermaid
sequenceDiagram
  autonumber
  participant osc as openstack-client
  participant keystone as keystone-api
  participant glance as glance-api
  participant object as swift-proxy-server

  osc->>keystone: GET /identity
  keystone-->>osc: 300 MULTIPLE CHOICES
  osc->>keystone: POST /identity/v3/auth/tokens
  keystone-->>osc: 201 CREATED
  osc->>glance: GET /image
  glance-->>osc: 300 Multiple Choices
  osc->>glance: POST /image/v2/images
  glance->>keystone: GET /identity/v3/auth/tokens
  keystone-->>glance: 200 OK
  glance-->>osc: 201 Created
  osc->>glance: PUT /image/v2/images/{image_id}/file
  glance->>keystone: POST /identity/v3/auth/tokens
  keystone-->>glance: 201 CREATED
  glance->>object: HEAD /v1/AUTH_{service_id}/glance
  object-->>glance: 204 No Content
  glance->>object: PUT /v1/AUTH_{service_id}/glance/{image_id}
  object-->>glance: 201 Created
  glance-->>osc: 204 No Content
```


``` http title="/var/log/requests-observer/requests.log"

__(openstack)__ -> Request [1] GET http://182.161.114.101/identity
User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive

None


___(openstack)__ <- Response [1] 300 MULTIPLE CHOICES http://182.161.114.101/identity
Date: Fri, 16 Dec 2022 08:28:56 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 274
Location: http://182.161.114.101/identity/v3/
Vary: X-Auth-Token
x-openstack-request-id: req-54ea30bc-033b-49b9-a4bb-620767d7596d
Connection: close

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


__(openstack)__ -> Request [2] POST http://182.161.114.101/identity/v3/auth/tokens
User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
Content-Type: application/json
Content-Length: 209

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


___(openstack)__ <- Response [2] 201 CREATED http://182.161.114.101/identity/v3/auth/tokens
Date: Fri, 16 Dec 2022 08:28:56 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 3952
X-Subject-Token: gAAAAABjnCxIorFQyfdwX_Alf3En5UsuCBIJIl0qb49Rb5fTO29ri5pjSRztRiXV0fQWV6kYQxyMKsYGpYr91JA8DQHP-9B3uvVVODUfleSrgqF-OibQNjv-RRdatvc2F9N8sqGc4pbV5qH2hfPMVUSJzulrB_vUgJnA2IwENDVV5xQHKT6QEeo
Vary: X-Auth-Token
x-openstack-request-id: req-5690c9f7-a77a-4af5-8f42-813449fab70f
Connection: close

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
      "h4OHnYcpQweKE8JWY0r4zA"
    ],
    "expires_at": "2022-12-16T11:28:56.000000Z",
    "issued_at": "2022-12-16T08:28:56.000000Z",
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


__(openstack)__ -> Request [3] GET http://182.161.114.101/image
User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive

None


___(openstack)__ <- Response [3] 300 Multiple Choices http://182.161.114.101/image
Date: Fri, 16 Dec 2022 08:28:57 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 1347
Connection: close

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


__(openstack)__ -> Request [4] POST http://182.161.114.101/image/v2/images
User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: */*
Connection: keep-alive
X-Auth-Token: gAAAAABjnCxIorFQyfdwX_Alf3En5UsuCBIJIl0qb49Rb5fTO29ri5pjSRztRiXV0fQWV6kYQxyMKsYGpYr91JA8DQHP-9B3uvVVODUfleSrgqF-OibQNjv-RRdatvc2F9N8sqGc4pbV5qH2hfPMVUSJzulrB_vUgJnA2IwENDVV5xQHKT6QEeo
Content-Type: application/json
Content-Length: 260

{
  "disk_format": "qcow2",
  "visibility": "public",
  "container_format": "bare",
  "name": "cirros-0.6.1-x86_64-disk",
  "owner_specified.openstack.md5": "",
  "owner_specified.openstack.sha256": "",
  "owner_specified.openstack.object": "images/cirros-0.6.1-x86_64-disk"
}


__(glance-api)__ -> Request [27] GET http://182.161.114.101/identity/v3/auth/tokens
User-Agent: python-keystoneclient
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
X-Subject-Token: gAAAAABjnCxIorFQyfdwX_Alf3En5UsuCBIJIl0qb49Rb5fTO29ri5pjSRztRiXV0fQWV6kYQxyMKsYGpYr91JA8DQHP-9B3uvVVODUfleSrgqF-OibQNjv-RRdatvc2F9N8sqGc4pbV5qH2hfPMVUSJzulrB_vUgJnA2IwENDVV5xQHKT6QEeo
OpenStack-Identity-Access-Rules: 1
X-Auth-Token: gAAAAABjnCtPGc5_8CDdnqTzklOSWiwPGh1HU1jNE3937ss_y6cFJYJXtfpvFz_e3LhYLgwispVKRnhAEUGXFHWlHNnRex1aWDdRqRgWesg6zNaKbOoL4igXcP3268LAAOM6b4YI95CwtPW7p71j4BLilh9aB6BGqI-q-oKaRqXP594aeuNe1Ik

None


___(glance-api)__ <- Response [27] 200 OK http://182.161.114.101/identity/v3/auth/tokens
Date: Fri, 16 Dec 2022 08:28:57 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 3952
X-Subject-Token: gAAAAABjnCxIorFQyfdwX_Alf3En5UsuCBIJIl0qb49Rb5fTO29ri5pjSRztRiXV0fQWV6kYQxyMKsYGpYr91JA8DQHP-9B3uvVVODUfleSrgqF-OibQNjv-RRdatvc2F9N8sqGc4pbV5qH2hfPMVUSJzulrB_vUgJnA2IwENDVV5xQHKT6QEeo
Vary: X-Auth-Token
x-openstack-request-id: req-7cf6665e-79e7-4df0-a175-7346eeb92fac
Connection: close

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
      "h4OHnYcpQweKE8JWY0r4zA"
    ],
    "expires_at": "2022-12-16T11:28:56.000000Z",
    "issued_at": "2022-12-16T08:28:56.000000Z",
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


__(glance-api)__ -> Request [28] GET http://182.161.114.101/identity/v3/limits/model
User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: */*
Connection: keep-alive
X-Auth-Token: gAAAAABjnCtQ7cwP9zpi_6XNzsOvKnZiLGSGe0Vgw-w2VF4u6PYGE8LRtuXqvK4FIKLl-Eyg_StsPaD4_6NWkU0uyPsjaMXHK5zekDaWe5dhMaO8-w9HCkt6YUrODItQti5VLKAMXsB5GqJNy5qFwer9S_Vg_f0Izw

None


___(glance-api)__ <- Response [28] 200 OK http://182.161.114.101/identity/v3/limits/model
Date: Fri, 16 Dec 2022 08:28:57 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 131
Vary: X-Auth-Token
x-openstack-request-id: req-5316a3bf-6ee8-42b1-990d-1565a46682fc
Connection: close

{
  "model": {
    "name": "flat",
    "description": "Limit enforcement and validation does not take project hierarchy into consideration."
  }
}


__(glance-api)__ -> Request [29] GET http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997
User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: */*
Connection: keep-alive
X-Auth-Token: gAAAAABjnCtQ7cwP9zpi_6XNzsOvKnZiLGSGe0Vgw-w2VF4u6PYGE8LRtuXqvK4FIKLl-Eyg_StsPaD4_6NWkU0uyPsjaMXHK5zekDaWe5dhMaO8-w9HCkt6YUrODItQti5VLKAMXsB5GqJNy5qFwer9S_Vg_f0Izw

None


___(glance-api)__ <- Response [29] 200 OK http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997
Date: Fri, 16 Dec 2022 08:28:57 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 335
Vary: X-Auth-Token
x-openstack-request-id: req-8827ad12-9dbd-4d09-9a7b-d06db3e1a2c4
Connection: close

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


__(glance-api)__ -> Request [30] GET http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_total&project_id=a5362cbd04fd4783a038d5a342d58e87
User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
X-Auth-Token: gAAAAABjnCtQ7cwP9zpi_6XNzsOvKnZiLGSGe0Vgw-w2VF4u6PYGE8LRtuXqvK4FIKLl-Eyg_StsPaD4_6NWkU0uyPsjaMXHK5zekDaWe5dhMaO8-w9HCkt6YUrODItQti5VLKAMXsB5GqJNy5qFwer9S_Vg_f0Izw

None


___(glance-api)__ <- Response [30] 200 OK http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_total&project_id=a5362cbd04fd4783a038d5a342d58e87
Date: Fri, 16 Dec 2022 08:28:57 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 251
Vary: X-Auth-Token
x-openstack-request-id: req-14bc3efc-905c-4477-bd60-ca98ab4588fb
Connection: close

{
  "limits": [],
  "links": {
    "next": null,
    "self": "http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_total&project_id=a5362cbd04fd4783a038d5a342d58e87",
    "previous": null
  }
}


__(glance-api)__ -> Request [31] GET http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_total
User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
X-Auth-Token: gAAAAABjnCtQ7cwP9zpi_6XNzsOvKnZiLGSGe0Vgw-w2VF4u6PYGE8LRtuXqvK4FIKLl-Eyg_StsPaD4_6NWkU0uyPsjaMXHK5zekDaWe5dhMaO8-w9HCkt6YUrODItQti5VLKAMXsB5GqJNy5qFwer9S_Vg_f0Izw

None


___(glance-api)__ <- Response [31] 200 OK http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_total
Date: Fri, 16 Dec 2022 08:28:57 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 536
Vary: X-Auth-Token
x-openstack-request-id: req-b6c143b3-5bce-47cd-919f-9cf7b58de641
Connection: close

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


___(openstack)__ <- Response [4] 201 Created http://182.161.114.101/image/v2/images
Date: Fri, 16 Dec 2022 08:28:58 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Length: 781
Content-Type: application/json
Location: http://127.0.0.1:60999/v2/images/603867aa-6d27-4ac2-80c2-bcb8c864f354
Openstack-Image-Import-Methods: glance-direct,web-download,copy-image
X-Openstack-Request-Id: req-c209ce63-03fb-4fb7-aa0d-f4ae80998408
Connection: close

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
  "id": "603867aa-6d27-4ac2-80c2-bcb8c864f354",
  "created_at": "2022-12-16T08:28:58Z",
  "updated_at": "2022-12-16T08:28:58Z",
  "tags": [],
  "self": "/v2/images/603867aa-6d27-4ac2-80c2-bcb8c864f354",
  "file": "/v2/images/603867aa-6d27-4ac2-80c2-bcb8c864f354/file",
  "schema": "/v2/schemas/image"
}


__(openstack)__ -> Request [5] PUT http://182.161.114.101/image/v2/images/603867aa-6d27-4ac2-80c2-bcb8c864f354/file
User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: 
Connection: keep-alive
Content-Type: application/octet-stream
X-Auth-Token: gAAAAABjnCxIorFQyfdwX_Alf3En5UsuCBIJIl0qb49Rb5fTO29ri5pjSRztRiXV0fQWV6kYQxyMKsYGpYr91JA8DQHP-9B3uvVVODUfleSrgqF-OibQNjv-RRdatvc2F9N8sqGc4pbV5qH2hfPMVUSJzulrB_vUgJnA2IwENDVV5xQHKT6QEeo
Content-Length: 21233664

<_io.BufferedReader name='cirros-0.6.1-x86_64-disk.img'>


__(glance-api)__ -> Request [32] GET http://182.161.114.101/identity/v3/limits/model
User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: */*
Connection: keep-alive
X-Auth-Token: gAAAAABjnCtQ7cwP9zpi_6XNzsOvKnZiLGSGe0Vgw-w2VF4u6PYGE8LRtuXqvK4FIKLl-Eyg_StsPaD4_6NWkU0uyPsjaMXHK5zekDaWe5dhMaO8-w9HCkt6YUrODItQti5VLKAMXsB5GqJNy5qFwer9S_Vg_f0Izw

None


___(glance-api)__ <- Response [32] 200 OK http://182.161.114.101/identity/v3/limits/model
Date: Fri, 16 Dec 2022 08:28:58 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 131
Vary: X-Auth-Token
x-openstack-request-id: req-b088982c-1efa-4eea-9283-767d98f3c9f6
Connection: close

{
  "model": {
    "name": "flat",
    "description": "Limit enforcement and validation does not take project hierarchy into consideration."
  }
}


__(glance-api)__ -> Request [33] GET http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997
User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: */*
Connection: keep-alive
X-Auth-Token: gAAAAABjnCtQ7cwP9zpi_6XNzsOvKnZiLGSGe0Vgw-w2VF4u6PYGE8LRtuXqvK4FIKLl-Eyg_StsPaD4_6NWkU0uyPsjaMXHK5zekDaWe5dhMaO8-w9HCkt6YUrODItQti5VLKAMXsB5GqJNy5qFwer9S_Vg_f0Izw

None


___(glance-api)__ <- Response [33] 200 OK http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997
Date: Fri, 16 Dec 2022 08:28:58 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 335
Vary: X-Auth-Token
x-openstack-request-id: req-84434164-3f4a-4a1e-956b-8ab6c968178d
Connection: close

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


__(glance-api)__ -> Request [34] GET http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_size_total&project_id=a5362cbd04fd4783a038d5a342d58e87
User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
X-Auth-Token: gAAAAABjnCtQ7cwP9zpi_6XNzsOvKnZiLGSGe0Vgw-w2VF4u6PYGE8LRtuXqvK4FIKLl-Eyg_StsPaD4_6NWkU0uyPsjaMXHK5zekDaWe5dhMaO8-w9HCkt6YUrODItQti5VLKAMXsB5GqJNy5qFwer9S_Vg_f0Izw

None


___(glance-api)__ <- Response [34] 200 OK http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_size_total&project_id=a5362cbd04fd4783a038d5a342d58e87
Date: Fri, 16 Dec 2022 08:28:58 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 250
Vary: X-Auth-Token
x-openstack-request-id: req-04080373-292b-42ec-aac8-6ebc38372d55
Connection: close

{
  "limits": [],
  "links": {
    "next": null,
    "self": "http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_size_total&project_id=a5362cbd04fd4783a038d5a342d58e87",
    "previous": null
  }
}


__(glance-api)__ -> Request [35] GET http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_size_total
User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
X-Auth-Token: gAAAAABjnCtQ7cwP9zpi_6XNzsOvKnZiLGSGe0Vgw-w2VF4u6PYGE8LRtuXqvK4FIKLl-Eyg_StsPaD4_6NWkU0uyPsjaMXHK5zekDaWe5dhMaO8-w9HCkt6YUrODItQti5VLKAMXsB5GqJNy5qFwer9S_Vg_f0Izw

None


___(glance-api)__ <- Response [35] 200 OK http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_size_total
Date: Fri, 16 Dec 2022 08:28:58 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 535
Vary: X-Auth-Token
x-openstack-request-id: req-ed2dd32c-7dc6-40c9-b623-03f20f2bfa15
Connection: close

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


__(glance-api)__ -> Request [36] GET http://182.161.114.101/identity/v3/limits/model
User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: */*
Connection: keep-alive
X-Auth-Token: gAAAAABjnCtQ7cwP9zpi_6XNzsOvKnZiLGSGe0Vgw-w2VF4u6PYGE8LRtuXqvK4FIKLl-Eyg_StsPaD4_6NWkU0uyPsjaMXHK5zekDaWe5dhMaO8-w9HCkt6YUrODItQti5VLKAMXsB5GqJNy5qFwer9S_Vg_f0Izw

None


___(glance-api)__ <- Response [36] 200 OK http://182.161.114.101/identity/v3/limits/model
Date: Fri, 16 Dec 2022 08:28:58 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 131
Vary: X-Auth-Token
x-openstack-request-id: req-356f023a-e98e-488c-b917-2d56c8c69135
Connection: close

{
  "model": {
    "name": "flat",
    "description": "Limit enforcement and validation does not take project hierarchy into consideration."
  }
}


__(glance-api)__ -> Request [37] GET http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997
User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: */*
Connection: keep-alive
X-Auth-Token: gAAAAABjnCtQ7cwP9zpi_6XNzsOvKnZiLGSGe0Vgw-w2VF4u6PYGE8LRtuXqvK4FIKLl-Eyg_StsPaD4_6NWkU0uyPsjaMXHK5zekDaWe5dhMaO8-w9HCkt6YUrODItQti5VLKAMXsB5GqJNy5qFwer9S_Vg_f0Izw

None


___(glance-api)__ <- Response [37] 200 OK http://182.161.114.101/identity/v3/endpoints/3195d06aa49541009838146ab9072997
Date: Fri, 16 Dec 2022 08:28:59 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 335
Vary: X-Auth-Token
x-openstack-request-id: req-27d53694-4f94-43b9-aa40-2fe31dd504e3
Connection: close

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


__(glance-api)__ -> Request [38] GET http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_uploading&project_id=a5362cbd04fd4783a038d5a342d58e87
User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
X-Auth-Token: gAAAAABjnCtQ7cwP9zpi_6XNzsOvKnZiLGSGe0Vgw-w2VF4u6PYGE8LRtuXqvK4FIKLl-Eyg_StsPaD4_6NWkU0uyPsjaMXHK5zekDaWe5dhMaO8-w9HCkt6YUrODItQti5VLKAMXsB5GqJNy5qFwer9S_Vg_f0Izw

None


___(glance-api)__ <- Response [38] 200 OK http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_uploading&project_id=a5362cbd04fd4783a038d5a342d58e87
Date: Fri, 16 Dec 2022 08:28:59 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 255
Vary: X-Auth-Token
x-openstack-request-id: req-34ab7641-8358-40f0-a808-7d9172889acc
Connection: close

{
  "limits": [],
  "links": {
    "next": null,
    "self": "http://182.161.114.101/identity/v3/limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_uploading&project_id=a5362cbd04fd4783a038d5a342d58e87",
    "previous": null
  }
}


__(glance-api)__ -> Request [39] GET http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_uploading
User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
X-Auth-Token: gAAAAABjnCtQ7cwP9zpi_6XNzsOvKnZiLGSGe0Vgw-w2VF4u6PYGE8LRtuXqvK4FIKLl-Eyg_StsPaD4_6NWkU0uyPsjaMXHK5zekDaWe5dhMaO8-w9HCkt6YUrODItQti5VLKAMXsB5GqJNy5qFwer9S_Vg_f0Izw

None


___(glance-api)__ <- Response [39] 200 OK http://182.161.114.101/identity/v3/registered_limits?service_id=4134c089d54f40c4bff6629c9b3c8b17&region_id=RegionOne&resource_name=image_count_uploading
Date: Fri, 16 Dec 2022 08:28:59 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 544
Vary: X-Auth-Token
x-openstack-request-id: req-c1134504-1e38-4732-84eb-64b71d406f0d
Connection: close

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


__(glance-api)__ -> Request [40] POST http://182.161.114.101/identity/v3/auth/tokens
User-Agent: glance-api keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
Content-Type: application/json
Content-Length: 218

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


___(glance-api)__ <- Response [40] 201 CREATED http://182.161.114.101/identity/v3/auth/tokens
Date: Fri, 16 Dec 2022 08:28:59 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: application/json
Content-Length: 3908
X-Subject-Token: gAAAAABjnCxL9Zt0030OHU1393fmRcnhFHNsKxuIId0P39dQjmaCoe3S1qOVXon9kOSg_6d8mJPlaviGP-_953lFcZAKYSX1Izc60iKIb3WPzOm0iPA9ekwA1AuYnWOGdY3Ly-PGj1m-8Iv5oly4XhNXHUxrZaR5D3SdCNFDQ8iUmGJwPoI0W3M
Vary: X-Auth-Token
x-openstack-request-id: req-8205d229-abee-4ff4-8921-e4622f3a52a7
Connection: close

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
      "ar3Ybz8GQsO9vZGFbq5VZw"
    ],
    "expires_at": "2022-12-16T11:28:59.000000Z",
    "issued_at": "2022-12-16T08:28:59.000000Z",
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


__(glance-api)__ -> Request [41] HEAD http://182.161.114.101:8080/v1/AUTH_3a16cadd069e4a70b95f71316ec6f3e8/glance
x-auth-token: b'gAAAAABjnCxL9Zt0030OHU1393fmRcnhFHNsKxuIId0P39dQjmaCoe3S1qOVXon9kOSg_6d8mJPlaviGP-_953lFcZAKYSX1Izc60iKIb3WPzOm0iPA9ekwA1AuYnWOGdY3Ly-PGj1m-8Iv5oly4XhNXHUxrZaR5D3SdCNFDQ8iUmGJwPoI0W3M'
user-agent: python-swiftclient-4.1.0

None


___(glance-api)__ <- Response [41] 204 No Content http://182.161.114.101:8080/v1/AUTH_3a16cadd069e4a70b95f71316ec6f3e8/glance
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
X-Trans-Id: tx2801161c4a304683b7568-00639c2c4b
X-Openstack-Request-Id: tx2801161c4a304683b7568-00639c2c4b
Date: Fri, 16 Dec 2022 08:28:59 GMT




__(glance-api)__ -> Request [42] PUT http://182.161.114.101:8080/v1/AUTH_3a16cadd069e4a70b95f71316ec6f3e8/glance/603867aa-6d27-4ac2-80c2-bcb8c864f354
x-auth-token: b'gAAAAABjnCxL9Zt0030OHU1393fmRcnhFHNsKxuIId0P39dQjmaCoe3S1qOVXon9kOSg_6d8mJPlaviGP-_953lFcZAKYSX1Izc60iKIb3WPzOm0iPA9ekwA1AuYnWOGdY3Ly-PGj1m-8Iv5oly4XhNXHUxrZaR5D3SdCNFDQ8iUmGJwPoI0W3M'
Content-Length: 21233664
user-agent: python-swiftclient-4.1.0

<swiftclient.utils.LengthWrapper object at 0x7fd550965ca0>


___(glance-api)__ <- Response [42] 201 Created http://182.161.114.101:8080/v1/AUTH_3a16cadd069e4a70b95f71316ec6f3e8/glance/603867aa-6d27-4ac2-80c2-bcb8c864f354
Content-Type: text/html; charset=UTF-8
Content-Length: 0
Etag: 0c839612eb3f2469420f2ccae990827f
Last-Modified: Fri, 16 Dec 2022 08:29:00 GMT
X-Trans-Id: tx445868eed86c4c9f8e4d1-00639c2c4b
X-Openstack-Request-Id: tx445868eed86c4c9f8e4d1-00639c2c4b
Date: Fri, 16 Dec 2022 08:29:01 GMT




___(openstack)__ <- Response [5] 204 No Content http://182.161.114.101/image/v2/images/603867aa-6d27-4ac2-80c2-bcb8c864f354/file
Date: Fri, 16 Dec 2022 08:29:02 GMT
Server: Apache/2.4.41 (Ubuntu)
Content-Type: text/html; charset=UTF-8
X-Openstack-Request-Id: req-2e9a4226-942d-4fa2-afce-56e1f516c4f8
Connection: close
```
