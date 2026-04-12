#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.2/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/OpenWrt/TR3000/g' package/base-files/files/bin/config_generate

# 关闭 DHCP（旁路由用）
sed -i "s/option ignore '0'/option ignore '1'/" package/network/services/dnsmasq/files/dhcp.conf

# OpenClash
git clone -b https://github.com/vernesong/OpenClash package/OpenClash

# Passwall
#git clone https://github.com/xiaorouji/openwrt-passwall package/passwall

# Fileshare
git clone https://github.com/ku891/fileshare-openwrt.git package/fileshare
