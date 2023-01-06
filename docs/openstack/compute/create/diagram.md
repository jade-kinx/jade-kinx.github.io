openstack->>keystone: GET /identity/
keystone-->>openstack: 300 MULTIPLE CHOICES /identity/
openstack->>keystone: POST /identity/v3/auth/tokens
keystone-->>openstack: 201 CREATED /identity/v3/auth/tokens
openstack->>glance-api: GET /
glance-api-->>openstack: 300 Multiple Choices None
openstack->>glance-api: GET /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e
glance-api->>keystone: GET /identity/
keystone-->>glance-api: 300 MULTIPLE CHOICES /identity/
glance-api->>keystone: POST /identity/v3/auth/tokens
keystone-->>glance-api: 201 CREATED /identity/v3/auth/tokens
glance-api->>keystone: GET /identity/v3/auth/tokens
keystone-->>glance-api: 200 OK /identity/v3/auth/tokens
glance-api-->>openstack: 200 OK /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e
openstack->>nova-api: GET /compute/v2.1/flavors/c1
nova-api-->>openstack: 200 OK /compute/v2.1/flavors/c1
openstack->>neutron-server: GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
neutron-server-->>openstack: 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
openstack->>nova-api: POST /compute/v2.1/servers
nova-api->>glance-api: GET /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e
glance-api-->>nova-api: 200 OK /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e
nova-api->>glance-api: GET /v2/schemas/image
glance-api-->>nova-api: 200 OK /v2/schemas/image
nova-api->>neutron-server: GET /networking/v2.0/networks
neutron-server-->>nova-api: 200 OK /networking/v2.0/networks
nova-api->>neutron-server: GET /networking/v2.0/ports
neutron-server-->>nova-api: 200 OK /networking/v2.0/ports
nova-api->>neutron-server: GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
neutron-server-->>nova-api: 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
nova-api->>neutron-server: GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
neutron-server-->>nova-api: 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
nova-api-->>openstack: 202 Accepted /compute/v2.1/servers
openstack->>nova-api: GET /compute/v2.1/servers/6dc2e525-a218-4814-9dc5-4cfcf2332268
nova-scheduler->>keystone: POST /identity/v3/auth/tokens
nova-api->>neutron-server: GET /networking/v2.0/ports
keystone-->>nova-scheduler: 201 CREATED /identity/v3/auth/tokens
neutron-server-->>nova-api: 200 OK /networking/v2.0/ports
nova-api-->>openstack: 200 OK /compute/v2.1/servers/6dc2e525-a218-4814-9dc5-4cfcf2332268
openstack->>glance-api: GET /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e
glance-api-->>openstack: 200 OK /v2/images/da9259d0-b57f-4230-a2cf-e5bc6cedf19e
openstack->>nova-api: GET /compute/v2.1/flavors/c1
nova-api-->>openstack: 200 OK /compute/v2.1/flavors/c1
nova-scheduler->>placement-api: GET /placement/allocation_candidates
placement-api-->>nova-scheduler: 200 OK /placement/allocation_candidates
nova-scheduler->>placement-api: GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
placement-api-->>nova-scheduler: 200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
nova-scheduler->>placement-api: PUT /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
placement-api-->>nova-scheduler: 204 No Content /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
nova-compute->>placement-api: GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
placement-api-->>nova-compute: 200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
nova-compute->>placement-api: GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
placement-api-->>nova-compute: 200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
nova-compute->>neutron-server: GET /networking/v2.0/networks
neutron-server-->>nova-compute: 200 OK /networking/v2.0/networks
nova-compute->>neutron-server: POST /networking/v2.0/ports
neutron-server-->>nova-compute: 201 Created /networking/v2.0/ports
nova-compute->>neutron-server: PUT /networking/v2.0/ports/f2267b05-180b-4920-b1e5-a77d38f70c24
neutron-server-->>nova-compute: 200 OK /networking/v2.0/ports/f2267b05-180b-4920-b1e5-a77d38f70c24
neutron-server->>nova-api: POST /compute/v2.1/os-server-external-events
nova-compute->>neutron-server: GET /networking/v2.0/ports
nova-api-->>neutron-server: 200 OK /compute/v2.1/os-server-external-events
neutron-server-->>nova-compute: 200 OK /networking/v2.0/ports
nova-compute->>neutron-server: GET /networking/v2.0/subnets
neutron-server-->>nova-compute: 200 OK /networking/v2.0/subnets
nova-compute->>neutron-server: GET /networking/v2.0/ports
neutron-server-->>nova-compute: 200 OK /networking/v2.0/ports
nova-compute->>neutron-server: GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
neutron-server-->>nova-compute: 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
nova-compute->>neutron-server: GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
neutron-server-->>nova-compute: 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
nova-compute->>neutron-server: GET /networking/v2.0/ports
neutron-server-->>nova-compute: 200 OK /networking/v2.0/ports
nova-compute->>neutron-server: GET /networking/v2.0/networks
neutron-server-->>nova-compute: 200 OK /networking/v2.0/networks
nova-compute->>neutron-server: GET /networking/v2.0/subnets
neutron-server-->>nova-compute: 200 OK /networking/v2.0/subnets
nova-compute->>neutron-server: GET /networking/v2.0/ports
neutron-server-->>nova-compute: 200 OK /networking/v2.0/ports
nova-compute->>neutron-server: GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
neutron-server-->>nova-compute: 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
nova-compute->>neutron-server: GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
neutron-server-->>nova-compute: 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
neutron-server->>keystone: GET /identity/
keystone-->>neutron-server: 300 MULTIPLE CHOICES /identity/
neutron-server->>keystone: POST /identity/v3/auth/tokens
keystone-->>neutron-server: 201 CREATED /identity/v3/auth/tokens
nova-api->>keystone: GET /identity/v3/auth/tokens
keystone-->>nova-api: 200 OK /identity/v3/auth/tokens
neutron-server->>nova-api: POST /compute/v2.1/os-server-external-events
nova-api-->>neutron-server: 200 OK /compute/v2.1/os-server-external-events
neutron-server->>nova-api: POST /compute/v2.1/os-server-external-events
nova-api-->>neutron-server: 200 OK /compute/v2.1/os-server-external-events
nova-api->>neutron-server: GET /networking/v2.0/ports
neutron-server-->>nova-api: 200 OK /networking/v2.0/ports
nova-compute->>neutron-server: GET /networking/v2.0/ports
neutron-server-->>nova-compute: 200 OK /networking/v2.0/ports
nova-compute->>neutron-server: GET /networking/v2.0/ports
neutron-server-->>nova-compute: 200 OK /networking/v2.0/ports
nova-compute->>neutron-server: GET /networking/v2.0/networks
neutron-server-->>nova-compute: 200 OK /networking/v2.0/networks
nova-compute->>neutron-server: GET /networking/v2.0/subnets
neutron-server-->>nova-compute: 200 OK /networking/v2.0/subnets
nova-compute->>neutron-server: GET /networking/v2.0/ports
neutron-server-->>nova-compute: 200 OK /networking/v2.0/ports
nova-compute->>neutron-server: GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
neutron-server-->>nova-compute: 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
nova-compute->>neutron-server: GET /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
neutron-server-->>nova-compute: 200 OK /networking/v2.0/networks/4529570d-57bf-4ec8-8d67-937f13b1d9ae
nova-compute->>placement-api: GET /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
placement-api-->>nova-compute: 200 OK /placement/allocations/6dc2e525-a218-4814-9dc5-4cfcf2332268
