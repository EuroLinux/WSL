# EuroLinux WSL

Welcome to EuroLinux images for Windows Subsystem for Linux

## Running Official EuroLinux images for WSL

X86_64:
```bash
wsl --import EuroLinux-9 "$env:USERPROFILE/EuroLinux-9" C:\Users\Alex\Downloads\el9.tar --version 2
```

ARM64 (aarch64):

```
TODO
```

## Creating image for WSL with `podman`

For the newest build code/script check `build.sh`. To manually
create the image from command line run:

```bash
my_arch=$(arch)
podman rm el9
podman run -it --name el9 docker.io/eurolinux/eurolinux-9:latest < install-script.sh
podman export el9 > "el9-${my_arch}.tar"
tar -czf - "el9-${my_arch}.tar" | gzip > "el9-${my_arch}.tar.gz"
```

Where:
- `el9-$ARCH.tar` is used for base import and release page
- `el9-$ARCH.tar.gz` is used for in DistroLauncher

**You can modify the `install-script.sh` to create custom/tailored images.**

## Changes to the base EuroLinux container

The `systemd-bootd` is enabled in the WSL configuration file `/etc/wsl.conf`.
```ini
[boot]
systemd=true
```

The MOTD (Message Of The Day) was overwritten in the `/etc/motd`
```
Welcome to EuroLinux 9 on WSL.

Any suggestions are welcome at https://github.com/EuroLinux/WSL

Happy using!

To delete this message use:
rm /etc/motd
```


MOTD was enabled in the `/etc/profile`, it's the easy and clean solution

```bash
echo '[ -e /etc/motd ] && cat /etc/motd' >> /etc/profile
```

The `sudo`, `util-linux-core` and 'systemd' were packages installed

```bash
yum install -y sudo util-linux-core systemd
```
Ands that's all

## Ultra short WSL cheatsheet

```bash
# list distros
wsl -l -v # alt wsl --list --verbose
# remove distro (EuroLinux-9)
wsl --unregister DISTRONAME
# change/set WSL version
wsl --set-version DISTRONAME VER
# run selected distro
wsl -d DISTRONAME
# run default distro
wsl
# set default distro
wsl --set-default DISTRONAME
```

## Additional resources

- [Easy way to create WSL for almost any distribution](https://learn.microsoft.com/en-us/windows/wsl/use-custom-distro).
- [EuroLinux Bugs and RFCs](https://github.com/EuroLinux/eurolinux-distro-bugs-and-rfc)
