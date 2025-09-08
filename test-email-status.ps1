# Test Email Status Script
Write-Host "🔍 Testing Email Status..." -ForegroundColor Yellow

$url = "https://ayodhya-court-main.onrender.com/email-status"

try {
    $response = Invoke-RestMethod -Uri $url -Method Get
    Write-Host "✅ Email Status:" -ForegroundColor Green
    Write-Host "   Status: $($response.status)" -ForegroundColor White
    Write-Host "   Message: $($response.message)" -ForegroundColor White
    
    if ($response.status -eq "not_configured") {
        Write-Host "❌ Email not configured!" -ForegroundColor Red
        Write-Host "   Quick Fix: $($response.quickFix)" -ForegroundColor Yellow
        Write-Host "   Setup URL: $($response.setupUrl)" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "🚀 Run QUICK_EMAIL_SETUP.bat for step-by-step instructions" -ForegroundColor Green
    }
} catch {
    Write-Host "❌ Error testing email status:" -ForegroundColor Red
    Write-Host "   $($_.Exception.Message)" -ForegroundColor White
}

Write-Host ""
Write-Host "📧 To test email configuration:" -ForegroundColor Cyan
Write-Host "   https://ayodhya-court-main.onrender.com/email-config/test" -ForegroundColor White
Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
