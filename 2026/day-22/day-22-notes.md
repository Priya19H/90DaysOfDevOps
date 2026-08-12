
# Day 22 – Introduction to Git: Your First Repository


- Understand what Git is and why it matters
- Set up your first Git repository from scratch
- Start building a living document of Git commands

---

## Expected Output
- A local Git repository with a clean commit history
- A file called `git-commands.md` that you will keep updating in future days
- A file called `day-22-notes.md` with your answers

---

## Challenge Tasks

### Task 1: Install and Configure Git
1. Verify Git is installed on your machine 
- Linux (Ubuntu/Debian):   
`sudo apt update && sudo apt install git -y`

- Linux (RHEL/Fedora):   
`sudo dnf install git -y`   

- Validate Git installed or not using:     
`git --version`

2. Set up your Git identity — name and email
- Applies globally to all your repositories.
Configure the global username and email address attached to your commits:
```
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```
4. Verify your configuration
```
git config --list --global
```
OR
```
git config user.name
git config user.email
```
---

### Task 2: Create Your Git Project
1. Create a new folder called `devops-git-practice`
   ```
   mkdir devops-git-practice
   cd devops-git-practice
   ```
2. Initialize it as a Git repository

   ` git init `

3. Check the status — read and understand what Git is telling you :

   ` git status `

- What Git is telling:
    1. On branch main (or master): Indicates the current local branch you are working on.   
    2. No commits yet: Confirms the repository history is completely empty.
    3. Nothing to commit: Your working directory is completely clean and matches the staged area
                     (no untracked or modified files present).
   
4. Explore the hidden `.git/` directory — look at what's inside
   
   ` ls -la .git/ `

   *Key components inside .git/:*
   - HEAD: Points to the currently checked-out branch reference.
   - config: Repository-specific configuration settings.
   - description: Used primarily by GitWeb (can be ignored for local workflows).
   - hooks/: Directory containing client-side or server-side executable scripts triggered by Git actions (e.g., pre-commit checks).
   - info/: Holds additional information, such as the exclude file for untracked files you don't want in .gitignore.
   - objects/: The object database holding all commits, trees (directories), and blobs (file contents).
   - refs/: Stores pointers to commit objects (branches in refs/heads/, tags in refs/tags/).
  
---

### Task 3: Create Your Git Commands Reference
1. Create a file called `git-commands.md` inside the repo
2. Add the Git commands you've used so far, organized by category:
   - **Setup & Config**
   - **Basic Workflow**
   - **Viewing Changes**
3. For each command, write:
   - What it does (1 line)
   - An example of how to use it

---

### Task 4: Stage and Commit
1. Stage your file

   *Move changes to the Staging Area (Index)*
   
   ` git add git-commands.md `
   
3. Check what's staged

   *Inspect what will be included in the commit*

   `git status`

   *Output*
   ```
   On branch master

   No commits yet

   Changes to be committed:
     (use "git rm --cached <file>..." to unstage)
	   new file:   git-commands.md

   ```
   
5. Commit with a meaningful message

   *Create a snapshot in the Git database*

   ` git commit -m "docs: add initial git command reference guide" `

   *Output*
   ```
   [master (root-commit) 24debac] docs: add initial git command reference guide
    1 file changed, 33 insertions(+)
    create mode 100644 git-commands.md
   ```
   
7. View your commit history

   *Inspect the repository log*

   `git log`

   *Output*
   ```
   commit 24debac230628f076f3719e15d46579a827c005d (HEAD -> master)
   Author: Priya19H <priyanka.a.hingade@gmail.com>
   Date:   Wed Aug 12 12:24:19 2026 +0530

   docs: add initial git command reference guide
   ```
---

### Task 5: Make More Changes and Build History
1. Edit `git-commands.md` — add more commands as you discover them

	Way to add text into file without going into that file.
   ```
   cat << 'EOF' >> git-commands.md
	> * **`git add`**
  	* **Description:** Stages changes in specified files to be included in the next commit.
  	* **Example:** `git add git-commands.md`

	* **`git commit`**
  	* **Description:** Records staged snapshots permanently into the repository history.
  	* **Example:** `git commit -m "docs: add new reference guide"`EOF
	> EOF
   ```
   
2. Check what changed since your last commit
   
4. Stage and commit again with a different, descriptive message
5. Repeat this process at least **3 times** so you have multiple commits in your history
6. View the full history in a compact format

---

### Task 6: Understand the Git Workflow
Answer these questions in your own words (add them to a `day-22-notes.md` file):
1. What is the difference between `git add` and `git commit`?
2. What does the **staging area** do? Why doesn't Git just commit directly?
3. What information does `git log` show you?
4. What is the `.git/` folder and what happens if you delete it?
5. What is the difference between a **working directory**, **staging area**, and **repository**?

---

## Ongoing Task

**Keep updating `git-commands.md` every day** as you learn new Git commands in the upcoming days. This will become your personal Git reference. Maintain a clean commit history — one commit per update with a clear message.

---

## Hints
- All you need today are about 8-10 Git commands — Google them, try them, break things
- Read what `git status` tells you — it's your best friend
- Use `man git-<command>` or `git <command> --help` to explore

---

## Submission
1. Share a screenshot of your `git log --oneline` output showing multiple commits
2. Add your `day-22-notes.md` to `2026/day-22/`
3. Commit and push to your fork
4. Add your submission for Community Builder of the week on discord

---

## Learn in Public

Share your first Git repo and commit history on LinkedIn.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
