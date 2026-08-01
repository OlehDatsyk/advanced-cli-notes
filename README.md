# 📝 Advanced CLI Notes Archive

A simple, dependency-free command-line notebook written in Python. Add timestamped notes, browse them chronologically, search by keyword, and clear the archive - all from your terminal.

## Features

- 👁️ **View All Notes** - see every saved note in chronological order
- ➕ **Add New Note** - notes are automatically stamped with the current date and time
- 🔍 **Search by Keyword** - case-insensitive search across all saved notes
- 🧹 **Erase Archive** - clear the notebook with a confirmation prompt
- No external dependencies - uses only the Python standard library

## Requirements

- Python 3.7 or later (no third-party packages required)

## Installation

```bash
git clone <your-repo-url>
cd <your-repo-folder>
python notes_app.py
```

> New to Python, Git, or the terminal? See [INSTRUCTION.md](INSTRUCTION.md) for a complete beginner's walkthrough, or double-click `Start App.bat` (Windows) / `Start App (Mac).command` (macOS) to launch automatically.

## Usage

Run the script and choose an option from the menu:

```
========================================
      📝 ADVANCED CLI NOTES ARCHIVE
========================================
1. 👁️  View All Notes (Chronological)
2. ➕ Add New Note (Auto-Timestamped)
3. 🔍 Search Notes by Keyword
4. 🧹 Erase Entire Archive
5. 🚪 Exit
========================================
```

Notes are stored in a plain text file, `notes.txt`, created automatically in the same folder as the script the first time you add a note.

## Project Structure

```
.
├── notes_app.py # Main application
└── notes.txt # Created automatically - your saved notes
```

## Data Storage

Each note is saved as a single line in `notes.txt` in the format:

```
[YYYY-MM-DD HH:MM:SS] - Your note text
```

This file is plain text and unencrypted, so avoid storing sensitive information in it. If you plan to publish this project on GitHub, add `notes.txt` to your `.gitignore` so your personal notes aren't committed to version control.

## Contributing

Issues and pull requests are welcome. Please open an issue to discuss any significant change before submitting a PR.

## License

No license file is currently included in this repository. See `PROJECT_REVIEW.md` for details on why adding one is recommended before making the repository public.
