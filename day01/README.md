# 🐚 Shell Scripting Journey

Learning shell scripting from scratch via YouTube. This repo tracks my daily progress, notes, and practice scripts.

---

## 📅 Progress Tracker

| Day | Topics Covered | Duration |
|-----|----------------|----------|
| Day 01 | Vim basics, File permissions (`chmod`) | ~30 min |

---

## 📖 Day 01 — Vim & File Permissions

### 🖊️ Vim Basics

Open or create a file using:
```bash
vim filename.extension
# Example:
vim hello.sh
```

**Essential Vim modes:**

| Mode | How to Enter | Purpose |
|------|-------------|---------|
| Normal | `Esc` | Navigate, delete, copy |
| Insert | `i` | Type/edit text |
| Command | `:` | Save, quit, etc. |

**Common commands:**
```
i        → Enter insert mode
Esc      → Go back to normal mode
:w       → Save
:q       → Quit
:wq      → Save and quit
:q!      → Quit without saving
```

---

### 🔐 File Permissions — `chmod`

Every file has three permission groups:

```
chmod [owner][group][others] filename

# Example:
chmod 754 hello.sh
```

**Permission values:**

| Number | Permission | Symbol |
|--------|-----------|--------|
| 7 | Read + Write + Execute | `rwx` |
| 6 | Read + Write | `rw-` |
| 5 | Read + Execute | `r-x` |
| 4 | Read only | `r--` |
| 0 | No permission | `---` |

**Common examples:**

```bash
chmod 777 file.sh   # Everyone can read, write, execute
chmod 755 file.sh   # Owner: rwx | Group: r-x | Others: r-x  (common for scripts)
chmod 764 file.sh   # Owner: rwx | Group: rw-  | Others: r--
chmod 700 file.sh   # Only owner can do anything
```

> 💡 **Your question answered:** If you want to give `rw` (read + write) to the group instead of `5` (r-x), use **`6`** for that position.
> Example: `chmod 764` → owner gets `rwx`, group gets `rw-`, others get `r--`

---

## 🗂️ Repo Structure

```
shell-scripting/
│
├── README.md
├── day01/
│   └── (your practice scripts)
├── day02/
│   └── ...
```

---

## 🛠️ Tools Used

- **Shell:** Bash
- **Editor:** Vim
- **OS:** Linux/Unix

---

## 🎯 Goal

Complete a structured shell scripting course and build real scripts along the way.