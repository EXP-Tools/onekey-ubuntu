#!/bin/bash
#------------------------------------------------
# 进入容器的交互终端
# bin/terminal.sh [-s ${SHELL}]
#------------------------------------------------

SHELL="bash"

set -- `getopt s: "$@"`
while [ -n "$1" ]
do
  case "$1" in
    -u) SHELL="$2"
        shift ;;
  esac
  shift
done


CONTAINER_NAME="SYS_FOR_TEST"
CONTAINER_ID=`docker ps -aq --filter name="$CONTAINER_NAME"`
if [[ "${CONTAINER_ID}x" = "x" ]] ; then
    echo "[$CONTAINER_NAME] is not running ..."
else
    docker exec -it -u root $CONTAINER_ID $SHELL
fi
