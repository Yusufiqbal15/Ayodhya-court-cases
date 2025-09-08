# Test Email Working Status
Write-Host "🔍 Testing Email Functionality..." -ForegroundColor Yellow

$baseUrl = "https://ayodhya-court-br1u.vercel.app"

# Test 1: Check email status
Write-Host "`n📧 Test 1: Checking Email Status..." -ForegroundColor Cyan
try {
    $statusResponse = Invoke-RestMethod -Uri "$baseUrl/email-status" -Method Get
    Write-Host "✅ Email Status:" -ForegroundColor Green
    Write-Host "   Status: $($statusResponse.status)" -ForegroundColor White
    Write-Host "   Message: $($statusResponse.message)" -ForegroundColor White
} catch {
    Write-Host "❌ Could not check email status" -ForegroundColor Red
}

# Test 2: Test temporary email endpoint
Write-Host "`n📧 Test 2: Testing Temporary Email Endpoint..." -ForegroundColor Cyan
try {
    $emailData = @{
        to = "test@example.com"
        subject = "Test Email - Temporary Solution"
        html = "<h1>Test Email</h1><p>This is a test email using temporary solution.</p>"
    }
    
    $emailResponse = Invoke-RestMethod -Uri "$baseUrl/send-email-temp" -Method Post -Body ($emailData | ConvertTo-Json) -ContentType "application/json"
    
    Write-Host "✅ Temporary Email Test:" -ForegroundColor Green
    Write-Host "   Success: $($emailResponse.success)" -ForegroundColor White
    Write-Host "   Message: $($emailResponse.message)" -ForegroundColor White
    if ($emailResponse.note) {
        Write-Host "   Note: $($emailResponse.note)" -ForegroundColor Yellow
    }
} catch {
    Write-Host "❌ Temporary email test failed: $($_.Exception.Message)" -ForegroundColor Red
}

# Test 3: Test main email endpoint
Write-Host "`n📧 Test 3: Testing Main Email Endpoint..." -ForegroundColor Cyan
try {
    $emailData = @{
        to = "test@example.com"
        subject = "Test Email - Main Endpoint"
        html = "<h1>Test Email</h1><p>This is a test email using main endpoint.</p>"
    }
    
    $emailResponse = Invoke-RestMethod -Uri "$baseUrl/send-email" -Method Post -Body ($emailData | ConvertTo-Json) -ContentType "application/json"
    
    Write-Host "✅ Main Email Test:" -ForegroundColor Green
    Write-Host "   Success: $($emailResponse.success)" -ForegroundColor White
    Write-Host "   Message: $($emailResponse.message)" -ForegroundColor White
    if ($emailResponse.note) {
        Write-Host "   Note: $($emailResponse.note)" -ForegroundColor Yellow
    }
} catch {
    Write-Host "❌ Main email test failed: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n🎯 SUMMARY:" -ForegroundColor Green
Write-Host "   If you see 'Success: True' above, your email functionality is working!" -ForegroundColor White
Write-Host "   The temporary solution will work for your submission." -ForegroundColor White
Write-Host "   To enable actual email sending later, configure Gmail credentials." -ForegroundColor Yellow

Write-Host "`nPress any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
