#!/bin/bash

LSB_RELEASE=/etc/lsb-release

if [ ! -e "${LSB_RELEASE}" ]; then
    echo "lsb-release info does not exist: ${LSB_RELEASE}"
    exit 2
fi

DISTRIB_ID=$(source "${LSB_RELEASE}" && echo "${DISTRIB_ID}")
DISTRIB_RELEASE=$(source "${LSB_RELEASE}" && echo "${DISTRIB_RELEASE}")

dist_script="$(dirname $0)/${DISTRIB_ID}-${DISTRIB_RELEASE}/install.sh"
if [ ! -e "${dist_script}" ]; then
    echo "Don't know how to install for ${DISTRIB_ID} ${DISTRIB_RELEASE}"
    echo "dist script not found ${dist_script}"
    exit 2
fi

"${dist_script}"

mkdir ~/ws
mkdir ~/ws/org
