openstack->>keystone: GET /identity/
keystone-->>openstack: 300 MULTIPLE CHOICES /identity/
openstack->>keystone: POST /identity/v3/auth/tokens
keystone-->>openstack: 201 CREATED /identity/v3/auth/tokens
openstack->>glance-api: GET /
glance-api-->>openstack: 300 Multiple Choices None
openstack->>glance-api: POST /v2/images
glance-api->>keystone: GET /identity/
keystone-->>glance-api: 300 MULTIPLE CHOICES /identity/
glance-api->>keystone: POST /identity/v3/auth/tokens
keystone-->>glance-api: 201 CREATED /identity/v3/auth/tokens
glance-api->>keystone: GET /identity/v3/auth/tokens
keystone-->>glance-api: 200 OK /identity/v3/auth/tokens
glance-api->>keystone: GET /identity/
keystone-->>glance-api: 300 MULTIPLE CHOICES /identity/
glance-api->>keystone: POST /identity/v3/auth/tokens
keystone-->>glance-api: 201 CREATED /identity/v3/auth/tokens
glance-api-->>openstack: 201 Created /v2/images
openstack->>glance-api: PUT /v2/images/{image_uuid}/file
glance-api->>keystone: GET /identity/
keystone-->>glance-api: 300 MULTIPLE CHOICES /identity/
glance-api->>keystone: POST /identity/v3/auth/tokens
keystone-->>glance-api: 201 CREATED /identity/v3/auth/tokens
glance-api->>keystone: POST /identity/v3/auth/tokens
keystone-->>glance-api: 201 CREATED /identity/v3/auth/tokens
glance-api->>swift-proxy-server: HEAD /v1/AUTH_{service_id}/glance
swift-proxy-server->>keystone: GET /identity/v3/auth/tokens
keystone-->>swift-proxy-server: 200 OK /identity/v3/auth/tokens
swift-proxy-server-->>glance-api: 204 No Content /v1/AUTH_{service_id}/glance
glance-api->>swift-proxy-server: PUT /v1/AUTH_{service_id}/glance/{image_uuid}
swift-proxy-server-->>glance-api: 201 Created /v1/AUTH_{service_id}/glance/{image_uuid}
glance-api-->>openstack: 204 No Content /v2/images/{image_uuid}/file
