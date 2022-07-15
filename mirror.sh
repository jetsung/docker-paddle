#!/usr/bin/env bash

# 腾讯云源
pip config set global.index-url  https://mirrors.cloud.tencent.com/pypi/simple  --trusted-host mirrors.cloud.tencent.com

# debian 北外源
sed -i 's/http:\/\/deb.debian.org/https:\/\/mirrors.bfsu.edu.cn/g' /etc/apt/sources.list
