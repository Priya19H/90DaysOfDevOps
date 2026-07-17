
# Day 38 – YAML Basics

## Task
Before writing a single CI/CD pipeline, you need to get comfortable with **YAML** — the language every pipeline is written in.

You will:
- Understand YAML syntax and rules
- Write YAML files by hand
- Validate them

---

## Challenge Tasks

### Task 1: Key-Value Pairs
Create `person.yaml` that describes yourself with:
- `name`
- `role`
- `experience_years`
- `learning` (a boolean)

**Verify:** Run `cat person.yaml` — does it look clean? No tabs?

<img width="367" height="117" alt="image" src="https://github.com/user-attachments/assets/1977ed23-efc3-4083-a5dc-eb2d4f566722" />


---

### Task 2: Lists
Add to `person.yaml`:
- `tools` — a list of 5 DevOps tools you know or are learning
- `hobbies` — a list using the inline format `[item1, item2]`

<img width="395" height="169" alt="image" src="https://github.com/user-attachments/assets/fba32cf0-4daf-4b77-ba76-f1f4059cf26b" />    



_Write in your notes: What are the two ways to write a list in YAML?_
In YAML, there are two common ways to write a list:

1. Block Style (most common)
   Each item starts with a hyphen (-).
```
tools:
  - Git
  - Docker
  - Kubernetes
  - Jenkins
  - Terraform
```

2. Inline (Flow) Style
   All items are written inside square brackets ([]), separated by commas.
```
tools: [Git, Docker, Kubernetes, Jenkins, Terraform]
```
---

### Task 3: Nested Objects
Create `server.yaml` that describes a server:
- `server` with nested keys: `name`, `ip`, `port`
- `database` with nested keys: `host`, `name`, `credentials` (nested further: `user`, `password`)

<img width="303" height="151" alt="image" src="https://github.com/user-attachments/assets/574ed8e7-a799-4e8a-8637-2fadf540a8ad" />

**Verify:** Try adding a tab instead of spaces — what happens when you validate it?
_(Pending)_
---

### Task 4: Multi-line Strings
In `server.yaml`, add a `startup_script` field using:
1. The `|` block style (preserves newlines)
```
server:
  name: web-server
  ip: 192.168.1.10
  port: 8080

startup_script: |
  #!/bin/bash
  echo "Starting server"
  systemctl start nginx
  echo "Server started"
```

Output value keeps the line breaks:

```
#!/bin/bash
echo "Starting server"
systemctl start nginx
echo "Server started"
```
2. The `>` fold style (folds into one line)

```
server:
  name: web-server
  ip: 192.168.1.10
  port: 8080

startup_script: >
  #!/bin/bash
  echo "Starting server"
  systemctl start nginx
  echo "Server started"
```
Output value becomes:
```
#!/bin/bash echo "Starting server" systemctl start nginx echo "Server started"
```


_When would you use `|` vs `>`?_

* Use | (literal block style) when you need to preserve line breaks.
   Examples:
   - Shell scripts
   - Configuration files
   - SQL queries
   - Log messages

* Use > (folded block style) when you want multiple lines in YAML to become a single paragraph/line.
   Examples:
   - Long descriptions
   - Documentation text
   - Messages where line breaks are not important

_Rule of thumb:_         
Commands/scripts → use |        
Human-readable paragraphs → use >


---

### Task 5: Validate Your YAML (Pending)
1. Install `yamllint` or use an online validator
2. Validate both your YAML files
3. Intentionally break the indentation — what error do you get?
4. Fix it and validate again

---

### Task 6: Spot the Difference
Read both blocks and write what's wrong with the second one:

```yaml
# Block 1 - correct
name: devops
tools:
  - docker
  - kubernetes
```

```yaml
# Block 2 - broken
name: devops
tools:
- docker
  - kubernetes
```
_Difference: In the first code block, the indentation is correct, whereas in the second code block, the indentation is incorrect._ 

---

## Hints
- YAML uses **spaces only** — never tabs
- Indentation is everything — 2 spaces is standard
- Strings don't need quotes unless they contain special characters (`:`, `#`, etc.)
- `true`/`false` are booleans, `"true"` is a string
- Validate online: yamllint.com

---

## Documentation
- Your YAML files
- What you learned (3 key points)
- 

---

## Submission
1. Add your YAML files and `day-38-yaml.md` to `2026/day-38/`
2. Commit and push to your fork

---

## Learn in Public
Share your YAML "aha moment" on LinkedIn — the tab vs space mistake gets everyone.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
