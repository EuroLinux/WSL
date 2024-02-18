echo '> setup motd'
cat <<EOF > /etc/motd
Welcome to EuroLinux 9 on WSL.

Any suggestions are welcome at https://github.com/EuroLinux/WSL

Happy using!

To delete this message use:
rm /etc/motd
EOF

echo '> setup profile'
echo '[ -e /etc/motd ] && cat /etc/motd' >> /etc/profile


echo '> setup wsl.conf'
cat <<EOF > /etc/wsl.conf
[boot]
systemd=true
EOF

echo '> run yum install'
yum install -y sudo util-linux-core systemd; yum clean all
