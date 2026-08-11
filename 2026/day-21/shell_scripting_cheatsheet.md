
# Bash Scripting Basics — Cheat Sheet

## 1. Shebang — `#!/bin/bash`

The **shebang** tells Linux which interpreter should be used to execute the script.

```bash
#!/bin/bash
```

Example:

```bash
#!/bin/bash

echo "Hello Linux"
```

Make it executable:

```bash
chmod +x script.sh
./script.sh
```

### Why does it matter?

Without the shebang, the system may not know which shell/interpreter should execute the script when using:

```bash
./script.sh
```

The shebang makes the intended interpreter explicit.

---

# 2. Running a Bash Script

There are two common ways to run a script.

## Method 1 — Execute directly

First give execute permission:

```bash
chmod +x script.sh
```

Then:

```bash
./script.sh
```

The `./` means:

> Run `script.sh` from the current directory.

---

## Method 2 — Run using Bash

```bash
bash script.sh
```

In this case, the script does **not need execute permission**.

Example:

```bash
ls -l script.sh
```

Even without execute permission:

```bash
bash script.sh
```

can run the script.

### Quick comparison

| Command          | Execute permission required? |
| ---------------- | ---------------------------- |
| `./script.sh`    | Yes                          |
| `bash script.sh` | No                           |

---

# 3. Comments

Comments are ignored by Bash.

## Single-line comment

Use `#`:

```bash
# This is a comment

echo "Hello"
```

Everything after `#` on that line is treated as a comment.

---

## Inline comment

A comment can also appear after a command:

```bash
echo "Hello"    # Print greeting
```

Another example:

```bash
NAME="Rahul"    # Store user's name
```

### Important

Don't put `#` inside quotes expecting it to be a comment:

```bash
echo "# This is NOT a comment"
```

Output:

```text
# This is NOT a comment
```

---

# 4. Variables

Variables store information.

## Declaring a variable

```bash
NAME="Rahul"
AGE=30
```

### Important

Do **not** put spaces around `=`.

Correct:

```bash
NAME="Rahul"
```

Incorrect:

```bash
NAME = "Rahul"
```

---

## Using a variable

Use `$`:

```bash
NAME="Rahul"

echo $NAME
```

Output:

```text
Rahul
```

You can also use:

```bash
echo "$NAME"
```

---

## `$VAR` vs `"$VAR"` vs `'$VAR'`

This is very important.

### `$VAR`

Bash expands the variable:

```bash
NAME="Rahul"

echo $NAME
```

Output:

```text
Rahul
```

---

### `"$VAR"`

Double quotes also expand the variable:

```bash
NAME="Rahul Sharma"

echo "$NAME"
```

Output:

```text
Rahul Sharma
```

**Recommended when using variables**, especially when values may contain spaces.

---

### `'$VAR'`

Single quotes prevent variable expansion:

```bash
NAME="Rahul"

echo '$NAME'
```

Output:

```text
$NAME
```

### Remember

```text
"$VAR"   → variable is expanded
'$VAR'   → variable is NOT expanded
```

---

## Example

```bash
#!/bin/bash

NAME="Rahul Sharma"

echo $NAME
echo "$NAME"
echo '$NAME'
```

Output:

```text
Rahul Sharma
Rahul Sharma
$NAME
```

---

# 5. Reading User Input — `read`

The `read` command gets input from the user.

Example:

```bash
#!/bin/bash

echo "Enter your name:"
read NAME

echo "Hello $NAME"
```

Run:

```text
Enter your name:
Rahul
Hello Rahul
```

---

## `read -p`

You can put the prompt directly in `read`:

```bash
read -p "Enter your name: " NAME

echo "Hello $NAME"
```

Output:

```text
Enter your name: Rahul
Hello Rahul
```

---

## Reading multiple values

```bash
read -p "Enter your first and last name: " FIRST LAST

echo "First name: $FIRST"
echo "Last name: $LAST"
```

---

## Recommended form

Use `-r` to prevent backslash interpretation:

```bash
read -r -p "Enter your name: " NAME
```

---

# 6. Command-Line Arguments

Command-line arguments allow users to pass values to a script when starting it.

Example script:

```bash
#!/bin/bash

echo "Script name: $0"
echo "First argument: $1"
echo "Number of arguments: $#"
```

Run:

```bash
./script.sh Rahul
```

Output:

```text
Script name: ./script.sh
First argument: Rahul
Number of arguments: 1
```

---

## `$0` — Script name

```bash
echo "$0"
```

Contains the name/path used to run the script.

Example:

```bash
./script.sh Rahul
```

Then:

```text
$0 = ./script.sh
```

---

## `$1` — First argument

```bash
echo "$1"
```

Example:

```bash
./script.sh Rahul
```

Result:

```text
$1 = Rahul
```

---

## `$2` — Second argument

```bash
echo "$2"
```

Example:

```bash
./script.sh Rahul 30
```

Then:

```text
$1 = Rahul
$2 = 30
```

Similarly:

```text
$3 → Third argument
$4 → Fourth argument
...
```

---

# `$#` — Number of arguments

`$#` tells you how many arguments were supplied.

Example:

```bash
#!/bin/bash

echo "Arguments: $#"
```

Run:

```bash
./script.sh Rahul 30 Linux
```

Output:

```text
Arguments: 3
```

---

# `$@` — All arguments

`$@` represents all command-line arguments.

Example:

```bash
#!/bin/bash

echo "Arguments: $@"
```

Run:

```bash
./script.sh Rahul 30 Linux
```

Output:

```text
Arguments: Rahul 30 Linux
```

### Recommended usage

Use:

```bash
"$@"
```

when passing arguments to another command or looping over them.

Example:

```bash
for arg in "$@"
do
    echo "Argument: $arg"
done
```

Run:

```bash
./script.sh Rahul 30 Linux
```

Output:

```text
Argument: Rahul
Argument: 30
Argument: Linux
```

---

# `$?` — Exit status of the last command

`$?` contains the exit status of the **previous command**.

Generally:

```text
0     → Success
non-0 → Failure
```

Example:

```bash
ls /tmp

echo "$?"
```

If `ls` succeeds:

```text
0
```

Example:

```bash
ls /does-not-exist

echo "$?"
```

Output might be:

```text
ls: cannot access '/does-not-exist': No such file or directory
2
```

The non-zero value indicates failure.

---

# Complete Example

```bash
#!/bin/bash

# Display script information

echo "Script name: $0"
echo "First argument: ${1:-Not provided}"
echo "Number of arguments: $#"

echo

# Read user input
read -r -p "Enter your name: " NAME

echo "Hello, $NAME"

echo

# Show all arguments
echo "All arguments: $@"

# Check command status
ls /tmp

echo "Last command exit status: $?"
```

Run:

```bash
chmod +x script.sh

./script.sh Rahul Linux
```

Possible output:

```text
Script name: ./script.sh
First argument: Rahul
Number of arguments: 2

Enter your name: Amit
Hello, Amit

All arguments: Rahul Linux
Last command exit status: 0
```

---

# Quick Reference

| Syntax                 | Meaning                             |
| ---------------------- | ----------------------------------- |
| `#!/bin/bash`          | Use Bash to execute the script      |
| `chmod +x script.sh`   | Give execute permission             |
| `./script.sh`          | Execute script directly             |
| `bash script.sh`       | Execute script using Bash           |
| `# comment`            | Single-line comment                 |
| `VAR="value"`          | Create/assign variable              |
| `$VAR`                 | Expand variable                     |
| `"$VAR"`               | Expand variable safely with quoting |
| `'$VAR'`               | Don't expand variable               |
| `read VAR`             | Read user input                     |
| `read -r -p "..." VAR` | Prompt and read input               |
| `$0`                   | Script name                         |
| `$1`                   | First argument                      |
| `$2`                   | Second argument                     |
| `$#`                   | Number of arguments                 |
| `$@`                   | All arguments                       |
| `$?`                   | Exit status of previous command     |

---

## ⭐ Easy Memory Trick

```text
$0  → Who am I?          → Script name
$1  → First value        → First argument
$2  → Second value       → Second argument
$#  → How many?          → Number of arguments
$@  → Give me all        → All arguments
$?  → Did it work?       → Exit status
```

### Most important Bash rule

When using variables, prefer:

```bash
echo "$VAR"
```

rather than:

```bash
echo $VAR
```

because quoting protects values containing spaces and other special characters.
