#!/usr/bin/env bash

my_arch=$(arch)
podman rm el9
podman run -it --name el9 docker.io/eurolinux/eurolinux-9:latest < install-script.sh
podman export el9 > "el9-${my_arch}.tar"
tar -czf - "el9-${my_arch}.tar" | gzip > "el9-${my_arch}.tar.gz"
