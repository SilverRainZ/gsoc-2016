#!/usr/bin/sh

[[ "$1" != "-g" ]] && arg="-display none"

qemu-system-i386 -enable-kvm  -m 1G                         \
    -drive cache=writeback,file=debian-hurd.img,format=raw  \
    -net nic -net user,hostfwd=tcp::5555-:22                \
    $arg & sleep 3 && ssh -p 5555 la@localhost
