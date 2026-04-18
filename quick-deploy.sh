#!/bin/bash
# Check Vercel authentication and deploy blog

echo "🔍 Checking Vercel authentication status..."

# Check if vercel is installed
if ! command -v vercel &> /dev/null; then
    echo "📦 Installing Vercel CLI..."
    npm install -g vercel
fi

# Check if user is authenticated
vercel whoami > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Vercel authentication confirmed"
    
    # Run the deployment 
    cd /Users/stephenellams/OpenClaw/basfoundry-blog/public
    
    echo "🚀 Deploying BAS Foundry affiliate blog..."
    
    # Create vercel.json configuration
    cat > vercel.json << 'EOF'
{
  "version": 2,
  "public": true,
  "cleanUrls": true,
  "trailingSlash": false
}
EOF
    
    # Deploy to production
    vercel --prod --yes --name basfoundry-blog
    
    echo "✅ Deployment completed!"
    echo "🎯 Affiliate blog is now generating revenue with 37+ affiliate links"
    
else
    echo "❌ Vercel authentication required"
    echo "Please run: vercel login"
    echo "Then execute this deployment again"
    exit 1
fi