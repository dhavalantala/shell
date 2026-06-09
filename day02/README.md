# 🐚 Shell Scripting Journey

Learning shell scripting from scratch via YouTube. This repo tracks my daily progress, notes, and practice scripts.

---

## 📅 Progress Tracker

| Day | Topics Covered | Duration |
|-----|----------------|----------|
| Day 01 | Vim basics, File permissions (`chmod`) | ~30 min |
| Day 02 | Variables, Arguments, Comments, Conditions, Loops, Functions | ~ongoing |

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

## 📖 Day 02 — Variables, Arguments, Comments, Conditions, Loops & Functions

### 💬 Comments

```bash
# This is a single line comment

<< comment
This is a
multiline comment.
Anything written here will NOT be executed.
comment
```

> 💡 `<< comment ... comment` is called a **heredoc** used as a multiline comment trick in bash.

---

### 📦 Variables

```bash
# ✅ Correct — no spaces around =
name="Jetha Lal"

# ❌ Wrong — spaces will cause an error
name = "Jetha Lal"

# Use a variable with $
echo "Name is $name"

# Command substitution — run a command and store/use its output
echo "Today is $(date)"
```

> 💡 From `jethalal_ki_duniya.sh`: `echo "Name is $name, and date is $(date)"`

---

### ⌨️ User Input

```bash
echo "Enter the name: "
read username
echo "You entered $username"
```

`read` waits for the user to type something and stores it in a variable.

---

### 📨 Arguments

Arguments are values you pass to a script when running it:

```bash
./script.sh arg1 arg2
```

Inside the script, access them using:

| Variable | Meaning |
|----------|---------|
| `$0` | The script name itself |
| `$1` | First argument |
| `$2` | Second argument |
| `$@` | All arguments |
| `$#` | Count of arguments |

**Example from your script:**
```bash
# Run as:
./jethalal_ki_duniya.sh iyar bhide

# Inside script:
echo "The characters in $0 $1 $2"
# Output: The characters in ./jethalal_ki_duniya.sh iyar bhide
```

---

### 🔀 Conditions — `if`, `elif`, `else`

**Syntax structure:**
```bash
if [[ condition ]];
then
        echo "..."
elif [[ condition ]];
then
        echo "..."
else
        echo "..."
fi
```

> ⚠️ **Common mistakes you hit:**
> - Putting `else` without a semicolon or newline after `]]` → `syntax error near unexpected token 'else'`
> - Unclosed `"` inside echo → `unexpected EOF while looking for matching '"'`
> - Always close the block with `fi`

**`[[ ]]` vs `[ ]` — prefer double brackets:**
- `[[ ]]` is safer for strings and supports `&&`, `||` inside directly
- `[ ]` is the older POSIX style, more strict

**String comparison:**
```bash
if [[ $bandi == "daya bhabhi" ]]; then
  echo "match!"
fi
```

**Number comparison operators:**

| Operator | Meaning |
|----------|---------|
| `-eq` | Equal to |
| `-ne` | Not equal to |
| `-gt` | Greater than |
| `-lt` | Less than |
| `-ge` | Greater than or equal |
| `-le` | Less than or equal |

**`read -p` — inline prompt shortcut:**
```bash
# Instead of two lines:
echo "Enter something: "
read var

# Do it in one line:
read -p "Enter something: " var
```

**Practice script — `check_if_jetha_loyal.sh`:**
```bash
#!/bin/bash

<< Disclaimer
This is just for infotainment purpose
Disclaimer

read -p "Enter the bandi: " bandi
read -p "Jetha ka payar %: " pyaar

if [[ $bandi == "daya bhabhi" ]];
then
        echo "Jetha is loyal"
elif [[ $pyaar -ge 100 ]];
then
        echo "Jetha is loyal"
else
        echo "Jetha is not loyal"
fi
```

---

### 🔁 Loops — `for` and `while`

#### `for` loop — C-style with `(( ))`

```bash
for (( num=$2 ; num<=$3; num++ ));
do
        mkdir "$1$num"
done
```

> ⚠️ **Errors you hit:**
> - `for (num=1 ; ...)` → missing double `((` → `syntax error near unexpected token '('`
> - Spaces around `=` in `num= 1` inside `(( ))` → `operand expected (error token is " ")`
> - Always use `(( ))` double parentheses for arithmetic in for loops

**Practice script — `for_loop.sh`:**

Takes 3 arguments: folder name prefix, start number, end number — and creates that many folders.

```bash
#!/bin/bash

# This is for and while loops

# mkdir demo1/2/3/4/5

<< task
$1 is argument 1 which is folder name
$2 is start range
$3 is end range
task

for (( num=$2 ; num<=$3; num++ ));
do
        mkdir "$1$num"
done
```

```bash
# Example run:
./for_loop.sh day 01 90
# Creates: day1, day2, day3 ... day90
```

---

#### `while` loop

```bash
while [[ condition ]]
do
        # commands
done
```

> ⚠️ **Errors you hit:**
> - `num = 0` with spaces → `num: command not found` (same rule as variables — no spaces!)
> - Missing `(( ))` around condition math → `syntax error in conditional expression`

**Practice script — `while_loop.sh`:**

```bash
#!/bin/bash

num=0
while [[ $((num % 2)) -eq 0 && $num -le 10 ]]
do
        echo $num
        # To print even numbers, increment by 2 instead of 1
        num=$(( num + 2 ))
done
```

```
# Output: 0 2 4 6 8 10
```

**Key things used:**
- `$(( ))` — arithmetic expression (e.g. `num + 2`, `num % 2`)
- `&&` — AND condition inside `[[ ]]`
- `-eq 0` — equals zero
- `-le 10` — less than or equal to 10

---

### 🧩 Functions

```bash
# Define a function
greet() {
  echo "Hello, $1!"
}

# Call it
greet "Jetha Lal"
greet "Dhaval"
```

> 💡 Functions must be **defined before** they are called in the script.

---

### 📄 Practice Script — `jethalal_ki_duniya.sh`

```bash
#!/bin/bash

# This is jethalal ki duniya

<< comment
Anything
written here will not be executed
comment

# Variable
name="Jetha Lal"

echo "Name is $name, and date is $(date)"

echo "Enter the name: "
read username
echo "You entered $username"

echo "The characters in $0 $1 $2"
```

---

## 🗂️ Repo Structure

```
shell-scripting/
│
├── README.md
├── day01/
│   └── (your practice scripts)
├── day02/
│   ├── jethalal_ki_duniya.sh
│   ├── check_if_jetha_loyal.sh
│   ├── for_loop.sh
│   ├── while_loop.sh
│   └── create_user.sh
```

---

## 🛠️ Tools Used

- **Shell:** Bash
- **Editor:** Vim
- **OS:** Linux/Unix

---

## 🎯 Goal

Complete a structured shell scripting course and build real scripts along the way.