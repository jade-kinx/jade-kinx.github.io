
### (openstack) REQ >>> (keystone) : GET http://182.161.114.101/identity/
Host: 182.161.114.101
User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
X-Requestshook-Request-Id: 577ca6d86fee45928fae4fe0142aadf5
X-Requestshook-Request-From: openstack

none


### (openstack) RESP <<< (keystone) : 300 MULTIPLE CHOICES GET http://182.161.114.101/identity/
Content-Type: application/json
Content-Length: 274
Location: http://182.161.114.101/identity/v3/
Vary: X-Auth-Token
X-Requestshook-Request-Id: 577ca6d86fee45928fae4fe0142aadf5
X-Requestshook-Request-From: openstack

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


### (openstack) REQ >>> (keystone) : POST http://182.161.114.101/identity/v3/auth/tokens
Host: 182.161.114.101
User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
Content-Type: application/json
Content-Length: 209
X-Requestshook-Request-Id: abc9df64ddb54e049500188e112e4e14
X-Requestshook-Request-From: openstack

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


### (openstack) RESP <<< (keystone) : 201 CREATED POST http://182.161.114.101/identity/v3/auth/tokens
Content-Type: application/json
Content-Length: 3952
X-Subject-Token: gAAAAABjsn20pmzK9_V7ehVsDICJVb08u5MFD0s09MMj-rGZH5sOaJv9lzinrxaM5Hb6KOhNEBX386FiJoWxj2xav4zEv6JeVqgKq5SrQJQBrQSiBTjA5mYLOVvJPqwy9-_XmAbIcVDE6DLx8IyfIyhI1V5NsRzjXqXaQQweeUUwokqD1MmiCqU
Vary: X-Auth-Token
X-Requestshook-Request-Id: abc9df64ddb54e049500188e112e4e14
X-Requestshook-Request-From: openstack

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
      "oPe4LNzvSjCDh8hrUiOuJw"
    ],
    "expires_at": "2023-01-02T09:46:12.000000Z",
    "issued_at": "2023-01-02T06:46:12.000000Z",
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


### (openstack) REQ >>> (glance-api) : GET http://127.0.0.1:60999/v2/images
Host: 127.0.0.1:60999
User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
X-Auth-Token: gAAAAABjsn20pmzK9_V7ehVsDICJVb08u5MFD0s09MMj-rGZH5sOaJv9lzinrxaM5Hb6KOhNEBX386FiJoWxj2xav4zEv6JeVqgKq5SrQJQBrQSiBTjA5mYLOVvJPqwy9-_XmAbIcVDE6DLx8IyfIyhI1V5NsRzjXqXaQQweeUUwokqD1MmiCqU
X-Requestshook-Request-Id: bc778ba8695d451fb502616faa5ffa15
X-Requestshook-Request-From: openstack
X-Forwarded-For: 182.161.114.101
X-Forwarded-Host: 182.161.114.101
X-Forwarded-Server: 127.0.0.1
Connection: Keep-Alive

none


### (glance-api) REQ >>> (keystone) : GET http://182.161.114.101/identity/
Host: 182.161.114.101
User-Agent: glance/25.0.1.dev4 keystonemiddleware.auth_token/10.1.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
X-Requestshook-Request-Id: 71216aa62c5141d896313973f7d91aed
X-Requestshook-Request-From: glance-api

none


### (glance-api) RESP <<< (keystone) : 300 MULTIPLE CHOICES GET http://182.161.114.101/identity/
Content-Type: application/json
Content-Length: 274
Location: http://182.161.114.101/identity/v3/
Vary: X-Auth-Token
X-Requestshook-Request-Id: 71216aa62c5141d896313973f7d91aed
X-Requestshook-Request-From: glance-api

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


### (glance-api) REQ >>> (keystone) : POST http://182.161.114.101/identity/v3/auth/tokens
Host: 182.161.114.101
User-Agent: glance/25.0.1.dev4 keystonemiddleware.auth_token/10.1.0 keystoneauth1/5.0.0 python-requests/2.28.1 CPython/3.8.10
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
Content-Type: application/json
Content-Length: 216
X-Requestshook-Request-Id: fceddcd003174a7db6aa6a917e944f36
X-Requestshook-Request-From: glance-api

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


### (glance-api) RESP <<< (keystone) : 201 CREATED POST http://182.161.114.101/identity/v3/auth/tokens
Content-Type: application/json
Content-Length: 3833
X-Subject-Token: gAAAAABjsn215OxhShBEiueN9lpmbGY7XYuF0OWOxl1aCACn0y8gtECXMWBUOSB6Zp6d1xqtoXuiKNEdnb74y1Md4IfwFluzMhVRHBoJBZHByNdLJgY0P6fmY97CzYQf1tVnSZ0rIrcyh2po7kxlrMwxPVhYtkx12b6Jjtd8seYdaBW59vYGT8k
Vary: X-Auth-Token
X-Requestshook-Request-Id: fceddcd003174a7db6aa6a917e944f36
X-Requestshook-Request-From: glance-api

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
      "R7PrstIQQLGYFFK6QSDAhg"
    ],
    "expires_at": "2023-01-02T09:46:13.000000Z",
    "issued_at": "2023-01-02T06:46:13.000000Z",
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


### (glance-api) REQ >>> (keystone) : GET http://182.161.114.101/identity/v3/auth/tokens
Host: 182.161.114.101
User-Agent: python-keystoneclient
Accept-Encoding: gzip, deflate
Accept: application/json
Connection: keep-alive
X-Subject-Token: gAAAAABjsn20pmzK9_V7ehVsDICJVb08u5MFD0s09MMj-rGZH5sOaJv9lzinrxaM5Hb6KOhNEBX386FiJoWxj2xav4zEv6JeVqgKq5SrQJQBrQSiBTjA5mYLOVvJPqwy9-_XmAbIcVDE6DLx8IyfIyhI1V5NsRzjXqXaQQweeUUwokqD1MmiCqU
Openstack-Identity-Access-Rules: 1
X-Auth-Token: gAAAAABjsn215OxhShBEiueN9lpmbGY7XYuF0OWOxl1aCACn0y8gtECXMWBUOSB6Zp6d1xqtoXuiKNEdnb74y1Md4IfwFluzMhVRHBoJBZHByNdLJgY0P6fmY97CzYQf1tVnSZ0rIrcyh2po7kxlrMwxPVhYtkx12b6Jjtd8seYdaBW59vYGT8k
X-Requestshook-Request-Id: 8e1b1a419fd942389842359efacb1430
X-Requestshook-Request-From: glance-api

none


### (glance-api) RESP <<< (keystone) : 200 OK GET http://182.161.114.101/identity/v3/auth/tokens
Content-Type: application/json
Content-Length: 3952
X-Subject-Token: gAAAAABjsn20pmzK9_V7ehVsDICJVb08u5MFD0s09MMj-rGZH5sOaJv9lzinrxaM5Hb6KOhNEBX386FiJoWxj2xav4zEv6JeVqgKq5SrQJQBrQSiBTjA5mYLOVvJPqwy9-_XmAbIcVDE6DLx8IyfIyhI1V5NsRzjXqXaQQweeUUwokqD1MmiCqU
Vary: X-Auth-Token
X-Requestshook-Request-Id: 8e1b1a419fd942389842359efacb1430
X-Requestshook-Request-From: glance-api

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
      "oPe4LNzvSjCDh8hrUiOuJw"
    ],
    "expires_at": "2023-01-02T09:46:12.000000Z",
    "issued_at": "2023-01-02T06:46:12.000000Z",
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


### (openstack) RESP <<< (glance-api) : 200 OK GET http://127.0.0.1:60999/v2/images
Content-Length: 2985
Content-Type: application/json
x-openstack-request-id: req-6aa6906e-0297-40b1-ad79-4d361ffd4905
X-Requestshook-Request-Id: bc778ba8695d451fb502616faa5ffa15
X-Requestshook-Request-From: openstack

{
  "images": [
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
    },
    {
      "hw_rng_model": "virtio",
      "owner_specified.openstack.md5": "",
      "owner_specified.openstack.object": "images/trove-guest-ubuntu-focal",
      "owner_specified.openstack.sha256": "",
      "name": "trove-guest-ubuntu-focal",
      "disk_format": "qcow2",
      "container_format": "bare",
      "visibility": "shared",
      "size": 1033175040,
      "virtual_size": 5368709120,
      "status": "active",
      "checksum": "afc6c6fd85a493e992616bf7f1ef2479",
      "protected": false,
      "min_ram": 0,
      "min_disk": 0,
      "owner": "7c4cda7e4807414bbdfcb22b535a9802",
      "os_hidden": false,
      "os_hash_algo": "sha512",
      "os_hash_value": "c2aa56de26e94b438a342a1de51edc504183018747793b3d43c58cb33f2ca0d6cce56537d357ee099673819f6cb018044c6494a116af2585ca19e7beb85f8341",
      "id": "52223e76-ba72-46d1-b11e-89e4bce4414a",
      "created_at": "2022-12-22T05:06:26Z",
      "updated_at": "2022-12-22T05:07:01Z",
      "tags": [
        "trove"
      ],
      "self": "/v2/images/52223e76-ba72-46d1-b11e-89e4bce4414a",
      "file": "/v2/images/52223e76-ba72-46d1-b11e-89e4bce4414a/file",
      "schema": "/v2/schemas/image"
    },
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
      "owner": "de5af600557d44d0996e667499376dbb",
      "os_hidden": false,
      "os_hash_algo": "sha512",
      "os_hash_value": "6b813aa46bb90b4da216a4d19376593fa3f4fc7e617f03a92b7fe11e9a3981cbe8f0959dbebe36225e5f53dc4492341a4863cac4ed1ee0909f3fc78ef9c3e869",
      "id": "98b68b53-2939-474e-aab1-64a49c57e941",
      "created_at": "2022-12-22T04:29:22Z",
      "updated_at": "2022-12-22T04:29:24Z",
      "tags": [],
      "self": "/v2/images/98b68b53-2939-474e-aab1-64a49c57e941",
      "file": "/v2/images/98b68b53-2939-474e-aab1-64a49c57e941/file",
      "schema": "/v2/schemas/image"
    }
  ],
  "first": "/v2/images",
  "schema": "/v2/schemas/images"
}

