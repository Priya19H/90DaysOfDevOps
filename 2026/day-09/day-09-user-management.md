
# Day 09 – Linux User & Group Management Challenge

## Task
Today's goal is to **practice user and group management** by completing hands-on challenges.

Figure out how to:
- Create users and set passwords
- Create groups and assign users  
- Set up shared directories with group permissions

Use what you learned from Days 1-7 to find the right commands!

---

## Expected Output
- A markdown file: `day-09-user-management.md`
- Screenshots of command outputs
- List of commands used

---

## Challenge Tasks

### Task 1: Create Users (20 minutes)

Create three users with home directories and passwords:
- `tokyo`
- `berlin`
- `professor`

 <img width="388" height="246" alt="image" src="https://github.com/user-attachments/assets/f8d96f72-a9a9-4a89-92cf-fd4e40026b1e" />


**Verify:** Check `/etc/passwd` and `/home/` directory
 
  <img width="398" height="260" alt="image" src="https://github.com/user-attachments/assets/f4422815-8497-4187-9b60-103db1c9f99c" />

---

### Task 2: Create Groups (10 minutes)

Create two groups:
- `developers`
- `admins`

**Verify:** Check `/etc/group`

<img width="403" height="254" alt="image" src="https://github.com/user-attachments/assets/9bacc2c4-4348-4ac6-bbc9-3502c6080fb6" />

---

### Task 3: Assign to Groups (15 minutes)

Assign users:
- `tokyo` → `developers`
- `berlin` → `developers` + `admins` (both groups)
- `professor` → `admins`

**Verify:** Use appropriate command to check group membership

<img width="395" height="257" alt="image" src="https://github.com/user-attachments/assets/862040c7-eabe-40cb-8382-0861c253dde4" />

---

### Task 4: Shared Directory (20 minutes)

1. Create directory: `/opt/dev-project`
2. Set group owner to `developers`
3. Set permissions to `775` (rwxrwxr-x)
4. Test by creating files as `tokyo` and `berlin`

**Verify:** Check permissions and test file creation

---

### Task 5: Team Workspace (20 minutes)

1. Create user `nairobi` with home directory
2. Create group `project-team`
3. Add `nairobi` and `tokyo` to `project-team`
4. Create `/opt/team-workspace` directory
5. Set group to `project-team`, permissions to `775`
6. Test by creating file as `nairobi`

---

## Hints

**Stuck? Try these commands:**
- User: `useradd`, `passwd`, `usermod`
- Group: `groupadd`, `groups`
- Permissions: `chgrp`, `chmod`
- Test: `sudo -u username command`

**Tip:** Use `-m` flag with useradd for home directory, `-aG` for adding to groups

---

## Documentation

Create `day-09-user-management.md`:

```markdown
# Day 09 Challenge

## Users & Groups Created
- Users: tokyo, berlin, professor, nairobi
- Groups: developers, admins, project-team

## Group Assignments
[List who is in which groups]

## Directories Created
[List directories with permissions]

## Commands Used
[Your commands here]

## What I Learned
[3 key points]
```

---


## Troubleshooting

**Permission denied?** Use `sudo`

**User can't access directory?**
- Check group: `groups username`
- Check permissions: `ls -ld /path`

---

## Submission
1. Fork this `90DaysOfDevOps` repository
2. Navigate to `2026/day-09/` folder
3. Add your `day-09-user-management.md` with screenshots
4. Commit and push

---

## Learn in Public
Share your Day 09 progress on LinkedIn:

- Post about completing the user management challenge
- Share one thing you figured out
- Mention real-world DevOps use

Use hashtags:
```
#90DaysOfDevOps
#DevOpsKaJosh
#TrainWithShubham
```

Happy Learning
**TrainWithShubham**
