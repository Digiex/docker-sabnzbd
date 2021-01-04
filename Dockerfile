FROM digiex/mp4:latest AS base
FROM linuxserver/sabnzbd:latest
MAINTAINER xzKinGzxBuRnzx

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  mkdir -p /mp4 && \
  apt-get update && \
  apt-get -y install ffmpeg jq bc mediainfo && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

COPY root /
COPY sabnzbd.ini /defaults/
COPY --from=base /mp4/* /mp4/
