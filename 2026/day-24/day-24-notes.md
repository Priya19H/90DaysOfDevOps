
# Day 24 – Advanced Git: Merge, Rebase, Stash & Cherry Pick

## Task

You know how to branch and push to GitHub. Now it's time to learn how branches come back together — and what to do when you're in the middle of something and need to context-switch. These are the Git skills that separate beginners from confident practitioners.

---

## Expected Output
- A markdown file: `day-24-notes.md` with your observations and answers
- Continue updating `git-commands.md` in your `devops-git-practice` repo

---

## Challenge Tasks

### Task 1: Git Merge — Hands-On
1. Create a new branch `feature-login` from `main`, add a couple of commits to it
   `git checkout -b feature-login`

   <img width="790" height="272" alt="image" src="https://github.com/user-attachments/assets/606328d7-6354-42fe-8760-762fcb7cc766" />

2. Switch back to `main` and merge `feature-login` into `main`

   <img width="790" height="272" alt="image" src="https://github.com/user-attachments/assets/4c7d9938-8492-46ac-86ce-e926b7d0c7b0" />

3. Observe the merge — did Git do a **fast-forward** merge or a **merge commit**?

<img width="790" height="272" alt="image" src="https://github.com/user-attachments/assets/6cf620e4-ca7b-4c7d-b4ba-dcb3d51e4cf0" />

ecause only see two original commit messages sitting right at the top of main, it was a fast-forward merge.

4. Now create another branch `feature-signup`, add commits to it — but also add a commit to `main` before merging
```
git checkout -b feature-signup                                //Create and checkout new branch
vim new-branch-feature-signup.txt                             //Create new file in new branch
git add new-branch-feature-signup.txt                         // Add file to staged area
git commit -m "New branch feature-signup added" new-branch-feature-signup.txt    //Commit file to local repo
vim new-branch-feature-signup.txt                      //Update file
git add new-branch-feature-signup.txt                 // Add file to staged area
git commit -m "File feature-signup Updated" new-branch-feature-signup.txt   //Commit updated file to local repo
```
```
git checkout master                             // Checkout to master
vim master-branch-file.txt                    // Create new file to master
git add master-branch-file.txt                //Add file to staged area
git commit -m "New file added in master branch" master-branch-file.txt       // Commit file to local repo 
```

5. Merge `feature-signup` into `main` — what happens this time?
`git merge feature-signup   // Merge feature-signup with master`

6. Answer in your notes:
   - What is a fast-forward merge?
      1. A fast-forward merge occurs when you merge a feature branch into a base branch (like main or master), and no new commits were made to the base branch while you were working on the feature branch.
      2. Because the base branch hasn't moved, Git doesn't need to combine anything. It simply moves ("fast-forwards") the main pointer forward to the tip of your feature branch. No extra commit is created.

   - When does Git create a merge commit instead?
      Git creates a merge commit (also known as a 3-way merge) when the base branch has moved forward with new commits after you originally branched off.

   ```
    Fast-Forward:  A ── B ── C (main, feature)

    Merge Commit:  A ── B ─────── D (main)
                     \       /
                      C ──── E (feature)  <-- Merge Commit "D" created
   ```

   - What is a merge conflict? (try creating one intentionally by editing the same line in both branches)
      A merge conflict happens when Git cannot automatically merge two branches because the same line in the same file was edited differently in both branches. Git pauses the merge and asks you to manually choose which change to keep.


<Hands on PENDING>






---

### Task 2: Git Rebase — Hands-On
1. Create a branch `feature-dashboard` from `main`, add 2-3 commits
2. While on `main`, add a new commit (so `main` moves ahead)
3. Switch to `feature-dashboard` and rebase it onto `main`
4. Observe your `git log --oneline --graph --all` — how does the history look compared to a merge?
5. Answer in your notes:
   - What does rebase actually do to your commits?
   - How is the history different from a merge?
   - Why should you **never rebase commits that have been pushed and shared** with others?
   - When would you use rebase vs merge?

---

### Task 3: Squash Commit vs Merge Commit
1. Create a branch `feature-profile`, add 4-5 small commits (typo fix, formatting, etc.)
2. Merge it into `main` using `--squash` — what happens?
3. Check `git log` — how many commits were added to `main`?
4. Now create another branch `feature-settings`, add a few commits
5. Merge it into `main` **without** `--squash` (regular merge) — compare the history
6. Answer in your notes:
   - What does squash merging do?
   - When would you use squash merge vs regular merge?
   - What is the trade-off of squashing?

---

### Task 4: Git Stash — Hands-On
1. Start making changes to a file but **do not commit**
2. Now imagine you need to urgently switch to another branch — try switching. What happens?
3. Use `git stash` to save your work-in-progress
4. Switch to another branch, do some work, switch back
5. Apply your stashed changes using `git stash pop`
6. Try stashing multiple times and list all stashes
7. Try applying a specific stash from the list
8. Answer in your notes:
   - What is the difference between `git stash pop` and `git stash apply`?
   - When would you use stash in a real-world workflow?

---

### Task 5: Cherry Picking
1. Create a branch `feature-hotfix`, make 3 commits with different changes
2. Switch to `main`
3. Cherry-pick **only the second commit** from `feature-hotfix` onto `main`
4. Verify with `git log` that only that one commit was applied
5. Answer in your notes:
   - What does cherry-pick do?
   - When would you use cherry-pick in a real project?
   - What can go wrong with cherry-picking?

---

## Hints
- Visualize history: `git log --oneline --graph --all`
- To intentionally create a merge conflict: edit the **same line** of the **same file** on two branches
- Stash with a message: `git stash push -m "description"`
- Cherry-pick needs a commit hash — find it with `git log --oneline`

---

## Submission
1. Add your `day-24-notes.md` to `2026/day-24/`
2. Update `git-commands.md` with all new commands and commit
3. Push to your fork

---

## Learn in Public

Share your merge vs rebase comparison on LinkedIn — a diagram or screenshot of `git log --graph` goes a long way!

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
