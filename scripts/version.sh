#!/bin/bash

PACKAGE_VERSION=$(cat package.json \
    | grep version \
    | head -1 \
    | awk -F: '{ print $2 }' \
    | sed 's/[",]//g' \
    | tr -d '[[:space:]]')

IFS=. read -a PACKAGE_ARRAY <<< "$PACKAGE_VERSION"

echo "##vso[task.setvariable variable=vMajor]$V_MAJOR"
echo "##vso[task.setvariable variable=vMinor]$V_MINOR"
echo "##vso[task.setvariable variable=vPatch]$V_PATCH"

printenv

echo vMajor is: ${V_MAJOR}
echo vMajor is: $V_MAJOR
echo global: $GLOBAL
echo build reason is: $BUILD_REASON
