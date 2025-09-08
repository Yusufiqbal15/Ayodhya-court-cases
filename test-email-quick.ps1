# Quick Email Test - त्वरित ईमेल परीक्षण
Write-Host "🔍 Quick Email Test..." -ForegroundColor Yellow

try {
    $response = Invoke-WebRequest -Uri "http://localhost:5000/email-config/test" -UseBasicParsing
    $data = $response.Content | ConvertFrom-Json
    
    Write-Host "📊 Status: $($data.configured)" -ForegroundColor Cyan
    Write-Host "✅ Valid: $($data.valid)" -ForegroundColor Cyan
    Write-Host "💬 Message: $($data.message)" -ForegroundColor Cyan
    
    if ($data.configured -eq $true -and $data.valid -eq $true) {
        Write-Host "🎉 SUCCESS: Email is working!" -ForegroundColor Green
    } else {
        Write-Host "⚠️  ISSUE: Email needs App Password" -ForegroundColor Yellow
        Write-Host "💡 Run: QUICK_EMAIL_FIX.bat" -ForegroundColor Cyan
    }
    
} catch {
    Write-Host "❌ Server not running" -ForegroundColor Red
    Write-Host "💡 Start server: cd server && node index.js" -ForegroundColor Yellow
}

Write-Host "`nPress any key to continue..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
