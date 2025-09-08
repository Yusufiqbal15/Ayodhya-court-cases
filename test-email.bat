@echo off
chcp 65001 >nul
echo 🔍 Testing Email Configuration...
echo ईमेल कॉन्फ़िगरेशन का परीक्षण...
echo.

curl -s http://localhost:5000/email-config/test

echo.
echo.
echo Press any key to continue...
pause >nul
