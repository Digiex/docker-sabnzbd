FROM ghcr.io/digiex/mp4:testing AS base
FROM ghcr.io/linuxserver/sabnzbd:unstable
MAINTAINER xzKinGzxBuRnzx

ENV NVIDIA_DRIVER_CAPABILITIES="compute,video,utility"

RUN apk add --no-cache bash ffmpeg jq

COPY root /
COPY sabnzbd.ini /defaults/
COPY --from=base /mp4.sh /
