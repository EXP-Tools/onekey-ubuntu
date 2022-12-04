# onekey-ubuntu

> ubuntu 一键装机脚本

------


## 前言

虽然现在 docker 很流行，但是每次买云主机时，一些基本的主机配置还是必须的。

但这些配置命令也不少，都要重新执行一遍去初始化配置环境，所以就干脆把它们都封装了 ...


## 运行环境

![](https://img.shields.io/badge/Ubuntu%20x64-red.svg)


## 使用

在 ubuntu 上**用 root 用户**执行以下命令即可: 

1. 下载仓库: `git clone https://github.com/lyy289065406/onekey-ubuntu`
2. 切换目录: `cd onekey-ubuntu`
3. 一键装机: `./onekey.sh`


## 测试

此工程所有脚本都封装在 [modules](./modules/) 目录下，可以启动 docker 环境测试它们:

1. 构建 docker 测试镜像: `bin/build.[sh|ps1]`
2. 运行 docker 测试容器: `bin/run.[sh|ps1]`
3. 进入 docker 交互终端: `bin/terminal.[sh|ps1]`（此工程挂载在 `/test_script` 目录下）
4. 停止 docker 测试容器: `bin/stop.[sh|ps1]`


> 部分命令只能依赖主机环境执行，docker 环境是跑不起来的，例如 [`vm.sh`](./modules/vm.sh) 设置虚拟内存命令


## 目录

```
onekey-ubuntu
|-- modules .................... [装机脚本模块]
|   |-- apt.sh ................. [apt 常用软件安装]
|   |-- python.sh .............. [python 安装]
|   |-- env.sh ................. [系统环境配置（含时区/语言等）]
|   |-- vm.sh .................. [虚拟内存配置]
|   |-- ohmyzsh.sh ............. [ohmyzsh 安装配置]
|   |-- ssh.sh ................. [ssh 免密配置]
|   `-- cron.sh ................ [crontab 日志配置]
|-- onekey.sh .................. [一键装机脚本]
|-- bin ........................ [测试环境 docker 操作脚本]
|   |-- build.ps1 .............. [镜像构建脚本]
|   |-- build.sh ............... [镜像构建脚本]
|   |-- run.ps1 ................ [容器运行脚本]
|   |-- run.sh ................. [容器运行脚本]
|   |-- terminal.ps1 ........... [进入交互终端脚本]
|   |-- terminal.sh ............ [进入交互终端脚本]
|   |-- stop.ps1 ............... [镜像停止脚本]
|   `-- stop.sh ................ [镜像停止脚本]
|-- docker-compose.yml ......... [测试环境镜像编排剧本]
|-- Dockerfile ................. [测试环境镜像 Dockerfile]
|-- LICENSE .................... [此工程 License]
`-- README.md .................. [此工程说明文档]
```