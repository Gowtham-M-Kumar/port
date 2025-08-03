# 🚀 Render Deployment Checklist

## ✅ Pre-Deployment Checklist

### 1. Files Ready for Deployment
- [x] `requirements.txt` - All dependencies listed
- [x] `build.sh` - Build script for Render
- [x] `render.yaml` - Automatic deployment configuration
- [x] `Procfile` - Alternative deployment configuration
- [x] `runtime.txt` - Python version specification
- [x] `.gitignore` - Excludes sensitive files
- [x] `portfolio_project/portfolio_project/settings.py` - Production-ready settings

### 2. Dependencies Verified
- [x] `Django==4.2.7` - Web framework
- [x] `gunicorn==21.2.0` - WSGI server
- [x] `whitenoise==6.6.0` - Static file serving
- [x] `dj-database-url==2.1.0` - Database URL parsing
- [x] `psycopg2-binary==2.9.9` - PostgreSQL adapter
- [x] `Pillow==10.1.0` - Image processing
- [x] `python-decouple==3.8` - Environment management

### 3. Settings Configuration
- [x] `DEBUG = False` in production
- [x] `ALLOWED_HOSTS` includes `.onrender.com`
- [x] `STATIC_ROOT` configured for WhiteNoise
- [x] `DATABASE_URL` environment variable support
- [x] `SECRET_KEY` from environment variable
- [x] WhiteNoise middleware configured

### 4. Database Setup
- [x] PostgreSQL configuration ready
- [x] Migrations will run during build
- [x] Database URL parsing configured

## 🚀 Deployment Steps

### Step 1: Push to GitHub
```bash
git add .
git commit -m "Prepare for Render deployment"
git push origin main
```

### Step 2: Deploy on Render

#### Option A: Using Blueprint (Recommended)
1. Go to [render.com](https://render.com)
2. Sign up/Login with GitHub
3. Click "New +" → "Blueprint"
4. Connect your GitHub repository
5. Render will automatically configure everything

#### Option B: Manual Setup
1. Go to [render.com](https://render.com)
2. Click "New +" → "Web Service"
3. Connect your GitHub repository
4. Configure:
   - **Name**: `portfolio-website`
   - **Environment**: `Python`
   - **Build Command**: `chmod +x build.sh && ./build.sh`
   - **Start Command**: `gunicorn portfolio_project.wsgi:application`
5. Add Environment Variables:
   - `SECRET_KEY`: [Generate new key]
   - `DEBUG`: `false`
   - `ALLOWED_HOSTS`: `localhost,127.0.0.1,.onrender.com`

### Step 3: Create Admin User
After deployment, create a superuser:
1. Go to your Render dashboard
2. Click on your web service
3. Go to "Shell" tab
4. Run: `python portfolio_project/manage.py createsuperuser`

## 🔧 Post-Deployment

### Access Your Application
- **Main Site**: `https://your-app-name.onrender.com`
- **Admin Panel**: `https://your-app-name.onrender.com/admin`

### Environment Variables (if using manual setup)
```
SECRET_KEY=your-generated-secret-key
DEBUG=false
ALLOWED_HOSTS=localhost,127.0.0.1,.onrender.com
DATABASE_URL=postgresql://... (provided by Render)
```

### Monitoring
- Check deployment logs in Render dashboard
- Monitor application performance
- Set up uptime monitoring

## 🐛 Troubleshooting

### Common Issues
1. **Build Fails**: Check build logs for missing dependencies
2. **Static Files Not Loading**: Verify WhiteNoise configuration
3. **Database Errors**: Ensure migrations run successfully
4. **500 Errors**: Check application logs in Render dashboard

### Debug Mode (Temporary)
If you need to debug, temporarily set:
```
DEBUG=true
```
**Remember to set back to `false` after debugging!**

## 📝 Notes

- Render automatically provides PostgreSQL database
- Static files are served via WhiteNoise
- Environment variables are automatically injected
- Auto-deployment on git push (if enabled)
- Free tier includes 750 hours/month

## 🎉 Success!

Once deployed, your portfolio will be live at:
`https://your-app-name.onrender.com` 