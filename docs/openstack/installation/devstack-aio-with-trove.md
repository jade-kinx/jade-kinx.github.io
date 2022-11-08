# DevStack All-In-One with Trove Installation



```ini title="local.conf"
[[local|localrc]]
RECLONE=False
HOST_IP=10.0.0.100

enable_plugin trove https://opendev.org/openstack/trove
enable_plugin trove-dashboard https://opendev.org/openstack/trove-dashboard

LIBS_FROM_GIT+=,python-troveclient
ADMIN_PASSWORD=asdf
DATABASE_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
SERVICE_TOKEN=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
LOGFILE=$DEST/logs/stack.sh.log
VERBOSE=True
LOG_COLOR=False
LOGDAYS=1

FLAT_INTERFACE=enp0s3
FLOATING_RANGE=172.16.0.0/24
IPV4_ADDRS_SAFE_TO_USE=192.168.10.0/24
PUBLIC_NETWORK_GATEWAY=172.16.0.1

# Pre-requisites
ENABLED_SERVICES=rabbit,mysql,key

# Nova
enable_service horizon

# Nova
enable_service n-api
enable_service n-cpu
enable_service n-cond
enable_service n-sch
enable_service n-api-meta
enable_service placement-api
enable_service placement-client

# Glance
enable_service g-api
enable_service g-reg

# Cinder
enable_service cinder
enable_service c-api
enable_service c-vol
enable_service c-sch

Q_AGENT=ovn
Q_ML2_PLUGIN_MECHANISM_DRIVERS=ovn,logger
Q_ML2_PLUGIN_TYPE_DRIVERS=local,flat,vlan,geneve
Q_ML2_TENANT_NETWORK_TYPE="geneve"
enable_service ovn-northd
enable_service ovn-controller
enable_service q-ovn-metadata-agent

# Neutron
enable_service q-svc

# Disable Neutron agents not used with OVN.
disable_service q-agt
disable_service q-l3
disable_service q-dhcp
disable_service q-meta

# Enable services, these services depend on neutron plugin.
enable_plugin neutron https://opendev.org/openstack/neutron
enable_service q-trunk
enable_service q-dns
enable_service q-port-forwarding
enable_service q-qos
enable_service neutron-segments
enable_service q-log

# Enable neutron tempest plugin tests
enable_plugin neutron-tempest-plugin https://opendev.org/openstack/neutron-tempest-plugin
OVN_BUILD_MODULES=True
ENABLE_CHASSIS_AS_GW=True

# Swift
ENABLED_SERVICES+=,swift
SWIFT_HASH=66a3d6b56c1f479c8b4e70ab5c2000f5
SWIFT_REPLICAS=1
```