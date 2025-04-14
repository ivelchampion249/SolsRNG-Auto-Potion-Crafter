#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

ActionExecuted := False

Playspeed := 1

; First Slot Item Amount
Loop
{
    if (!ActionExecuted) {
        MouseMove, 716, 630, 3
        Sleep 300
        Click, 716, 630
        Click, 716, 630
        sleep 100
        SendInput, 250
        sleep 300
        MouseMove, 795, 631, 3
        sleep 300
        Click, 795, 631
        sleep 300
        Click, 795, 631
        sleep 150

        ActionExecuted := True
    }
; Craft Button
    MouseMove, 575, 575, 3
    sleep 300
    Click, 575, 575
    sleep 450
    Click, 575, 575
    sleep 450
    Click, 575, 575
    sleep 100
; First Slot Add
    MouseMove, 795, 631, 3
    sleep 300
    Click, 795, 631
    sleep 300
    Click, 795, 631

; Second Slot Add
	Mousemove, 795, 680, 3
	sleep 300
	Click, 795, 680
	sleep 300
	Click, 795, 680

; Third Slot Add
	MouseMove, 795, 740, 3
	sleep 300
	Click, 795, 740
	Sleep 300
	Click, 795, 740
	sleep 200

; Fourth Slot Add
    send {WheelDown 3}
    sleep 200
    MouseMove, 795, 765, 3
    sleep 450
    Click, 795, 765
    sleep 450
    Click, 795, 765
    sleep 150
    send {WheelUp 3}
    sleep 200
    MouseMove, 575, 575, 3
}

F2::
    ActionExecuted := False
    ToolTip, Action Reset. It will run again on next loop.
    SetTimer, RemoveToolTip, -2000
return

RemoveToolTip:
    ToolTip
return
