@echo off
chcp 65001 >nul
title START SERVER WITH FIXED ENV - ठीक किए गए ENV के साथ सर्वर शुरू करें

echo.
echo 🚀 STARTING SERVER WITH FIXED ENVIRONMENT - ठीक किए गए पर्यावरण के साथ सर्वर शुरू करें 🚀
echo ================================================================================
echo.

echo 🔧 Setting environment variables manually...
echo 🔧 पर्यावरण चर मैन्युअली सेट कर रहे हैं...

set GMAIL_USER=jrkwrit53@gmail.com
set GMAIL_APP_PASSWORD=COLLERATEOFFICE@12345
set MONGODB_URI=mongodb://localhost:27017/ayodhya-court
set PORT=5000

echo ✅ Environment variables set:
echo    GMAIL_USER=%GMAIL_USER%
echo    GMAIL_APP_PASSWORD=%GMAIL_APP_PASSWORD%
echo    MONGODB_URI=%MONGODB_URI%
echo    PORT=%PORT%
echo.

echo ⚠️  NOTE: Email will still need App Password to work properly
echo ⚠️  नोट: ईमेल को सही तरीके से काम करने के लिए अभी भी App Password की आवश्यकता होगी
echo.

echo 🚀 Starting server...
echo 🚀 सर्वर शुरू कर रहे हैं...
echo.

node index.js

echo.
echo Press any key to exit...
pause >nul
