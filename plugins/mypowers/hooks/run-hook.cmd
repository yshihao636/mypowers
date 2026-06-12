@echo off
setlocal

if "%~1"=="session-start" (
  where pwsh >nul 2>nul
  if %ERRORLEVEL% equ 0 (
    pwsh -NoProfile -ExecutionPolicy Bypass -File "%~dp0session-start.ps1"
    exit /b %ERRORLEVEL%
  )

  powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0session-start.ps1"
  exit /b %ERRORLEVEL%
)

exit /b 0
