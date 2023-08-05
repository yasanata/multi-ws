#!/bin/bash
cd
mkdir -p /etc/udpp

# change to time GMT+7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# installing
apt install ruby figlet jq -y
gem install lolcat

# install udp-custom
echo downloading udp-custom
wget "https://github.com/SSHSEDANG4/multiws/raw/main/udpcustom/udp-custom-linux-amd64" -O /etc/udpp/udp-custom
chmod +x /etc/udpp/udp-custom

echo downloading default config
wget "https://raw.githubusercontent.com/SSHSEDANG4/multiws/main/udpcustom/config.json" -O /etc/udpp/config.json
chmod 644 /etc/udpp/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=udp-custom by Ronggolawe86

[Service]
User=root
Type=simple
ExecStart=/etc/udpp/udp-custom server
WorkingDirectory=/etc/udpp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=udp-custom by JAGOANNEON

[Service]
User=root
Type=simple
ExecStart=/etc/udpp/udp-custom server -exclude 1194,7100,7200,7300,7400,7500
WorkingDirectory=/etc/udpp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

echo start service udp-custom
systemctl start udp-custom &>/dev/null

echo enable service udp-custom
systemctl enable udp-custom &>/dev/null

echo restart service udp-custom
systemctl restart udp-custom &>/dev/null

echo restart cron
systemctl restart cron &>/dev/null

clear
echo " "
echo "==========SCRIPT UDP SUKSES TERINSTAL==========="
echo " "
echo "=================-SCRIPT BY JAGOANNEON-==============" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "   - Dev/Main           : RONGGOLAWE86" | tee -a log-install.txt
echo "   - Telegram           : t.me/ronggolawe1986" | tee -a log-install.txt
echo "   - Whatsapp           : https://wa.me/6283857684916" | tee -a log-install.txt
echo "   - Facebook           : https://fb.com/generasironggolawetuban" | tee -a log-install.txt
echo "--------Script Created By JAGOANNEON------" | tee -a log-install.txt
echo ""
echo "========SUKSES MENGINSTALL UDP-CUSTOM========"
echo "===============KETIK MENU-UDP================"
echo ""
echo ""
echo " Server Akan Melakukan Restart Otomatis Dalam 5 detik"
sleep 1
echo " 5...."
sleep 1
echo " 4...."
sleep 1
echo " 3...."
sleep 1
echo " 2...."
sleep 1
echo " 1...."
sleep 1
echo "Reboot Server Di Lakukan Tunggu 1-2 menit Lalu Login Kembali"
rm -rf install-udp
reboot
