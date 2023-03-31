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
