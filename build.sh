#!/usr/bin/env bash

set -euo pipefail
set -x

my_arch=$(arch)
rm -f el9-${my_arch}.tar el9-${my_arch}.tar.gz
podman rm -f el9
podman run -i --name el9 docker.io/eurolinux/eurolinux-9:latest < install-script.sh
podman export el9 > "el9-${my_arch}.tar"
tar -czf - "el9-${my_arch}.tar" | gzip > "el9-${my_arch}.tar.gz"
set +x

echo "Generation finished! WSL images saved: el9-${my_arch}.tar.gz el9-${my_arch}.tar"
