
# Day 22 – Introduction to Git: Your First Repository

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
   
4. Commit with a meaningful message

   *Create a snapshot in the Git database*

   ` git commit -m "docs: add initial git command reference guide" `

   *Output*
   ```
   [master (root-commit) 24debac] docs: add initial git command reference guide
    1 file changed, 33 insertions(+)
    create mode 100644 git-commands.md
   ```
   
5. View your commit history

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
	
	*Check the unstaged diff to verify your additions:*

   ` git diff `
  
3. Stage and commit again with a different, descriptive message

  ```
  git add git-commands.md
  git commit -m "docs: add staging and committing section to reference" git-commands.md
  ```

4. Repeat this process at least **3 times** so you have multiple commits in your history

```
cat << 'EOF' >> git-commands.md
	> File Content need to be added
	> EOF

git add git-commands.md
git commit -m "Data added" git-commands.md
```


5. View the full history in a compact format

` git log --oneline --graph --decorate --all `

*Output*
```
* f6c1218 (HEAD -> master) Formating of file
* c8a0804  Added git revert command
* 8ba50af  Added git reset command
* 59cc622  Added git restore command
* 91805c4 docs: add staging and committing section to reference
* 24debac docs: add initial git command reference guide
```
---

### Task 6: Understand the Git Workflow
Answer these questions in your own words (add them to a `day-22-notes.md` file):
1. What is the difference between `git add` and `git commit`?
   - git add copies modifications from your Working Directory to the Staging Area (Index). It prepares specific changes for a snapshot without writing anything to the commit history.

     `*Working directory -> Staging area*`
   - git commit takes the exact snapshot currently inside the Staging Area and permanently writes it to the local repository database (.git/), assigning it a unique SHA hash and commit message.

     `*Staging area -> Local Repository*`

2. What does the **staging area** do? Why doesn't Git just commit directly?
   - The staging area is a drafting table. It holds only the specific changes you're ready to save, before making them permanent.
     
   *- Why not commit directly?*
   
     *1. Selective Saving:* If you edited 5 files today, but only 2 of them are ready, you can stage and commit just those 2. The other 3 stay as work-in-progress.

     *2. Clean History:* It gives you a final chance to review your work (git diff --staged) so you can group related changes together with a clear message, rather than saving a messy pile of everything at once.

	 In short: Direct committing would force you to save everything at once. Staging lets you organize your changes into clean, meaningful updates.

3. What information does `git log` show you?
   - Commit Hash (SHA): A unique alphanumeric identifier (e.g., a1b2c3d4...) representing the snapshot.
   - Author Details: The name and email address configured by the author.
   - Date & Timestamp: Exact time zone and timestamp when the commit was created. 
   - Commit Message: The descriptive summary explaining what changes were introduced.
   - Refs & Pointers: Markers showing where HEAD, local branches (e.g., main), or remote tracking branches are currently pointing.
   
4. What is the `.git/` folder and what happens if you delete it?
   - The .git/ folder is the Git repository. It holds your object database, configuration settings, hook scripts, logs, and branch references (HEAD, refs/heads/).
   - If you delete .git/: You destroy the entire version control history of the project. All past commits, branches, stashes, and tags are permanently deleted.
   
5. What is the difference between a **working directory**, **staging area**, and **repository**?
  - Working Directory: Where you make the changes.
  - Staging Area: Where you prepare the changes.
  - Repository: Where you permanently save the changes.

---

<img width="727" height="168" alt="image" src="https://github.com/user-attachments/assets/56ce06e2-5f22-4895-bda1-06920147915c" />

## Ongoing Task

**Keep updating `git-commands.md` every day** as you learn new Git commands in the upcoming days. This will become your personal Git reference. Maintain a clean commit history — one commit per update with a clear message.

---


Happy Learning!
**TrainWithShubham**
