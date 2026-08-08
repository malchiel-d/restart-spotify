#Requires AutoHotkey v2.0

; Hotkey: Ctrl + Alt + S
^!s::
{
    ; 1. Close Spotify if it is running
    if ProcessExist("Spotify.exe")
    {
        ProcessClose("Spotify.exe")
        ProcessWaitClose("Spotify.exe", 5)
    }

    ; 2. Launch Spotify
    spotifyPath := A_AppData . "\Spotify\Spotify.exe"
    
    if FileExist(spotifyPath)
    {
        Run(spotifyPath)
    }
    else
    {
        ; Fallback if installed via Windows Store
        Run("spotify:")
    }

    ; 3. Wait for Spotify window to appear and become active
    if WinWait("ahk_exe Spotify.exe",, 10)
    {
        WinActivate("ahk_exe Spotify.exe")
        WinWaitActive("ahk_exe Spotify.exe",, 5)
        
        ; Delay to ensure Spotify UI finishes loading before receiving keypress
        Sleep(1500)
        
        ; 4. Press Spacebar
        Send("{Space}")
    }
}