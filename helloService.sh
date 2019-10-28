#!/bin/bash

SERVERDIR="/home/xixi/code/study/c/app/service" 
SERVERNAME="hello"
SCRIPTNAME="helloService.sh"

install()
{
    cp ./$SCRIPTNAME /etc/init.d/
    service $SCRIPTNAME start &
    exit 0;
}
remove()
{
    service $SCRIPTNAME stop
    rm /etc/init.d/$SCRIPTNAME
    exit 0;
}
start()
{
    echo "start $SERVERNAME"
    $SERVERDIR/$SERVERNAME &
    echo "start $SERVERNAME ok!"
    exit 0;
}
 
stop()
{
    echo "stop $SERVERNAME"
    killall $SERVERNAME
    echo "stop $SERVERNAME ok!"
}
 
case "$1" in
install)
    install
    ;;
remove)
    remove
    ;;
start)
    start
    ;;
stop)
    stop
    ;;
restart)
    stop
    start
    ;;
*)
    echo "init: install|remove"
    echo "usage: $0 start|stop|restart"
    exit 0;
esac
exit

