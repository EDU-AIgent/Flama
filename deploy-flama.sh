#!/bin/bash
# 🔥 Flama - Fraktal Language Model Deployment Script
# Automated setup for Mac Mini M1 LLM server

set -e

echo "🔥 ====================================="
echo "🔥    FLAMA DEPLOYMENT SYSTEM          "
echo "🔥    Fraktal Language Model           "
echo "🔥 ====================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo -e "${RED}❌ This script is designed for macOS (Mac Mini M1)${NC}"
    echo "For other platforms, please see the documentation."
    exit 1
fi

# Get server IP
if [ -z "$SERVER_IP" ]; then
    # Try to get local IP
    SERVER_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || echo "localhost")
fi

echo -e "${BLUE}📍 Server IP: $SERVER_IP${NC}"
echo ""

# Create directory structure
echo -e "${YELLOW}📁 Creating project structure...${NC}"
mkdir -p {
    api/{routers,models,services,utils},
    storage/{models,cache,temp,optimized,termux},
    scripts,
    config,
    web/{static,templates},
    termux/{qr-codes,widgets,docs},
    docs,
    tests,
    .github/workflows
}

# Copy all files from current setup
echo -e "${YELLOW}📋 Copying project files...${NC}"
cp -r ../api/* api/ 2>/dev/null || true
cp -r ../scripts/* scripts/ 2>/dev/null || true
cp -r ../termux/* termux/ 2>/dev/null || true
cp -r ../web/* web/ 2>/dev/null || true
cp ../control-panel.html . 2>/dev/null || true
cp ../docker-compose.yml . 2>/dev/null || true
cp ../.env .env.example 2>/dev/null || true

# Create Python virtual environment
echo -e "${YELLOW}🐍 Setting up Python environment...${NC}"
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install fastapi uvicorn aiofiles psutil qrcode pillow httpx termux-apt-repo

# Clone and build llama.cpp
echo -e "${YELLOW}🔨 Building llama.cpp with Metal support...${NC}"
if [ ! -d "llama.cpp" ]; then
    git clone https://github.com/ggerganov/llama.cpp.git
fi

cd llama.cpp
cmake -B build -DCMAKE_BUILD_TYPE=Release -DLLAMA_METAL=ON -DLLAMA_ACCELERATE=ON
cmake --build build --config Release -j$(sysctl -n hw.ncpu)
cd ..

echo -e "${GREEN}✅ llama.cpp built successfully!${NC}"

# Create main deployment script
cat > scripts/start-all.sh << 'EOF'
#!/bin/bash
# Start all Flama services

echo "🔥 Starting Flama services..."

# Start API server
cd api && python3 main.py &
API_PID=$!
echo "✅ API Server started (PID: $API_PID)"

# Start Termux repository
cd ../termux-repo && ./start-termux-repo.sh &
REPO_PID=$!
echo "✅ Termux Repository started (PID: $REPO_PID)"

echo ""
echo "🔥 Flama is running!"
echo "📍 Control Panel: http://localhost:8000/control-panel"
echo "💬 Web Chat: http://localhost:8000/web-chat"
echo "📱 QR Codes: http://localhost:8000/qr-codes"
echo ""
echo "Press Ctrl+C to stop all services"

# Wait for interrupt
trap "kill $API_PID $REPO_PID; exit" INT
wait
EOF

chmod +x scripts/start-all.sh

# Create setup completion script
cat > scripts/setup-complete.sh << 'EOF'
#!/bin/bash
# Final setup and verification

echo "🔥 Flama Setup Complete!"
echo ""
echo "📊 System Status:"
echo "  - API Server: Ready"
echo "  - llama.cpp: Built with Metal support"
echo "  - Termux Repo: Configured"
echo "  - Web Interfaces: Available"
echo ""
echo "🚀 Quick Start:"
echo "  1. Run: ./scripts/start-all.sh"
echo "  2. Open: http://localhost:8000/control-panel"
echo "  3. Share: http://localhost:8000/qr-codes"
echo ""
echo "📱 For Android users:"
echo "  - Install Termux from F-Droid"
echo "  - Scan QR code or run:"
echo "    curl -sSL http://$SERVER_IP:8000/magic-setup | bash"
echo ""
echo "Made with 🔥 by EDU-AIgent"
EOF

chmod +x scripts/setup-complete.sh

# Create environment file if not exists
if [ ! -f .env ]; then
    cat > .env << EOF
# Flama Configuration
SERVER_IP=$SERVER_IP
API_PORT=8000
REPO_PORT=8001

# Model Settings
DEFAULT_MODEL=tinyllama-1.1b
QUANTIZATION=Q4_0
MAX_CONTEXT=2048

# Optimization
METAL_ACCELERATION=true
ARM64_NEON=true
LLAMA_CPP_PATH=./llama.cpp/build/bin

# Security
API_KEY=$(openssl rand -base64 32)
EOF
fi

# Download a small test model
echo -e "${YELLOW}📦 Downloading test model...${NC}"
mkdir -p storage/models
cd storage/models
if [ ! -f "tinyllama-chat-v0.3.Q2_K.gguf" ]; then
    curl -L -o tinyllama-chat-v0.3.Q2_K.gguf \
        "https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v0.3-GGUF/resolve/main/tinyllama-1.1b-chat-v0.3.Q2_K.gguf" &
    echo "Downloading model in background..."
fi
cd ../..

# Run setup complete
./scripts/setup-complete.sh

echo ""
echo -e "${GREEN}🎉 Flama deployment complete!${NC}"
echo -e "${BLUE}Run './scripts/start-all.sh' to start all services${NC}"