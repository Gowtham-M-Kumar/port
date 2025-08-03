# 🚀 Deployment Guide - Render

This guide will walk you through deploying your Django portfolio website on Render in just a few minutes.

## Prerequisites

- A GitHub account
- Your code pushed to a GitHub repository
- A Render account (free at [render.com](https://render.com))

## Step-by-Step Deployment

### Step 1: Prepare Your Repository

Make sure your repository contains these files:
- ✅ `requirements.txt`
- ✅ `build.sh`
- ✅ `render.yaml` (optional, for automatic configuration)
- ✅ `portfolio_project/portfolio_project/settings.py` (updated for production)

### Step 2: Create a Render Account

1. Go to [render.com](https://render.com)
2. Sign up with your GitHub account
3. Verify your email address

### Step 3: Deploy Your Application

#### Option A: Manual Setup (Step-by-step)

1. **Create New Web Service**
   - Click "New +" in your Render dashboard
   - Select "Web Service"
   - Connect your GitHub repository

2. **Configure the Service**
   - **Name**: `portfolio-website` (or your preferred name)
   - **Environment**: `Python`
   - **Region**: Choose closest to your users
   - **Branch**: `main` (or your default branch)
   - **Root Directory**: Leave empty (if your Django project is in the root)

3. **Build & Deploy Settings**
   - **Build Command**: `chmod +x build.sh && ./build.sh`
   - **Start Command**: `gunicorn portfolio_project.wsgi:application`
   - **Plan**: Free (or choose paid for more resources)

4. **Environment Variables**
   Click "Advanced" and add these variables:
   ```
   SECRET_KEY: [Generate a new Django secret key]
   DEBUG: false
   ALLOWED_HOSTS: localhost,127.0.0.1,.onrender.com
   ```

5. **Create Service**
   - Click "Create Web Service"
   - Render will start building and deploying your application

#### Option B: Automatic Setup (Using Blueprint)

1. **Push your code to GitHub** (make sure `render.yaml` is included)
2. **Go to Render Dashboard**
3. **Click "New +" and select "Blueprint"**
4. **Connect your repository**
5. **Render will automatically configure everything based on `render.yaml`**

### Step 4: Wait for Deployment

- Build process takes 2-5 minutes
- You'll see logs showing the progress
- Once complete, you'll get a URL like: `https://your-app-name.onrender.com`

### Step 5: Create Admin User

After deployment, create a superuser to manage your content:

1. **Go to your Render dashboard**
2. **Click on your web service**
3. **Go to "Shell" tab**
4. **Run these commands:**
   ```bash
   python manage.py createsuperuser
   ```
5. **Follow the prompts to create your admin account**

### Step 6: Access Your Admin Panel

1. **Go to your live URL**: `https://your-app-name.onrender.com/admin`
2. **Login with your superuser credentials**
3. **Start adding your projects, updating content, etc.**

## Troubleshooting

### Common Issues

**Build Fails**
- Check that all files are in the correct location
- Verify `requirements.txt` has all dependencies
- Check the build logs for specific errors

**Static Files Not Loading**
- Make sure `whitenoise` is in your `requirements.txt`
- Verify `STATIC_ROOT` is set in settings
- Check that `collectstatic` runs during build

**Database Errors**
- Render automatically provides PostgreSQL
- Make sure `dj-database-url` and `psycopg2-binary` are in requirements
- Check that migrations run during build

**500 Server Error**
- Check the logs in your Render dashboard
- Verify environment variables are set correctly
- Make sure `DEBUG=false` in production

### Getting Help

1. **Check Render Logs**: Go to your service dashboard → Logs
2. **Django Debug**: Temporarily set `DEBUG=true` to see detailed errors
3. **Render Support**: Use the chat support in your dashboard

## Post-Deployment

### Custom Domain (Optional)

1. **In your Render dashboard, go to your web service**
2. **Click "Settings" tab**
3. **Scroll to "Custom Domains"**
4. **Add your domain and configure DNS**

### Monitoring

- **Uptime**: Render provides automatic uptime monitoring
- **Logs**: Access real-time logs in your dashboard
- **Performance**: Monitor response times and resource usage

### Updates

To update your deployed application:
1. **Push changes to your GitHub repository**
2. **Render will automatically redeploy**
3. **No manual intervention needed**

## Cost

- **Free Plan**: Perfect for portfolios and small projects
- **Paid Plans**: Available if you need more resources or custom domains

---

🎉 **Congratulations!** Your portfolio is now live on the internet!

Your URL will be: `https://your-app-name.onrender.com` 