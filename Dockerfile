FROM ubuntu:22.04

LABEL maintainer="lzm"

COPY warp-init.sh /

RUN apt-get update \
&& apt-get install -y curl \
&& curl -L https://pkg.cloudflareclient.com/uploads/cloudflare_warp_2023_1_133_1_amd64_dc941b82de.deb -o /tmp/warp.deb \
&& apt-get install -y /tmp/warp.deb \
&& rm -rf /var/lib/apt/lists/* /tmp \
&& chmod 777 /warp-init.sh

EXPOSE 40000/tcp
ENTRYPOINT ["/warp-init.sh"]

