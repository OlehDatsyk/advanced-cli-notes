import os
from datetime import datetime

NOTES_FILE = "notes.txt"

def display_menu():
    print("\n" + "="*40)
    print("      📝 ADVANCED CLI NOTES ARCHIVE")
    print("="*40)
    print("1. 👁️  View All Notes (Chronological)")
    print("2. ➕ Add New Note (Auto-Timestamped)")
    print("3. 🔍 Search Notes by Keyword")
    print("4. 🧹 Erase Entire Archive")
    print("5. 🚪 Exit")
    print("="*40)

def view_notes():
    print("\n--- 📖 Current Archived Notes ---")
    if not os.path.exists(NOTES_FILE) or os.path.getsize(NOTES_FILE) == 0:
        print("[Your notebook is empty.]")
        return
        
    with open(NOTES_FILE, "r", encoding="utf-8") as file:
        for idx, line in enumerate(file, 1):
            print(f"{idx}. {line.strip()}")

def add_note():
    note_content = input("\n✍️ Type your note: ").strip()
    if note_content:
        # Get the current date and time in a clean, readable format
        current_time = datetime.now().strftime("[%Y-%m-%d %H:%M:%S]")
        
        # Combine timestamp with the note content
        full_entry = f"{current_time} - {note_content}"
        
        with open(NOTES_FILE, "a", encoding="utf-8") as file:
            file.write(full_entry + "\n")
        print("✅ Note archived with timestamp!")
    else:
        print("⚠️ Entry was empty. Nothing saved.")

def search_notes():
    print("\n--- 🔍 Search Engine ---")
    if not os.path.exists(NOTES_FILE) or os.path.getsize(NOTES_FILE) == 0:
        print("[No notes available to search.]")
        return
        
    keyword = input("Enter a keyword to look for: ").strip().lower()
    if not keyword:
        print("⚠️ Search canceled: Empty keyword.")
        return
        
    found = False
    print(f"\nResults matching '{keyword}':")
    print("-" * 30)
    
    with open(NOTES_FILE, "r", encoding="utf-8") as file:
        for idx, line in enumerate(file, 1):
            if keyword in line.lower():
                print(f"Line {idx}: {line.strip()}")
                found = True
                
    if not found:
        print("❌ No matching notes found in your history.")

def clear_all():
    confirm = input("\n⚠️ WARNING: Erase your entire notebook archive permanently? (y/n): ").strip().lower()
    if confirm == 'y':
        open(NOTES_FILE, "w", encoding="utf-8").close()
        print("🧹 Notebook cleared successfully.")

def main():
    while True:
        display_menu()
        choice = input("Choose an action (1-5): ").strip()
        
        if choice == "1":
            view_notes()
        elif choice == "2":
            add_note()
        elif choice == "3":
            search_notes()
        elif choice == "4":
            clear_all()
        elif choice == "5":
            print("\nExiting notebook. Goodbye! 👋\n")
            break
        else:
            print("❌ Invalid entry. Please enter a number from 1 to 5.")

if __name__ == "__main__":
    main()
