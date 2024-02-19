# EuroLinux WSL

Welcome to EuroLinux images for Windows Subsystem for Linux

## Running Official EuroLinux images for WSL

**In the Windows PowerShell/Terminal:**

Import X86_64 WSL image:
```bash
wget https://github.com/EuroLinux/WSL/releases/latest/download/el9-x86_64.tar -o el9-x86_64.tar
wsl --import EuroLinux-9 "$env:USERPROFILE/EuroLinux-9" .\el9-x86_64.tar --version 2
```

Import ARM64 (aarch64) image :

```bash
wget https://github.com/EuroLinux/WSL/releases/latest/download/el9-aarch64.tar -o el9-aarch64.tar
wsl --import EuroLinux-9 "$env:USERPROFILE/EuroLinux-9" .\el9-aarch64.tar --version 2
```

In both cases, the WSL disk is saved in the user's home directory. After import, you can run your instance with:
```bash
wsl -d EuroLinux-9
```

To set EuroLinux 9 as the default WSL distribution run:
```bash
wsl --set-default EuroLinux-9
```

Then simply run it with:
```bash
wsl
```

## Creating image for WSL with `podman`

For the newest build code/script check build.sh. To manually create the image from the command line run:

```bash
my_arch=$(arch)
podman rm el9
podman run -i --name el9 docker.io/eurolinux/eurolinux-9:latest < install-script.sh
podman export el9 > "el9-${my_arch}.tar"
tar -czf - "el9-${my_arch}.tar" | gzip > "el9-${my_arch}.tar.gz"
```

Where:
- `el9-$ARCH.tar` is used for base import and releases
- `el9-$ARCH.tar.gz` is used in DistroLauncher releases

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


MOTD was enabled in the `/etc/profile`, it's an easy and clean solution
```bash
echo '[ -e /etc/motd ] && cat /etc/motd' >> /etc/profile
```

The `sudo`, `util-linux-core`, and `systemd` were packages installed

```bash
yum install -y sudo util-linux-core systemd
```

That's all :)!

## Ultra short WSL cheatsheet

```bash
# list distros
wsl -l -v # alt wsl --list --verbose
# remove distro (EuroLinux-9)
wsl --unregister DISTRONAME
# change/set WSL version
wsl --set-version DISTRONAME VER
# run a selected distro
wsl -d DISTRONAME
# run default distro
wsl
# set default distro
wsl --set-default DISTRONAME
```

## Additional resources

- [Easy way to create WSL for almost any distribution](https://learn.microsoft.com/en-us/windows/wsl/use-custom-distro).
- [EuroLinux Bugs and RFCs](https://github.com/EuroLinux/eurolinux-distro-bugs-and-rfc)
