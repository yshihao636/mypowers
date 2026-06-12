@echo off
setlocal

if "%~1"=="session-start" (
  powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0session-start.ps1"
  exit /b %ERRORLEVEL%
)

exit /b 0
