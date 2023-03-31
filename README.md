# Run Shadowsocks, V2Ray, and WireGuard in Docker

This guide provides step-by-step instructions for running Shadowsocks, V2Ray, and WireGuard in Docker on a Linux system using a shell script.

## Requirements

* Docker: https://docs.docker.com/get-docker/
* Docker Compose: https://docs.docker.com/compose/install/

## Instructions

### Setup

1. Clone the proxy repository:

```shell
git clone https://github.com/zzci/proxy.git
cd proxy
```

2. Create a init.sh script in the work/.init directory with the following content:

```sh
#!/bin/sh

# Enable Shadowsocks
sctl enable ss

# Enable V2Ray
sctl enable v2ray

# Enable WireGuard
sctl enable wireguard
```

3. Modify the docker-compose.yml port mapping to the port you want to use.

4. Run the following command to start the proxy:

```shell
docker-compose up -d
```

### Test wireguard client 

```
ip link add dev wg0 type wireguard
ip addr add dev wg0 25.0.0.2/32
ip link set wg0 up

wg set wg0 private-key priv.key
wg set wg0 peer iUQjotFkH46/afxCVvRkZfteTRpez02DaZHPQkHXEg0= endpoint 172.17.0.2:4434 allowed-ips 0.0.0.0/0
```
