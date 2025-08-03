#!/usr/bin/env bash
# exit on error
set -o errexit

echo "🚀 Starting build process..."

# Upgrade pip and setuptools first
echo "📦 Upgrading pip and setuptools..."
pip install --upgrade pip setuptools wheel

# Install requirements with verbose output
echo "📦 Installing Python dependencies..."
pip install -r requirements.txt --verbose

# Change to project directory
echo "📁 Changing to project directory..."
cd portfolio_project

# Collect static files
echo "📁 Collecting static files..."
python manage.py collectstatic --no-input

# Run migrations
echo "🗄️ Running database migrations..."
python manage.py migrate

echo "✅ Build completed successfully!" 