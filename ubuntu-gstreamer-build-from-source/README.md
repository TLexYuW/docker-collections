# Prerequisite Packages
- container
    - python-is-python3
    - python3-pip
    - gcc g++
    - cmake
    - meson
    - ninja
    - flex
    - bison
    - pkg-config
    - gnupg
    - kurento-media-server
    - git
    - clone gstreamer repository, checkout to 1.22
- host
    - xorg  

# Steps
1. build image
```bash
docker build -t ubuntu-20-gstreamer-build-from-source .
```
- run container
```bash
docker run -it \
    --name ubuntu-20-gst-source \
    -p 8888:8888/tcp \
    -p 5000-5300:5000-5300/udp \
    # -e KMS_MIN_PORT=5000 \ 
    # -e KMS_MAX_PORT=6000 \
    # -e KMS_STUN_IP="stun.l.google.com:19302" \
    # -e KMS_STUN_PORT=3478 \
    -v "[YOUR-HOST-LOCATION]":/tmp/.X11-unix \
    --privileged -e DISPLAY=$DISPLAY \
    --mount type=bind,src="[YOUR_CONFIG]",dst=/home/kurento/configs \
    ubuntu-20-gstreamer-build-from-source \
    bash
```