FROM ubuntu:latest

LABEL maintainer="lzm"

COPY warp-init.sh /

RUN apt-get update \
&& apt-get install -y curl \
socat \
# cloudflare_warp needs libcap2-bin but old version not added to Depends in .deb file, explicitly install it
libcap2-bin\
# download from https://pkg.cloudflareclient.com/packages/cloudflare-warp
&& curl -L https://pkg.cloudflareclient.com/uploads/cloudflare_warp_2021_12_0_1_amd64_2dae41e61d.deb -o /tmp/warp.deb \
&& apt-get install -y /tmp/warp.deb \
&& rm -rf /var/lib/apt/lists/* /tmp/* \
&& chmod 777 /warp-init.sh

EXPOSE 40000/tcp
ENTRYPOINT ["/warp-init.sh"]

