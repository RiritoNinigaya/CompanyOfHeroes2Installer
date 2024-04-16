; ///////////////////////////////////////////////////////////
; // Graphical Installer for Inno Setup                    //
; // Build: 6.2.2                                  //
; // Copyright (c) 2011 - 2024 unSigned, s. r. o.          //
; // http://www.graphical-installer.com                    //
; // customers(at)unsigned.sk                              //
; // All Rights Reserved.                                  //
; ///////////////////////////////////////////////////////////
 
; *********************************************
; * This file contains setting for graphical  *
; * interface. Modify them freerly.           *
; ********************************************* 
 
; Script generated with Graphical Installer Wizard.
 
; UI file for Graphical Installer
#define public GraphicalInstallerUI "GraphicalInstallerUI"
 
; Texts colors
#define public TextsColor    "$008080"
#define public HeadersColor  "$FF00FF"
#define public InversedColor "$008080"
 
; Buttons colors
#define public ButtonNormalColor   "$804000"
#define public ButtonFocusedColor  "$8000FF"
#define public ButtonPressedColor  "$FF0000"
#define public ButtonDisabledColor "$0080FF"
 
; Images - all files must be in the same directory as this .iss file!
#define public TopPicture    "CoH2Installer-top.png"    ; 690x416 px
#define public InnerPicture  "CoH2Installer-inner.png"  ; 413x237 px
#define public BottomPicture "CoH2Installer-bottom.png" ; 690x83 px
#define public ButtonPicture "Basic-green.png" ; 80x136 px
 
; File with core functions and procedures
#include "compiler:Graphical Installer\GraphicalInstaller_functions.iss"
  
[Files]
; Pictures with skin 
Source: {#TopPicture};    Flags: dontcopy;
Source: {#InnerPicture};  Flags: dontcopy;
Source: {#BottomPicture}; Flags: dontcopy;
Source: {#ButtonPicture}; Flags: dontcopy;
; DLLs
Source: compiler:Graphical Installer\botva2.dll;       Flags: dontcopy;
 
; End of file (EOF)
