#!/bin/bash
pip3 install requests
wget https://github.com/ViRb3/wgcf/releases/download/v1.0.5/wgcf_1.0.5_linux_amd64
mv wgcf_1.0.5_linux_amd64 wgcf
chmod +x wgcf
echo "\n" |./wgcf register

wget https://raw.githubusercontent.com/holao09/cloudflare-vpn-for-desktop/master/cloudflare.py
cat wgcf-account.toml |grep device_id|awk '{print $3}'|python3 cloudflare.py 
