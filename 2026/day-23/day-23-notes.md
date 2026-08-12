# Day 23 – Git Branching & Working with GitHub

## Task

Now that you know how to create repos, stage, and commit — it's time to learn the most powerful concept in Git: **branching**. Branches let you work on features, fixes, and experiments in isolation without breaking your main code. You'll also push your work to GitHub for the first time.

---

## Expected Output
- A markdown file: `day-23-notes.md` with your answers
- Continue updating `git-commands.md` in your `devops-git-practice` repo
- Your practice repo pushed to GitHub

---

## Challenge Tasks

### Task 1: Understanding Branches
Answer these in your `day-23-notes.md`:
1. What is a branch in Git?
   
   Git branch is a separate, isolated workspace where you can change code without messing up the main project.
   
2. Why do we use branches instead of committing everything to `main`?

   - We use branches instead of committing everything to main because branches let people work on different features at the same time without breaking the main code.
   - They keep new work separate until it is fully tested and ready to join the main project.

3. What is `HEAD` in Git?

   HEAD is a special pointer that references your current active state or position in the repository.

4. What happens to your files when you switch branches?

   1. *Committed files:* Your tracked files change to match the exact content and version saved in the new branch.
   2. *Missing files:* Files that existed on your old branch but do not exist on the new branch are deleted from your working folder.
   3. *New branch files:* Files unique to the new branch are added or extracted into your working folder.
   4. *Uncommitted (unstaged/staged) clean changes:* If your local changes do not touch files that differ on the target branch, Git carries those modified files right over to the new branch.
   5. *Uncommitted conflicting changes:* If your local changes conflict with versions on the target branch, modern Git commands (git switch or git checkout) abort the switch to prevent data loss.

---

### Task 2: Branching Commands — Hands-On
In your `devops-git-practice` repo, perform the following:
1. List all branches in your repo

   `git branch`

   *Output*
   `* master`

3. Create a new branch called `feature-1`

   `git branch feature-1`

   ```
   git branch
    feature-1
   * master
   ```
4. Switch to `feature-1`

   `git checkout feature-1`

   ```
   git branch
   * feature-1
     master
   ```
   
6. Create a new branch and switch to it in a single command — call it `feature-2`

   `checkout -b feature-2`

   *Output*
   
   `Switched to a new branch 'feature-2'`

8. Try using `git switch` to move between branches — how is it different from `git checkout`?
9. Make a commit on `feature-1` that does **not** exist on `main`
10. Switch back to `main` — verify that the commit from `feature-1` is not there
11. Delete a branch you no longer need
12. Add all branching commands to your `git-commands.md`

---

### Task 3: Push to GitHub
1. Create a **new repository** on GitHub (do NOT initialize it with a README)
2. Connect your local `devops-git-practice` repo to the GitHub remote
3. Push your `main` branch to GitHub
4. Push `feature-1` branch to GitHub
5. Verify both branches are visible on GitHub
6. Answer in your notes: What is the difference between `origin` and `upstream`?

---

### Task 4: Pull from GitHub
1. Make a change to a file **directly on GitHub** (use the GitHub editor)
2. Pull that change to your local repo
3. Answer in your notes: What is the difference between `git fetch` and `git pull`?

---

### Task 5: Clone vs Fork
1. **Clone** any public repository from GitHub to your local machine
2. **Fork** the same repository on GitHub, then clone your fork
3. Answer in your notes:
   - What is the difference between clone and fork?
   - When would you clone vs fork?
   - After forking, how do you keep your fork in sync with the original repo?

---

## Hints
- When you create a branch, it starts from the commit you're currently on
- `git switch` is the modern alternative to `git checkout` for switching branches
- To push a new branch: `git push -u origin <branch-name>`
- A fork is a GitHub concept, not a Git concept

---

## Submission
1. Add your `day-23-notes.md` to `2026/day-23/`
2. Update `git-commands.md` with all new commands and commit
3. Push to your fork

---

## Learn in Public

Share your branching workflow and first GitHub push on LinkedIn.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
