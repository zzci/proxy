FROM alpine:3.15

WORKDIR /work

ENV PATH=$PATH:/build/bin:/work/bin

COPY --from=zzci/init / /

RUN apk add --no-cache wireguard-tools tcpdump; mkdir -p /build/bin/ /build/app/v2ray; \
    ## outline
    wget -qO- https://github.com/Jigsaw-Code/outline-ss-server/releases/download/v1.4.0/outline-ss-server_1.4.0_linux_x86_64.tar.gz \
    | tar xz -C /tmp; mv /tmp/outline-ss-server /build/bin;\
    ## v2fly
    wget -O /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.4.1/v2ray-linux-64.zip; \
    unzip /tmp/v2ray.zip -d /build/app/v2ray; \
    ln -s /build/app/v2ray/v2ray /build/bin; \
    ## clearn
    rm -rf /tmp/*

EXPOSE 4433

ADD rootfs /

CMD ["/start.sh"]
