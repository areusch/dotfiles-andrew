#!/bin/bash -ex

set -xe

PROFILE_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"

mkdir -p "${PROFILE_DIR}"
cp "$(dirname $0)/Andrew.plist" "${PROFILE_DIR}/Andrew.plist"

cd $(dirname $0)
poetry lock && poetry install && poetry run python3 set_profile.py
