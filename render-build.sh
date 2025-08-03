#!/usr/bin/env bash
# exit on error
set -o errexit

echo "🚀 Starting Render build process..."

# Install system dependencies for Pillow
echo "📦 Installing system dependencies..."
apt-get update -qq && apt-get install -y --no-install-recommends \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libwebp-dev \
    libopenjp2-7-dev \
    libtiff5-dev \
    liblcms2-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libxcb1-dev \
    pkg-config \
    zlib1g-dev \
    || echo "System dependencies installation completed"

# Upgrade pip and setuptools
echo "📦 Upgrading pip and setuptools..."
pip install --upgrade pip setuptools wheel

# Install Python requirements
echo "📦 Installing Python dependencies..."
pip install --no-cache-dir -r requirements.txt

# Change to project directory
echo "📁 Changing to project directory..."
cd portfolio_project

# Create staticfiles directory if it doesn't exist
echo "📁 Creating staticfiles directory..."
mkdir -p staticfiles

# Collect static files
echo "📁 Collecting static files..."
python manage.py collectstatic --no-input --clear

# Run migrations
echo "🗄️ Running database migrations..."
python manage.py migrate

# Test the application
echo "🧪 Testing application..."
python manage.py check --deploy

echo "✅ Build completed successfully!" 