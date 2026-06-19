FROM alpine:latest
MAINTAINER Invincible the Catheter King

ENV PATH=/root/.local/bin:$PATH
RUN apk --no-cache --no-interactive update \
    && apk --no-cache --no-interactive add curl bash nix \
    && curl -fsSL https://claude.ai/install.sh | bash \
    && mkdir -p /etc/nix \
    && echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf \
    && mkdir /root/workspace

WORKDIR /root/workspace
ENTRYPOINT ["/bin/bash"]
CMD ["-c", "claude"]
