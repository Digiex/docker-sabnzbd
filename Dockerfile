FROM digiex/mp4:testing AS base
FROM linuxserver/sabnzbd:unstable
MAINTAINER xzKinGzxBuRnzx

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  mkdir -p /mp4 /config/scripts && \
  apt-get update && \
  apt-get -y install jq bc mediainfo ffmpeg && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

COPY root /
COPY sabnzbd.ini /defaults/
COPY --from=base /mp4 /
