
# Bash Shell Scripting Cheat Sheet

## Task 1: Basics

### 1. Shebang

```bash
#!/bin/bash
```

Tells Linux to run the script using **Bash**.

```bash
#!/bin/bash
echo "Hello World"
```

---

### 2. Running a Script

Make executable:

```bash
chmod +x script.sh
```

Run directly:

```bash
./script.sh
```

Run using Bash:

```bash
bash script.sh
```

```text
./script.sh     → needs execute permission + uses shebang
bash script.sh  → Bash runs it directly
```

---

### 3. Comments

Single-line:

```bash
# This is a comment
echo "Hello"
```

Inline:

```bash
echo "Hello"  # Print greeting
```

---

### 4. Variables

Declare:

```bash
name="Rahul"
age=30
```

Use:

```bash
echo "$name"
echo "$age"
```

Quoting:

```bash
echo $name       # Unquoted
echo "$name"     # Variable expanded
echo '$name'     # Prints literal $name
```

**Rule:** Prefer `"$VAR"`.

---

### 5. User Input

```bash
read -p "Enter name: " name
echo "Hello $name"
```

---

### 6. Command-Line Arguments

Run:

```bash
./script.sh Rahul 30
```

| Variable | Meaning                      |
| -------- | ---------------------------- |
| `$0`     | Script name                  |
| `$1`     | First argument               |
| `$#`     | Number of arguments          |
| `$@`     | All arguments                |
| `$?`     | Previous command exit status |

Example:

```bash
echo "Script: $0"
echo "Name: $1"
echo "Arguments: $#"
echo "All: $@"
```

Exit status:

```bash
ls /tmp
echo $?
```

```text
0     → Success
non-0 → Failure
```

---

# Task 2: Operators & Conditionals

## 1. String Comparisons

```bash
name="Rahul"

[ "$name" = "Rahul" ]
[ "$name" != "Amit" ]
[ -z "$name" ]
[ -n "$name" ]
```

| Operator | Meaning   |
| -------- | --------- |
| `=`      | Equal     |
| `!=`     | Not equal |
| `-z`     | Empty     |
| `-n`     | Not empty |

---

## 2. Integer Comparisons

```bash
a=10
b=20

[ "$a" -lt "$b" ]
```

| Operator | Meaning       |
| -------- | ------------- |
| `-eq`    | Equal         |
| `-ne`    | Not equal     |
| `-lt`    | Less than     |
| `-gt`    | Greater than  |
| `-le`    | Less/equal    |
| `-ge`    | Greater/equal |

---

## 3. File Tests

```bash
file="/etc/passwd"

[ -f "$file" ]
```

| Operator | Meaning              |
| -------- | -------------------- |
| `-f`     | Regular file         |
| `-d`     | Directory            |
| `-e`     | Exists               |
| `-r`     | Readable             |
| `-w`     | Writable             |
| `-x`     | Executable           |
| `-s`     | Exists and not empty |

Example:

```bash
if [ -f "$file" ]; then
    echo "File exists"
fi
```

---

## 4. `if`, `elif`, `else`

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

### AND `&&`

```bash
[ "$age" -ge 18 ] && echo "Adult"
```

### OR `||`

```bash
[ -f "$file" ] || echo "File not found"
```

### NOT `!`

```bash
if ! [ -f "$file" ]; then
    echo "File does not exist"
fi
```

---

## 6. `case`

Useful for multiple choices:

```bash
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

Pattern matching:

```bash
case "$file" in
    *.log) echo "Log file" ;;
    *.txt) echo "Text file" ;;
    *)     echo "Unknown" ;;
esac
```

---

# Task 3: Loops

## 1. `for` Loop

### List-based

```bash
for name in Rahul Amit Priya; do
    echo "$name"
done
```

### C-style

```bash
for ((i=1; i<=5; i++)); do
    echo "$i"
done
```

---

## 2. `while`

Runs while condition is true:

```bash
count=1

while [ "$count" -le 5 ]; do
    echo "$count"
    ((count++))
done
```

---

## 3. `until`

Runs until condition becomes true:

```bash
count=1

until [ "$count" -gt 5 ]; do
    echo "$count"
    ((count++))
done
```

```text
while → while TRUE
until  → until TRUE
```

---

## 4. `break` and `continue`

### `break`

Stops the loop:

```bash
for i in {1..10}; do
    [ "$i" -eq 5 ] && break
    echo "$i"
done
```

### `continue`

Skips current iteration:

```bash
for i in {1..5}; do
    [ "$i" -eq 3 ] && continue
    echo "$i"
done
```

---

## 5. Loop Over Files

```bash
for file in *.log; do
    echo "$file"
done
```

Example:

```bash
for file in *.log; do
    gzip "$file"
done
```

---

## 6. Loop Over Command/File Output

```bash
while IFS= read -r line; do
    echo "$line"
done < users.txt
```

Using command output:

```bash
while IFS= read -r line; do
    echo "$line"
done < <(ls)
```

---

# Task 4: Functions

## 1. Define a Function

```bash
greet() {
    echo "Hello"
}
```

---

## 2. Call a Function

```bash
greet
```

---

## 3. Function Arguments

```bash
add() {
    echo "$1 + $2"
}

add 10 20
```

Inside the function:

```text
$1 → first argument
$2 → second argument
```

---

## 4. `return` vs `echo`

### `return`

Returns an **exit status**:

```bash
check_file() {
    [ -f "$1" ]
    return $?
}

check_file "/etc/passwd"

echo $?
```

```text
0     → Success
non-0 → Failure
```

### `echo`

Returns actual data:

```bash
add() {
    echo $(( $1 + $2 ))
}

result=$(add 10 20)

echo "$result"
```

Output:

```text
30
```

**Remember:**

```text
return → status
echo   → value/data
```

---

## 5. Local Variables

```bash
greet() {
    local name="Rahul"
    echo "$name"
}

greet
```

`local` keeps the variable inside the function.

---

# Task 5: Text Processing

## 1. `grep` — Search

```bash
grep "error" app.log
```

| Option | Meaning        |
| ------ | -------------- |
| `-i`   | Ignore case    |
| `-r`   | Recursive      |
| `-c`   | Count          |
| `-n`   | Line number    |
| `-v`   | Exclude match  |
| `-E`   | Extended regex |

Examples:

```bash
grep -in "error" app.log
grep -r "failed" /var/log/
grep -c "ERROR" app.log
grep -v "DEBUG" app.log
grep -E "error|failed" app.log
```

---

## 2. `awk` — Columns/Data

Print columns:

```bash
awk '{print $1, $3}' file
```

Field separator:

```bash
awk -F: '{print $1}' /etc/passwd
```

Pattern:

```bash
awk '$3 > 1000 {print $1}' file
```

`BEGIN` / `END`:

```bash
awk 'BEGIN {print "START"} {print $1} END {print "DONE"}' file
```

Important:

```text
$0  → Entire line
$1  → First field
$NF → Last field
NR  → Line number
NF  → Number of fields
```

---

## 3. `sed` — Edit Text

Replace:

```bash
sed 's/old/new/' file
```

Replace all:

```bash
sed 's/old/new/g' file
```

Delete line:

```bash
sed '2d' file
```

Delete matching lines:

```bash
sed '/error/d' file
```

Edit file directly:

```bash
sed -i 's/old/new/g' file
```

---

## 4. `cut` — Extract Columns

```bash
cut -d: -f1 /etc/passwd
```

```text
-d → delimiter
-f → field
```

---

## 5. `sort`

Alphabetical:

```bash
sort file
```

Numerical:

```bash
sort -n file
```

Reverse:

```bash
sort -r file
```

Unique:

```bash
sort -u file
```

Highest number first:

```bash
sort -nr file
```

---

## 6. `uniq`

Remove consecutive duplicates:

```bash
uniq file
```

Count duplicates:

```bash
uniq -c file
```

Usually combine with `sort`:

```bash
sort file | uniq -c
```

---

## 7. `tr`

Translate:

```bash
echo "hello" | tr 'a-z' 'A-Z'
```

Output:

```text
HELLO
```

Delete:

```bash
echo "hello123" | tr -d '0-9'
```

Output:

```text
hello
```

---

## 8. `wc`

```bash
wc -l file    # Lines
wc -w file    # Words
wc -c file    # Characters/bytes
```

---

## 9. `head` / `tail`

First 5 lines:

```bash
head -5 file
```

Last 5 lines:

```bash
tail -5 file
```

Follow a log:

```bash
tail -f app.log
```

---

# Task 6: Useful One-Liners

## 1. Find files older than 7 days

```bash
find /var/log -type f -name "*.log" -mtime +7
```

Delete:

```bash
find /tmp -type f -mtime +7 -delete
```

---

## 2. Count lines in `.log` files

```bash
wc -l *.log
```

---

## 3. Replace text in multiple files

```bash
sed -i 's/old/new/g' *.conf
```

---

## 4. Check service status

```bash
systemctl is-active --quiet sshd && echo "Running" || echo "Stopped"
```

---

## 5. Disk usage alert

Show filesystems above 80%:

```bash
df -hP | awk 'NR > 1 && $5+0 > 80 {print "WARNING:", $6, $5}'
```

---

## 6. Monitor errors in real time

```bash
tail -f app.log | grep --line-buffered -i "error"
```

---

## 7. Top CPU processes

```bash
ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head
```

---

# Task 7: Error Handling & Debugging

## 1. Exit Codes

Check previous command:

```bash
ls /tmp
echo $?
```

```text
0     → Success
non-0 → Failure
```

Success:

```bash
exit 0
```

Failure:

```bash
exit 1
```

---

## 2. `set -e`

Stop when an unhandled command fails:

```bash
set -e

ls /does-not-exist

echo "This will not execute"
```

---

## 3. `set -u`

Treat unset variables as errors:

```bash
set -u

echo "$UNDEFINED"
```

Result:

```text
UNDEFINED: unbound variable
```

---

## 4. `set -o pipefail`

Detect failures inside pipelines:

```bash
set -o pipefail

false | echo "Hello"

echo $?
```

Without `pipefail`, a successful last command can hide an earlier failure.

---

## 5. `set -x`

Debug/trace commands:

```bash
set -x

name="Rahul"
echo "$name"

set +x
```

Useful when troubleshooting scripts.

---

## 6. `trap`

Run cleanup when the script exits:

```bash
cleanup() {
    echo "Cleaning up..."
}

trap cleanup EXIT
```

Example:

```bash
#!/bin/bash

cleanup() {
    rm -f /tmp/myfile
    echo "Cleanup completed"
}

trap cleanup EXIT

touch /tmp/myfile

echo "Script running..."
```

When the script exits, `cleanup` runs automatically.

---

# ⭐ Quick Revision

| Topic         | Remember                    |
| ------------- | --------------------------- |
| `#!/bin/bash` | Use Bash                    |
| `chmod +x`    | Make executable             |
| `$0`          | Script name                 |
| `$1`          | First argument              |
| `$#`          | Argument count              |
| `$@`          | All arguments               |
| `$?`          | Exit status                 |
| `=`           | String equal                |
| `-eq`         | Number equal                |
| `-gt`         | Greater than                |
| `-f`          | Regular file                |
| `-d`          | Directory                   |
| `&&`          | AND                         |
| `\|\|`        | OR                          |
| `!`           | NOT                         |
| `for`         | Loop over list              |
| `while`       | Loop while true             |
| `until`       | Loop until true             |
| `break`       | Exit loop                   |
| `continue`    | Skip iteration              |
| Function      | Reusable code               |
| `local`       | Function-only variable      |
| `return`      | Return status               |
| `grep`        | Search                      |
| `awk`         | Process columns/data        |
| `sed`         | Edit/replace text           |
| `cut`         | Extract fields              |
| `sort`        | Sort                        |
| `uniq`        | Deduplicate/count           |
| `tr`          | Translate/delete characters |
| `wc`          | Count                       |
| `head`        | First lines                 |
| `tail`        | Last/follow lines           |
| `set -e`      | Stop on errors              |
| `set -u`      | Catch unset variables       |
| `pipefail`    | Catch pipeline errors       |
| `set -x`      | Debug/trace                 |
| `trap`        | Cleanup on exit             |
