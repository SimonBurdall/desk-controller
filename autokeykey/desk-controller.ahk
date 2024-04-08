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
+F22:: ; Default Layout
If WinExist("ahk_exe Discord.exe")  {
    WinMove, ahk_exe Discord.exe,, 0, 0, 1242, 1410
}
If WinExist("ahk_exe Floorp.exe")  { 
    WinMove, ahk_exe Floorp.exe,, 1242, 0, 2587, 1410
}

+F24:: ; Default window position large
WinGetPos,,, Width, Height, A
WinMove, A, , 1242, 0, 2587, 1410
return 

!F2:: ; Default window position small
WinGetPos,,, Width, Height, A
CenterX := (A_ScreenWidth - Width) / 2
HalfHeightY := A_ScreenHeight / 1.5
WinMove, A, , CenterX, HalfHeightY, Width, A_ScreenHeight // 2
return 