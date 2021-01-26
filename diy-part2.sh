#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.31.200/g' package/base-files/files/bin/config_generate
wget -O package/base-files/files/etc/hosts https://raw.githubusercontent.com/chenxiccc/Customfiles/master/hosts
wget -O tmp/dhcp.tmp https://raw.githubusercontent.com/chenxiccc/Customfiles/master/newifi3/dhcp
cat tmp/dhcp.tmp >> package/network/services/dnsmasq/files/dhcp.conf
rm tmp/dhcp.tmp
wget -O tmp/firewall.tmp https://raw.githubusercontent.com/chenxiccc/Customfiles/master/newifi3/firewall
cat tmp/firewall.tmp >> package/network/config/firewall/files/firewall.config
rm tmp/firewall.tmp
