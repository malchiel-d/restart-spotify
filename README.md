# restart-spotify

> Restart Spotify and resume playback instantly with a single shortcut (`Ctrl` + `Alt` + `S`).

---

## Quick Start (No Coding Required)

### Step 1: Install AutoHotkey

Download and install **AutoHotkey v2** from [autohotkey.com](https://www.autohotkey.com/).

### Step 2: Run the Script

1. Download `RestartSpotify.ahk` from this repository.
2. Double-click the file to run it.
3. Press `Ctrl` + `Alt` + `S` anytime to restart Spotify and hit Play.

---

## Run Automatically on Windows Startup

1. Press `Win` + `R` on your keyboard to open the Run dialog.
2. Type `shell:startup` and press **Enter**.
3. Copy `RestartSpotify.ahk` into the folder that opens.

---

## How It Works

- **Shortcut:** `Ctrl` + `Alt` + `S`
- **Actions:**
  1. Checks whether Spotify was the focused window before doing anything.
  2. Closes `Spotify.exe` completely if running.
  3. Relaunches Spotify:
     - If Spotify was focused, it reopens normally and stays in focus.
     - If Spotify was **not** focused, it reopens minimized in the background and focus is restored to whatever app you were using.
  4. Waits for the audio engine to initialize, then sends `Media Next` to skip to the next track.

### Notes

- Because Spotify's launcher briefly respawns a second window on startup, you may see a couple of quick flashes and a short CPU spike while it relaunches — this is expected and doesn't affect anything long-term.
- This is a workaround (restart + skip), not a permanent ad blocker — results can be inconsistent, and it doesn't reflect an officially supported use of Spotify.
