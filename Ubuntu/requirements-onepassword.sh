wget https://cache.agilebits.com/dist/1P/op/pkg/v1.12.4/op_linux_amd64_v1.12.4.zip -O /tmp/op.zip
unzip /tmp/op.zip -d /tmp/
gpg --receive-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
gpg --verify /tmp/op.sig /tmp/op
mv /tmp/op /usr/local/bin
rm /tmp/op.zip
rm /tmp/op.sig

apt-get install expect expect-dev -y
autoexpect -f auto_onepassword.exp op signin my
