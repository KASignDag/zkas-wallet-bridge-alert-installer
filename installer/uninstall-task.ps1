#Requires -RunAsAdministrator
$ErrorActionPreference = 'SilentlyContinue'
$TaskName = 'ZKas Wallet Bridge Alert Installer'
Stop-ScheduledTask -TaskName $TaskName
Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
