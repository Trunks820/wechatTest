# Windows 用户云服务器部署指南

## 🔧 准备工作

### 1. 安装必要工具
- **WinSCP** - 文件传输工具
- **PuTTY** - SSH连接工具
- **Git for Windows** - 版本控制工具

### 2. 配置服务器信息
```
服务器IP: 47.106.217.116
用户名: root
端口: 22
```

## 🚀 部署方式选择

### 方式一：WinSCP + PuTTY 手动部署

#### 步骤1：准备本地文件
```cmd
# 在项目根目录创建部署包
mkdir deploy-package
copy deploy\* deploy-package\

# 修改 deploy-package\.env 文件
# 添加必要配置：
# ADMIN_KEY=你的复杂密钥
# WEB_DOMAIN=47.106.217.116:1238
# TZ=Asia/Shanghai
```

#### 步骤2：使用WinSCP上传
1. 打开WinSCP
2. 连接到服务器 (47.106.217.116)
3. 上传 `deploy-package` 文件夹到 `/opt/wechatpadpro/`

#### 步骤3：使用PuTTY执行部署
```bash
# 连接到服务器
ssh root@47.106.217.116

# 进入部署目录
cd /opt/wechatpadpro/deploy-package

# 安装Docker（如果未安装）
yum install -y docker docker-compose
systemctl start docker
systemctl enable docker

# 启动服务
docker-compose up -d

# 检查状态
docker-compose ps
docker-compose logs -f
```

### 方式二：Git 部署（推荐）

#### 在服务器上直接克隆
```bash
# 1. SSH连接到服务器
ssh root@47.106.217.116

# 2. 克隆项目
git clone https://github.com/WeChatPadPro/WeChatPadPro.git
cd WeChatPadPro/deploy

# 3. 修改配置文件
vi .env
# 添加以下配置：
# ADMIN_KEY=你的复杂密钥
# WEB_DOMAIN=47.106.217.116:1238
# TZ=Asia/Shanghai

# 4. 部署
docker-compose up -d
```

### 方式三：一键部署脚本

#### 使用Git Bash运行脚本
```bash
# 在项目根目录，使用Git Bash运行
chmod +x deploy-script.sh
./deploy-script.sh
```

## 🔧 Windows环境下的详细步骤

### 1. 使用PowerShell上传文件
```powershell
# 安装OpenSSH客户端（Windows 10 1809+）
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# 上传文件到服务器
scp -r deploy root@47.106.217.116:/tmp/

# 连接到服务器
ssh root@47.106.217.116
```

### 2. 使用PSCP上传文件
```cmd
# 下载PuTTY套件中的PSCP
# 上传文件
pscp -r deploy root@47.106.217.116:/tmp/

# 使用PuTTY连接
putty root@47.106.217.116
```

### 3. 使用FTP工具
- **FileZilla** - 免费FTP客户端
- **WinSCP** - Windows专用SCP客户端

## 🔒 安全配置

### 1. 配置防火墙
```bash
# 在服务器上执行
ufw allow 1238/tcp
ufw allow 22/tcp
ufw enable
```

### 2. 修改SSH端口（可选）
```bash
# 修改SSH配置
vi /etc/ssh/sshd_config
# 修改端口号，重启SSH服务
systemctl restart sshd
```

## 📊 部署后验证

### 1. 检查服务状态
```bash
# 检查Docker容器
docker ps

# 检查服务日志
docker-compose logs -f wechatpadpro

# 检查端口监听
netstat -tlnp | grep 1238
```

### 2. 访问测试
- 浏览器访问: `http://47.106.217.116:1238`
- 检查管理界面是否正常

### 3. 功能测试
- 登录管理后台
- 检查数据库连接
- 测试基本功能

## 🚨 常见问题

### 1. 连接被拒绝
- 检查服务器防火墙设置
- 确认端口是否开放
- 验证服务是否启动

### 2. 上传失败
- 检查网络连接
- 验证服务器用户权限
- 确认目标目录存在

### 3. 服务启动失败
- 查看Docker日志
- 检查配置文件格式
- 验证依赖服务状态

## 🔧 维护命令

```bash
# 查看服务状态
docker-compose ps

# 重启服务
docker-compose restart

# 更新服务
docker-compose pull
docker-compose up -d

# 备份数据
docker exec wechatpadpro_mysql mysqldump -u root -p wechatpadpro > backup.sql

# 查看日志
docker-compose logs -f --tail=100
```

## 📞 技术支持

如果在部署过程中遇到问题：
- GitHub Issues: https://github.com/WeChatPadPro/WeChatPadPro/issues
- Telegram群组: https://t.me/+LK0JuqLxjmk0ZjRh 