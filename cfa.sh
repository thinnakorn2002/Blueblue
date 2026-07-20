#!/bin/bash
clear

# ==========================================
# Color การตกแต่งตามสไตล์สคริปต์เดิม
# ==========================================
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}===========================================${NC}"
echo -e "      MANUAL DOMAIN SETUP FOR IPV6 & WS     "
echo -e "${CYAN}===========================================${NC}"
echo ""

# 1. เปิดให้คุณกรอกโดเมนที่ผูกกับ IPv6 ของคุณเองตรงๆ
read -p "Input your domain (e.g., v6.devpetch.com): " USER_DOMAIN

# ตรวจสอบเผื่อกด Enter ผ่านไปเฉยๆ
if [[ -z "$USER_DOMAIN" ]]; then
    echo -e "\033[0;31m[ ERROR ] Domain cannot be empty!\033[0m"
    exit 1
fi

# 2. จัดเตรียมโฟลเดอร์ระบบที่สคริปต์ตัวอื่นๆ วิ่งมาเรียกใช้งาน
mkdir -p /root
mkdir -p /usr/bin/xray
mkdir -p /etc/xray
mkdir -p /var/lib/scrz-prem

# 3. บันทึกค่าโดเมนลงไฟล์ระบบตามพิมพ์เขียวที่สคริปต์ต้องการทั้งหมด
echo "$USER_DOMAIN" > /root/domain
echo "$USER_DOMAIN" > /etc/xray/domain
echo "IP=$USER_DOMAIN" > /var/lib/scrz-prem/ipvps.conf

echo ""
echo -e "Host Configured : ${GREEN}$USER_DOMAIN${NC}"
echo -e "${GREEN}Domain configuration completed successfully!..${NC}"
sleep 2

# ลบไฟล์ตัวเองทิ้งตอนท้ายตามสเต็ปของสคริปต์เดิม เพื่อความสะอาด
rm -f /root/cf.sh
rm -f /root/cfa
