# Netflix Clone Flutter App Runner Script

Write-Host "========================================"
Write-Host "Netflix Clone Flutter App - Run Script"
Write-Host "========================================"
Write-Host ""

# Check if Flutter is installed
$flutterPath = Get-Command flutter -ErrorAction SilentlyContinue

if (-not $flutterPath) {
    Write-Host "Flutter is not installed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "To install Flutter:" -ForegroundColor Yellow
    Write-Host "1. Download Flutter SDK from: https://docs.flutter.dev/get-started/install/windows"
    Write-Host "2. Extract to C:\flutter (or your preferred location)"
    Write-Host "3. Add Flutter\bin to your PATH environment variable"
    Write-Host "4. Restart PowerShell and run this script again"
    Write-Host ""
    Write-Host "Quick install using Chocolatey (if you have it):" -ForegroundColor Green
    Write-Host "choco install flutter"
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit
}

Write-Host "Flutter found! Version:" -ForegroundColor Green
flutter --version

Write-Host ""
Write-Host "Getting dependencies..." -ForegroundColor Yellow
flutter pub get

Write-Host ""
Write-Host "========================================"
Write-Host "Choose how to run the app:"
Write-Host "========================================"
Write-Host "1. Run on Chrome (Web)"
Write-Host "2. Run on Windows Desktop"
Write-Host "3. Run on Android Emulator"
Write-Host "4. Check Flutter Doctor (diagnose issues)"
Write-Host "5. Exit"
Write-Host ""

$choice = Read-Host "Enter your choice (1-5)"

$apiKey = "58da31f2a41f86b707533f2c56379467"

switch ($choice) {
    "1" {
        Write-Host "Running on Chrome..." -ForegroundColor Green
        flutter run -d chrome --dart-define=TMDB_API_KEY=$apiKey
    }
    "2" {
        Write-Host "Running on Windows Desktop..." -ForegroundColor Green
        flutter run -d windows --dart-define=TMDB_API_KEY=$apiKey
    }
    "3" {
        Write-Host "Running on Android Emulator..." -ForegroundColor Green
        Write-Host "Make sure your emulator is running first!" -ForegroundColor Yellow
        flutter run --dart-define=TMDB_API_KEY=$apiKey
    }
    "4" {
        Write-Host "Running Flutter Doctor..." -ForegroundColor Green
        flutter doctor -v
        Read-Host "Press Enter to continue"
    }
    default {
        Write-Host "Exiting..." -ForegroundColor Yellow
    }
}
