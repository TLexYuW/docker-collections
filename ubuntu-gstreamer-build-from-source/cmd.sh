#!bin/bash

echo "cd to /home"
cd /home 

echo "use pip3 install higher version meson"
apt-get update && pip3 install meson

echo "git clone gstreamer"
git clone https://gitlab.freedesktop.org/gstreamer/gstreamer.git

echo "source, apt-key, tee, install kurento-media-server process"
source /etc/upstream-release/lsb-release 2>/dev/null || source /etc/lsb-release

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 234821A61B67740F89BFD669FC8A16625AFA7A83 

tee "/etc/apt/sources.list.d/kurento.list" >/dev/null <<EOF
deb [arch=amd64] http://ubuntu.openvidu.io/7.0.0 $DISTRIB_CODENAME main
EOF

apt-get update

apt-get install -y kurento-media-server
echo "midea server install done!"

echo "replace default media server configs"
cp -r /home/configs/. /etc/kurento/modules/kurento

