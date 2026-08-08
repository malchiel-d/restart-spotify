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
  1. Closes `Spotify.exe` if running.
  2. Launches Spotify (supports both standard installer and Windows Store versions).
  3. Waits for the window to load and sends a `Spacebar` command to start playback.
