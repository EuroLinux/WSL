#!/usr/bin/env bash

my_arch=$(arch)
podman rm el9
podman run -i --name el9 docker.io/eurolinux/eurolinux-9:latest < install-script.sh
#podman export el9 > el9.tar
#tar -czf - el9.tar | gzip > el9.tar.gz
