# Debugging python-openstackclient

데브스택 설치버전의 오픈스택에서, python-openstackclient 디버깅하는 방법에 대해서 알아본다.

## Requirements

* DevStack(ZED) Version 설치
* HOST_IP 는 Public IP이고, Loop Back Device에 Public IP 추가
* 보안 그룹에 HTTP, SSH, OpenStack-EndPoint(NEUTRON: 9696, SWIFT:8080, TROVE:8779) 등록
* Visual Studio Code 설치
* VSCode Extensions
    - Python
    - Remote - SSH
    - Remote - SSH: Editing Configuration Files
    - Remote Explorer
    - ~~Remote Development~~
    - ~~WSL~~
    - ~~Dev Containers~~

## VSCode를 이용한 원격 디버깅




