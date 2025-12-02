# Test Vercel Backend - Quick Test
Write-Host "🚀 Testing Vercel Backend..." -ForegroundColor Green

$baseUrl = https://ayodhya-court-cases-fg.vercel.app"

Write-Host "`n📧 Testing Email Endpoint on Vercel..." -ForegroundColor Cyan
try {
    $emailData = @{
        to = "test@example.com"
        subject = "Test Email - Vercel Backend"
        html = "<h1>Test Email</h1><p>Testing email from Vercel backend.</p>"
    }
    
    $emailResponse = Invoke-RestMethod -Uri "$baseUrl/send-email-working" -Method Post -Body ($emailData | ConvertTo-Json) -ContentType "application/json"
    
    Write-Host "✅ SUCCESS! Vercel backend is working:" -ForegroundColor Green
    Write-Host "   Success: $($emailResponse.success)" -ForegroundColor White
    Write-Host "   Message: $($emailResponse.message)" -ForegroundColor White
    Write-Host "   Note: $($emailResponse.note)" -ForegroundColor Yellow
    
    if ($emailResponse.details) {
        Write-Host "   Details:" -ForegroundColor White
        Write-Host "     Recipient: $($emailResponse.details.recipient)" -ForegroundColor White
        Write-Host "     Method: $($emailResponse.details.method)" -ForegroundColor White
        Write-Host "     Delivered: $($emailResponse.details.delivered)" -ForegroundColor White
    }
    
} catch {
    Write-Host "❌ Vercel backend test failed: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "   This means your Vercel backend needs to be updated with the email code." -ForegroundColor Yellow
}

Write-Host "`n🎯 SUMMARY:" -ForegroundColor Green
Write-Host "   If you see 'Success: True' above, your Vercel backend is working!" -ForegroundColor White
Write-Host "   If you see an error, you need to deploy the email code to Vercel." -ForegroundColor Yellow

Write-Host "`n📋 NEXT STEPS:" -ForegroundColor Cyan
Write-Host "   1. If working: Great! Your email functionality is ready!" -ForegroundColor White
Write-Host "   2. If not working: Deploy the email code to your Vercel backend" -ForegroundColor Yellow

Write-Host "`nPress any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
