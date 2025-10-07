@echo off
echo ========================================
echo Netflix Clone Flutter App - Setup Script
echo ========================================
echo.

echo Checking for Flutter installation...
where flutter >nul 2>&1
if %errorlevel% neq 0 (
    echo Flutter is not installed!
    echo.
    echo Please install Flutter first:
    echo 1. Download Flutter SDK from: https://docs.flutter.dev/get-started/install/windows
    echo 2. Extract to C:\flutter or your preferred location
    echo 3. Add Flutter to your PATH environment variable
    echo 4. Run this script again
    echo.
    pause
    exit /b 1
)

echo Flutter found! Getting dependencies...
call flutter pub get

echo.
echo ========================================
echo Choose how to run the app:
echo ========================================
echo 1. Run on Chrome (Web)
echo 2. Run on Windows Desktop
echo 3. Run on Android Emulator
echo 4. Exit
echo.
set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" (
    echo Running on Chrome...
    call flutter run -d chrome --dart-define=TMDB_API_KEY=58da31f2a41f86b707533f2c56379467
) else if "%choice%"=="2" (
    echo Running on Windows Desktop...
    call flutter run -d windows --dart-define=TMDB_API_KEY=58da31f2a41f86b707533f2c56379467
) else if "%choice%"=="3" (
    echo Running on Android Emulator...
    echo Make sure your emulator is running first!
    call flutter run --dart-define=TMDB_API_KEY=58da31f2a41f86b707533f2c56379467
) else (
    echo Exiting...
    exit /b 0
)

pause
