# 🚨 Deployment Troubleshooting Guide

## Common Deployment Errors and Solutions

### 1. KeyError: '__version__' Error

**Error Message:**
```
KeyError: '__version__'
error: subprocess-exited-with-error
Getting requirements to build wheel did not run successfully.
```

**Solution:**
- ✅ Updated `requirements.txt` with more stable versions
- ✅ Added `setuptools>=65.5.1` and `wheel>=0.38.4`
- ✅ Added `PIP_NO_CACHE_DIR=1` and `PIP_DISABLE_PIP_VERSION_CHECK=1` environment variables
- ✅ Updated build script to upgrade pip and setuptools first

### 2. Build Script Issues

**Problem:** Build script not finding correct paths or commands

**Solution:**
- ✅ Updated `build.sh` to change directory before running Django commands
- ✅ Added verbose output for better debugging
- ✅ Improved error handling and logging

### 3. Start Command Issues

**Problem:** Application not starting correctly

**Solution:**
- ✅ Updated `startCommand` in `render.yaml` to include directory change
- ✅ Updated `Procfile` to match the new start command
- ✅ Ensured consistent path handling

## Updated Files for Error-Free Deployment

### 1. `requirements.txt` (Updated)
```txt
Django==4.2.7
gunicorn==21.2.0
whitenoise==6.6.0
dj-database-url==2.1.0
psycopg2-binary==2.9.7
Pillow==10.0.1
python-decouple==3.8
setuptools>=65.5.1
wheel>=0.38.4
```

### 2. `build.sh` (Updated)
```bash
#!/usr/bin/env bash
set -o errexit

echo "🚀 Starting build process..."
pip install --upgrade pip setuptools wheel
pip install -r requirements.txt --verbose
cd portfolio_project
python manage.py collectstatic --no-input
python manage.py migrate
echo "✅ Build completed successfully!"
```

### 3. `render.yaml` (Updated)
```yaml
services:
  - type: web
    name: portfolio-website
    env: python
    plan: free
    buildCommand: chmod +x build.sh && ./build.sh
    startCommand: cd portfolio_project && gunicorn portfolio_project.wsgi:application
    envVars:
      - key: PYTHON_VERSION
        value: 3.11.0
      - key: SECRET_KEY
        generateValue: true
      - key: DEBUG
        value: false
      - key: ALLOWED_HOSTS
        value: localhost,127.0.0.1,.onrender.com
      - key: PIP_NO_CACHE_DIR
        value: "1"
      - key: PIP_DISABLE_PIP_VERSION_CHECK
        value: "1"
      - key: DATABASE_URL
        fromDatabase:
          name: portfolio-db
          property: connectionString
    autoDeploy: true

databases:
  - name: portfolio-db
    databaseName: portfolio
    user: portfolio
```

### 4. `Procfile` (Updated)
```
web: cd portfolio_project && gunicorn portfolio_project.wsgi:application
```

## Environment Variables for Error Prevention

Add these to your Render environment variables:

```
PIP_NO_CACHE_DIR=1
PIP_DISABLE_PIP_VERSION_CHECK=1
PYTHON_VERSION=3.11.0
```

## Manual Deployment Steps (If Blueprint Fails)

1. **Create Web Service manually:**
   - Go to Render Dashboard
   - Click "New +" → "Web Service"
   - Connect your GitHub repository

2. **Configure the service:**
   - **Name**: `portfolio-website`
   - **Environment**: `Python`
   - **Build Command**: `chmod +x build.sh && ./build.sh`
   - **Start Command**: `cd portfolio_project && gunicorn portfolio_project.wsgi:application`

3. **Add Environment Variables:**
   - `SECRET_KEY`: [Generate new key]
   - `DEBUG`: `false`
   - `ALLOWED_HOSTS`: `localhost,127.0.0.1,.onrender.com`
   - `PIP_NO_CACHE_DIR`: `1`
   - `PIP_DISABLE_PIP_VERSION_CHECK`: `1`

## Testing Deployment Locally

Before deploying, test the build process locally:

```bash
# Test the build script
chmod +x build.sh
./build.sh

# Test the start command
cd portfolio_project
gunicorn portfolio_project.wsgi:application
```

## Monitoring Deployment

1. **Check Build Logs:** Monitor the build process in Render dashboard
2. **Verify Dependencies:** Ensure all packages install correctly
3. **Test Application:** Access your application URL after deployment
4. **Check Database:** Verify migrations run successfully

## If Errors Persist

1. **Check Render Logs:** Look for specific error messages
2. **Verify File Paths:** Ensure all files are in correct locations
3. **Test Dependencies:** Try installing requirements locally first
4. **Contact Support:** Use Render's support if issues continue

## Success Indicators

✅ Build completes without errors
✅ All dependencies install successfully
✅ Static files collect without issues
✅ Database migrations run successfully
✅ Application starts and responds to requests
✅ Admin panel accessible at `/admin`

---

**Note:** The updated configuration should resolve the `KeyError: '__version__'` and other common deployment issues. 