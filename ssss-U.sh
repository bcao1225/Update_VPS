#!/bin/bash
#URL: https://github.com/uselibrary/Update_VPS
#E-mail: mail@pa.ci
clear
echo "    ################################################"
echo "    #                                              #"
echo "    #            Install SSSS on Linux OS          #"
echo "    #                https://pa.ci               #"
echo "    #                 Version 0.4                  #"
echo "    ################################################"
#Prepare the installation environment
echo -e ""
echo -e "Prepare the installation environment."
if cat /etc/*-release | grep -Eqi "centos|red hat|redhat"; then
  echo "RPM-based"
  yum -y update
  if rpm -qa | grep -Eqi "unzip";then
    echo "unzip installed"
  else
    echo "unzip installing"
    yum -y install unzip
  fi
  if rpm -qa | grep -Eqi "virt-what";then
    echo "virt-what installed"
  else
    echo "virt-what installing"
    yum -y install virt-what
  fi
  if rpm -qa | grep -Eqi "net-tools";then
    echo "net-tools installed"
  else
    echo "net-tools installing"
    yum -y install net-tools
  fi
elif cat /etc/*-release | grep -Eqi "debian|ubuntu"; then
  echo "Debian-based"
  apt-get -y update
  if dpkg -l | grep -Eqi "unzip";then
    echo "unzip installed"
  else
    echo "unzip installing"
    apt-get -y install unzip
  fi
  if dpkg -l | grep -Eqi "virt-what";then
    echo "virt-what installed"
  else
    echo "virt-what installing"
    apt-get -y install virt-what
  fi
  if dpkg -l | grep -Eqi "net-tools";then
    echo "net-tools installed"
  else
    echo "net-tools installing"
    apt-get -y install net-tools
  fi
else
  echo "This release is not supported."
  exit
fi
#Check the virtualization
echo "Check the virtualization."
if virt-what | grep -Eqi "openvz"; then
  vir=1
else
  vir=2
fi
# drop caches
if [ "$vir" -eq 2 ]; then
  echo 1 > /proc/sys/vm/drop_caches
fi
#Install serverspeeder
if [ "$vir" -eq 2 ]; then
  echo -e ""
  read -p "Do you want to install server speeder? [Y/n] " serverspeeder
  if [[ ${serverspeeder} == "y" || ${serverspeeder} == "Y" ]]; then
    wget --no-check-certificate -O appex.sh https://raw.githubusercontent.com/0oVicero0/serverSpeeder_Install/master/appex.sh && chmod +x appex.sh && bash appex.sh install
    echo -e ""
    echo -e "Serverspeeder installed"
    echo 1 > /proc/sys/vm/drop_caches
  fi
fi
#Install OpenVZ-BBR
if [ "$vir" -eq 1 ]; then
  echo -e ""
  read -p "Do you want to install OpenVZ-BBR? [Y/n] " openvzbbr
  if [[ ${openvzbbr} == "y" || ${openvzbbr} == "Y" ]]; then
      wget --no-check-certificate -O bbr.sh https://github.com/91yun/uml/raw/master/lkl/install.sh && chmod +x bbr.sh && bash bbr.sh
      echo -e ""
      echo -e "OpenVZ-BBR installed"
  fi
fi
#Install KVM-BBR
if [ "$vir" -eq 2 ]; then
  echo -e ""
  echo -e "Only kernel>=4.9 can install."
  read -p "Do you want to install KVM-BBR? [Y/n] " kvmbbr
  if [[ ${kvmbbr} == "y" || ${kvmbbr} == "Y" ]]; then
    echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
    echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
    sysctl -p
    sysctl net.ipv4.tcp_available_congestion_control
    lsmod | grep bbr
    echo 1 > /proc/sys/vm/drop_caches
  fi
fi
#Install shadowsocks
echo -e ""
read -p "Do you want to install shadowsocks? [Y/n] " shadowsocks
if [[ ${shadowsocks} == "y" || ${shadowsocks} == "Y" ]]; then
    wget --no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh && chmod +x shadowsocks-all.sh && ./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log
    echo -e ""
    echo -e "Shadowsocks installed"
fi
#drop caches
if [ "$vir" -eq 2 ]; then
  echo 1 > /proc/sys/vm/drop_caches
fi
#Install shadowsocksR
echo -e ""
read -p "Do you want to install shadowsocksR? [Y/n] " shadowsocksR
if [[ ${shadowsocksR} == "y" || ${shadowsocksR} == "Y" ]]; then
    wget --no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocksR.sh && chmod +x shadowsocksR.sh && ./shadowsocksR.sh 2>&1 | tee shadowsocksR.log
    echo -e ""
    echo -e "ShadowsocksR installed"
fi
#drop caches
if [ "$vir" -eq 2 ]; then
  echo 1 > /proc/sys/vm/drop_caches
fi
#Reboot the system
echo ""
seconds_left=10
echo -e "The system will reboot in ${seconds_left} seconds.\nTo stop the reboot, press the CTRL+C key to cancel it."
while [ $seconds_left -gt 0 ];do
  echo -n $seconds_left
  sleep 1
  seconds_left=$(($seconds_left - 1))
  echo -ne "\r     \r"
done
echo "The system is rebooting."
sleep 1
reboot
