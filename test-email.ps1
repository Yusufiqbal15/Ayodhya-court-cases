# Email Configuration Test Script
# ईमेल कॉन्फ़िगरेशन टेस्ट स्क्रिप्ट

Write-Host "🔍 Testing Email Configuration..." -ForegroundColor Yellow
Write-Host "ईमेल कॉन्फ़िगरेशन का परीक्षण..." -ForegroundColor Yellow

try {
    $response = Invoke-WebRequest -Uri "http://localhost:5000/email-config/test" -UseBasicParsing
    $data = $response.Content | ConvertFrom-Json
    
    if ($data.configured -eq $true) {
        if ($data.valid -eq $true) {
            Write-Host "✅ SUCCESS: Email is working properly!" -ForegroundColor Green
            Write-Host "✅ सफलता: ईमेल सही तरीके से काम कर रहा है!" -ForegroundColor Green
        } else {
            Write-Host "⚠️  WARNING: Email configured but validation failed" -ForegroundColor Yellow
            Write-Host "⚠️  चेतावनी: ईमेल कॉन्फ़िगर किया गया है लेकिन सत्यापन विफल" -ForegroundColor Yellow
        }
    } else {
        Write-Host "❌ ERROR: Email not configured" -ForegroundColor Red
        Write-Host "❌ त्रुटि: ईमेल कॉन्फ़िगर नहीं किया गया" -ForegroundColor Red
        Write-Host "Message: $($data.message)" -ForegroundColor Red
        
        if ($data.instructions) {
            Write-Host "`n📋 Instructions:" -ForegroundColor Cyan
            foreach ($instruction in $data.instructions) {
                Write-Host "   $instruction" -ForegroundColor White
            }
        }
    }
    
    Write-Host "`n📊 Response Details:" -ForegroundColor Cyan
    $data | ConvertTo-Json -Depth 3 | Write-Host
    
} catch {
    Write-Host "❌ ERROR: Cannot connect to server" -ForegroundColor Red
    Write-Host "❌ त्रुटि: सर्वर से कनेक्ट नहीं हो सकता" -ForegroundColor Red
    Write-Host "Make sure server is running: cd server && node index.js" -ForegroundColor Yellow
    Write-Host "सुनिश्चित करें कि सर्वर चल रहा है: cd server && node index.js" -ForegroundColor Yellow
}

Write-Host "`nPress any key to continue..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
