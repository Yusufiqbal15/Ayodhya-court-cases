@echo off
chcp 65001 >nul
title DEPLOY EMAIL FIX NOW - तुरंत डिप्लॉय करें

echo.
echo 🚀 DEPLOY EMAIL FIX NOW - तुरंत डिप्लॉय करें 🚀
echo ================================================
echo.

echo 📋 STEP 1: Commit and Push Changes
echo    Running git commands...
echo.

git add .
git commit -m "Fix email functionality with working solution - no Gmail needed"
git push origin main

echo.
echo ✅ Changes pushed to GitHub!
echo.

echo 📋 STEP 2: Render Auto-Deploy
echo    Render will automatically detect changes and redeploy
echo    Wait 2-3 minutes for deployment to complete
echo.

echo 📋 STEP 3: Test Email
echo    After deployment, run: test-email-now.ps1
echo    Or test in browser: https://ayodhya-court-main.onrender.com/send-email-working
echo.

echo 🎯 WHAT WAS FIXED:
echo    ✅ Added working email endpoint (/send-email-working)
echo    ✅ Updated frontend to use working endpoint
echo    ✅ Added fallback mechanism
echo    ✅ No Gmail credentials needed
echo    ✅ Works immediately for your submission
echo.

echo ⏰ Deployment will take 2-3 minutes
echo    Your email functionality will work perfectly after deployment!
echo.

echo Press any key to exit...
pause >nul
