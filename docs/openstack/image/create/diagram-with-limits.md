openstack->>keystone: GET /identity
keystone-->>openstack: 300 MULTIPLE CHOICES /identity
openstack->>keystone: POST /identity/v3/auth/tokens
keystone-->>openstack: 201 CREATED /identity/v3/auth/tokens
openstack->>glance-api: GET /image
glance-api-->>openstack: 300 Multiple Choices /image
openstack->>glance-api: POST /image/v2/images
glance-api->>keystone: GET /identity
keystone-->>glance-api: 300 MULTIPLE CHOICES /identity
glance-api->>keystone: POST /identity/v3/auth/tokens
keystone-->>glance-api: 201 CREATED /identity/v3/auth/tokens
glance-api->>keystone: GET /identity/v3/auth/tokens
keystone-->>glance-api: 200 OK /identity/v3/auth/tokens
glance-api->>keystone: GET /identity
keystone-->>glance-api: 300 MULTIPLE CHOICES /identity
glance-api->>keystone: POST /identity/v3/auth/tokens
keystone-->>glance-api: 201 CREATED /identity/v3/auth/tokens
glance-api->>keystone: GET /identity/v3/limits/model
keystone-->>glance-api: 200 OK /identity/v3/limits/model
glance-api->>keystone: GET /identity/v3/endpoints/{image_endpoint_id}
keystone-->>glance-api: 200 OK /identity/v3/endpoints/{image_endpoint_id}
glance-api->>keystone: GET /identity/v3/limits
keystone-->>glance-api: 200 OK /identity/v3/limits
glance-api->>keystone: GET /identity/v3/registered_limits
keystone-->>glance-api: 200 OK /identity/v3/registered_limits
glance-api-->>openstack: 201 Created /image/v2/images
openstack->>glance-api: PUT /image/v2/images/{image_id}/file
glance-api->>keystone: GET /identity/v3/limits/model
keystone-->>glance-api: 200 OK /identity/v3/limits/model
glance-api->>keystone: GET /identity/v3/endpoints/{image_endpoint_id}
keystone-->>glance-api: 200 OK /identity/v3/endpoints/{image_endpoint_id}
glance-api->>keystone: GET /identity/v3/limits
keystone-->>glance-api: 200 OK /identity/v3/limits
glance-api->>keystone: GET /identity/v3/registered_limits
keystone-->>glance-api: 200 OK /identity/v3/registered_limits
glance-api->>keystone: GET /identity/v3/limits/model
keystone-->>glance-api: 200 OK /identity/v3/limits/model
glance-api->>keystone: GET /identity/v3/endpoints/{image_endpoint_id}
keystone-->>glance-api: 200 OK /identity/v3/endpoints/{image_endpoint_id}
glance-api->>keystone: GET /identity/v3/limits
keystone-->>glance-api: 200 OK /identity/v3/limits
glance-api->>keystone: GET /identity/v3/registered_limits
keystone-->>glance-api: 200 OK /identity/v3/registered_limits
glance-api->>keystone: POST /identity/v3/auth/tokens
keystone-->>glance-api: 201 CREATED /identity/v3/auth/tokens
glance-api-->>openstack: 204 No Content /image/v2/images/{image_id}/file
