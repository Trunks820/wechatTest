#!/bin/bash

# WeChatPadPro 云服务器部署脚本
# 使用方法：chmod +x deploy-script.sh && ./deploy-script.sh

echo "🚀 WeChatPadPro 云服务器部署脚本"
echo "=================================="

# 配置变量
SERVER_IP="47.106.217.116"
SERVER_USER="root"
PROJECT_NAME="wechatTest"
DEPLOY_PATH="/opt/wechatpadpro"

echo "📋 部署信息："
echo "服务器IP: $SERVER_IP"
echo "用户: $SERVER_USER"
echo "部署路径: $DEPLOY_PATH"
echo ""

# 检查本地文件
if [ ! -f "deploy/docker-compose.yml" ]; then
    echo "❌ 错误：未找到 deploy/docker-compose.yml 文件"
    echo "请在项目根目录运行此脚本"
    exit 1
fi

if [ ! -f "deploy/.env" ]; then
    echo "❌ 错误：未找到 deploy/.env 文件"
    echo "请先创建并配置 .env 文件"
    exit 1
fi

echo "✅ 本地文件检查通过"

# 创建部署包
echo "📦 创建部署包..."
rm -rf deploy-package
mkdir deploy-package
cp -r deploy/* deploy-package/

# 压缩部署包
tar -czf wechatpadpro-deploy.tar.gz deploy-package/
echo "✅ 部署包创建完成: wechatpadpro-deploy.tar.gz"

# 上传到服务器
echo "📤 上传部署包到服务器..."
scp wechatpadpro-deploy.tar.gz $SERVER_USER@$SERVER_IP:/tmp/

# 在服务器上执行部署
echo "🔧 在服务器上执行部署..."
ssh $SERVER_USER@$SERVER_IP << 'EOF'
# 设置变量
DEPLOY_PATH="/opt/wechatpadpro"
PROJECT_NAME="wechatTest"

echo "🔧 服务器端部署开始..."

# 创建部署目录
mkdir -p $DEPLOY_PATH
cd $DEPLOY_PATH

# 备份旧版本（如果存在）
if [ -d "$PROJECT_NAME" ]; then
    echo "📋 备份旧版本..."
    mv $PROJECT_NAME ${PROJECT_NAME}_backup_$(date +%Y%m%d_%H%M%S)
fi

# 解压新版本
echo "📦 解压部署包..."
tar -xzf /tmp/wechatpadpro-deploy.tar.gz
mv deploy-package $PROJECT_NAME
cd $PROJECT_NAME

# 检查Docker是否安装
if ! command -v docker &> /dev/null; then
    echo "🔧 安装Docker..."
    # CentOS/RHEL
    if command -v yum &> /dev/null; then
        yum install -y docker docker-compose
    # Ubuntu/Debian
    elif command -v apt-get &> /dev/null; then
        apt-get update
        apt-get install -y docker.io docker-compose
    fi
fi

# 启动Docker服务
echo "🔧 启动Docker服务..."
systemctl start docker
systemctl enable docker

# 部署应用
echo "🚀 部署应用..."
docker-compose down 2>/dev/null || true
docker-compose pull
docker-compose up -d

# 等待服务启动
echo "⏳ 等待服务启动..."
sleep 10

# 检查服务状态
echo "📊 检查服务状态..."
docker-compose ps

# 检查端口
echo "🔍 检查端口监听..."
netstat -tlnp | grep :1238 || echo "⚠️  警告: 端口1238未监听"

# 清理临时文件
rm -f /tmp/wechatpadpro-deploy.tar.gz

echo "✅ 服务器端部署完成！"
echo "🌐 访问地址: http://47.106.217.116:1238"
echo "🔧 查看日志: docker-compose logs -f"
EOF

# 清理本地临时文件
rm -rf deploy-package
rm -f wechatpadpro-deploy.tar.gz

echo ""
echo "🎉 部署完成！"
echo "🌐 访问地址: http://$SERVER_IP:1238"
echo "🔧 查看日志: ssh $SERVER_USER@$SERVER_IP 'cd $DEPLOY_PATH/$PROJECT_NAME && docker-compose logs -f'"
echo "📊 查看状态: ssh $SERVER_USER@$SERVER_IP 'cd $DEPLOY_PATH/$PROJECT_NAME && docker-compose ps'" 