@echo off
chcp 65001 >nul
title QUICK EMAIL FIX - त्वरित ईमेल समाधान

echo.
echo 🚨 QUICK EMAIL FIX - त्वरित ईमेल समाधान 🚨
echo ================================================
echo.

echo ❌ CURRENT PROBLEM - वर्तमान समस्या:
echo    Gmail requires App Password, not regular password
echo    Gmail को App Password चाहिए, नियमित पासवर्ड नहीं
echo.

echo 💡 IMMEDIATE SOLUTION - तत्काल समाधान:
echo    1. Open this link: https://myaccount.google.com/apppasswords
echo    2. Enable 2-Step Verification if not enabled
echo    3. Generate App Password for "Mail"
echo    4. Copy the 16-character password
echo.

echo 📝 UPDATE .env FILE - .env फ़ाइल अपडेट करें:
echo    Replace COLLERATEOFFICE@12345 with your App Password
echo    COLLERATEOFFICE@12345 को अपने App Password से बदलें
echo.

echo 🔧 STEPS - चरण:
echo    1. Open server/.env file
echo    2. Change: GMAIL_APP_PASSWORD=YOUR_APP_PASSWORD_HERE
echo    3. Save the file
echo    4. Restart server: node index.js
echo.

echo 📱 OR USE MOBILE - या मोबाइल का उपयोग करें:
echo    - Go to Google Account settings
echo    - Security → 2-Step Verification → App passwords
echo    - Generate password for "Mail"
echo.

echo ⏰ This will take 2-3 minutes to set up
echo ⏰ इसमें सेटअप के लिए 2-3 मिनट लगेंगे
echo.

echo Press any key to open Google Account settings...
pause >nul

start https://myaccount.google.com/apppasswords

echo.
echo ✅ After getting App Password:
echo    1. Update .env file
echo    2. Restart server
echo    3. Test: http://localhost:5000/email-config/test
echo.

echo Press any key to exit...
pause >nul
