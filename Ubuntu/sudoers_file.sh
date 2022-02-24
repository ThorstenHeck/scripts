touch /etc/sudoers.d/funkyfrank
echo "%funkyfrank ALL=NOPASSWD: /bin/systemctl restart NetworkManager" >> /etc/sudoers.d/funkyfrank
echo "%funkyfrank ALL=NOPASSWD: /bin/chown -R funkyfrank\:funkyfrank /etc/NetworkManager/system-connections/" >> /etc/sudoers.d/funkyfrank
echo "%funkyfrank ALL=NOPASSWD: /bin/chown -R root\:root /etc/NetworkManager/system-connections/" >> /etc/sudoers.d/funkyfrank
