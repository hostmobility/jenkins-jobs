#!/bin/bash -l

cd mx4-update

# Clean up old directories. make_system.sh requires it!
sudo rm -rf deploy-*

for machine in ${MACHINES}
do
    DEPLOY_DIR=../deploy/images/$machine/
    ./make_system.sh -t `echo $machine | sed -e "s/^mx4-//"` -r $DEPLOY_DIR/console-hostmobility-image-$machine.tar.xz -k $DEPLOY_DIR/uImage
done