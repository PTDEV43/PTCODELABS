function Test-RegistryHealth {
    $jsonPath = "C:\UIUX\collections\enterprise.json"
    $data = Get-Content $jsonPath | ConvertFrom-Json
    foreach ($item in $data) {
        try {
            Invoke-WebRequest -Uri $item.url -Method Head -ErrorAction Stop | Out-Null
            Write-Host "[OK] $(.name)" -ForegroundColor Green
        } catch {
            Write-Host "[FAIL] $(.name)" -ForegroundColor Red
        }
    }
}
