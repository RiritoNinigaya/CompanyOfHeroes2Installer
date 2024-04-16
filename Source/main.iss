; ///////////////////////////////////////////////////////////
; // Graphical Installer for Inno Setup                    //
; // Build: 6.2.2                                  //
; // Copyright (c) 2011 - 2024 unSigned, s. r. o.          //
; // http://www.graphical-installer.com                    //
; // customers(at)unsigned.sk                              //
; // All Rights Reserved.                                  //
; ///////////////////////////////////////////////////////////
 
; *********************************************
; *              Main script file.            *
; ********************************************* 
 
; Script generated with Graphical Installer Wizard.
 
; This identifier is used for compiling script as Graphical Installer powered installer. Comment it out for regular compiling.
#define GRAPHICAL_INSTALLER_PROJECT

#ifdef GRAPHICAL_INSTALLER_PROJECT
;    File with setting for graphical interface
    #include "main.graphics.iss"
#else
;   Default UI file
    #define public GraphicalInstallerUI ""
#endif

[Setup]
AppName=CoH2
AppVersion=1.0
DefaultDirName= {autopf}\CoH2
AppPublisher=RepackFromRiritoNinigaya
OutputBaseFilename=CoH2Installer
PrivilegesRequired=lowest
OutputDir=Output
; Directive "WizardSmallImageBackColor" was modified for purposes of Graphical Installer.
WizardSmallImageBackColor={#GraphicalInstallerUI}
[Files]
Source: "C:\Include_InnoSetup\bass.dll"; DestDir: "{tmp}"; Flags: ignoreversion dontcopy
Source: "E:\Games\Company of Heroes 2\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "ANSISYS_MBR.mp3"; DestDir: "{tmp}"; Flags: ignoreversion dontcopy 
[Code]
function BASS_Init(device: Integer; freq, flags: DWORD; win: hwnd; CLSID: Integer): Boolean;
external 'BASS_Init@files:bass.dll stdcall';
 
function BASS_StreamCreateFile(mem: BOOL; f: PAnsiChar; offset1: DWORD; offset2: DWORD; length1: DWORD; length2: DWORD; flags: DWORD): DWORD;
external 'BASS_StreamCreateFile@files:bass.dll stdcall';
 
function BASS_Start(): Boolean;
external 'BASS_Start@files:bass.dll stdcall';
 
function BASS_ChannelPlay(handle: DWORD; restart: BOOL): Boolean;
external 'BASS_ChannelPlay@files:bass.dll stdcall';

function BASS_Stop(): Boolean;
external 'BASS_Stop@files:bass.dll stdcall';
 
function BASS_Free(): Boolean;
external 'BASS_Free@files:bass.dll stdcall';

const
  BASS_SAMPLE_LOOP = 4;
var
  mp3Handle: HWND;
  mp3Name: string;
procedure InitializeWizard();
begin
    InitGraphicalInstaller();
    ExtractTemporaryFile('ANSISYS_MBR.mp3');
    mp3Name := ExpandConstant('{tmp}\ANSISYS_MBR.mp3');
    BASS_Init(-1, 48000, 0, 0, 0);
    mp3Handle := BASS_StreamCreateFile(FALSE, PAnsiChar(mp3Name), 0, 0, 0, 0, BASS_SAMPLE_LOOP);
    BASS_Start();
    BASS_ChannelPlay(mp3Handle, False);
end;

// Next function is used for proper working of Graphical Installer powered installer
procedure CurPageChanged(CurPageID: Integer);
begin
    #ifdef GRAPHICAL_INSTALLER_PROJECT
    PageChangedGraphicalInstaller(CurPageID);
    #endif
end;

// Next function is used for proper working of Graphical Installer powered installer
procedure DeInitializeSetup();
begin
    #ifdef GRAPHICAL_INSTALLER_PROJECT
    DeInitGraphicalInstaller();
    #endif
end;

// End of file (EOF)
