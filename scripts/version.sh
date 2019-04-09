#!/bin/bash

PACKAGE_VERSION=$(cat package.json \
    | grep version \
    | head -1 \
    | awk -F: '{ print $2 }' \
    | sed 's/[",]//g' \
    | tr -d '[[:space:]]')

IFS=. read -a PACKAGE_ARRAY <<< "$PACKAGE_VERSION"

vMajor=${PACKAGE_ARRAY[0]}
vMinor=${PACKAGE_ARRAY[1]}
vPatch=${PACKAGE_ARRAY[2]}

echo THIS_WONT=show up

echo "##vso[task.setvariable variable=vMajor]$vMajor"
echo "##vso[task.setvariable variable=vMinor]$vMinor"
echo "##vso[task.setvariable variable=vPatch]$vPatch"

printenv

echo vMajor is: ${V_MAJOR}
echo vPatch is: $vpatch
echo global: $GLOBAL
echo build reason is: $BUILD_REASON
