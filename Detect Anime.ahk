#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#SingleInstance Force

run, cmd /c rmdir D:\Users\kevin\Videos\Anime\,,Hide

SetTimer checkTaiga, 1000 ;runs every second (1000 ms)

checkTaiga() {
    static existedPreviously := false ;`static` means the variable will persist between function calls, otherwise it would always be `false` on the beginning of the function
    existsNow := WinExist("ahk_exe Taiga.exe")
    if (existsNow != existedPreviously) { ; `!=` means `are different`
        if (existsNow) {
            run, cmd /c mklink /J D:\Users\kevin\Videos\Anime D:\$_ETC\con\Anime\,,Hide
        } else {
            run, cmd /c rmdir D:\Users\kevin\Videos\Anime\,,Hide
        }
        existedPreviously := existsNow
    }
}