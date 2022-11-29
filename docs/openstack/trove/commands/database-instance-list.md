# database instance list

데이터베이스를 제공하고 있는 VM 인스턴스 목록을 요청한다

## Flows

``` mermaid
sequenceDiagram
  trove-client->>keystone-api: (1) Access Token 요청
  keystone-api->>trove-client: (2) Access Token 및 EndPoint Catalog 응답
  trove-client->>trove-api: (3) 데이터베이스 인스턴스 목록 요청
  trove-api->>trove-client: (4) 데이터베이스 인스턴스 목록 응답
```

## (1) Access Token 요청

``` http title="header"
POST /identity/v3/auth/tokens HTTP/1.1
Host: devstack
User-Agent: go-troveclient/0.0.1
Content-Length: 192
Accept: application/json
Content-Type: application/json
Accept-Encoding: gzip
```

``` json title="body"
{
  "auth": {
    "identity": {
      "methods": [
        "password"
      ],
      "password": {
        "user": {
          "domain": {
            "name": "Default"
          },
          "name": "demo",
          "password": "asdf"
        }
      }
    },
    "scope": {
      "project": {
        "domain": {
          "name": "Default"
        },
        "name": "demo"
      }
    }
  }
}
```

!!! note
    인증 방법은 `password` 방식이고, 유저네임이 `demo`, 패스워드가 `asdf`, 도메인이 `Default`이며, 프로젝트 스코프로 토큰 요청




## (2) Access Token 및 EndPoint Catalog 응답

``` http title="header" hl_lines="8"
Connection: close
Content-Length: 3878
Content-Type: application/json
Date: Mon, 28 Nov 2022 07:34:58 GMT
Server: Apache/2.4.41 (Ubuntu)
Vary: X-Auth-Token
X-Openstack-Request-Id: req-7c5f10e2-211c-41a1-9336-0804e8ddb79b
X-Subject-Token: gAAAAABjhGSikldzUl0rErkyM0Rh9xdbsR2tZllT6whmV-uTcX7yGtHCDymVXVekRYvQUy2WdB97yMxq-g5tXGfxulKamd_miuXiD2QxU9Xh2BvvWj5jU29RkAXcAgMrlK_0VHxVDnbJC9WCswPyGygs7VeQ1GZMrWzGr_NzL21577_dkj3PVnE
```

!!! note
    Response 헤더의 `X-Subject-Token` 값에 토큰이 저장되어 응답으로 날라온다. `gAAAAABjhGSikldzUl0rErky...`

``` json title="body" linenums="1" hl_lines="141"
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
      "id": "d34f4a0369174b92baa9e866071ee21a",
      "name": "demo",
      "password_expires_at": null
    },
    "audit_ids": [
      "5E6Pr88XTq2-aP_dyMO8sw"
    ],
    "expires_at": "2022-11-28T10:34:58.000000Z",
    "issued_at": "2022-11-28T07:34:58.000000Z",
    "project": {
      "domain": {
        "id": "default",
        "name": "Default"
      },
      "id": "2907622321664d088dba2c09a066593d",
      "name": "demo"
    },
    "is_domain": false,
    "roles": [
      {
        "id": "d7423b98235a45e09a614fb08cde18fd",
        "name": "reader"
      },
      {
        "id": "36504d99e4404029a02cb73304568f03",
        "name": "member"
      },
      {
        "id": "f7f2ad36fc154bf692d2abde2ab22cc0",
        "name": "anotherrole"
      }
    ],
    "catalog": [
      {
        "endpoints": [
          {
            "id": "4baf5c6157314a0a9fd2083a144261d7",
            "interface": "public",
            "region_id": "RegionOne",
            "url": "http://10.0.0.24/image",
            "region": "RegionOne"
          }
        ],
        "id": "0d7a3aed1cf94226bb0f3baf8460c35d",
        "type": "image",
        "name": "glance"
      },
      {
        "endpoints": [
          {
            "id": "ce717f7ecb574925972f39e3ea6abf50",
            "interface": "public",
            "region_id": "RegionOne",
            "url": "http://10.0.0.24/compute/v2/2907622321664d088dba2c09a066593d",
            "region": "RegionOne"
          }
        ],
        "id": "1eb1191380ba4a0898ecdb8d56349edd",
        "type": "compute_legacy",
        "name": "nova_legacy"
      },
      {
        "endpoints": [
          {
            "id": "07f9f64993254eb89f5febae799933c1",
            "interface": "public",
            "region_id": "RegionOne",
            "url": "http://10.0.0.24/placement",
            "region": "RegionOne"
          }
        ],
        "id": "2aa0f137bf5f40a4b83fe2d173b6d563",
        "type": "placement",
        "name": "placement"
      },
      {
        "endpoints": [
          {
            "id": "fb5fc7bb56b7439d9ccfcd62b3afa17d",
            "interface": "public",
            "region_id": "RegionOne",
            "url": "http://10.0.0.24/identity",
            "region": "RegionOne"
          }
        ],
        "id": "3c3f70a551a249499f2409420d46c28f",
        "type": "identity",
        "name": "keystone"
      },
      {
        "endpoints": [
          {
            "id": "e33648a593274a958bdda1d21b5bc917",
            "interface": "public",
            "region_id": "RegionOne",
            "url": "http://10.0.0.24/volume/v3/2907622321664d088dba2c09a066593d",
            "region": "RegionOne"
          }
        ],
        "id": "4180bd565c4a43e79ec93522ce6014f5",
        "type": "block-storage",
        "name": "cinder"
      },
      {
        "endpoints": [
          {
            "id": "c9a794c2c30e4a6b9c2861d60919291f",
            "interface": "public",
            "region_id": "RegionOne",
            "url": "http://10.0.0.24/compute/v2.1",
            "region": "RegionOne"
          }
        ],
        "id": "70aade61dcc64f59a4cdb63700b3b4e4",
        "type": "compute",
        "name": "nova"
      },
      {
        "endpoints": [
          {
            "id": "8db5aceeaff7486d998010dc571f1950",
            "interface": "internal",
            "region_id": "RegionOne",
            "url": "http://10.0.0.24:8779/v1.0/2907622321664d088dba2c09a066593d",
            "region": "RegionOne"
          },
          {
            "id": "c0a554cc5adb4ebea187096d3cb3d5e9",
            "interface": "public",
            "region_id": "RegionOne",
            "url": "http://10.0.0.24:8779/v1.0/2907622321664d088dba2c09a066593d",
            "region": "RegionOne"
          },
          {
            "id": "edadc1f8c1d041a7b755492f5416b3fe",
            "interface": "admin",
            "region_id": "RegionOne",
            "url": "http://10.0.0.24:8779/v1.0/2907622321664d088dba2c09a066593d",
            "region": "RegionOne"
          }
        ],
        "id": "72350ad9df614923974aa116c4e97cdf",
        "type": "database",
        "name": "trove"
      },
      {
        "endpoints": [
          {
            "id": "1f9892aba1ba483eb6d94f3ce189dba7",
            "interface": "public",
            "region_id": "RegionOne",
            "url": "http://10.0.0.24/volume/v3/2907622321664d088dba2c09a066593d",
            "region": "RegionOne"
          }
        ],
        "id": "d606defbd157426b9fe891dfa8df5337",
        "type": "volumev3",
        "name": "cinderv3"
      },
      {
        "endpoints": [
          {
            "id": "1ad82c4045974330acb511750264950e",
            "interface": "admin",
            "region_id": "RegionOne",
            "url": "http://10.0.0.24:8080",
            "region": "RegionOne"
          },
          {
            "id": "403f3d8b670147d6836a19f2021bb715",
            "interface": "public",
            "region_id": "RegionOne",
            "url": "http://10.0.0.24:8080/v1/AUTH_2907622321664d088dba2c09a066593d",
            "region": "RegionOne"
          }
        ],
        "id": "d8e016df11d24092a66126df9b8e2d0b",
        "type": "object-store",
        "name": "swift"
      },
      {
        "endpoints": [
          {
            "id": "f0422f453e1147f1a81b5352d82dd36a",
            "interface": "public",
            "region_id": "RegionOne",
            "url": "http://10.0.0.24:9696/networking",
            "region": "RegionOne"
          }
        ],
        "id": "f8ddeb8c2331406bb04c22bc4f45a8db",
        "type": "network",
        "name": "neutron"
      }
    ]
  }
}
```

!!! note
    Response Body에는 해당 프로젝트 스코프에서 사용 가능한 EndPoint 목록(`catalog`)이 포함된다. 이 경우 `type`이 `database` 인 EndPoint를 찾아, 해당 EndPoint 로 Access Token 과 함께 요청할 수 있다. 이 경우는 141번 줄의 `http://10.0.0.24:8779/v1.0/2907622321664d088dba2c09a066593d`


## (3) 데이터베이스 인스턴스 목록 요청

``` http title="header" hl_lines="5"
GET /v1.0/2907622321664d088dba2c09a066593d/instances HTTP/1.1
Host: 10.0.0.24:8779
User-Agent: go-troveclient/0.0.1
Accept: application/json
X-Auth-Token: gAAAAABjhGSikldzUl0rErkyM0Rh9xdbsR2tZllT6whmV-uTcX7yGtHCDymVXVekRYvQUy2WdB97yMxq-g5tXGfxulKamd_miuXiD2QxU9Xh2BvvWj5jU29RkAXcAgMrlK_0VHxVDnbJC9WCswPyGygs7VeQ1GZMrWzGr_NzL21577_dkj3PVnE
Accept-Encoding: gzip
```

!!! note
    데이터베이스 EndPoint인 `http://10.0.0.24:8779/v1.0/2907622321664d088dba2c09a066593d`에 인스턴스 목록 요청인 `GET {EndPoint}/instances` 요청을 Access Token(헤더: X-Auth-Token)과 함께 전송하여 인스턴스 목록을 요청한다.


## (4) 데이터베이스 인스턴스 목록 응답

``` http title="header"
HTTP/1.1 200 OK
Connection: close
Content-Length: 925
Content-Type: application/json
Date: Mon, 28 Nov 2022 07:34:58 GMT
Server: Apache/2.4.41 (Ubuntu)
```

``` json title="body"
{
  "instances": [
    {
      "id": "be2fba1d-c160-4b22-ae4d-ebb29a78f926",
      "name": "mysql-instance",
      "status": "ACTIVE",
      "operating_status": "HEALTHY",
      "links": [
        {
          "href": "https://10.0.0.24:8779/v1.0/2907622321664d088dba2c09a066593d/instances/be2fba1d-c160-4b22-ae4d-ebb29a78f926",
          "rel": "self"
        },
        {
          "href": "https://10.0.0.24:8779/instances/be2fba1d-c160-4b22-ae4d-ebb29a78f926",
          "rel": "bookmark"
        }
      ],
      "flavor": {
        "id": "d2",
        "links": [
          {
            "href": "https://10.0.0.24:8779/v1.0/2907622321664d088dba2c09a066593d/flavors/d2",
            "rel": "self"
          },
          {
            "href": "https://10.0.0.24:8779/flavors/d2",
            "rel": "bookmark"
          }
        ]
      },
      "datastore": {
        "type": "mysql",
        "version": "5.7.29"
      },
      "region": "RegionOne",
      "access": {
        "is_public": true
      },
      "volume": {
        "size": 5
      },
      "ip": [
        "10.10.10.15",
        "192.168.100.165"
      ],
      "addresses": [
        {
          "address": "10.10.10.15",
          "type": "private",
          "network": "a5837480-591c-4529-b01b-1bdbcdb5595e"
        },
        {
          "address": "192.168.100.165",
          "type": "public"
        }
      ]
    }
  ]
}
```


## (5) 화면 출력

``` json title="openstack database instance list -f json"
[
  {
    "Flavor": {
      "ID": "d2",
      "Links": [
        {
          "href": "https://10.0.0.24:8779/v1.0/2907622321664d088dba2c09a066593d/flavors/d2",
          "rel": "self"
        },
        {
          "href": "https://10.0.0.24:8779/flavors/d2",
          "rel": "bookmark"
        }
      ]
    },
    "Hostname": "",
    "IP": [
      "10.10.10.15",
      "192.168.100.165"
    ],
    "ID": "be2fba1d-c160-4b22-ae4d-ebb29a78f926",
    "Links": [
      {
        "href": "https://10.0.0.24:8779/v1.0/2907622321664d088dba2c09a066593d/instances/be2fba1d-c160-4b22-ae4d-ebb29a78f926",
        "rel": "self"
      },
      {
        "href": "https://10.0.0.24:8779/instances/be2fba1d-c160-4b22-ae4d-ebb29a78f926",
        "rel": "bookmark"
      }
    ],
    "Name": "mysql-instance",
    "Status": "ACTIVE",
    "Fault": null,
    "Volume": {
      "Size": 5,
      "Used": 0
    },
    "Datastore": {
      "Version": "5.7.29",
      "Type": "mysql",
      "version_id": ""
    },
    "Addresses": [
      {
        "Type": "private",
        "Address": "10.10.10.15"
      },
      {
        "Type": "public",
        "Address": "192.168.100.165"
      }
    ]
  }
]
```