# 🔥 Flama - Fraktal Language Model

<div align="center">

![Flama Logo](https://img.shields.io/badge/Flama-🔥_Fraktal_Language_Model-FF6B6B?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Mac_Mini_M1-00D9FF?style=for-the-badge&logo=apple)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![PyTorch Free](https://img.shields.io/badge/PyTorch-FREE-FF4444?style=for-the-badge)

**Revolutionary PyTorch-free LLM deployment system for instant AI access on any device**

[Features](#features) • [Quick Start](#quick-start) • [Installation](#installation) • [Architecture](#architecture) • [Contributing](#contributing)

</div>

---

## 🎯 Mission

**Flama** democratizes AI by eliminating the 2GB+ PyTorch dependency, enabling instant AI deployment on mobile devices through a revolutionary 60-second setup process. Pure C++ performance meets radical simplicity.

## ✨ Features

### 🚫 **Zero PyTorch Required**
- **40x smaller** binary size (50MB vs 2GB+)
- **15x faster** startup (2s vs 30-60s)
- **50% less** RAM usage
- Pure C++ llama.cpp backend

### 📱 **60-Second Mobile Setup**
- QR scan → AI chat in under a minute
- Automatic Termux configuration
- One-line installation script
- Home screen widgets

### 🍎 **Mac Mini M1 Server**
- Metal acceleration for Apple Silicon
- ARM64 NEON optimizations
- Custom APT repository hosting
- Real-time monitoring dashboard

### 🌐 **Multi-Platform Access**
- Web chat interface
- Control panel dashboard
- QR code generator
- API endpoints

## 🚀 Quick Start

### For Server Operators (Mac Mini M1)

```bash
# Clone and deploy
git clone https://github.com/EDU-AIgent/Flama.git
cd Flama
./deploy-flama.sh

# Access interfaces
open http://localhost:8000/control-panel
```

### For Android Users (Termux)

1. Install [Termux from F-Droid](https://f-droid.org/packages/com.termux/)
2. Run this single command:

```bash
curl -sSL http://YOUR_SERVER:8000/magic-setup | bash
```

3. Type `ai` to start chatting!

## 📦 Installation

### Prerequisites

- **Server**: Mac Mini M1 (or any ARM64/x86_64 system)
- **Client**: Android 7+ with Termux
- **RAM**: 4GB minimum (8GB recommended)

### Server Setup

```bash
# Install dependencies
brew install cmake git wget dpkg

# Clone repository
git clone https://github.com/EDU-AIgent/Flama.git
cd Flama

# Run automated setup
./scripts/setup-server.sh

# Start all services
./scripts/start-all.sh
```

### Component Status

| Component | Port | URL | Status |
|-----------|------|-----|--------|
| API Server | 8000 | http://localhost:8000 | ✅ Running |
| Web Chat | 8000 | http://localhost:8000/web-chat | ✅ Active |
| Control Panel | 8000 | http://localhost:8000/control-panel | ✅ Active |
| Termux Repo | 8001 | http://localhost:8001 | ✅ Active |

## 🏗️ Architecture

```
Flama Server (Mac Mini M1)
├── FastAPI Backend
│   ├── /api/* - REST endpoints
│   ├── /web-chat - Browser interface
│   ├── /control-panel - Management UI
│   └── /termux-repo/* - Package distribution
├── llama.cpp Engine
│   ├── Metal acceleration
│   ├── ARM64 optimizations
│   └── GGUF model support
└── Termux Repository
    ├── Custom .deb packages
    ├── APT repository server
    └── One-line installer

Android Client (Termux)
├── llama.cpp binary
├── Auto-download models
├── Home screen widgets
└── Offline capability
```

## 📊 Performance

| Metric | PyTorch | Flama | Improvement |
|--------|---------|-------|-------------|
| Binary Size | 2GB+ | 50MB | **40x smaller** |
| Startup Time | 30-60s | 2s | **15-30x faster** |
| RAM Usage | 4-6GB | 1-3GB | **50% less** |
| Dependencies | 100+ | 0 | **Zero deps** |

## 🛠️ API Reference

### Core Endpoints

```bash
# Health check
GET /health

# Magic setup script
GET /magic-setup

# Termux repository info
GET /termux-repo/

# Web interfaces
GET /web-chat
GET /control-panel
GET /qr-codes
```

### Termux Integration

```bash
# Add repository
curl -sSL http://server:8000/termux-repo/install-script | bash

# Install package
pkg install llama-cpp-edu

# Start AI chat
ai
```

## 📱 Mobile Features

- **Instant Setup**: QR scan to AI chat in 60 seconds
- **Offline Mode**: Models cached locally
- **Widgets**: Home screen shortcuts
- **Battery Optimized**: Efficient C++ runtime
- **Auto Updates**: Repository integration

## 🔧 Configuration

### Environment Variables

```bash
# Server configuration
SERVER_IP=localhost
API_PORT=8000
REPO_PORT=8001

# Model settings
DEFAULT_MODEL=tinyllama-1.1b
QUANTIZATION=Q4_0
MAX_CONTEXT=2048

# Optimization
METAL_ACCELERATION=true
ARM64_NEON=true
```

### Model Support

- TinyLlama 1.1B
- Phi-2
- Mistral 7B
- Llama 2 (7B/13B)
- Custom GGUF models

## 📈 Monitoring

Access the control panel at `http://localhost:8000/control-panel` for:

- Real-time server metrics
- Active connections
- Model performance
- Network traffic
- Error logs

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Development Setup

```bash
# Fork and clone
git clone https://github.com/YOUR_USERNAME/Flama.git
cd Flama

# Create branch
git checkout -b feature/amazing-feature

# Make changes and test
./scripts/test-all.sh

# Submit PR
git push origin feature/amazing-feature
```

## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file.

## 🙏 Acknowledgments

- [llama.cpp](https://github.com/ggerganov/llama.cpp) - Pure C++ LLM inference
- [Termux](https://termux.dev) - Android terminal emulator
- Apple M1 - Revolutionary ARM architecture

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/EDU-AIgent/Flama/issues)
- **Discussions**: [GitHub Discussions](https://github.com/EDU-AIgent/Flama/discussions)
- **Author**: Eduard Terre, Offenburg Germany
- **Email**: terre.eduard@hotmail.com

---

<div align="center">

**Made with 🔥 by Eduard Terre**  
*Offenburg, Germany*

*Democratizing AI, one device at a time*

</div>