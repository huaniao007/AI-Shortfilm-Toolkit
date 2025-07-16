#!/bin/bash

echo "🌱 检查并安装 Homebrew..."
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew 已安装，跳过"
fi

echo "📦 安装 Git..."
brew install git

echo "🐳 安装 Docker Desktop..."
brew install --cask docker

echo "🚀 启动 Docker（首次运行可能授权）"
open -a Docker
sleep 10

echo "🤖 安装 Ollama..."
curl -fsSL https://ollama.com/install.sh | sh

echo "🧠 测试运行 Ollama 模型（llama3）"
ollama run llama3 &

echo "🖼️ 克隆 Open WebUI..."
git clone https://github.com/open-webui/open-webui.git
cd open-webui

echo "🚀 启动 Open WebUI（图形界面）..."
docker compose up -d

echo "🎉 部署完成！访问地址：http://localhost:3000"
