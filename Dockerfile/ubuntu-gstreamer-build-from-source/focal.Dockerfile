FROM ubuntu:focal

ENV LANG en_US.utf8
# ENV DISPLAY=:0
ENV GST_DEBUG="${GST_DEBUG:-2},Kurento*:5,KurentoWebSocket*:4"

COPY cmd.sh /home
COPY build-gstreamer.sh /home
COPY build-kurento.sh /home
COPY test-gstreamer.sh /home

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

RUN apt-get update && apt-get install -y python-is-python3 && apt-get install -y python3-pip 

RUN apt-get update && apt-get install -y --no-install-recommends build-essential

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates

# RUN apt-get update && apt-get install -y meson

RUN apt-get update && apt-get install --no-install-recommends gnupg

RUN apt-get update && apt-get install -y flex

RUN apt-get update && apt-get install -y bison

RUN apt-get update && apt-get install -y gcc g++

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y cmake

RUN apt-get update && apt-get install -y git

RUN apt-get update && apt-get install -y pkg-config

RUN apt-get update && apt-get install -y gstreamer1.0-tools

# RUN apt-get update && apt-get install -y x11-apps

# RUN apt-get update && apt-get install -y xvfb

RUN apt-get update && apt-get install nano

# RUN apt-get update && apt-get install --no-install-recommends kurento-media-server-dev

WORKDIR /home

ENTRYPOINT ["./cmd"]
