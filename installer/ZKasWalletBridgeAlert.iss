#define MyAppName "ZKas Wallet Bridge Alert Installer"
#define MyAppVersion "0.1.1"
#define MyAppPublisher "KASignDag Community Tool"
#define MyAppExeName "ZKasWalletBridgeAlert.exe"

[Setup]
AppId={{8F0A56E7-7DB5-4A1F-9B35-3E4F6F3C2C11}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\ZKas Wallet Bridge Alert Installer
DefaultGroupName=ZKas Wallet Bridge Alert Installer
OutputDir=output
OutputBaseFilename=ZKas-Wallet-Bridge-Alert-Setup
Compression=lzma2
SolidCompression=yes
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequired=admin
UninstallDisplayIcon={app}\{#MyAppExeName}
WizardStyle=modern

[Files]
Source: "..\dist\ZKasWalletBridgeAlert.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "install-task.ps1"; DestDir: "{app}"; Flags: ignoreversion
Source: "uninstall-task.ps1"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\README.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\LICENSE"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Open ZKas Wallet Bridge Alert"; Filename: "http://127.0.0.1:3042"
Name: "{group}\Uninstall ZKas Wallet Bridge Alert"; Filename: "{uninstallexe}"

[Run]
Filename: "powershell.exe"; Parameters: "-NoProfile -ExecutionPolicy Bypass -File ""{app}\install-task.ps1"" -ExePath ""{app}\{#MyAppExeName}"""; Flags: runhidden waituntilterminated
Filename: "http://127.0.0.1:3042"; Description: "Open the ZKas Wallet Bridge Alert dashboard"; Flags: shellexec postinstall skipifsilent nowait

[UninstallRun]
Filename: "powershell.exe"; Parameters: "-NoProfile -ExecutionPolicy Bypass -File ""{app}\uninstall-task.ps1"""; Flags: runhidden waituntilterminated; RunOnceId: "RemoveAlertTask"

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
var
  DataDir: String;
begin
  if CurStep = ssInstall then
  begin
    DataDir := ExpandConstant('{commonappdata}\ZKasWalletBridgeAlertInstaller\data');
    ForceDirectories(DataDir);
  end;
end;
