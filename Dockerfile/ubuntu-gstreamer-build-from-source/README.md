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

# Steps
1. build image
```bash
docker build -t ubuntu-20-gstreamer-build-from-source .
```

2. run container
```bash
docker run -d \
    --name ubuntu-20-gst-source \
    -p 8888:8888/tcp \
    -p 5000-5300:5000-5300/udp \
    --mount type=bind,src="[YOUR-HOST-LOCATION]",dst=/home/configs \
    --mount type=bind,src="[YOUR-HOST-LOCATION]",dst=/home/gstreamer \
    focal-gstreamer-build-from-source:latest
```

3. get into bash
```bash
docker exec -it [container_id] bash
```