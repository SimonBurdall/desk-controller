; ## Main #############
; Based on David Zhang's work, check it out on https://github.com/davidz-yt/desk-controller/tree/main
; Note the following hotkey prefixes (^ Ctrl) (! Alt) (+ Shift)

; ## Settings #############
#NoEnv
; #Warn 
SendMode Input  
SetWorkingDir %A_ScriptDir% 

; ## Quick Launchers #############
+F15:: ; Mute Discord or any App
send, ^+M
return

Alt & F18:: ; Open the terminal. 
Run, C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.19.10573.0_x64__8wekyb3d8bbwe\wt.exe
return

Alt & F14:: 
Process, Exist, floorp.exe 
If Not ErrorLevel
{
    Run, C:\Program Files\Ablaze Floorp\floorp.exe
}
Else
{
    WinActivate, ahk_exe floorp.exe
}
return

; ## Windows Management ###########
; # Default Management ############
+F22:: ; Default Layout
If WinExist("ahk_exe Discord.exe")  {
    WinMove, ahk_exe Discord.exe,, 0, 0, 1242, 1415
}
If WinExist("ahk_exe Floorp.exe")  { 
    WinMove, ahk_exe Floorp.exe,, 1242, 0, 2587, 1415
}

+F24:: ; Default Window position 
WinGetPos,,, Width, Height, A
WinMove, A,, 1242, 0, 2587, 1415
return 

; Resize Window 3 Col Tall
!F16::
WinGetPos, X, Y, W, H, A
WinMove, A,,X,0,1415,1415
return

; Resize Window Small
+F20::
WinGetPos, X, Y, W, H, A
CenterX := (A_ScreenWidth - 1277) / 2  
HalfHeightY := (A_ScreenHeight - 712) / 2
WinMove, A, , CenterX, HalfHeightY, 1277, 712 
return

; # Movement Based ################
; Expand left
!F15::
WinGetPos, X, Y, W, H, A
WinMove, A,,X-200,Y,W+200,H
return

; Move left
+F23::
WinGetPos, X, Y, W, H, A
WinMove, A,,X-200,Y,W,H
return

; Compress left
+F21::
WinGetPos, X, Y, W, H, A
WinMove, A,,X+200,Y,W-200,H
return

; Expand right
!F17::
WinGetPos, X, Y, W, H, A
WinMove, A,,X,Y,W+200,H
return

; Move right
!F13::
WinGetPos, X, Y, W, H, A
WinMove, A,,X+200,Y,W,H
return

; Compress right
+F19::
WinGetPos, X, Y, W, H, A
WinMove, A,,X,Y,W-200,H
return

; ## Light & Screen Management ####
