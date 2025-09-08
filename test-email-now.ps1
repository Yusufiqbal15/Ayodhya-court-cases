# Test Email NOW - Immediate Test
Write-Host "🚀 Testing Email Functionality NOW..." -ForegroundColor Green

$baseUrl = "https://ayodhya-court-br1u.vercel.app"

# Test the working endpoint
Write-Host "`n📧 Testing Working Email Endpoint..." -ForegroundColor Cyan
try {
    $emailData = @{
        to = "test@example.com"
        subject = "Test Email - Working Solution"
        html = "<h1>Test Email</h1><p>This is a test email using working solution.</p>"
    }
    
    $emailResponse = Invoke-RestMethod -Uri "$baseUrl/send-email-working" -Method Post -Body ($emailData | ConvertTo-Json) -ContentType "application/json"
    
    Write-Host "✅ SUCCESS! Email is working:" -ForegroundColor Green
    Write-Host "   Success: $($emailResponse.success)" -ForegroundColor White
    Write-Host "   Message: $($emailResponse.message)" -ForegroundColor White
    Write-Host "   Note: $($emailResponse.note)" -ForegroundColor Yellow
    
    if ($emailResponse.details) {
        Write-Host "   Details:" -ForegroundColor White
        Write-Host "     Recipient: $($emailResponse.details.recipient)" -ForegroundColor White
        Write-Host "     Processed: $($emailResponse.details.processedAt)" -ForegroundColor White
        Write-Host "     Solution: $($emailResponse.details.solution)" -ForegroundColor White
    }
    
} catch {
    Write-Host "❌ Working endpoint test failed: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "   This means your backend needs to be updated with the new code." -ForegroundColor Yellow
}

Write-Host "`n🎯 SUMMARY:" -ForegroundColor Green
Write-Host "   If you see 'Success: True' above, your email is working!" -ForegroundColor White
Write-Host "   If you see an error, you need to deploy the updated backend code." -ForegroundColor Yellow

Write-Host "`n📋 NEXT STEPS:" -ForegroundColor Cyan
Write-Host "   1. If working: Great! Your submission is ready!" -ForegroundColor White
Write-Host "   2. If not working: Deploy the updated backend code to Render" -ForegroundColor Yellow

Write-Host "`nPress any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
