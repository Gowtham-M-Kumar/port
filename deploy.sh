#!/bin/bash

echo "🚀 Preparing for Render Deployment..."
echo "======================================"

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "❌ Git repository not found. Please initialize git first:"
    echo "   git init"
    echo "   git add ."
    echo "   git commit -m 'Initial commit'"
    exit 1
fi

# Check if all required files exist
echo "📋 Checking required files..."

required_files=(
    "requirements.txt"
    "build.sh"
    "render.yaml"
    "Procfile"
    "runtime.txt"
    ".gitignore"
    "portfolio_project/portfolio_project/settings.py"
)

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file"
    else
        echo "❌ $file - Missing!"
        exit 1
    fi
done

echo ""
echo "✅ All required files are present!"
echo ""

# Check git status
echo "📊 Git Status:"
git status --porcelain

echo ""
echo "🚀 Ready for deployment!"
echo ""
echo "Next steps:"
echo "1. Commit your changes:"
echo "   git add ."
echo "   git commit -m 'Prepare for Render deployment'"
echo ""
echo "2. Push to GitHub:"
echo "   git push origin main"
echo ""
echo "3. Deploy on Render:"
echo "   - Go to https://render.com"
echo "   - Click 'New +' → 'Blueprint'"
echo "   - Connect your GitHub repository"
echo "   - Render will automatically configure everything"
echo ""
echo "🎉 Your portfolio will be live at: https://your-app-name.onrender.com" 