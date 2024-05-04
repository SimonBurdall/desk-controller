; ## Main #############
; Based on David Zhang's work, check it out on https://github.com/davidz-yt/desk-controller/tree/main
; Note the following hotkey prefixes (^ Ctrl) (! Alt) (+ Shift)

; ## Settings #############
#NoEnv
; #Warn 
SendMode Input  
SetWorkingDir %A_ScriptDir% 

; Add your Home Assistant API Key below.
HomeAssistantKey := ""

; ## Quick Launchers #############
+F15:: ; Mute Discord or any App
If WinExist("ahk_exe Discord.exe")  {
    send, ^+M
}
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
MoveWindow(WinTitle, X, Y, W, H) {
  If WinExist("ahk_exe " . WinTitle) {
    WinMove, ahk_exe %WinTitle%, , %X%, %Y%, %W%, %H%
  }
}

+F22:: ; Default Layout
MoveWindow("Floorp.exe", 1273, 0, 2570, 1415)
MoveWindow("Discord.exe", 0, 0, 1278, 1415)
MoveWindow("Obsidian.exe", 0, 0, 1278, 1415)
MoveWindow("sublime_text.exe", 0, 0, 1278, 1415)
MoveWindow("TogglTrack.exe", 3839, 0, 427, 705)
MoveWindow("KeePassXC.exe", 4259, 0, 868, 712)
MoveWindow("steamwebhelper.exe", 3839, 705, 1281, 705)
return

+F24:: ; Default Window position 
WinGetPos,,, Width, Height, A
WinMove, A,, 1273, 0, 2570, 1415
return 

; Resize Window 3 Col Tall
!F16::
WinGetPos, X, Y, W, H, A
WinMove, A,,X,0,1278,1415
return

; Resize Window Small
+F20::
WinGetPos, X, Y, W, H, A
CenterX := (A_ScreenWidth - 1721) / 2  
HalfHeightY := (A_ScreenHeight - 712) / 2
WinMove, A, , CenterX, HalfHeightY, 1721, 712 
return

; Open Task View - emulating MacOS Expanded view shortcut
^up::
send, #{Tab}
return

; # Movement Based ################
; Expand left
!F15::
WinGetPos, X, Y, W, H, A
WinMove, A,,X-426,Y,W+426,H
return

; Move left
+F23::
WinGetPos, X, Y, W, H, A
WinMove, A,,X-426,Y,W,H
return

; Compress left
+F21::
WinGetPos, X, Y, W, H, A
WinMove, A,,X+426,Y,W-426,H
return

; Expand right
!F17::
WinGetPos, X, Y, W, H, A
WinMove, A,,X,Y,W+426,H
return

; Move right
!F13::
WinGetPos, X, Y, W, H, A
WinMove, A,,X+426,Y,W,H
return

; Compress right
+F19::
WinGetPos, X, Y, W, H, A
WinMove, A,,X,Y,W-426,H
return

; ## Light & Screen Management ####
; Toggle Screen Power
+F13::
run curl -X POST -H "Authorization: Bearer %HomeAssistantKey%" -H "Content-Type: application/json" http://homeassistant.local:8123/api/services/script/monitor_toggle_pwr,,hide
return

; # Input Based ################
; Display Port 1
+F16::
run curl -X POST -H "Authorization: Bearer %HomeAssistantKey%" -H "Content-Type: application/json" http://homeassistant.local:8123/api/services/script/quick_dp1,,hide
return

; Display Port 2
+F17::
run curl -X POST -H "Authorization: Bearer %HomeAssistantKey%" -H "Content-Type: application/json" http://homeassistant.local:8123/api/services/script/quick_dp2,,hide
return

; HDMI 1
+F18::
run curl -X POST -H "Authorization: Bearer %HomeAssistantKey%" -H "Content-Type: application/json" http://homeassistant.local:8123/api/services/script/quick_hdmi,,hide
return