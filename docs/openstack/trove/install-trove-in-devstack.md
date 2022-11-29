# Install Trove in DevStack

## Requirements

* Ubuntu 20.04
* 8GB 이상 RAM
* 50GB 이상 HDD

!!! warning
    Install Trove in DevStack 문서(https://docs.openstack.org/trove/yoga/install/install-devstack.html)
    에서는 devstack/yoga 에서 Ubuntu 16.04, 18.04에서 fully verified 됐다고 안내하지만, 설치시 오류 
    발생한다. 20.04를 쓰자


## Add user stack

``` title=""
# useradd -s /bin/bash -d /opt/stack -m stack
# echo "stack ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/stack
# sudo -u stack -i
```
!!! note
    devstack은 non-root 권한으로 실행되어야 한다.  
    그래서 stack 사용자를 만들어주고, sudo 를 패스워드 없이 실행할 수 있도록 해준다.  
    설치는 stack 사용자로 진행한다.  


## Download DevStack

``` title=""
$ git clone https://opendev.org/openstack/devstack 
$ git checkout stable/zed
```
!!! note
    설치할 버전으로 checkout 해준다. (rocky 버전: `git checkout stable/rocky`, 없으면 `master` 브랜치로 빌드된다.)  
    `git clone` 중 key 오류 발생하면 `apt update && apt -y dist-upgrade` 해주고 clone 해준다.  


## local.conf 설정

```ini title="local.conf"
[[local|localrc]]
RECLONE=False
HOST_IP=10.0.0.24
IP_VERSION=4

# TROVE
TROVE_BRANCH=stable/zed
enable_plugin trove https://opendev.org/openstack/trove $TROVE_BRANCH
enable_plugin trove-dashboard https://opendev.org/openstack/trove-dashboard $TROVE_BRANCH
LIBS_FROM_GIT+=,python-troveclient

# PASSWORDS
ADMIN_PASSWORD=asdf
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
SERVICE_TOKEN=$ADMIN_PASSWORD

# LOGS
ENABLE_DEBUG_LOG_LEVEL=True
VERBOSE=True
LOG_COLOR=True
LOGFILE=$DEST/logs/stack.sh.log
LOGDAYS=1

# NETWORK
IPV4_ADDRS_SAFE_TO_USE=10.10.10.0/24
NETWORK_GATEWAY=10.10.10.1
FLOATING_RANGE=192.168.100.0/24
PUBLIC_NETWORK_GATEWAY=192.168.100.1
#FLAT_INTERFACE=ens3

# Swift
ENABLED_SERVICES+=,swift
SWIFT_HASH=66a3d6b56c1f479c8b4e70ab5c2000f5
SWIFT_REPLICAS=1```

## Another configuration

```ini title="local.conf"
[[local|localrc]]
RECLONE=False
HOST_IP=10.0.0.24
IP_VERSION=4

# TROVE
TROVE_BRANCH=stable/zed
enable_plugin trove https://opendev.org/openstack/trove $TROVE_BRANCH
enable_plugin trove-dashboard https://opendev.org/openstack/trove-dashboard $TROVE_BRANCH
LIBS_FROM_GIT+=,python-troveclient

# PASSWORDS
ADMIN_PASSWORD=asdf
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
SERVICE_TOKEN=$ADMIN_PASSWORD

# LOGS
ENABLE_DEBUG_LOG_LEVEL=True
VERBOSE=True
LOG_COLOR=True
LOGFILE=$DEST/logs/stack.sh.log
LOGDAYS=1

# NETWORK
IPV4_ADDRS_SAFE_TO_USE=10.10.10.0/24
NETWORK_GATEWAY=10.10.10.1
FLOATING_RANGE=192.168.100.0/24
PUBLIC_NETWORK_GATEWAY=192.168.100.1
#FLAT_INTERFACE=ens3

# Swift
ENABLED_SERVICES+=,swift
SWIFT_HASH=66a3d6b56c1f479c8b4e70ab5c2000f5
SWIFT_REPLICAS=1
```