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
sed -i 's/192.168.1.1/10.10.10.6/g' package/base-files/files/bin/config_generate

 
#'删除argon主题，并拉最新版'
rm -rf package/lean/luci-theme-edge
git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/lean/luci-theme-edge

#'godproxy'
rm -rf package/lean/luci-app-godproxy
git clone https://github.com/godros/luci-app-godproxy.git package/lean/luci-app-godproxy

# theme: atmaterial	
rm -rf package/lean/luci-theme-atmaterial	
git clone https://github.com/sypopo/luci-theme-atmaterial.git  package/lean/luci-theme-atmaterial	

cat >> .config <<EOF	
CONFIG_PACKAGE_luci-theme-atmaterial=y	
CONFIG_PACKAGE_luci-theme-edge=y	
EOF	


#'设置默认主题'
default_theme='atmaterial'	
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci

