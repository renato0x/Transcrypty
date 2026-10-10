; Transcrypty — Inno Setup Script
; renato0x

#define MyAppName "Transcrypty"
#ifndef MyAppVersion
#define MyAppVersion "0.2"
#endif
#define MyAppPublisher "renato0x"
#define MyAppURL "https://github.com/renato0x/Transcrypty"

[Setup]
AppId={{F4A7B3C2-8D5E-4F1A-9B6C-3E2D5A8F7B1C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
DefaultDirName={localappdata}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=.
OutputBaseFilename=Transcrypty_v{#MyAppVersion}_Setup
Compression=lzma2/max
SolidCompression=yes
UninstallDisplayIcon={app}\Transcrypty.exe
UninstallDisplayName={#MyAppName}
PrivilegesRequired=lowest
DisableDirPage=auto
DisableFinishedPage=no
SetupIconFile=logo.ico

VersionInfoVersion={#MyAppVersion}.0
VersionInfoCompany={#MyAppPublisher}
VersionInfoDescription=Transcrypty — Local speech transcription

WizardImageFile=banner.bmp
WizardSmallImageFile=small.bmp
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
 WelcomeLabel1=Welcome to Transcrypty {#MyAppVersion}
 WelcomeLabel2=This will install Transcrypty on your computer.%n%nLightweight, private, offline speech transcription.

[Files]
Source: "dist\Transcrypty\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop shortcut"; GroupDescription: "Shortcuts:"; Flags: checkedonce

[Icons]
Name: "{userdesktop}\Transcrypty"; Filename: "{app}\Transcrypty.exe"; WorkingDir: "{app}"; Tasks: desktopicon; Comment: "Transcrypty — Local speech transcription"
Name: "{group}\Transcrypty"; Filename: "{app}\Transcrypty.exe"; WorkingDir: "{app}"; Comment: "Transcrypty — Local speech transcription"
Name: "{group}\Uninstall Transcrypty"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\Transcrypty.exe"; Description: "Run Transcrypty now"; Flags: nowait postinstall skipifsilent shellexec

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

[Code]
function InitializeSetup: Boolean;
var
  ResultCode: Integer;
begin
  Result := True;
  if ShellExec('open', 'taskkill', '/f /im Transcrypty.exe', '', SW_HIDE, ewNoWait, ResultCode) then
    Sleep(500);
end;

function InitializeUninstall: Boolean;
var
  ResultCode: Integer;
begin
  Result := True;
  if ShellExec('open', 'taskkill', '/f /im Transcrypty.exe', '', SW_HIDE, ewNoWait, ResultCode) then
    Sleep(500);
end;
