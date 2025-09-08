# Test Environment Variables - पर्यावरण चर का परीक्षण
Write-Host "🔍 Testing Environment Variables..." -ForegroundColor Yellow
Write-Host ""

# Check if .env file exists
if (Test-Path ".env") {
    Write-Host "✅ .env file found" -ForegroundColor Green
    Write-Host "📄 Contents:" -ForegroundColor Cyan
    Get-Content ".env" | ForEach-Object { Write-Host "   $_" -ForegroundColor White }
} else {
    Write-Host "❌ .env file not found" -ForegroundColor Red
}

Write-Host ""

# Test dotenv loading
try {
    $envContent = Get-Content ".env" -Raw
    $envVars = @{}
    
    foreach ($line in $envContent -split "`n") {
        if ($line -match "^([^=]+)=(.*)$") {
            $key = $matches[1]
            $value = $matches[2]
            $envVars[$key] = $value
            Write-Host "📋 $key = $value" -ForegroundColor Cyan
        }
    }
    
    Write-Host ""
    Write-Host "🔧 Manual Environment Setup:" -ForegroundColor Yellow
    Write-Host "   Set these variables manually:" -ForegroundColor White
    
    foreach ($key in $envVars.Keys) {
        Write-Host "   `$env:$key = `"$($envVars[$key])`"" -ForegroundColor Green
    }
    
} catch {
    Write-Host "❌ Error reading .env file: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "Press any key to continue..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
