#!/bin/bash
# 🔥 Display Flama Repository Structure

echo "🔥 Flama - Fraktal Language Model Repository"
echo "=============================================="
echo ""

tree_command="tree"
if ! command -v tree &> /dev/null; then
    echo "📂 Repository Structure (using ls):"
    echo ""
    find . -type f -name ".*" -prune -o -type f -print | sort | head -20
else
    echo "📂 Repository Structure:"
    echo ""
    tree -I '.git|__pycache__|*.pyc|node_modules|venv' -L 3
fi

echo ""
echo "📄 Key Files:"
echo "============="
echo "✅ README.md - Complete project documentation"
echo "✅ deploy-flama.sh - One-click deployment script"
echo "✅ setup-github-repo.sh - GitHub repository setup"
echo "✅ LICENSE - MIT license"
echo "✅ CONTRIBUTING.md - Contribution guidelines"
echo "✅ .gitignore - Git ignore patterns"
echo "✅ requirements.txt - Python dependencies"
echo "✅ CHANGELOG.md - Release history"
echo ""

echo "🚀 GitHub Actions:"
echo "=================="
echo "✅ ci.yml - Continuous integration"
echo "✅ release.yml - Automated releases"
echo ""

echo "📚 Documentation:"
echo "=================="
echo "✅ docs/index.md - Documentation home"
echo "✅ docs/installation.md - Installation guide" 
echo ""

echo "🎯 Ready for GitHub!"
echo "===================="
echo ""
echo "Next steps:"
echo "1. Run: ./setup-github-repo.sh"
echo "2. Visit: https://github.com/EDU-AIgent/Flama"
echo "3. Share with the world! 🌍"
echo ""
echo "Made with 🔥 by Eduard Terre, Offenburg Germany"