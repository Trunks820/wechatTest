# WeChatPadPro 云服务器配置指南

## 🔧 配置修改清单

### 1. 已完成的修改
- ✅ **docker-compose.yml**: 已将硬编码IP地址替换为环境变量

### 2. 需要手动修改的配置

#### 📝 更新 .env 文件
请用以下内容替换你的 `.env` 文件：

```ini
# ==========================================
# WeChat Pad Pro 云服务器配置文件
# ==========================================

# WeChat Pad Pro 主要配置
WECHAT_PORT=8081

# 数据库配置
DB_HOST=47.106.217.116
DB_PORT=3306
DB_DATABASE=weixin
DB_USERNAME=admin
DB_PASSWORD=Wy1997@Kakarot

# Redis配置
REDIS_HOST=47.106.217.116
REDIS_PORT=6379
REDIS_DB=0
REDIS_PASSWORD=Wy1997@Kakarot

# 其他核心配置
DEBUG=false
HOST=0.0.0.0
PORT=1238

# ==========================================
# 【重要】安全配置 - 请务必修改！
# ==========================================
# 管理员密钥（请修改为复杂的随机字符串，至少16位）
ADMIN_KEY=YOUR_SECURE_ADMIN_KEY_HERE_$(date +%s)

# API版本前缀（如 /v1, /v2）
API_VERSION

# MCP服务端口（用于AI大模型集成服务）
MCP_PORT=8099

# 推广公众号微信ID（用于新用户首次登录时推广）
GH_WXID=

# ==========================================
# Redis高级配置
# ==========================================
REDIS_PASS=Wy1997@Kakarot
REDIS_MAX_IDLE=30
REDIS_MAX_ACTIVE=100
REDIS_IDLE_TIMEOUT=5000
REDIS_MAX_CONN_LIFETIME=3600
REDIS_CONNECT_TIMEOUT=5000
REDIS_READ_TIMEOUT=10000
REDIS_WRITE_TIMEOUT=10000

# ==========================================
# 应用配置
# ==========================================
TZ=Asia/Shanghai
WORKER_POOL_SIZE=500
MAX_WORKER_TASK_LEN=1000

# 【重要】Web域名配置 - 请修改为你的实际域名或IP
WEB_DOMAIN=47.106.217.116:1238

WEB_TASK_NAME=
WEB_TASK_APP_NUMBER=
NEWS_SYN_WXID=true
DT=true

# ==========================================
# 任务配置
# ==========================================
TASK_RETRY_COUNT=3
TASK_RETRY_INTERVAL=5
HEARTBEAT_INTERVAL=25
AUTO_AUTH_INTERVAL=30
AUTO_SYNC_INTERVAL_MINUTES=30
TASK_EXEC_WAIT_TIMES=500
QUEUE_EXPIRE_TIME=86400

# ==========================================
# WebSocket配置
# ==========================================
WS_HANDSHAKE_TIMEOUT=10
WS_READ_BUFFER_SIZE=4096
WS_WRITE_BUFFER_SIZE=4096
WS_READ_DEADLINE=120
WS_WRITE_DEADLINE=60
WS_PING_INTERVAL=25
WS_CONNECTION_CHECK_INTERVAL=45
WS_MAX_MESSAGE_SIZE=8192

# ==========================================
# 消息队列配置（可选，根据需要启用）
# ==========================================
TOPIC=wx_sync_msg_topic
ROCKET_MQ_ENABLED=false
ROCKET_MQ_HOST=127.0.0.1:9876
ROCKET_ACCESS_KEY=123
ROCKET_SECRET_KEY=123!#@13$
RABBIT_MQ_ENABLED=false
RABBIT_MQ_URL=amqp://yunkong:123456@127.0.0.1:5672/
KAFKA_ENABLED=false
KAFKA_URL=
KAFKA_USERNAME=
KAFKA_PASSWORD=
```

## 🔐 安全配置建议

### 1. 必须修改的配置项

#### 🚨 管理员密钥
```ini
# 当前配置（不安全）
ADMIN_KEY=999222

# 建议修改为（请生成随机字符串）
ADMIN_KEY=A7x9B2m8E5q3F6n1K4p7L9r2S8w5T1u6
```

#### 🔗 Web域名配置
```ini
# 修改为你的实际服务器IP
WEB_DOMAIN=47.106.217.116:1238
```

### 2. 网络安全建议

#### 防火墙配置
```bash
# 开放必要端口
sudo ufw allow 1238/tcp    # WeChatPadPro主服务
sudo ufw allow 8099/tcp    # MCP服务（如果需要）
sudo ufw allow 22/tcp      # SSH
sudo ufw enable
```

#### 数据库安全
- 建议为MySQL和Redis设置不同的密码
- 考虑使用更强的密码策略
- 定期备份数据库

### 3. 监控和日志

#### 服务状态监控
```bash
# 查看服务状态
docker-compose ps

# 查看日志
docker-compose logs -f wechatpadpro
```

#### 资源监控
```bash
# 监控系统资源
htop
df -h
free -h
```

## 📋 部署检查清单

### 部署前检查
- [ ] 已更新 `.env` 文件配置
- [ ] 已修改 `ADMIN_KEY` 为复杂密钥
- [ ] 已配置防火墙规则
- [ ] 已确认MySQL和Redis服务正常运行
- [ ] 已备份重要数据

### 部署后验证
- [ ] 服务能正常启动 (`docker-compose up -d`)
- [ ] 服务端口正常监听 (`netstat -tlnp | grep 1238`)
- [ ] 可以访问管理界面 (`http://你的IP:1238`)
- [ ] 日志没有错误信息 (`docker-compose logs`)

## 🚀 部署命令

```bash
# 1. 进入部署目录
cd WeChatPadPro/deploy

# 2. 停止现有服务（如果有）
docker-compose down

# 3. 拉取最新镜像
docker-compose pull

# 4. 启动服务
docker-compose up -d

# 5. 查看状态
docker-compose ps
docker-compose logs -f
```

## 🔧 故障排除

### 常见问题

1. **服务无法启动**
   - 检查端口是否被占用
   - 查看日志确认错误信息
   - 验证配置文件格式

2. **无法连接数据库**
   - 确认数据库服务正常运行
   - 检查网络连接
   - 验证用户名密码

3. **Redis连接失败**
   - 确认Redis服务状态
   - 检查密码配置
   - 验证网络连接

### 联系支持
如果遇到问题，可以通过以下方式获取支持：
- GitHub Issues: https://github.com/WeChatPadPro/WeChatPadPro/issues
- Telegram群组: https://t.me/+LK0JuqLxjmk0ZjRh 