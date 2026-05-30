FROM alpine:latest
MAINTAINER Invincible the Catheter King

ENV PATH=/root/.local/bin:$PATH
RUN apk --no-cache --no-interactive update \
    && apk --no-cache --no-interactive add curl bash \
    && curl -fsSL https://claude.ai/install.sh | bash \
    && mkdir /root/workspace

WORKDIR /root/workspace
ENTRYPOINT ["/bin/bash"]
CMD ["-c", "claude"]
