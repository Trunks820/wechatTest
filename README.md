# WeChatPadPro

<div align="center">
  <img src="static/doc/4270252wc57e-4b66-9ae3-0a81fc001255.png" alt="WeChatPadPro" width="600px">
</div>

<h1 align="center">🚀 基于 WeChat Pad 协议的微信管理工具</h1>

<p align="center">
  <a href="https://github.com/Trunks820/wechatTest">
    <img src="https://img.shields.io/badge/Version-v860-blue?style=for-the-badge" alt="版本">
  </a>
  <a href="https://github.com/Trunks820/wechatTest">
    <img src="https://img.shields.io/badge/iOS-18.5-brightgreen?style=for-the-badge" alt="iOS">
  </a>
  <br>
  <a href="https://github.com/Trunks820/wechatTest/stargazers">
    <img src="https://img.shields.io/github/stars/Trunks820/wechatTest?style=for-the-badge" alt="Stars">
  </a>
  <a href="https://github.com/Trunks820/wechatTest/network/members">
    <img src="https://img.shields.io/github/forks/Trunks820/wechatTest?style=for-the-badge" alt="Forks">
  </a>
  <a href="https://github.com/Trunks820/wechatTest/issues">
    <img src="https://img.shields.io/github/issues/Trunks820/wechatTest?style=for-the-badge" alt="Issues">
  </a>
</p>

<p align="center">
  <a href="#-项目介绍">📋 项目介绍</a> •
  <a href="#-功能特性">📝 功能特性</a> •
  <a href="#-快速部署">🚀 快速部署</a> •
  <a href="#-配置说明">⚙️ 配置说明</a> •
  <a href="#-使用指南">📖 使用指南</a> •
  <a href="#-风控指南">🛡️ 风控指南</a>
</p>

---

## 📋 项目介绍

WeChatPadPro 是一个基于 WeChat Pad 协议开发的微信管理工具。本项目致力于提供稳定、高效的 WeChat 自动化解决方案，支持多账号管理、消息处理、自动化任务等功能。

### 🌟 主要特点

- 🛡️ **安全可靠**: 采用最新的 WeChat Pad 协议，确保账号安全
- 🔄 **自动化处理**: 支持消息自动回复、群管理等自动化操作
- 🎯 **精准控制**: 提供细粒度的功能控制和配置选项
- 🔌 **扩展性强**: 支持插件系统，可自定义扩展功能
- 📊 **数据同步**: 支持多设备数据同步，确保信息统一

### 🎯 适用场景

- 👥 **个人用户**: 消息管理、自动回复、防撤回等
- 🏢 **企业用户**: 客户管理、批量操作、数据分析等
- 🤖 **开发者**: 二次开发、功能扩展、自动化集成等

### 📦 环境要求

- MySQL 5.7+ (推荐)
- Redis
- Docker & Docker Compose
- 稳定的网络环境
- 支持 Windows/Linux 系统

---

## 📝 功能特性

WeChatPadPro 基于 WeChat Pad 协议，支持以下功能：

<table>
<tr>
<td width="50%" valign="top">

### 🔹 基础功能

- 💬 **消息收发** - 文字、图片、名片、动图、文件
- 👥 **好友管理** - 添加、删除、清理僵尸粉
- 🔄 **朋友圈互动** - 发布、点赞、评论
- 💲 **微信支付** - 转账、红包
- 🔖 **小程序和名片分享**
- 📇 **通讯录好友添加**
- ⭐ **微信收藏**
- 🏷️ **标签管理**

</td>
<td width="50%" valign="top">

### 🔹 增强功能

- 🔧 **MCP 增强功能**
  - 多协议适配：自动识别并适配不同版本微信协议
  - 自动化管理：通过配置实现请求自动通过、消息同步
- 🤖 **自动化功能**
  - 自动抢红包、消息防撤回
  - 自动通过好友请求
  - 多群消息同步
- 👑 **高级群管理**
  - 建群、拉人、踢人、邀请成员
  - 群公告发布、修改群名称

</td>
</tr>
</table>

---

## 🚀 快速部署

### ⏱️ 一键部署

只需三个命令，立即启动 WeChatPadPro：

```bash
# 1. 克隆项目
git clone https://github.com/Trunks820/wechatTest.git

# 2. 进入部署目录
cd wechatTest/deploy

# 3. 启动服务
docker-compose up -d
```

启动后访问：`http://你的服务器IP:1238`

### 详细部署步骤

#### 1. 克隆项目

```bash
git clone https://github.com/Trunks820/wechatTest.git
cd wechatTest/deploy
```

#### 2. 配置环境变量

编辑 `.env` 文件，根据需求修改配置：

```ini
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

# 核心配置
DEBUG=false
HOST=0.0.0.0
PORT=1238

# 管理员密钥（请修改为复杂字符串）
ADMIN_KEY=Trunks820_WeChatPadPro_2024

# Web域名配置
WEB_DOMAIN=47.106.217.116:1238

# 时区设置
TZ=Asia/Shanghai
```

#### 3. 启动服务

```bash
docker-compose up -d
```

#### 4. 验证部署

```bash
# 查看服务状态
docker-compose ps

# 查看日志
docker-compose logs -f

# 检查端口
netstat -tlnp | grep 1238
```

### 常用管理命令

```bash
# 停止服务
docker-compose down

# 重启服务
docker-compose restart

# 更新服务
docker-compose pull
docker-compose up -d

# 查看日志
docker-compose logs -f --tail=100
```

---

## ⚙️ 配置说明

### 核心配置项

| 配置项 | 说明 | 默认值 | 必填 |
|--------|------|--------|------|
| `ADMIN_KEY` | 管理员密钥 | - | 是 |
| `DB_HOST` | 数据库地址 | localhost | 是 |
| `REDIS_HOST` | Redis地址 | localhost | 是 |
| `PORT` | 服务端口 | 1238 | 否 |
| `DEBUG` | 调试模式 | false | 否 |

### 高级配置

#### Redis 连接池配置
```ini
REDIS_MAX_IDLE=30                   # 最大空闲连接数
REDIS_MAX_ACTIVE=100                # 最大活动连接数
REDIS_IDLE_TIMEOUT=5000             # 空闲连接超时时间（毫秒）
REDIS_CONNECT_TIMEOUT=5000          # 连接超时时间（毫秒）
```

#### 任务调度配置
```ini
TASK_RETRY_COUNT=3                  # 任务重试次数
TASK_RETRY_INTERVAL=5               # 任务重试间隔（秒）
HEARTBEAT_INTERVAL=25               # 心跳包间隔（秒）
AUTO_AUTH_INTERVAL=30               # 自动认证间隔（分钟）
```

#### WebSocket 配置
```ini
WS_HANDSHAKE_TIMEOUT=10             # WebSocket握手超时时间（秒）
WS_READ_BUFFER_SIZE=4096            # WebSocket读缓冲区大小（字节）
WS_WRITE_BUFFER_SIZE=4096           # WebSocket写缓冲区大小（字节）
WS_PING_INTERVAL=25                 # WebSocket心跳间隔（秒）
```

---

## 📖 使用指南

### 初次使用步骤

1. **完成部署**: 按照上述部署指南完成服务部署
2. **配置管理员**: 在 `.env` 文件中设置 `ADMIN_KEY`
3. **启动服务**: 使用 `docker-compose up -d` 启动
4. **访问界面**: 浏览器访问 `http://你的IP:1238`
5. **获取授权**: 通过API获取授权码进行登录

### API 使用说明

#### 获取授权码
```bash
curl "http://你的IP:1238/api/v1/login/GenAuthKey?key=你的ADMIN_KEY&count=1&days=365"
```

#### 登录微信
```bash
curl -X POST "http://你的IP:1238/api/v1/login/Login" \
  -H "Content-Type: application/json" \
  -d '{"authKey": "你的授权码"}'
```

#### 发送消息
```bash
curl -X POST "http://你的IP:1238/api/v1/message/SendTextMsg" \
  -H "Content-Type: application/json" \
  -d '{
    "authKey": "你的授权码",
    "wxid": "目标微信ID",
    "msg": "Hello World"
  }'
```

---

## 🛡️ 风控指南

### 登录注意事项

1. **异地登录处理**
   - 必须设置同城市的Socks5代理
   - 代理格式: `socks5://用户名:密码@代理IP:代理端口`
   - 优先级: 同城市IP > 同省IP

2. **首次登录说明**
   - 可能出现立即掉线情况，重新扫码登录2次后即可稳定
   - 24小时内可能会再次掉线，使用原API Key重新登录即可
   - 重新登录后一般可稳定使用3个月

### 账号安全建议

1. **新账号使用**
   - 建议新号稳定挂机3天后再使用高风险API操作
   - 避免频繁操作，循序渐进增加使用频率

2. **操作频率控制**
   - 避免短时间内大量操作
   - 设置合理的操作间隔
   - 监控账号状态，及时调整策略

3. **网络环境**
   - 使用稳定的网络环境
   - 避免频繁切换IP地址
   - 建议使用固定的代理服务器

### 风险预防措施

- **分散风险**: 不要在单个账号上集中进行大量操作
- **监控日志**: 定期检查应用日志，及时发现异常
- **备份数据**: 定期备份重要数据和配置
- **版本更新**: 及时关注项目更新，使用最新稳定版本

---

## 🔧 故障排除

### 常见问题

#### 1. 服务无法启动
```bash
# 检查端口占用
netstat -tlnp | grep 1238

# 查看详细日志
docker-compose logs wechatpadpro

# 检查配置文件
cat .env
```

#### 2. 数据库连接失败
```bash
# 检查数据库服务状态
docker-compose ps

# 测试数据库连接
mysql -h 47.106.217.116 -u admin -p

# 查看错误日志
docker-compose logs wechatpadpro | grep -i mysql
```

#### 3. Redis连接失败
```bash
# 测试Redis连接
redis-cli -h 47.106.217.116 -p 6379 -a Wy1997@Kakarot

# 查看Redis日志
docker-compose logs redis
```

### 性能优化

1. **内存优化**
   - 适当调整Redis最大内存限制
   - 设置合理的连接池大小

2. **网络优化**
   - 使用高速稳定的网络环境
   - 适当调整超时时间配置

3. **存储优化**
   - 定期清理日志文件
   - 优化数据库查询性能

---

## 📊 技术架构

### 系统架构图
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Web Interface │    │   API Gateway   │    │  WeChat Client  │
└─────────┬───────┘    └─────────┬───────┘    └─────────┬───────┘
          │                      │                      │
          └──────────────────────┼──────────────────────┘
                                 │
                    ┌─────────────┴───────────────┐
                    │    WeChatPadPro Core       │
                    └─────────────┬───────────────┘
                                 │
          ┌──────────────────────┼──────────────────────┐
          │                      │                      │
┌─────────┴───────┐    ┌─────────┴───────┐    ┌─────────┴───────┐
│     MySQL       │    │     Redis       │    │   File Storage  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### 技术栈

- **后端**: Go语言
- **数据库**: MySQL 5.7+
- **缓存**: Redis
- **容器化**: Docker & Docker Compose
- **协议**: WeChat Pad Protocol

---

## 📚 开发指南

### 项目结构
```
wechatTest/
├── deploy/                 # 部署相关文件
│   ├── docker-compose.yml  # Docker编排文件
│   ├── .env                # 环境变量配置
│   └── *.md               # 部署指南
├── static/                # 静态资源
│   └── doc/               # 文档图片
└── README.md              # 项目说明
```

### 本地开发

1. **克隆项目**
```bash
git clone https://github.com/Trunks820/wechatTest.git
cd wechatTest
```

2. **配置开发环境**
```bash
# 复制配置文件
cp deploy/.env.example deploy/.env

# 修改配置
vim deploy/.env
```

3. **启动开发环境**
```bash
cd deploy
docker-compose up -d
```

### 贡献指南

1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

---

## 📄 许可证

本项目采用开源许可证，具体许可证信息请查看 [LICENSE](LICENSE) 文件。

---

## 🤝 技术支持

如果在使用过程中遇到问题：

- 📝 [提交 Issue](https://github.com/Trunks820/wechatTest/issues)
- 📖 查看项目 [Wiki](https://github.com/Trunks820/wechatTest/wiki)
- 📧 发送邮件至技术支持

---

<div align="center">
  <p><strong>⭐ 如果这个项目对你有帮助，请给一个 Star ⭐</strong></p>
  <p>Copyright © 2024 WeChatPadPro. All rights reserved.</p>
</div>

