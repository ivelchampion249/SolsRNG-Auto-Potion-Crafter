#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

ActionExecuted := False

Playspeed := 1

; Third Slot Item Amount
Loop
{
    if (!ActionExecuted) {
        MouseMove, 716, 740, 3
        Sleep 300
        Click, 716, 740
        Click, 716, 740
        sleep 300
        SendInput, 5
        sleep 300
        MouseMove, 795, 740, 3
        sleep 300
        Click, 795, 740
        sleep 300
        Click, 795, 740
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
}

F2::
    ActionExecuted := False
    ToolTip, Action Reset. It will run again on next loop.
    SetTimer, RemoveToolTip, -2000
return

RemoveToolTip:
    ToolTip
return
