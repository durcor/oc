#!/bin/sh

[ "$USER" != "root" ] && {
    >&2 echo "$0 must be run by root."
    exit 1
}

install()
{
    mkdir -p /usr/share/oc
    mv ./gpus.csv /usr/share/oc/
    mv ./oc.service /etc/systemd/system/
    systemctl enable oc
}

uninstall()
{
    rm -r /usr/share/oc
    rm /bin/oc
    rm /etc/systemd/system/oc.service
}

case $1 in
    "uninstall")
        uninstall
        ;;
    "install"|*)
        install
        ;;
esac
