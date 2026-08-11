 
# Day 18 – Shell Scripting: Functions & intermediate Concepts

## Task
Write cleaner, reusable scripts — learn functions, strict mode, and real-world patterns.

You will:
- Write and call **functions**
- Use **`set -euo pipefail`** for safer scripts
- Work with **return values** and **local variables**
- Build an intermediate script

---

## Expected Output
- A markdown file: `day-18-scripting.md`
- All scripts you write during the tasks
---

## Challenge Tasks

### Task 1: Basic Functions
1. Create `functions.sh` with:
   - A function `greet` that takes a name as argument and prints `Hello, <name>!`
   - A function `add` that takes two numbers and prints their sum
   - Call both functions from the script

```bash
#!/bin/bash

# Function to greet a user
greet() {
    echo "Hello, $1!"
}

# Function to add two numbers
add() {
    echo $(( $1 + $2 ))
}

# Call the functions
greet "Avani"
add 10 20

```



---

### Task 2: Functions with Return Values
1. Create `disk_check.sh` with:
   - A function `check_disk` that checks disk usage of `/` using `df -h`
   - A function `check_memory` that checks free memory using `free -h`
   - A main section that calls both and prints the results

```bash
#!/bin/bash
# A function `check_disk` that checks disk usage of `/`
check_disk(){
	df -h /
}

#A function check_memory that checks free memory
check_memory(){
	free -h
}

#A main section that calls both and prints the results

disk_result=$(check_disk)
memory_result=$(check_memory)

echo "---------Disk usage of /----------- "
echo "$disk_result"

echo "---------Free Memory---------------"
echo "$memory_result"

```


---

### Task 3: Strict Mode — `set -euo pipefail`
1. Create `strict_demo.sh` with `set -euo pipefail` at the top
2. Try using an **undefined variable** — what happens with `set -u`?
3. Try a command that **fails** — what happens with `set -e`?
4. Try a **piped command** where one part fails — what happens with `set -o pipefail`?

**Document:** What does each flag do?

### `2. set -e` →
- ` Without set -e `
```bash
#!/bin/bash

echo "1. Script started"

ls /does-not-exist

echo "2. Script is still running"

echo "3. Script finished"
```

`Output`
```
1. Script started
ls: cannot access '/does-not-exist': No such file or directory
2. Script is still running
3. Script finished
```

- ` With set -e `
```bash
#!/bin/bash
set -e
echo "1. Script started"

ls /does-not-exist

echo "2. Script is still running"

echo "3. Script finished"
```

`Output`
```
1. Script started
ls: cannot access '/does-not-exist': No such file or directory

```

------------------------------------

### `2. set -u` →
- ` Without set -u `
```bash
#!/bin/bash

echo "1. Script started"

echo "$P"

echo "2. Script is still running"

echo "3. Script finished"
```

`Output`
```
1. Script started

2. Script is still running
3. Script finished

```

- ` With set -u `
```bash
#!/bin/bash
set -u
echo "1. Script started"

echo "$P"

echo "2. Script is still running"

echo "3. Script finished"
```

`Output`
```
1. Script started
./demo.sh: line 7: P: unbound variable

```
------------------------------------

### `3. set -o pipefail` →
- ` Without pipefail `
```bash
#!/bin/bash

echo "1. Script started"

false | echo "Hello"

echo "Pipeline exit status = $?"

echo "2. Script continued"
```

`Output`
```
1. Script started
Hello
Pipeline exit status = 0
2. Script continued
```

```
false  |  echo "Hello"
  ❌              ✅
                ↑
          Last command
                ↓
             SUCCESS
```



- ` With pipefail `
```bash
#!/bin/bash

set -o pipefail

echo "1. Script started"

false | echo "Hello"

echo "Pipeline exit status = $?"

echo "2. Script continued"
```

`Output`
```
1. Script started
Hello
Pipeline exit status = 1
2. Script continued
```
```
false  |  echo "Hello"
  ❌              ✅
  │
  └──────────────┐
                 ↓
             pipefail
                 ↓
              FAILURE
```

------------------------------------

```
Use, set -euo pipefail to make Bash scripts safer and fail early instead of silently continuing with bad results.
```

```
-e          If something goes wrong → STOP 🛑

-u          If you use something unknown → STOP 👀

pipefail    If something fails inside a pipeline → NOTICE IT 🚨
```

---

### Task 4: Local Variables
1. Create `local_demo.sh` with:
   - A function that uses `local` keyword for variables
   - Show that `local` variables don't leak outside the function
   - Compare with a function that uses regular variables






---

### Task 5: Build a Script — System Info Reporter
Create `system_info.sh` that uses functions for everything:
1. A function to print **hostname and OS info**
2. A function to print **uptime**
3. A function to print **disk usage** (top 5 by size)
4. A function to print **memory usage**
5. A function to print **top 5 CPU-consuming processes**
6. A `main` function that calls all of the above with section headers
7. Use `set -euo pipefail` at the top

Output should look clean and readable.

---

## Hints
- Function syntax: `function_name() { ... }`
- Local vars: `local MY_VAR="value"`
- Strict mode: `set -euo pipefail` as first line after shebang
- Pass args to functions: `greet "Shubham"` → access as `$1` inside
- `$?` gives the exit code of last command

---

## Documentation

Create `day-18-scripting.md` with:
- Each script's code and output
- Explanation of `set -euo pipefail`
- What you learned (3 key points)

---

## Submission
1. Add your scripts and `day-18-scripting.md` to `2026/day-18/`
2. Commit and push to your fork

---

## Learn in Public

Share what you learned about shell functions and strict mode on LinkedIn.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
