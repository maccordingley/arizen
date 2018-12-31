#!/bin/bash

# This script takes care of testing your crate

set -e

echo "Deciding How to build"

if [[ ${TRAVIS_OS_NAME} == "osx" ]]; then
     echo "Building For OSX"
     npm run dist
elif [[ ${TRAVIS_OS_NAME} == "linux" && ${TRAVIS_BUILD_PALTORM} == "windows" ]]; then
    echo "Building for Windows"
    npm run dist --win --x64
    echo ${TRAVIS_BUILD_PALTORM}
    echo "end build platform"
elif [[ ${TRAVIS_OS_NAME} == "linux" && ${TRAVIS_BUILD_PALTORM} == "linux" ]]; then
    echo "Building for Linux"
    echo ${TRAVIS_BUILD_PALTORM}
    echo "end build platform"
    npm run dist
else
    echo "Unknown OS"
fi
