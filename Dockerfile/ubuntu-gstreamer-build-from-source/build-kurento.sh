#!/bin/bash

echo "install kurento-media-server-dev"
apt-get update && apt-get install --no-install-recommends kurento-media-server-dev

# OPTION.1
# apt-get update && apt-get install --no-install-recommends devscripts equivs

# echo "cd server/module-core/"
# cd /  && cd server/module-core/

# Get DISTRIB_* env vars.
# source /etc/upstream-release/lsb-release 2>/dev/null || source /etc/lsb-release

# apt-get update && mk-build-deps --install --remove \
#     --tool="apt-get -o Debug::pkgProblemResolver=yes --target-release 'a=$DISTRIB_CODENAME-backports' --no-install-recommends --no-remove" \
#     ./debian/control

# echo "cd server/"
# cd ..

# OPTION.2
cd /
cd /home

git clone https://github.com/Kurento/kurento.git
cd kurento/

git submodule update --init --recursive

export MAKEFLAGS="-j$(nproc)"

bin/build-run.sh
