#!/bin/bash
# 🔥 Flama GitHub Repository Setup Script
# Creates and pushes the repository to GitHub

set -e

echo "🔥 Setting up Flama GitHub Repository"
echo "===================================="

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install git first."
    exit 1
fi

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "⚠️  GitHub CLI (gh) not found. Installing..."
    brew install gh
fi

# Initialize git repository
echo "📁 Initializing git repository..."
git init

# Add all files
git add .
git commit -m "🔥 Initial commit: Flama - Fraktal Language Model

- Revolutionary PyTorch-free LLM deployment
- 60-second mobile setup via Termux
- Mac Mini M1 optimized with Metal acceleration
- Custom APT repository for Android distribution
- Complete web interfaces and API endpoints"

# Create repository on GitHub
echo "🌐 Creating GitHub repository..."
gh repo create EDU-AIgent/Flama \
    --public \
    --description "🔥 Fraktal Language Model - PyTorch-free LLM deployment for instant mobile AI" \
    --homepage "https://flama.edu-aigent.com" \
    --add-readme=false

# Add remote and push
echo "📤 Pushing to GitHub..."
git branch -M main
git remote add origin https://github.com/EDU-AIgent/Flama.git
git push -u origin main

# Create additional branches
echo "🌿 Creating development branches..."
git checkout -b develop
git push -u origin develop

git checkout -b feature/termux-optimization
git push -u origin feature/termux-optimization

git checkout main

# Set up repository settings
echo "⚙️  Configuring repository settings..."
gh repo edit EDU-AIgent/Flama \
    --enable-issues \
    --enable-wiki \
    --enable-projects

# Create initial issues
echo "📝 Creating initial issues..."
gh issue create \
    --title "📱 Optimize Termux installation process" \
    --body "Reduce setup time to under 30 seconds for low-end Android devices" \
    --label "enhancement"

gh issue create \
    --title "🚀 Add support for more models" \
    --body "Expand model support beyond TinyLlama:
- Phi-2
- Mistral 7B  
- Llama 2 variants
- Custom GGUF models" \
    --label "feature"

gh issue create \
    --title "📊 Implement usage analytics dashboard" \
    --body "Track and visualize:
- Setup success rate
- Active users
- Model performance
- Error rates" \
    --label "feature"

# Create initial release
echo "🏷️  Creating initial release..."
gh release create v0.1.0 \
    --title "Flama v0.1.0 - Initial Release" \
    --notes "🔥 **Flama - Fraktal Language Model**

First public release of the revolutionary PyTorch-free LLM deployment system.

## Features
- ✅ 60-second mobile setup
- ✅ Mac Mini M1 server with Metal acceleration  
- ✅ Custom Termux APT repository
- ✅ Web chat and control panel
- ✅ QR code generation
- ✅ TinyLlama 1.1B support

## Quick Start
\`\`\`bash
git clone https://github.com/EDU-AIgent/Flama.git
cd Flama
./deploy-flama.sh
\`\`\`

Made with 🔥 by EDU-AIgent" \
    --prerelease

echo ""
echo "✅ GitHub repository setup complete!"
echo ""
echo "📍 Repository URL: https://github.com/EDU-AIgent/Flama"
echo "🌐 View online: https://github.com/EDU-AIgent/Flama"
echo ""
echo "📝 Next steps:"
echo "  1. Add repository topics: llm, ai, termux, arm64, metal, pytorch-free"
echo "  2. Configure GitHub Pages for documentation"
echo "  3. Set up branch protection rules"
echo "  4. Add collaborators if needed"
echo ""
echo "🔥 Flama is now on GitHub!"