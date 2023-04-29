Write-Host('Starting Powershell')
$p = $profile
if (-not(Test-Path -Path $profile -PathType Leaf)) {
    cp $MyInvocation.MyCommand.Path $profile
}

function runDevEnv {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false, Position=0, ValueFromRemainingArguments=$true)]
        [string[]]$args
    )
    Write-Host($args)
    $vsPath = Get-ItemPropertyValue -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\devenv.exe" -Name "(Default)"
    Start-Process -FilePath $vsPath -ArgumentList $args
}

Set-Alias -Name devenv -Value runDevEnv -Scope Global
