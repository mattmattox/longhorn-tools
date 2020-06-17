FROM ubuntu:18.04

MAINTAINER mmattox@mattoxengineering.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
curl \
e2fsck-static \
htop \
nmon \
sysstat \
smartmontools \
hexdump \
hexcurse \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

##Install Docker client
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh ./get-docker.sh

COPY run.sh /bin/run.sh
CMD /bin/run.sh

