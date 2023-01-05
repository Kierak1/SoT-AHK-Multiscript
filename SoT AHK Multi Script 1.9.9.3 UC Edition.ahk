#NoEnv
#MaxThreadsPerHotkey 2
SendMode Input
SetWorkingDir %A_ScriptDir%
FileInstall,settings.ini,%A_WorkingDir%\settings.ini
FileInstall,stop.wav,%A_WorkingDir%\stop.wav
FileInstall,stop2.wav,%A_WorkingDir%\stop2.wav
IniRead,mousesens,settings.ini,mousesens1,mousesens
IniRead,mousesensminus,settings.ini,mousesens1,mousesensminus
IniRead,mousesens2,settings.ini,mousesens1,mousesens2
IniRead,mousesensminus2,settings.ini,mousesens1,mousesensminus2
Hotkey, LButton, Off

;goto Is_the_Game_Running

;Is_the_Game_Running:
;if !ProcessExist("SoTGame.exe")
;{
;    SetTimer, Done, 5000
;    MsgBox Bro start the game first						This script is free on unknowncheats.me!				Made by: Kierak3
;    ExitApp
;}
;else
;{
;goto Password
;Process, WaitClose, SoTGame.exe
;ExitApp
;}
;return

~^f6::
{
Gui, Add, GroupBox, x16 y25 w290 h50 , Sensitivity
Gui, Add, Text, x26 y45 w30 h20 , Mine
Gui, Add, Edit, vSens1 x55 y46 w90 h20 , 

Gui, Add, GroupBox, x16 y85 w290 h50 , Results
Gui, Add, Button, Default x56 y105 w90 h20 , Calculate
Gui, Add, Edit, x166 y105 w130 h20 vResults, 

Gui, Show, x131 y96 h160 w325, Sensitivity Adjuster
Return

ButtonCalculate:
Enter:

Gui, Submit, NoHide

Calc:

X =
X2 =
Status =

X1 := (1.7 / Sens1)

X := 950 * (X1)
X := RegExReplace(X, "\.\d*")

X2 := 650 * (X1)
X2 := RegExReplace(X2, "\.\d*")

If X < 1 
{
  Status = Can't be negative
}
If X > 1 
{
  Status = That's your X value
}

Display:
GuiControl, , Results, %X% - %Status%
IniWrite, %X%, settings.ini, mousesens1, mousesens
IniWrite, -%X%, settings.ini, mousesens1, mousesensminus
IniWrite, %X2%, settings.ini, mousesens1, mousesens2
IniWrite, -%X2%, settings.ini, mousesens1, mousesensminus2
Return

GuiClose:
ExitApp
}
return

;Rowboat Script
~^f5::
Toggle := !Toggle
loop
{
    If not Toggle
        break
Send {a down} {d down}
Sleep, 1500
Send {a up} {d up}
Sleep, 300
    tooltip,% A_Index
}
return

;Ladder Shot
~^c::
{
Send {e}
Send {rbutton down}
Sleep, 200
Send {lbutton}
Sleep, 5
Send {rbutton up}
Sleep, 50
Send {e}
}
return

;Barrel Autocollect from Crate to Ship
~^f4::
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", mousesens)
Sleep, 100
Send {x}
Sleep, 100
while GetKeyState("f4")
{
Sleep, 100
Send {r}
Sleep, 100
Send {enter}
Sleep, 30
if !GetKeyState("f4")
    break
Send {esc}
Sleep, 100
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", mousesensminus)
Sleep, 100
Send {e}
Sleep, 100
Send {Left}
Sleep, 5
Send {Left}
Sleep, 5
Send {Left}
Sleep, 5
Send {Left}
Sleep, 5
Send {Left}
Sleep, 5
Send {Left}
Sleep, 5
Send {Left}
Sleep, 5
Send {Left}
Sleep, 50
Send {enter}
Sleep, 10
if !GetKeyState("f4")
    break
Send {esc}
Sleep, 100
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", mousesens)
}
return

;Barrel Autocollect from Ship to Crate
~^f3::
{
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", mousesens)
Sleep, 10
Send {x}
Sleep, 10
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", mousesensminus)
Sleep, 10
Send {e}
Sleep 75
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {esc}
Sleep, 100
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", mousesens)
Sleep, 10
Send {r}
Sleep, 50
Send {q}
Sleep, 75
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {esc}
Sleep, 100
Send {e}
Sleep, 10
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", mousesensminus)
}
return

;Crosshair Off
~f1::
Gui, crosshair:Destroy
Return

;Crosshair
~f2::
{
Gui, crosshair:new, -Caption +AlwaysOnTop +ToolWindow +LastFound
Gui, crosshair:Margin, 0, 0
Gui, crosshair:Font, cBA000 S14 Q4
Gui, crosshair:Add, Text, BackgroundTrans vT1, +
Controlgetpos, , , picW, picH, ,
xPos := A_ScreenWidth/2 - picW/2
yPos := A_ScreenHeight/2 - picH/2
Gui crosshair:show, x%xPos% y%yPos% NA
Gui, crosshair:Color, 00FF00
WinSet, TransColor, 00FF00
}
return

;Double Gun
~*c::			
{
Sleep, 275
Send, {wheeldown}
Sleep, 100
Send, {w down}
Sleep, 100
Send, {lshift down}
Sleep, 5
Send, {lshift up}
Sleep, 5
Send, {w up}
Sleep, 5
Send, {rbutton down}
Sleep, 350
Send, {lbutton}
Sleep, 20
Send, {rbutton up}
}
return

;Bhop
~*space::
Loop
{
GetKeyState,state,space,P
if state = U
break

Send, {Blind}{SPACE}
Sleep,20
}
return

;Turn off or on the script
f12::
Suspend,Toggle
Pause
return

;AntiAFK
~^f12::
Toggle := !Toggle
loop
{
    If not Toggle
        break
Send, {w down}
Sleep, 1000
Send, {w up}
Sleep, 1000
Send, {s down}
Sleep, 1000
Send, {s up}
Sleep, 1000
    tooltip,% A_Index
}
return

;Auto Reloading
~lbutton::
{
Sleep, 100
Send, {x}
Sleep, 50
Send, {x}
}
return

;Pause Auto Reloading
~^J::
Hotkey, lbutton, Toggle
Return

;Auto Digging
~^g::
while GetKeyState("g")
{
Send {lbutton}
Sleep, 50
Send, {x}
Send, {x}
Sleep, 50
}
return

;Auto Bucket
~^h::
while GetKeyState("h")
{
Send {lbutton}
Sleep, 10
Send {x}
Sleep, 10
Send {x}
Sleep, 10
Send {lbutton}
Sleep, 400
Send {x}
Sleep, 10
Send {x}
Sleep, 10
}
return

;Cannon Reload
~^rbutton::
while GetKeyState("rbutton")
{
Send {lbutton}
Sleep 100
Send {r}
Sleep 2000
}
return

;Barrel Autocollect
~^f::
{
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", mousesens2)
Sleep, 10
Send {x}
Sleep, 10
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", mousesensminus2)
Sleep, 10
Send {e}
Sleep 75
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {f}
Sleep, 10
Send {esc}
Sleep, 100
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", mousesens2)
Sleep, 10
Send {r}
Sleep, 50
Send {q}
Sleep, 75
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {f}
Sleep, 100
Send {esc}
Sleep, 100
Send {e}
Sleep, 10
DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", mousesensminus2)
}
return

;SWORDLUNGE 					;keybind (currently Ctrl + Alt + S)
~^!s::
{
Send {rbutton down}
Sleep,100
Send {lbutton down}
Sleep,500
Send {lbutton up}
Send {rbutton up}
Sleep,1500
Send {space}
}
return

;LOOTSPRINT
~v:: 						;keybind (currently V)
while GetKeyState("v")
{
Send, {x Down}
Sleep, 1
Send, {shift}
Sleep, 1
Send, {e}
Send, {x Up}
}
return

;Freeze and Unfreeze the game anytime		;keybind (currently Ctrl + X)
~^x::

if (toggle := !toggle) {

SoundPlay, stop.wav

Process_Suspend("SoTGame.exe")

Process_Suspend(PID_or_Name){
	 
	     PID := (InStr(PID_or_Name,".")) ? ProcExist(PID_or_Name) : PID_or_Name
 	 
 	    h:=DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", pid)
 	 
	     If !h   
 
	         Return -1
 
	     DllCall("ntdll.dll\NtSuspendProcess", "Int", h)
 
	     DllCall("CloseHandle", "Int", h)
	 	}
	  
	 } else {
 
	 Process_Resume("SoTGame.exe")

	 SoundPlay, stop2.wav
	  
	 Process_Resume(PID_or_Name){
	  
	     PID := (InStr(PID_or_Name,".")) ? ProcExist(PID_or_Name) : PID_or_Name
	  
	     h:=DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", pid)
	  
	     If !h   
	  
	         Return -1
	  
	     DllCall("ntdll.dll\NtResumeProcess", "Int", h)
	  
	     DllCall("CloseHandle", "Int", h)
	 }
 
	 ProcExist(PID_or_Name=""){
	  
	     Process, Exist, % (PID_or_Name="") ? DllCall("GetCurrentProcessID") : PID_or_Name
	  
	     Return Errorlevel
	 	}
	 }
	 return

ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

Password:
Thread,Priority,1

SPass = This script is free on unknowncheats.me ;;Script password

InputBox, Inputpass, Password, Enter your password, HIDE,200,130
If (SPass == Inputpass)
{
gosub Credits
return
}
else
{
    Exitapp
}

Done:
ExitApp

Credits:
{
Gui, Credits:new, -Caption +AlwaysOnTop +ToolWindow +LastFound
Gui, Credits:Margin, 0, 0
Gui, Credits:Font, cBA000 S10 Q3 Bold
Gui, Credits:Add, Text, BackgroundTrans vT1, Coded By: Kierak
Controlgetpos, , , picW, picH, ,
xPos := A_ScreenWidth/1.04 - picW/2
yPos := A_ScreenHeight/70 - picH/2
Gui Credits:show, x%xPos% y%yPos% NA
Gui, Credits:Color, 000000
WinSet, TransColor, 000000
}
return