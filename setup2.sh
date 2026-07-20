#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi
clear
# // Exporting Language to UTF-8
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
BIRed='\033[1;91m'
red='\e[1;31m'
bo='\e[1m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

# // Export Banner Status Information
export EROR="[${RED} ERROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host (ชี้ไปที่คลังหลักของคุณเพื่อความปลอดภัย)
export Server_URL="raw.githubusercontent.com/NevermoreSSH/Blueblue/main/test"
export Server1_URL="raw.githubusercontent.com/NevermoreSSH/Blueblue/main/limit"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther=".geovpn"

# // Exporting Script Version
export VERSION="1.1"
 
# // Exporting IP Address Information (แก้ไขให้รองรับทั้ง IPv6 และ IPv4)
export IP=$( curl -6 -s https://ifconfig.me/ip || curl -s https://ipinfo.io/ip )

# // Set Time To Bangkok / GMT +7 (เปลี่ยนเป็นเวลาไทย)
ln -fs /usr/share/zoneinfo/Asia/Bangkok /etc/localtime

# // cek old script
if [[ -r /etc/xray/domain ]]; then
echo -e "${INFO} Having Script Detected !"
echo -e "${INFO} If You Replacing Script, All Client Data On This VPS Will Be Cleanup !"
read -p "Are You Sure Wanna Replace Script ? (Y/N) " josdong
if [[ $josdong == "Y" || $josdong == "y" ]]; then
		clear
		echo -e "${INFO} Starting Replacing Script !"
		rm -rf /var/lib/scrz-prem 
elif [[ $josdong == "N" || $josdong == "n" ]]; then
		echo -e "${INFO} Action Canceled !"
		exit 1
else
		echo -e "${EROR} Your Input Is Wrong !"
		exit 1
fi
clear
fi

echo -e "${GREEN}Starting Installation............${NC}"
# // Go To Root Directory
cd /root/

# // Remove old web/service files
apt-get remove --purge nginx* -y
apt-get remove --purge nginx-common* -y
apt-get remove --purge nginx-full* -y
apt-get remove --purge dropbear* -y
apt-get remove --purge stunnel4* -y
apt-get remove --purge apache2* -y
apt-get remove --purge ufw* -y
apt-get remove --purge firewalld* -y
apt-get remove --purge exim4* -y
apt autoremove -y

# // Update Packages
apt update -y

# // Install Requirement Tools
apt-get --reinstall --fix-missing install -y sudo dpkg psmisc socat jq ruby wondershaper python2 tmux nmap bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip vim gnupg gnupg1 bc apt-transport-https build-essential gcc g++ automake make autoconf perl m4 dos2unix dropbear libreadline-dev zlib1g-dev libssl-dev dirmngr libxml-parser-perl neofetch git lsof iptables iptables-persistent fail2ban vnstat libsqlite3-dev cron bash-completion ntpdate xz-utils gnupg2 dnsutils lsb-release chrony
gem install lolcat

# // Update & Upgrade
apt update -y
apt upgrade -y
apt dist-upgrade -y

# // Clear Screens
clear; clear; clear

# // Folder Sistem Yang Tidak Boleh Di Hapus
mkdir -p /usr/bin
# // Remove File & Directory
rm -fr /usr/local/bin/xray
rm -fr /usr/local/bin/stunnel
rm -fr /usr/local/bin/stunnel5
rm -fr /etc/nginx
rm -fr /var/lib/scrz-prem/
rm -fr /usr/bin/xray
rm -fr /etc/xray
rm -fr /usr/local/etc/xray

# // Making Directory 
mkdir -p /etc/nginx
mkdir -p /var/lib/scrz-prem/
mkdir -p /usr/bin/xray
mkdir -p /etc/xray
mkdir -p /usr/local/etc/xray

# // แก้ไขบั๊กสำคัญ: บันทึกค่า IP ตัวแปรที่ถูกต้องลงไฟล์คอนฟิกหลัก
mkdir -p /var/lib/scrz-prem >/dev/null 2>&1
echo "IP=$IP" > /var/lib/scrz-prem/ipvps.conf

# // เรียกสคริปต์จัดการโดเมน (ตัวที่เราโมดิฟายให้กรอก IPv6 เอง)
wget https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/cf.sh && chmod +x cf.sh && ./cf.sh

sleep 2

# โหลดระบบจัดการ Network (jembot.sh)
echo -e "$white\033[0;34m┌─────────────────────────────────────────┐${NC}"
echo -e " \E[41;1;39m            ⇱ Install Jembot ⇲            \E[0m$NC"
echo -e "$white\033[0;34m└─────────────────────────────────────────┘${NC}"
sleep 1 
wget -q https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/jembot.sh && chmod +x jembot.sh && ./jembot.sh

# โหลดระบบ SSH / WebSocket
echo -e "$white\033[0;34m┌─────────────────────────────────────────┐${NC}"
echo -e " \E[41;1;39m          ⇱ Install SSH / WS ⇲           \E[0m$NC"
echo -e "$white\033[0;34m└─────────────────────────────────────────┘${NC}"
sleep 1
wget -q https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/ssh-vpn2.sh && chmod +x ssh-vpn2.sh && ./ssh-vpn2.sh

# โหลดตัวติดตั้ง Xray Core
echo -e "$white\033[0;34m┌─────────────────────────────────────────┐${NC}"
echo -e " \E[41;1;39m            ⇱ Install Xray ⇲              \E[0m$NC"
echo -e "$white\033[0;34m└─────────────────────────────────────────┘${NC}"
sleep 1 
wget -q https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
wget -q https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh

# // Download Data (ดาวน์โหลดคำสั่งควบคุมย่อยต่างๆ)
echo -e "${GREEN}Download Data${NC}"
wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/add-ws.sh"
wget -q -O /usr/bin/add-ssws "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/add-ssws.sh"
wget -q -O /usr/bin/add-socks "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/add-socks.sh"
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/add-vless.sh"
wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/add-tr.sh"
wget -q -O /usr/bin/add-trgo "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/add-trgo.sh"
wget -q -O /usr/bin/autoreboot "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/autoreboot.sh"
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/restart.sh"
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/tendang.sh"
wget -q -O /usr/bin/clearlog "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/clearlog.sh"
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/running.sh"
wget -q -O /usr/bin/cek-trafik "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/cek-trafik.sh"
wget -q -O /usr/bin/cek-speed "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/speedtes_cli.py"
wget -q -O /usr/bin/cek-bandwidth "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/cek-bandwidth.sh"
wget -q -O /usr/bin/cek-ram "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/ram.sh"
wget -q -O /usr/bin/limit-speed "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/limit-speed.sh"
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/menu-vless.sh"
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/menu-vmess.sh"
wget -q -O /usr/bin/menu-socks "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/menu-socks.sh"
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/menu-ss.sh"
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/menu-trojan.sh"
wget -q -O /usr/bin/menu-trgo "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/menu-trgo.sh"
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/menu-ssh.sh"
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/usernew.sh"
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/menu4.sh"
wget -q -O /usr/bin/wbm "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/webmin.sh"
wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/xp.sh"
wget -q -O /usr/bin/update "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/update.sh"
wget -q -O /usr/bin/dns "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/dns.sh"
wget -q -O /usr/bin/netf "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/netf.sh"
wget -q -O /usr/bin/bbr "https://raw.githubusercontent.com/NevermoreSSH/Blueblue/main/bbr.sh"

chmod +x /usr/bin/add-ws /usr/bin/add-ssws /usr/bin/add-socks /usr/bin/add-vless /usr/bin/add-tr /usr/bin/add-trgo /usr/bin/usernew /usr/bin/autoreboot /usr/bin/restart /usr/bin/tendang /usr/bin/clearlog /usr/bin/running /usr/bin/cek-trafik /usr/bin/cek-speed /usr/bin/cek-bandwidth /usr/bin/cek-ram /usr/bin/limit-speed /usr/bin/menu-vless /usr/bin/menu-vmess /usr/bin/menu-ss /usr/bin/menu-socks /usr/bin/menu-trojan /usr/bin/menu-trgo /usr/bin/menu-ssh /usr/bin/menu /usr/bin/wbm /usr/bin/xp /usr/bin/update /usr/bin/dns /usr/bin/netf /usr/bin/bbr

# > install gotop
gotop_link="https://github.com/NevermoreSSH/gotop/releases/download/gotopV4/gotop_v4.2.0_linux_amd64.deb"
curl -sL "$gotop_link" -o /tmp/gotop.deb
dpkg -i /tmp/gotop.deb >/dev/null 2>&1

# > Setup Crontab
echo "0 0 * * * root xp" >> /etc/crontab
echo "0 3 * * * root /usr/bin/xp" >> /etc/crontab
echo "0 5 * * * root reboot" >> /etc/crontab
cd

cat > /etc/cron.d/xp_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
2 0 * * * root /usr/bin/xp
END

cat > /etc/cron.d/cl_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
2 1 * * * root /usr/bin/clearlog
END

cat > /home/re_otm <<-END
7
END

service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1

clear
cat> /root/.profile << END
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
mesg n || true
clear
menu
END
chmod 644 /root/.profile

# Cleanup old logs
rm -fr /root/log-install.txt /etc/afak.conf
if [ ! -f "/etc/log-create-user.log" ]; then
		echo "Log All Account " > /etc/log-create-user.log
fi
history -c
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]; then gg="PM"; else gg="AM"; fi

# ลบโค้ดส่วนที่แอบสร้าง Git Remote และแอบสั่ง Push ข้อมูลลิขสิทธิ์และ IP ของผู้ใช้ออกเพื่อความปลอดภัย

echo "1.1" >> /home/.ver
curl -sS ifconfig.me > /etc/myipvps
clear
echo "====================-[ NevermoreSSH TUNNELING ]-===================="
echo ""
echo "------------------------------------------------------------"
echo ""
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                  : 22"  | tee -a log-install.txt
echo "   - SSH Websocket            : 80" | tee -a log-install.txt
echo "   - SSH SSL Websocket        : 443" | tee -a log-install.txt
echo "   - Stunnel5                 : 447, 777" | tee -a log-install.txt
echo "   - Dropbear                 : 109, 143" | tee -a log-install.txt
echo "   - Nginx                    : 81" | tee -a log-install.txt
echo "   - XRAY  Vmess TLS          : 443" | tee -a log-install.txt
echo "   - XRAY  Vmess None TLS     : 80" | tee -a log-install.txt
echo "   - XRAY  Vless TLS          : 443" | tee -a log-install.txt
echo "   - XRAY  Vless None TLS     : 80" | tee -a log-install.txt
echo "   - Trojan WS                : 443" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                 : Asia/Bangkok (GMT +7)"  | tee -a log-install.txt
echo "   - IPv6                     : [ON]"  | tee -a log-install.txt
echo "   - Fully automatic script modified by Thinnakorn" | tee -a log-install.txt
echo "------------------------------------------------------------"
echo ""
rm -fr /root/weleh.sh /root/jembot.sh /root/ssh-vpn2.sh /root/ins-xray.sh /root/setup2.sh /root/domain
history -c

read -p "$( echo -e "Press ${NC}${GREEN}Enter${NC} For Reboot") "
reboot
