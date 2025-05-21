; -- Inno Setup Script for Library Management System --

[Setup]
AppName=Library Management System
AppVersion=1.0
DefaultDirName={pf}\LibraryManagementSystem
OutputDir=.
OutputBaseFilename=LibraryManagementInstaller
Compression=lzma
SolidCompression=yes

[Files]
; Your C# executable
Source: "LibraryManagementSystem.exe"; DestDir: "{app}"; Flags: ignoreversion

; DLL dependencies
Source: "System.Buffers.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "System.Memory.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "System.Numerics.Vectors.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "System.Threading.Tasks.Extensions.dll"; DestDir: "{app}"; Flags: ignoreversion

; MySQL setup scripts
Source: "init_db.sql"; DestDir: "{app}"; Flags: ignoreversion
Source: "library_management.sql"; DestDir: "{app}"; Flags: ignoreversion
Source: "setup_mysql.bat"; DestDir: "{app}"; Flags: ignoreversion

; MySQL Installer MSI 
Source: "mysql-installer-community-8.0.41.0.msi"; DestDir: "{tmp}"; Flags: deleteafterinstall

[Run]
; Silent install MySQL server from MSI
Filename: "msiexec.exe"; Parameters: "/i ""{tmp}\mysql-installer-community-8.0.41.0.msi"" /qn /norestart"; Flags: runhidden waituntilterminated

; Run your batch file to configure MySQL and restore DB
Filename: "cmd.exe"; Parameters: "/C ""{app}\setup_mysql.bat"""; Flags: runhidden waituntilterminated

; Optionally launch your app after install
Filename: "{app}\LibraryManagementSystem.exe"; Description: "Launch Library Management System"; Flags: nowait postinstall skipifsilent

[Icons]
Name: "{group}\Library Management System"; Filename: "{app}\LibraryManagementSystem.exe"
