#!/bin/bash

sudo docker run --name docker_$JOB_NAME --rm --privileged \
    -v /home/viktor/.ssh:/home/builder/.ssh \
    -v /home/viktor/buildfolder:/media/buildfolder \
    hostmobility/buildplatform-mx4:2.0 \
    /bin/bash -l -c "
        set -x ;
        export MACHINES=\"$MACHINES\" ;
        cd /media/buildfolder/workspace/$JOB_NAME ;
        jenkins-jobs/$JOB_NAME/./BuildScript.sh
    "