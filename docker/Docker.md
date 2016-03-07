## docker-machine

### SSH可能なリモートサーバーに対して実行
```sh
# 前提
# - SSHで接続できる状態
# - sudoをパスワードなしで実行可能なユーザー

docker-machine create --driver generic --generic-ip-address {$SERVER_IP_ADDRESS} --generic-ssh-user {$SERVER_USER} {$DOCKER_MACHINE_NAME}
```