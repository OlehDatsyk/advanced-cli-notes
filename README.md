# Advanced CLI Notes Archive

A lightweight, powerful command-line interface (CLI) notebook application built purely with Python. Designed for developers and power users who prefer logging thoughts, tracking development tasks, or maintaining a personal stream of consciousness directly from the terminal without leaving the keyboard.

<p align="center">
  <img src="https://github.com/user-attachments/assets/8e84fa62-53d9-49fc-9d0b-fa047a2ea28d" alt="CLI Notes Preview" width="300">
  <img src="https://github.com/user-attachments/assets/4c6ac338-502f-4d07-8ccc-1f76476ae1cc" alt="CLI Notes Preview" width="300">
  <img src="https://github.com/user-attachments/assets/dfb5d4dd-95cf-46a8-8f3e-93154f1ccf6a" alt="CLI Notes Preview" width="300">
</p>

## 🚀 Features

* **Zero Dependencies:** Built entirely using Python's native modules (`os` and `datetime`)—no external package installations required.
* **Automatic Chronological Timestamping:** Every single saved entry is automatically prefixed with a standardized `[YYYY-MM-DD HH:MM:SS]` timestamp metadata tag.
* **Local Persistent Storage:** Saves records securely onto your machine in a flat-file database (`notes.txt`) that persists even after closing your terminal session.
* **Built-in Search Engine:** Instantly scans your entire notebook file line-by-line and extracts specific entries matching any case-insensitive keyword.
* **Fail-Safe Disks Cleanses:** Safeguarded master reset option requiring user validation confirmations (`y/n`) before purging historical logs.

## 🛠️ Prerequisites

Before running this project, you will need to have Python installed on your machine.

## 📦 Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/OlehDatsyk/advanced-cli-notes.git](https://github.com/OlehDatsyk/advanced-cli-notes.git)
   cd advanced-cli-notes
