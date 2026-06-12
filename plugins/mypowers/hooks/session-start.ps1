$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$PluginRoot = Split-Path -Parent $ScriptDir
$IntroFile = Join-Path $PluginRoot "docs\using-mypowers.md"

if (-not (Test-Path $IntroFile)) {
  exit 0
}

$Content = Get-Content $IntroFile -Raw

if ([string]::IsNullOrWhiteSpace($Content)) {
  exit 0
}

@{
  hookSpecificOutput = @{
    hookEventName = "SessionStart"
    additionalContext = $Content
  }
} | ConvertTo-Json -Depth 5 -Compress
