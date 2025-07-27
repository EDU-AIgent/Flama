# Flama Documentation

Welcome to the Flama documentation! Flama is a revolutionary PyTorch-free LLM deployment system.

## Quick Links

- [Installation Guide](installation.md)
- [API Reference](api-reference.md)
- [Mobile Setup](mobile-setup.md)
- [Model Support](models.md)
- [Troubleshooting](troubleshooting.md)

## What is Flama?

Flama (Fraktal Language Model) democratizes AI by eliminating the heavy PyTorch dependency, enabling instant AI deployment on mobile devices through a 60-second setup process.

### Key Features

- **Zero PyTorch**: Pure C++ performance
- **60-Second Setup**: QR scan to AI chat
- **Mobile First**: Optimized for Android/Termux
- **Metal Acceleration**: Mac Mini M1 optimized

## Getting Started

### For Server Operators

```bash
git clone https://github.com/EDU-AIgent/Flama.git
cd Flama
./deploy-flama.sh
```

### For Mobile Users

1. Install Termux from F-Droid
2. Scan QR code or run:
   ```bash
   curl -sSL http://YOUR_SERVER:8000/magic-setup | bash
   ```

## Architecture Overview

```
Flama Server (Mac Mini M1)
├── FastAPI Backend
├── llama.cpp Engine  
├── Termux Repository
└── Web Interfaces

Android Client (Termux)
├── llama.cpp binary
├── Auto-download models
└── Offline capability
```

## Support

- Issues: [GitHub Issues](https://github.com/EDU-AIgent/Flama/issues)
- Discussions: [GitHub Discussions](https://github.com/EDU-AIgent/Flama/discussions)