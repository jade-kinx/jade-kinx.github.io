openstack->>keystone: GET /identity/
keystone-->>openstack: 300 MULTIPLE CHOICES /identity/
openstack->>keystone: POST /identity/v3/auth/tokens
keystone-->>openstack: 201 CREATED /identity/v3/auth/tokens
openstack->>glance-api: GET /v2/images
opt glance-api 인증 토큰 발급
  glance-api->>keystone: GET /identity/
  keystone-->>glance-api: 300 MULTIPLE CHOICES /identity/
  glance-api->>keystone: POST /identity/v3/auth/tokens
  keystone-->>glance-api: 201 CREATED /identity/v3/auth/tokens
end
glance-api->>keystone: GET /identity/v3/auth/tokens
keystone-->>glance-api: 200 OK /identity/v3/auth/tokens
glance-api-->>openstack: 200 OK /v2/images
