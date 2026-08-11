# Bash Basics & Conditionals — Cheat Sheet

## Task 1: Basics

### 1. Shebang

```bash
#!/bin/bash
```

Tells Linux to run the script using **Bash**.

Example:

```bash
#!/bin/bash
echo "Hello World"
```

---

### 2. Running a Script

Give execute permission:

```bash
chmod +x script.sh
```

Run directly:

```bash
./script.sh
```

Or run using Bash without execute permission:

```bash
bash script.sh
```

**Difference:**

```text
./script.sh   → needs execute permission + uses shebang
bash script.sh → Bash directly runs the script
```

---

### 3. Comments

Single-line comment:

```bash
# This is a comment
echo "Hello"
```

Inline comment:

```bash
echo "Hello"  # Print greeting
```

Comments are ignored by Bash.

---

### 4. Variables

Declare:

```bash
name="Rahul"
age=30
```

Use:

```bash
echo $name
echo $age
```

#### Quoting

```bash
echo $name
echo "$name"
echo '$name'
```

If:

```bash
name="Rahul Kumar"
```

Then:

```bash
echo $name
```

May be split into multiple words.

```bash
echo "$name"
```

Preserves the value as one string.

```bash
echo '$name'
```

Prints literally:

```text
$name
```

**Rule:** Prefer `"$VAR"` when using variables.

---

### 5. Reading User Input

```bash
read -p "Enter your name: " name

echo "Hello $name"
```

Example:

```text
Enter your name: Rahul
Hello Rahul
```

---

### 6. Command-Line Arguments

Run:

```bash
./script.sh Rahul 30
```

Inside the script:

| Variable | Meaning                         |
| -------- | ------------------------------- |
| `$0`     | Script name                     |
| `$1`     | First argument                  |
| `$2`     | Second argument                 |
| `$#`     | Number of arguments             |
| `$@`     | All arguments                   |
| `$?`     | Exit status of previous command |

Example:

```bash
#!/bin/bash

echo "Script: $0"
echo "Name: $1"
echo "Age: $2"
echo "Arguments: $#"
echo "All args: $@"
```

Run:

```bash
./script.sh Rahul 30
```

Output:

```text
Script: ./script.sh
Name: Rahul
Age: 30
Arguments: 2
All args: Rahul 30
```

### `$?` Example

```bash
ls /tmp
echo $?
```

```text
0 → command successful
non-zero → command failed
```

---

# Task 2: Operators and Conditionals

## 1. String Comparisons

```bash
name="Rahul"

[ "$name" = "Rahul" ]
[ "$name" != "Amit" ]
[ -z "$name" ]
[ -n "$name" ]
```

| Operator | Meaning             |
| -------- | ------------------- |
| `=`      | Equal               |
| `!=`     | Not equal           |
| `-z`     | String is empty     |
| `-n`     | String is not empty |

Example:

```bash
if [ "$name" = "Rahul" ]; then
    echo "Correct"
fi
```

---

## 2. Integer Comparisons

```bash
a=10
b=20
```

| Operator | Meaning               |
| -------- | --------------------- |
| `-eq`    | Equal                 |
| `-ne`    | Not equal             |
| `-lt`    | Less than             |
| `-gt`    | Greater than          |
| `-le`    | Less than or equal    |
| `-ge`    | Greater than or equal |

Example:

```bash
if [ "$a" -lt "$b" ]; then
    echo "a is smaller"
fi
```

**Remember:** Don't use `>` or `<` for integer comparison inside `[ ]`.

---

## 3. File Test Operators

```bash
[ -f "$file" ]
```

| Operator | Meaning                      |
| -------- | ---------------------------- |
| `-f`     | Regular file exists          |
| `-d`     | Directory exists             |
| `-e`     | File/directory exists        |
| `-r`     | Readable                     |
| `-w`     | Writable                     |
| `-x`     | Executable                   |
| `-s`     | File exists and is not empty |

Example:

```bash
if [ -f "/etc/passwd" ]; then
    echo "File exists"
fi
```

---

## 4. `if`, `elif`, `else`

Syntax:

```bash
if [ condition ]; then
    commands
elif [ condition ]; then
    commands
else
    commands
fi
```

Example:

```bash
age=20

if [ "$age" -ge 18 ]; then
    echo "Adult"
elif [ "$age" -ge 13 ]; then
    echo "Teenager"
else
    echo "Child"
fi
```

---

## 5. Logical Operators

### AND — `&&`

Run second command only if first succeeds:

```bash
mkdir test && echo "Directory created"
```

Inside condition:

```bash
if [ "$age" -ge 18 ] && [ "$age" -lt 60 ]; then
    echo "Working age"
fi
```

### OR — `||`

Run second command if first fails:

```bash
ls /tmp || echo "Directory not found"
```

### NOT — `!`

Reverse the condition:

```bash
if ! [ -f "$file" ]; then
    echo "File does not exist"
fi
```

---

## 6. Case Statement

Useful when checking **multiple possible values**.

Syntax:

```bash
case "$variable" in
    value1)
        commands
        ;;
    value2)
        commands
        ;;
    *)
        default commands
        ;;
esac
```

Example:

```bash
read -p "Enter choice: " choice

case "$choice" in
    1)
        echo "Start"
        ;;
    2)
        echo "Stop"
        ;;
    3)
        echo "Restart"
        ;;
    *)
        echo "Invalid choice"
        ;;
esac
```

### Pattern example

```bash
case "$file" in
    *.log)
        echo "Log file"
        ;;
    *.txt)
        echo "Text file"
        ;;
    *)
        echo "Unknown file"
        ;;
esac
```

---

# Quick Memory Table

| Topic                | Syntax          |   |   |
| -------------------- | --------------- | - | - |
| Shebang              | `#!/bin/bash`   |   |   |
| Variable             | `name="Rahul"`  |   |   |
| Use variable         | `"$name"`       |   |   |
| Input                | `read name`     |   |   |
| First argument       | `$1`            |   |   |
| Script name          | `$0`            |   |   |
| Argument count       | `$#`            |   |   |
| All arguments        | `"$@"`          |   |   |
| Previous exit status | `$?`            |   |   |
| String equal         | `=`             |   |   |
| String not equal     | `!=`            |   |   |
| Empty string         | `-z`            |   |   |
| Number equal         | `-eq`           |   |   |
| Number greater       | `-gt`           |   |   |
| File                 | `-f`            |   |   |
| Directory            | `-d`            |   |   |
| Readable             | `-r`            |   |   |
| Writable             | `-w`            |   |   |
| Executable           | `-x`            |   |   |
| AND                  | `&&`            |   |   |
| OR                   | `               |   | ` |
| NOT                  | `!`             |   |   |
| Conditional          | `if ... fi`     |   |   |
| Multiple choices     | `case ... esac` |   |   |
