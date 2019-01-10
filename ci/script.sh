#!/bin/bash

# This script takes care of testing your crate

set -e

#npm run dist

#apt install -y wine


if [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
    npx electron-builder build -m
elif [[ ${TRAVIS_OS_NAME} == "linux" && ${PLATFORM} == "windows"]] then
    npx electron-builder build -w
elif [[ ${TRAVIS_OS_NAME} == "linux" && ${PLATFORM} == "linux"]] then
    npx electron-builder build -l
else
    echo "Unknown OS"
fi
