#Requires AutoHotkey v2.0
; Hotkey: Ctrl + Alt + S
^!s::
{
    ; Remember what you were doing before we touch anything
    activeHWnd := WinExist("A")
    wasSpotifyFocused := WinActive("ahk_exe Spotify.exe") ? true : false

    ; 1. Close Spotify completely if running
    if ProcessExist("Spotify.exe")
    {
        ProcessClose("Spotify.exe")
        ProcessWaitClose("Spotify.exe", 5)
    }

    spotifyPath := A_AppData . "\Spotify\Spotify.exe"

    ; 2. Launch Spotify
    if (wasSpotifyFocused)
    {
        ; It was open and focused -> reopen normally, visible
        if FileExist(spotifyPath)
            Run(spotifyPath)
        else
            Run("spotify:")

        try WinWait("ahk_exe Spotify.exe", , 10)
        try WinActivate("ahk_exe Spotify.exe")
    }
    else
    {
        ; It was NOT focused -> reopen minimized/in background
        if FileExist(spotifyPath)
            Run('"' spotifyPath '" --minimized --minimized-to-tray')
        else
            Run("spotify:")

        ; Give it a moment to spawn, then minimize once (no polling loop)
        try WinWait("ahk_exe Spotify.exe", , 10)
        try WinMinimize("ahk_exe Spotify.exe")

        ; Spotify's launcher respawns a second real window shortly after
        ; the first one appears -> wait for that, then minimize it too.
        Sleep(1500)
        try WinMinimize("ahk_exe Spotify.exe")

        ; Restore focus to whatever you were on before
        if (activeHWnd)
            try WinActivate(activeHWnd)
    }

    ; 3. Wait for Spotify's audio engine to initialize, then skip track
    Sleep(3500)
    Send("{Media_Next}")
}
