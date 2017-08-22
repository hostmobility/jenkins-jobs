#!/bin/bash -l
export LICENSE_FLAGS_WHITELIST="closed"
export TEMPLATECONF=$PWD/layers/meta-hostmobility-distro/conf

source layers/openembedded-core/oe-init-build-env

# Whitelist Host Mobility license
grep closed conf/local.conf || echo 'LICENSE_FLAGS_WHITELIST += "closed"' >> conf/local.conf

# This will white list the BUILD_TAG environment variable which will make it
# accessible in bitbake "sandbox"
export BB_ENV_EXTRAWHITE="$BB_ENV_EXTRAWHITE BUILD_TAG"

for machine in ${MACHINES}
do
    echo "Building machine: $machine"
    export MACHINE=$machine && bitbake console-hostmobility-image
done
