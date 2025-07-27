# Changelog

All notable changes to Flama will be documented in this file.

## [Unreleased]

### Added
- Multi-model support
- Advanced monitoring dashboard
- Docker deployment options

### Changed
- Improved startup performance
- Enhanced error handling

## [0.1.0] - 2025-07-27

### Added
- Initial release of Flama (Fraktal Language Model)
- PyTorch-free LLM deployment system
- 60-second mobile setup via Termux
- Mac Mini M1 server with Metal acceleration
- Custom APT repository for Android distribution
- Web chat interface
- Control panel dashboard
- QR code generation for mobile setup
- TinyLlama 1.1B model support
- Automated deployment script
- Complete API endpoints
- Termux widget support

### Features
- **Zero PyTorch**: 40x smaller binaries, 15x faster startup
- **Mobile First**: Optimized for Android/Termux
- **Metal Acceleration**: Full Apple Silicon support
- **One-Click Setup**: Automated installation scripts
- **Multi-Platform**: Web, mobile, and API access

### Technical
- FastAPI backend with async support
- llama.cpp with ARM64 NEON optimizations
- Custom Termux package repository
- Real-time monitoring and health checks
- Comprehensive test suite
- CI/CD with GitHub Actions

### Documentation
- Complete installation guide
- API reference
- Mobile setup instructions
- Troubleshooting guide
- Contributing guidelines