FROM ubuntu:24.04

ARG COMMIT_SHA=dev

LABEL build="JusteReseau - Commit: ${COMMIT_SHA}"
LABEL org.opencontainers.image.description="This is a docker image for testing network connectivity and debugging network issues."
LABEL org.opencontainers.image.licenses="WTFPL"
LABEL org.opencontainers.image.source="https://github.com/justereseau/network-tools"
LABEL maintainer="JusteSonic"

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Configure timezone to prevent tzdata prompts
RUN ln -fs /usr/share/zoneinfo/America/Toronto /etc/localtime && \
  echo "America/Toronto" > /etc/timezone && \
  apt-get update && apt-get install -y tzdata

RUN apt-get update ; apt-get dist-upgrade -y ; apt-get install -y curl ca-certificates yq jq
RUN apt-get install -y mysql-client iputils-ping dnsutils mtr traceroute
RUN apt-get install -y telnet netcat-openbsd
RUN apt-get install -y nmap iperf3 tcpdump ftp wget

RUN apt-get autoremove -y ; apt-get clean -y ; rm -rf /var/lib/apt/lists/*

COPY --chown=root:root --chmod=755 ./scripts/ /usr/bin/

USER 1000

CMD [ "/usr/bin/bash" ]
