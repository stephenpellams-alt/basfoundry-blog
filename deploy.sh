#!/bin/bash
# BAS Foundry Blog Deployment Script

echo "🚀 Deploying BAS Foundry affiliate blog..."

BUILD_DIR="$HOME/OpenClaw/basfoundry-blog/public"
DOMAIN="basfoundry.com"

if [ ! -d "$BUILD_DIR" ]; then
    echo "❌ Build directory not found. Run 'python3 bas-blog-builder.py build' first"
    exit 1
fi

echo "📦 Blog files ready in $BUILD_DIR"
echo "📊 Total files: $(find $BUILD_DIR -name '*.html' | wc -l) HTML pages"

# Option 1: Deploy to Vercel
if command -v vercel &> /dev/null; then
    echo "🌐 Deploying to Vercel..."
    cd "$BUILD_DIR"
    vercel --prod
    exit 0
fi

# Option 2: Deploy to Netlify Drop
echo "🌐 Deploy options:"
echo "1. Zip files and upload to Netlify Drop (https://app.netlify.com/drop)"
echo "2. Copy files to your web hosting provider"
echo "3. Use GitHub Pages (commit files to repository)"

echo "📁 Files ready for deployment in: $BUILD_DIR"
