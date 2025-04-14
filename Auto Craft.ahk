#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
Menu, Tray, Icon, %A_ScriptDir%\assets\macroicon.ico

global SelectedScript := ""
global RunningPID := ""
global StartKey := "F1"
global StopKey := "F3"

Gui, Add, Tab2, x8 y8 w400 h300, Main|Keybind|Credits

; -------- Main Tab --------
Gui, Tab, Main
Gui, Add, Text, w380, Select a potion to auto craft:
Gui, Add, DropDownList, vSelectedScript gUpdateScript Choose1 w380, None|Bounded Potion|Heavenly Potion|Rage Potion
Gui, Add, Button, vStartButton gStartScript w380, Start (F1)
Gui, Add, Button, vStopButton gStopScript w380, Stop (F3)

; -------- Keybind Tab --------
Gui, Tab, Keybind
Gui, Add, Text, w380, Set Start Key:
Gui, Add, Hotkey, vStartKeybind gSetStartKey w380, F1
Gui, Add, Text, w380, Set Stop Key:
Gui, Add, Hotkey, vStopKeybind gSetStopKey w380, F3

; -------- Credits Tab --------
Gui, Tab, Credits
Gui, Add, Text, w230, ivel's Potion Crafter
Gui, Add, Text, w230, Main developer: xVapure. He helped the GUI and provided the main parts of the code.
Gui, Add, Text, w230, A special thanks to l3m0n_0 and diego696969 for the Discord server as a platform for the macro.
Gui, Add, Text, w230, Head over to README.txt to learn how to use.
Gui, Add, Picture, x250 y40 w150 h150 0xE, assets\GlitchHuntPFP.png

Gui, Show,, ivel's Auto Potion Crafter
return

; ------------------- Handlers -------------------

UpdateScript:
    GuiControlGet, SelectedScript
return

StartScript:
    RunSelectedScript()
return

StopScript:
    StopRunningScript()
return

F1::RunSelectedScript()
F3::StopRunningScript()

RunSelectedScript() {
    global SelectedScript, RunningPID

    if (SelectedScript = "None") {
        MsgBox, Please select a script first.
        return
    }

    fileMap := Object()
    fileMap["Heavenly Potion"] := "Heavenly Potion.ahk"
    fileMap["Rage Potion"] := "Rage Potion.ahk"
    fileMap["Bounded Potion"] := "Bounded Potion.ahk"

    scriptFile := fileMap[SelectedScript]
    if (!scriptFile) {
        MsgBox, Invalid script selection.
        return
    }

    StopRunningScript()

    scriptFolder := A_Desktop . "\ivels Auto Potion Crafter\solsrngpotioncrafter-1.0.3\auto_potions_do_not_open"
    scriptPath := scriptFolder . "\" . scriptFile

    if !FileExist(scriptPath) {
        MsgBox, Script not found:`n%scriptPath%
        return
    }

    Run, %scriptPath%, , , RunningPID
    ToolTip, Running: %SelectedScript%
    SetTimer, RemoveToolTip, -2000
}

StopRunningScript() {
    global RunningPID
    if (RunningPID) {
        Process, Close, %RunningPID%
        RunningPID := ""
        ToolTip, Script stopped.
        SetTimer, RemoveToolTip, -2000
    }
}

SetStartKey:
    GuiControlGet, StartKeybind
    Hotkey, %StartKey%, Off
    StartKey := StartKeybind
    Hotkey, %StartKey%, RunSelectedScript, On
    GuiControl,, StartButton, Start (%StartKey%)
return

SetStopKey:
    GuiControlGet, StopKeybind
    Hotkey, %StopKey%, Off
    StopKey := StopKeybind
    Hotkey, %StopKey%, StopRunningScript, On
    GuiControl,, StopButton, Stop (%StopKey%)
return

RemoveToolTip:
    ToolTip
return

GuiClose:
ExitApp
