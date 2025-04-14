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
        SendInput, 10
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
    sleep 350 ; slower then all the others to make sure it doesnt break overnight

; First Slot Add
    MouseMove, 795, 631, 3
    sleep 300
    Click, 795, 631
    sleep 300
    Click, 795, 631
    sleep 350 ; slower then all the other ones to make sure it doesnt break overnight
}

F2::
    ActionExecuted := False
    ToolTip, Action Reset. It will run again on next loop.
    SetTimer, RemoveToolTip, -2000
return

RemoveToolTip:
    ToolTip
return
