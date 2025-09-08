@echo off
chcp 65001 >nul
title QUICK EMAIL SETUP - त्वरित ईमेल सेटअप

echo.
echo 🚀 QUICK EMAIL SETUP - त्वरित ईमेल सेटअप 🚀
echo ================================================
echo.

echo 📧 STEP 1: Open Google Account Settings
echo    Click the link below to open Google App Passwords:
echo    https://myaccount.google.com/apppasswords
echo.

echo 📝 STEP 2: Generate App Password
echo    1. Enable 2-Step Verification if not enabled
echo    2. Click "App passwords"
echo    3. Select "Mail" and "Other (Custom name)"
echo    4. Enter name: "Ayodhya Court System"
echo    5. Click "Generate"
echo    6. Copy the 16-character password
echo.

echo 🔧 STEP 3: Update Environment Variables
echo    You need to set these in your Render dashboard:
echo    GMAIL_USER=jrkwrit53@gmail.com
echo    GMAIL_APP_PASSWORD=YOUR_16_CHAR_APP_PASSWORD
echo.

echo 🌐 STEP 4: Update Render Environment
echo    1. Go to your Render dashboard
echo    2. Select your ayodhya-court-main service
echo    3. Go to Environment tab
echo    4. Add the two variables above
echo    5. Redeploy your service
echo.

echo ⚡ QUICK TEST:
echo    After setup, test: https://ayodhya-court-main.onrender.com/email-status
echo.

echo Press any key to open Google Account settings...
pause >nul

start https://myaccount.google.com/apppasswords

echo.
echo ✅ After getting App Password:
echo    1. Update Render environment variables
echo    2. Redeploy your service
echo    3. Test: https://ayodhya-court-main.onrender.com/email-status
echo.

echo Press any key to exit...
pause >nul
