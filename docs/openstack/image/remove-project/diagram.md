openstack->>keystone: GET /identity/
keystone-->>openstack: 300 MULTIPLE CHOICES /identity/
openstack->>keystone: POST /identity/v3/auth/tokens
keystone-->>openstack: 201 CREATED /identity/v3/auth/tokens
openstack->>keystone: GET /identity/v3/projects/{project_id}
keystone-->>openstack: 200 OK /identity/v3/projects/{project_id}
openstack->>glance-api: GET /v2/images/{image_id}
glance-api->>keystone: GET /identity/v3/auth/tokens
keystone-->>glance-api: 200 OK /identity/v3/auth/tokens
glance-api-->>openstack: 200 OK /v2/images/{image_id}
openstack->>glance-api: DELETE /v2/images/{image_id}/members/{project_id}
glance-api-->>openstack: 204 No Content /v2/images/{image_id}/members/{project_id}
