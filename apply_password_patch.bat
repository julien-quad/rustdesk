@echo off
REM Script to apply custom password patch for Technic informatique
REM Run this after: git submodule update --init --recursive

echo Applying custom permanent password patch for Technic informatique...

SET CONFIG_FILE=libs\hbb_common\src\config.rs

if not exist "%CONFIG_FILE%" (
    echo Error: %CONFIG_FILE% not found. Make sure submodules are initialized.
    echo Run: git submodule update --init --recursive
    exit /b 1
)

REM Check if patch already applied
findstr /C:"Custom default permanent password for Technic informatique" "%CONFIG_FILE%" >nul
if %errorlevel% equ 0 (
    echo Patch already applied!
    exit /b 0
)

echo.
echo MANUAL PATCH REQUIRED:
echo.
echo Please edit the file: %CONFIG_FILE%
echo.
echo Find the function "pub fn get_permanent_password() -^> String {"
echo and add these lines BEFORE the final closing brace:
echo.
echo         // Custom default permanent password for Technic informatique
echo         if password.is_empty() {
echo             password = "^&aqw1AQW".to_string();
echo         }
echo.
echo See PASSWORD_EXPLANATION.md for detailed instructions.
echo.
pause
