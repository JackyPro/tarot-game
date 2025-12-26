# 1. 直接使用 Python 3.12 鏡像 (基於 Debian Bookworm)
FROM python:3.12-bookworm

# 2. 安裝 Node.js 20 (解決你剛才遇到的 Gemini CLI 錯誤)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# 3. 安裝 Gemini CLI
RUN npm install -g @google/gemini-cli

# 4. 安裝 Gemini Python SDK (需要 Python 3.9+)
RUN pip install --no-cache-dir google-generativeai

# 設定工作目錄
WORKDIR /workspace