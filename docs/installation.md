# Installation Guide

## Server Installation (Mac Mini M1)

### Prerequisites

- macOS 12.0 or later
- Xcode Command Line Tools
- Homebrew package manager
- Python 3.9+
- 8GB RAM minimum

### Quick Install

```bash
# Clone repository
git clone https://github.com/EDU-AIgent/Flama.git
cd Flama

# Run automated setup
./deploy-flama.sh
```

### Manual Installation

#### 1. Install Dependencies

```bash
# Install build tools
brew install cmake git wget dpkg

# Install Python packages
pip3 install fastapi uvicorn aiofiles psutil qrcode
```

#### 2. Build llama.cpp

```bash
# Clone llama.cpp
git clone https://github.com/ggerganov/llama.cpp.git
cd llama.cpp

# Build with Metal support
cmake -B build -DCMAKE_BUILD_TYPE=Release -DLLAMA_METAL=ON
cmake --build build --config Release -j$(sysctl -n hw.ncpu)
cd ..
```

#### 3. Configure Environment

```bash
# Copy example environment
cp .env.example .env

# Edit configuration
nano .env
```

#### 4. Start Services

```bash
# Start all services
./scripts/start-all.sh
```

## Client Installation (Android/Termux)

### Automated Setup

1. Install [Termux from F-Droid](https://f-droid.org/packages/com.termux/)
2. Open Termux and run:

```bash
curl -sSL http://YOUR_SERVER:8000/magic-setup | bash
```

### Manual Setup

```bash
# Update packages
pkg update && pkg upgrade

# Install dependencies
pkg install clang cmake git wget

# Clone and build llama.cpp
git clone https://github.com/ggerganov/llama.cpp.git
cd llama.cpp
cmake -B build -DLLAMA_NEON=ON
cmake --build build --config Release
```

## Docker Installation

```bash
# Build and run with Docker
docker-compose up -d
```

## Verification

Check that all services are running:

```bash
# Test API
curl http://localhost:8000/health

# Open control panel
open http://localhost:8000/control-panel
```

## Next Steps

- [Configure your first model](models.md)
- [Set up mobile clients](mobile-setup.md)
- [Explore the API](api-reference.md)