FROM ghcr.io/digiex/mp4:latest AS base
FROM ghcr.io/linuxserver/sabnzbd:latest
MAINTAINER xzKinGzxBuRnzx

ENV NVIDIA_DRIVER_CAPABILITIES="compute,video,utility"
ARG DEBIAN_FRONTEND=noninteractive

RUN apk add --no-cache bash ffmpeg jq

COPY root /
COPY sabnzbd.ini /defaults/
COPY --from=base /mp4.sh /
