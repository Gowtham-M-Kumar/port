# 🌍 Environment Variables Guide

This guide explains all the environment variables needed for your Django portfolio application.

## 📋 Required Environment Variables

### **Core Django Settings**

```bash
# Django Secret Key (Required)
SECRET_KEY=your-secret-key-here

# Debug Mode (False for production)
DEBUG=False

# Allowed Hosts (comma-separated)
ALLOWED_HOSTS=localhost,127.0.0.1,.onrender.com
```

### **Database Configuration**

```bash
# PostgreSQL Database URL (Required)
DATABASE_URL=postgresql://portfolio_u2pz_user:8HKmUljB5ESxLwDwuR9Wa6kk10DqFE8K@dpg-d27fkmmuk2gs73e47g30-a.oregon-postgres.render.com/portfolio_u2pz
```

### **Build Optimization**

```bash
# Python Version
PYTHON_VERSION=3.11.0

# Build Optimization (prevents deployment errors)
PIP_NO_CACHE_DIR=1
PIP_DISABLE_PIP_VERSION_CHECK=1
```

### **Static and Media Files**

```bash
# Static Files Configuration
STATIC_URL=/static/
STATIC_ROOT=staticfiles

# Media Files Configuration
MEDIA_URL=/media/
MEDIA_ROOT=media
```

### **Security Settings**

```bash
# Security Headers
CSRF_COOKIE_SECURE=True
SESSION_COOKIE_SECURE=True
SECURE_BROWSER_XSS_FILTER=True
SECURE_CONTENT_TYPE_NOSNIFF=True
```

### **Email Configuration**

```bash
# Email Backend (for development)
EMAIL_BACKEND=django.core.mail.backends.console.EmailBackend

# Production Email Settings (optional)
# EMAIL_HOST=smtp.gmail.com
# EMAIL_PORT=587
# EMAIL_USE_TLS=True
# EMAIL_HOST_USER=your-email@gmail.com
# EMAIL_HOST_PASSWORD=your-app-password
# DEFAULT_FROM_EMAIL=your-email@gmail.com
```

## 🚀 How to Use Environment Variables

### **For Local Development**

1. **Copy the example file:**
   ```bash
   cp env.example .env
   ```

2. **Edit the .env file:**
   ```bash
   # Update SECRET_KEY with a new value
   SECRET_KEY=your-new-secret-key-here
   
   # Set DEBUG to True for development
   DEBUG=True
   ```

3. **Run the application:**
   ```bash
   cd portfolio_project
   python run_server.py
   ```

### **For Render Deployment**

The `render.yaml` file automatically sets these environment variables:

```yaml
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
    value: postgresql://portfolio_u2pz_user:8HKmUljB5ESxLwDwuR9Wa6kk10DqFE8K@dpg-d27fkmmuk2gs73e47g30-a.oregon-postgres.render.com/portfolio_u2pz
```

### **Manual Environment Variable Setup**

If you need to set environment variables manually in Render:

1. Go to your Render dashboard
2. Click on your web service
3. Go to "Environment" tab
4. Add each variable:

| Variable | Value |
|----------|-------|
| `SECRET_KEY` | [Generate new key] |
| `DEBUG` | `false` |
| `ALLOWED_HOSTS` | `localhost,127.0.0.1,.onrender.com` |
| `DATABASE_URL` | `postgresql://portfolio_u2pz_user:8HKmUljB5ESxLwDwuR9Wa6kk10DqFE8K@dpg-d27fkmmuk2gs73e47g30-a.oregon-postgres.render.com/portfolio_u2pz` |
| `PIP_NO_CACHE_DIR` | `1` |
| `PIP_DISABLE_PIP_VERSION_CHECK` | `1` |

## 🔐 Security Notes

### **SECRET_KEY**
- **Never commit your actual SECRET_KEY to version control**
- Generate a new one for production: `python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"`
- Render automatically generates one when using `generateValue: true`

### **DATABASE_URL**
- Contains sensitive database credentials
- Keep this secure and don't share publicly
- Render automatically handles this in production

### **DEBUG**
- Always set to `False` in production
- Set to `True` only for local development

## 📝 Environment Variables by Environment

### **Development (.env file)**
```bash
DEBUG=True
SECRET_KEY=dev-secret-key
ALLOWED_HOSTS=localhost,127.0.0.1
```

### **Production (Render)**
```bash
DEBUG=False
SECRET_KEY=[auto-generated]
ALLOWED_HOSTS=localhost,127.0.0.1,.onrender.com
```

## 🎯 Quick Setup Commands

### **Generate a New Secret Key**
```bash
python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
```

### **Test Environment Variables**
```bash
cd portfolio_project
python manage.py check --deploy
```

### **Create Local .env File**
```bash
cp env.example .env
# Edit .env with your local settings
```

---

**Note**: The `.env` file is already in `.gitignore` to prevent committing sensitive information to version control. 