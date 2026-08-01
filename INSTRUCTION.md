# 📘 Complete Beginner's Guide to Running the CLI Notes Archive

This guide assumes you have **never used Python, Git, Visual Studio Code, a virtual environment, or a terminal before**. Follow every step in order - nothing is skipped.

---

## Table of Contents

1. [Installing Python](#1-installing-python)
2. [Installing Git](#2-installing-git)
3. [Installing Visual Studio Code](#3-installing-visual-studio-code)
4. [Recommended VS Code Extensions](#4-recommended-vs-code-extensions)
5. [Opening the Project](#5-opening-the-project)
6. [Creating a Virtual Environment](#6-creating-a-virtual-environment)
7. [Activating the Virtual Environment](#7-activating-the-virtual-environment)
8. [Installing Dependencies](#8-installing-dependencies)
9. [Environment File (.env)](#9-environment-file-env)
10. [Running the Application](#10-running-the-application)
11. [Testing the Application](#11-testing-the-application)
12. [Using Every Feature](#12-using-every-feature)
13. [Troubleshooting](#13-troubleshooting)
14. [FAQ](#14-faq)
15. [Common Mistakes](#15-common-mistakes)
16. [Security Recommendations](#16-security-recommendations)
17. [Next Learning Steps](#17-next-learning-steps)

---

## 1. Installing Python

**Windows**
1. Go to https://www.python.org/downloads/
2. Click the yellow **Download Python** button (it detects your OS automatically).
3. Run the downloaded installer.
4. ⚠️ **Important:** On the first install screen, check the box **"Add python.exe to PATH"** before clicking Install.
5. Click **Install Now** and wait for it to finish.
6. Open a terminal (see [Common Mistakes](#15-common-mistakes) if unsure how) and type:
   ```
   python --version
   ```
   You should see something like `Python 3.12.x`.

**macOS**
1. Go to https://www.python.org/downloads/
2. Download the macOS installer and run it.
3. Follow the on-screen prompts (Continue -> Agree -> Install).
4. Open **Terminal** (press `Cmd + Space`, type "Terminal", press Enter).
5. Type:
   ```
   python3 --version
   ```
   You should see something like `Python 3.12.x`.

---

## 2. Installing Git

**Windows**
1. Go to https://git-scm.com/download/win - the download starts automatically.
2. Run the installer and click **Next** through the default options (they're fine for beginners).
3. After installing, open a terminal and type:
   ```
   git --version
   ```

**macOS**
1. Open Terminal.
2. Type `git --version`.
3. If Git isn't installed, macOS will prompt you to install the "Command Line Developer Tools" - click **Install** and wait.

---

## 3. Installing Visual Studio Code

1. Go to https://code.visualstudio.com/
2. Download the version for your operating system.
3. Run the installer:
   - **Windows:** accept the defaults; consider checking "Add to PATH" and "Add 'Open with Code'".
   - **macOS:** drag the VS Code icon into your Applications folder.
4. Open VS Code once to confirm it launches correctly.

---

## 4. Recommended VS Code Extensions

Open VS Code, click the **Extensions** icon in the left sidebar (four squares), search for and install:

- **Python** (by Microsoft) - syntax highlighting, IntelliSense, and running Python files
- **Pylance** (by Microsoft) - usually installs automatically with the Python extension
- **Code Runner** (optional) - lets you run scripts with one click
- **GitLens** (optional) - helpful Git history and blame information

---

## 5. Opening the Project

1. Open VS Code.
2. Go to **File -> Open Folder...**
3. Select the folder containing `notes_app.py`.
4. VS Code will open the file explorer on the left showing your project files.
5. Open a built-in terminal inside VS Code: **Terminal -> New Terminal** (or `` Ctrl+` ``). This terminal starts in your project folder automatically.

---

## 6. Creating a Virtual Environment

A virtual environment is an isolated space for a project's Python packages so they don't conflict with other projects. This project has **no external dependencies**, but it's still good practice.

In the VS Code terminal, run:

**Windows**
```
python -m venv venv
```

**macOS**
```
python3 -m venv venv
```

This creates a folder named `venv` in your project.

---

## 7. Activating the Virtual Environment

**Windows (Command Prompt)**
```
venv\Scripts\activate
```

**Windows (PowerShell)**
```
venv\Scripts\Activate.ps1
```
> If PowerShell blocks the script, run: `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass` first, then try again.

**macOS**
```
source venv/bin/activate
```

Once activated, you'll see `(venv)` at the start of your terminal prompt.

---

## 8. Installing Dependencies

This project uses only Python's built-in `os` and `datetime` modules, so **no packages need to be installed**. If a `requirements.txt` file is ever added later, you would run:

```
pip install -r requirements.txt
```

---

## 9. Environment File (.env)

This project does **not** use any API keys, secrets, or environment variables, so **no `.env` file is required**. You can skip this step entirely.

---

## 10. Running the Application

With your virtual environment activated and your terminal open in the project folder, run:

**Windows**
```
python notes_app.py
```

**macOS**
```
python3 notes_app.py
```

You should see the menu appear:

```
========================================
      📝 ADVANCED CLI NOTES ARCHIVE
========================================
```

---

## 11. Testing the Application

Try each menu option once to confirm everything works:

1. Choose `2` to add a note - type any text and press Enter.
2. Choose `1` to view all notes - your new note should appear with a timestamp.
3. Choose `3` to search - type a keyword from your note and confirm it's found.
4. Choose `5` to exit safely.

If all four steps work without errors, the app is functioning correctly.

---

## 12. Using Every Feature

| Menu Option | What It Does | How to Use It |
|---|---|---|
| **1. View All Notes** | Prints every saved note in the order they were added, numbered. | Choose `1`. If no notes exist yet, you'll see "Your notebook is empty." |
| **2. Add New Note** | Saves a new note with an automatic timestamp. | Choose `2`, type your note, press Enter. Empty input is not saved. |
| **3. Search Notes by Keyword** | Finds notes containing a keyword (not case-sensitive). | Choose `3`, type a keyword, press Enter. |
| **4. Erase Entire Archive** | Permanently deletes all saved notes. | Choose `4`, then type `y` to confirm or anything else to cancel. |
| **5. Exit** | Closes the application. | Choose `5`. |

---

## 13. Troubleshooting

**"python is not recognized as an internal or external command" (Windows)**
Python wasn't added to PATH during installation. Reinstall Python and check "Add python.exe to PATH", or search "Environment Variables" in Windows and add Python's install folder manually.

**"command not found: python" (macOS)**
Use `python3` instead of `python` - macOS ships with Python 3 only, and it's usually accessed via `python3`.

**Emoji or symbols show as boxes or question marks**
Your terminal's font or encoding doesn't support emoji. This is a display issue only - the app still works. Try using Windows Terminal instead of the classic Command Prompt, or VS Code's integrated terminal.

**"UnicodeEncodeError" when running on Windows**
Some older Windows terminals use a code page that can't display emoji, which can cause a crash when printing. Run this first to fix it for your session:
```
chcp 65001
```
Then run the app again.

**Notes seem to disappear**
The app creates `notes.txt` in whichever folder you ran it from. If you run the script from a different folder next time, it will create a new, empty `notes.txt` there. Always run it from the same project folder.

**Permission denied errors**
Make sure you have write access to the project folder, and that `notes.txt` isn't open in another program (like Excel or Notepad) while the app is running.

---

## 14. FAQ

**Do I need the internet to run this app?**
No. Everything runs locally on your computer.

**Where are my notes stored?**
In a plain text file called `notes.txt`, in the same folder as `notes_app.py`.

**Can I edit or delete a single note?**
Not currently - the app only supports viewing, adding, searching, and erasing the entire archive. You can edit `notes.txt` manually in any text editor if needed.

**Is this app secure?**
Notes are stored as plain, unencrypted text. Don't store passwords or sensitive personal information in it.

**Can I use this on Linux?**
Yes - run `python3 notes_app.py` from a terminal the same way as macOS.

---

## 15. Common Mistakes

- **Not activating the virtual environment** before running the app (you'll notice `(venv)` is missing from the prompt).
- **Running the script from the wrong folder**, which creates a separate, empty `notes.txt` elsewhere.
- **Using `python` on macOS instead of `python3`.**
- **Closing the terminal window** thinking the app has frozen - it's actually just waiting for your menu input.
- **Typing more than one character** at the menu prompt (e.g., "1." instead of "1").

---

## 16. Security Recommendations

- Do not store passwords, financial information, or other sensitive data in your notes - they are saved as plain, unencrypted text.
- If you upload this project to GitHub, add `notes.txt` to a `.gitignore` file first so your personal notes are never published.
- Keep regular backups of `notes.txt` if your notes are important, since option 4 (Erase Entire Archive) is permanent and irreversible once confirmed.

---

## 17. Next Learning Steps

Once you're comfortable running this app, consider:

- Learning about **Python functions and file I/O** (this project is a great example of both).
- Learning **Git basics**: `git init`, `git add`, `git commit`, `git push`, so you can save versions of your project and publish it on GitHub.
- Exploring how to add features yourself, such as deleting a single note or editing an existing one.
- Learning about **exception handling** (`try`/`except`) to make the app more robust.
- Trying a simple **unit testing** framework like `pytest` to test the app's functions automatically.
