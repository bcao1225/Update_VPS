# Universal Script
`version 0.4`</br>
A new universal version which can work well on CentOS, Ubuntu and Debian.</br>
### ssss-U
1. Serverspeeder can work well on Debain 8 64bits without any settings, while other OS need a kernel supported. For more details, please click [here][1].
2. BBR also needs a kernel supported, in general, kernel 4.9+  can use it. If you use a dedicated/KVM vps/Xen vps and so on, you need change the kernel to install KVM-BBR. If you use a OpenVZ vps, please choose the OpenVZ-BBR(The port should between 9000-9999).</br>

`How to use`
```
wget --no-check-certificate -O ssss-U.sh https://raw.githubusercontent.com/bcao1225/Update_VPS/master/ssss-U.sh && chmod +x ssss-U.sh && bash ssss-U.sh
```

[1]: https://github.com/0oVicero0/serverSpeeder_Install



<br></br><br></br><br></br>
## OLD VERSION
update-U
This is a simple shell script for a new VPS/dedicated to update and install some softwares automaticly.</br>
It will work better if you personalize configuration on it.</br>
CentOS 5+/Debian 7+/Ubuntu 14.04+ are all supported.</br>
`How to use`
```
wget --no-check-certificate -O update-U.sh https://raw.githubusercontent.com/bcao1225/Update_VPS/master/update-U.sh && chmod +x update-U.sh && bash update-U.sh
```
Update VPS(old)
This is a simple shell script for a new VPS to update and install some softwares automaticly.</br>
The script for Debian/Ubuntu('update.sh') works well while the script for CentOS/Redhat('updateC.sh') has not been tested.</br>
It will work better if you personalize configuration on it.</br>
For Debian/Ubuntu:
```
wget --no-check-certificate -O update.sh https://raw.githubusercontent.com/bcao1225/Update_VPS/master/update.sh && chmod +x update.sh && bash update.sh
```
For CentOS/Redhat:
```
wget --no-check-certificate -O updateC.sh https://raw.githubusercontent.com/bcao1225/Update_VPS/master/updateC.sh && chmod +x updateC.sh && bash updateC.sh
```
Module
Debian8_ssss.sh
Only for KVM vps with Debain8 64bits OS!</br>
If the RAM is less than 256M, please choose libev version.</br>
```
wget --no-check-certificate -O debain8_ssss.sh https://raw.githubusercontent.com/bcao1225/Update_VPS/master/debain8_ssss.sh && chmod +x debain8_ssss.sh && bash debain8_ssss.sh
```
Debian8_ssssr.sh
Only for KVM vps with Debain8 64bits OS!</br>
If the RAM is less than 256M, please choose libev version.</br>
```
wget --no-check-certificate -O debain8_ssssr.sh https://raw.githubusercontent.com/bcao1225/Update_VPS/master/debain8_ssssr.sh && chmod +x debain8_ssssr.sh && bash debain8_ssssr.sh
```
openvz_bbrssD.sh
Only for vps with Debain8+/Ubuntu 16.04+ 64bits OS!</br>
The bbr need 16M+ RAM to run, if the RAM is less than 256M, please choose libev version.</br>
Only the port between 9000 to 9999 can use bbr. If you want to change it, please check `/root/lkl/run.sh` and `/root/lkl/haproxy.cfg`</br>
```
wget --no-check-certificate -O openvz_bbrssD.sh https://raw.githubusercontent.com/bcao1225/Update_VPS/master/openvz_bbrssD.sh && chmod +x openvz_bbrssD.sh && bash openvz_bbrssD.sh
```
openvz_bbrssC.sh
Only for vps with CentOS7+ 64bits OS!</br>
The bbr need 16M+ RAM to run, if the RAM is less than 256M, please choose libev version.</br>
Only the port between 9000 to 9999 can use bbr. If you want to change it, please check `/root/lkl/run.sh` and `/root/lkl/haproxy.cfg`</br>
```
wget --no-check-certificate -O openvz_bbrssC.sh https://raw.githubusercontent.com/bcao1225/Update_VPS/master/openvz_bbrssC.sh && chmod +x openvz_bbrssC.sh && bash openvz_bbrssC.sh
```

<br></br>
VPS开荒脚本(旧版)
此脚本主要是用来开荒新安装系统的VPS，包括一些常用软件的安装和系统更新。</br>
适用于Debian/Ubuntu的脚本'update.sh'已经经过测试，可以正常使用；适用于CentOS/Redhat的脚本'updateC.sh'尚未测试，但是理论上应该也可以正常使用。</br>
如果你经常使用到此脚本，强烈建议你对其进行个性化配置以发挥最大的效用。</br>
对于Debian/Ubuntu系统:
```
wget --no-check-certificate -O update.sh https://raw.githubusercontent.com/bcao1225/Update_VPS/master/update.sh && chmod +x update.sh && bash update.sh
```
对于CentOS/Redhat系统:
```
wget --no-check-certificate -O updateC.sh https://raw.githubusercontent.com/bcao1225/Update_VPS/master/updateC.sh && chmod +x updateC.sh && bash updateC.sh
```
