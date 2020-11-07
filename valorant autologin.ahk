#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode,Mouse,Window
CoordMode,Pixel,Window

global riotClientPath := "D:\Riot Games\Riot Client\RiotClientServices.exe"
global login := A_Args[1]
global pass := A_Args[2]

;msgbox, login is %login% and pass is %pass%

login(){
	WinActivate, Riot Client
	MouseClick, left, 250, 250
	Send, ^a
	Send, {Delete}
	Send, %login%
	Send, %A_Tab%
	Send %pass%
	Send, {Enter}
}



if WinExist("Riot Client"){
	login()
} else{
	Run %riotClientPath% --launch-product=valorant --launch-patchline=live
	;Waiting for riot client to start
	while(!WinExist("Riot Client")){
	}
	login()
	ExitApp
}
