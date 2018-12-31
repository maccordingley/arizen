#!/bin/bash

# This script takes care of testing your crate

set -e

echo "Before Install Script"

if [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
     npm run dist
elif [[ ${TRAVIS_OS_NAME} == "linux" && ${TRAVIS_BUILD_PALTORM} == "windows" ]]; then
    npm run dist --win --x64
elif [[ ${TRAVIS_OS_NAME} == "linux" && ${TRAVIS_BUILD_PALTORM} == "linux" ]]; then
    npm run dist
else
    echo "Unknown OS"
fi
