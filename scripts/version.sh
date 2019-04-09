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

export V_MAJOR=${PACKAGE_ARRAY[0]}
export V_MINOR=${PACKAGE_ARRAY[1]}
export V_PATCH=${PACKAGE_ARRAY[2]}

echo "##vso[task.setvariable variable=vMajor]$vMajor"
echo "##vso[task.setvariable variable=vMinor]$vMinor"
echo "##vso[task.setvariable variable=vPatch]$"Patch

printenv

echo vMajor is: ${V_MAJOR}
echo vMajor is: $V_MAJOR
echo global: $GLOBAL
echo build reason is: $BUILD_REASON
