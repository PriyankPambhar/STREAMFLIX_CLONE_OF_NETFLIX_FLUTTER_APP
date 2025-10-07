# Flutter Installation Guide for Windows

## Quick Install Steps

### Option 1: Manual Installation (Recommended)

1. **Download Flutter SDK**
   - Go to: https://docs.flutter.dev/get-started/install/windows
   - Download the latest stable Flutter SDK (about 1GB)

2. **Extract Flutter**
   - Extract the zip file to `C:\flutter` (or any location without spaces)
   - Avoid paths with spaces like "Program Files"

3. **Add Flutter to PATH**
   - Open "Environment Variables" (search in Start menu)
   - Under "User variables", find "Path" and click Edit
   - Add new entry: `C:\flutter\bin` (or your flutter\bin path)
   - Click OK to save

4. **Restart PowerShell/Command Prompt**
   - Close all terminals
   - Open a new PowerShell window

5. **Verify Installation**
   ```powershell
   flutter doctor
   ```

### Option 2: Using Chocolatey (If you have it)

```powershell
# Run PowerShell as Administrator
choco install flutter
```

### Option 3: Using Git Clone

```powershell
# If you have Git installed
cd C:\
git clone https://github.com/flutter/flutter.git -b stable
# Then add C:\flutter\bin to PATH as in Option 1
```

## After Installation

1. **Run Flutter Doctor**
   ```powershell
   flutter doctor
   ```
   This will check for any missing dependencies.

2. **Install Dependencies for This Project**
   ```powershell
   cd C:\Users\PD\Music\netflix\netflix
   flutter pub get
   ```

3. **Run the Netflix Clone App**
   ```powershell
   # For Web (Chrome)
   flutter run -d chrome --dart-define=TMDB_API_KEY=58da31f2a41f86b707533f2c56379467
   
   # For Windows Desktop
   flutter run -d windows --dart-define=TMDB_API_KEY=58da31f2a41f86b707533f2c56379467
   ```

## Troubleshooting

### If Flutter command not found:
- Make sure you added Flutter to PATH correctly
- Restart your terminal/computer
- Try using full path: `C:\flutter\bin\flutter.bat`

### For Web development:
- Chrome must be installed
- Edge can also be used: `flutter run -d edge`

### For Windows Desktop:
- Visual Studio 2022 with "Desktop development with C++" workload is required
- Run: `flutter doctor` to check

## Quick Run Scripts

After Flutter is installed, you can use:
- `run_app.ps1` - PowerShell script with menu
- `INSTALL_AND_RUN.bat` - Batch file for quick run

Just double-click or run in terminal!
