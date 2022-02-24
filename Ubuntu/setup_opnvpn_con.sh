PW_OPNVPN=$(op get item 4gpse5fv77e5rjnuxmr2z5mgva --fields password)

nmcli connection import type openvpn file /home/funkyfrank/Workspace/admin-container/opnvpn/OpenVPN_openvpn_hetzner.ovpn
nmcli connection modify OpenVPN_openvpn_hetzner +vpn.data username=openvpn_hetzner

sudo chown -R funkyfrank:funkyfrank /etc/NetworkManager/system-connections/

sed -i -e "s/.*password-flag.*/password-flags=0/" /etc/NetworkManager/system-connections/OpenVPN_openvpn_hetzner.nmconnection

echo "[vpn-secrets]" >> /etc/NetworkManager/system-connections/OpenVPN_openvpn_hetzner.nmconnection
echo "password=$PW_OPNVPN" >> /etc/NetworkManager/system-connections/OpenVPN_openvpn_hetzner.nmconnection

sudo chown -R root:root /etc/NetworkManager/system-connections/


sudo systemctl restart NetworkManager

sleep 15

nmcli con up id OpenVPN_openvpn_hetzner
