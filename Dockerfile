FROM digiex/mp4:latest AS base
FROM linuxserver/sabnzbd:latest
MAINTAINER xzKinGzxBuRnzx

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  mkdir -p /mp4 /config/scripts && \
  apt-get update && \
  apt-get -y install ffmpeg && \
  apt-get clean

COPY --from=base /mp4 /
COPY root /
COPY sabnzbd.ini /defaults/
