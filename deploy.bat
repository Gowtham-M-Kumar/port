@echo off
echo 🚀 Preparing for Render Deployment...
echo ======================================

REM Check if git is initialized
if not exist ".git" (
    echo ❌ Git repository not found. Please initialize git first:
    echo    git init
    echo    git add .
    echo    git commit -m "Initial commit"
    pause
    exit /b 1
)

REM Check if all required files exist
echo 📋 Checking required files...

if exist "requirements.txt" (
    echo ✅ requirements.txt
) else (
    echo ❌ requirements.txt - Missing!
    pause
    exit /b 1
)

if exist "build.sh" (
    echo ✅ build.sh
) else (
    echo ❌ build.sh - Missing!
    pause
    exit /b 1
)

if exist "render.yaml" (
    echo ✅ render.yaml
) else (
    echo ❌ render.yaml - Missing!
    pause
    exit /b 1
)

if exist "Procfile" (
    echo ✅ Procfile
) else (
    echo ❌ Procfile - Missing!
    pause
    exit /b 1
)

if exist "runtime.txt" (
    echo ✅ runtime.txt
) else (
    echo ❌ runtime.txt - Missing!
    pause
    exit /b 1
)

if exist ".gitignore" (
    echo ✅ .gitignore
) else (
    echo ❌ .gitignore - Missing!
    pause
    exit /b 1
)

if exist "portfolio_project\portfolio_project\settings.py" (
    echo ✅ portfolio_project\portfolio_project\settings.py
) else (
    echo ❌ portfolio_project\portfolio_project\settings.py - Missing!
    pause
    exit /b 1
)

echo.
echo ✅ All required files are present!
echo.

REM Check git status
echo 📊 Git Status:
git status --porcelain

echo.
echo 🚀 Ready for deployment!
echo.
echo Next steps:
echo 1. Commit your changes:
echo    git add .
echo    git commit -m "Prepare for Render deployment"
echo.
echo 2. Push to GitHub:
echo    git push origin main
echo.
echo 3. Deploy on Render:
echo    - Go to https://render.com
echo    - Click "New +" → "Blueprint"
echo    - Connect your GitHub repository
echo    - Render will automatically configure everything
echo.
echo 🎉 Your portfolio will be live at: https://your-app-name.onrender.com
pause 