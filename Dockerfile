FROM ghcr.io/digiex/mp4:latest AS base
FROM ghcr.io/linuxserver/sabnzbd:latest
MAINTAINER xzKinGzxBuRnzx

ENV NVIDIA_DRIVER_CAPABILITIES="compute,video,utility"
ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get -y install ffmpeg jq && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

COPY root /
COPY sabnzbd.ini /defaults/
COPY --from=base /mp4.sh /
