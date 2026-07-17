
# Day 39 – What is CI/CD?

## Task
Before writing a single pipeline, understand **why CI/CD exists** and what it actually does.

Today is a research and diagram day — no pipelines yet. Get the concepts right first.

---

## Expected Output
- A markdown file: `day-39-cicd-concepts.md`
- A pipeline diagram (hand-drawn or text-based)

---

## Challenge Tasks                

### Task 1: The Problem
-----------
If team of 5 developers all pushing code to the same repo manually deploying to production.

## 1. What can go wrong?

When five developers are pushing code to the same repository and manually deploying to production, several issues can occur:

- **Code conflicts:** Developers may overwrite each other's changes or merge code that has not been tested properly.
- **Human errors:** Someone may deploy the wrong branch, miss a step, or change the wrong production settings.
- **Production bugs:** Untested code can reach users and cause failures or downtime.
- **Inconsistent deployments:** Different developers may follow different deployment steps, leading to unpredictable results.
- **Environment differences:** Production may have different configurations, dependencies, or software versions compared to developer machines.
- **Hard debugging:** If many changes are deployed together, it becomes difficult to find which change caused a problem.
- **Rollback difficulties:** Returning to a previous stable version can be slow and complicated.
- **Slower releases:** Developers may avoid frequent deployments because manual releases take time and feel risky.

## 2. What does "it works on my machine" mean and why is it a real problem?

"It works on my machine" means the code works correctly on a developer's computer but fails when run in another environment, such as testing or production.

This happens because environments may differ in:

- Operating system versions
- Installed packages and dependencies
- Database versions
- Environment variables
- Configuration settings
- Hardware resources

It is a real problem because users do not run the application on the developer's machine. If environments are not consistent, bugs can appear after deployment even when the developer tested successfully.

## 3. How many times a day can a team safely deploy manually?

A team of five developers can usually safely perform only a few manual deployments per day.

A realistic range is around **1–3 manual deployments per day** if the team follows a careful process with testing and reviews.

Frequent manual deployments increase the chance of human mistakes. Using automated testing, Continuous Integration (CI), and Continuous Deployment (CD) allows teams to deploy more often with lower risk.


---


### Task 2: CI vs CD
-----------
## Continuous Integration (CI)

Continuous Integration is the practice of developers frequently merging their code changes into a shared repository.  
Each change is automatically built and tested to catch bugs, integration issues, and code errors early.

**Real-world example:**  
A developer pushes a new feature to GitHub, and an automated pipeline runs unit tests to check that the new code does not break the application.

---

## Continuous Delivery

Continuous Delivery extends CI by automatically preparing code for release after it passes testing.  
The application is always in a deployable state, but a human usually decides when to release it to production.

**Real-world example:**  
A company automatically builds and tests a mobile app after every code change, then keeps the approved version ready for a manager to release to users.

---

## Continuous Deployment

Continuous Deployment goes one step further than Continuous Delivery by automatically releasing every successfully tested change to production without manual approval.  
Teams use it when they need fast releases and have strong automated testing and monitoring.

**Real-world example:**  
An online service automatically deploys website updates several times a day after automated tests pass, allowing users to receive new features immediately.

---

## CI vs CD Summary

| Practice | Main Goal | Deployment Process |
|---|---|---|
| Continuous Integration | Merge and test code frequently | Code is tested automatically |
| Continuous Delivery | Keep software ready for release | Manual approval before production |
| Continuous Deployment | Release changes automatically | Successful changes go directly to production |

---

### Task 3: Pipeline Anatomy   

A pipeline has these parts :
--------------
1. Trigger : 
   - A trigger is the event that starts a CI/CD pipeline.  
   - It can be a code push, pull request, scheduled time, or manual action.

**Example:** A developer pushes code to the repository, which automatically starts the pipeline.

---

2. Stage :
   - A stage is a logical phase of the pipeline that groups related activities together.  
   - Common stages include build, test, and deploy.

**Example:** A pipeline may have a Build stage followed by a Test stage and a Deploy stage.

---

3. Job :
   - A job is a unit of work inside a stage that performs specific tasks.  
   - Jobs contain one or more steps and can sometimes run in parallel.

**Example:** A Test stage may contain separate jobs for running frontend tests and backend tests.

---

4. Step :
   - A step is a single command or action performed inside a job.  
   - Steps are executed in order to complete the job.

**Example:** Installing dependencies, running a test command, or creating a build file are individual steps.

---

5. Runner :
   - A runner is the machine or environment that executes pipeline jobs.  
   - It provides the operating system, tools, and resources needed to run the steps.

**Example:** A GitHub Actions runner using Ubuntu executes a build and test job.

---

6. Artifact :
   - An artifact is the output produced by a job that can be stored, shared, or used by later stages.  
   - Artifacts can include compiled code, packages, reports, or deployment files.

**Example:** A build job creates a Docker image or application package that is later deployed to production.
---

### Task 4: Draw a Pipeline (Pending)
Draw a CI/CD pipeline for this scenario:
> A developer pushes code to GitHub. The app is tested, built into a Docker image, and deployed to a staging server.

Include at least 3 stages. Hand-drawn and photographed is perfectly fine.

---

### Task 5: Explore in the Wild (Pending)
1. Open any popular open-source repo on GitHub (Kubernetes, React, FastAPI — pick one you know)
2. Find their `.github/workflows/` folder
3. Open one workflow YAML file
4. Write in your notes:
   - What triggers it?
   - How many jobs does it have?
   - What does it do? (best guess)

---

## Hints
- CI/CD is a practice, not just a tool
- GitHub Actions, Jenkins, GitLab CI, CircleCI — all are tools that implement CI/CD
- A pipeline failing is not a problem — it's CI/CD doing its job

---

## Documentation
Create `day-39-cicd-concepts.md` with:
- Your CI vs CD vs CD definitions
- Pipeline anatomy notes
- Your pipeline diagram
- What you found in the open-source repo

---

## Submission
1. Add your `day-39-cicd-concepts.md` to `2026/day-39/`
2. Commit and push to your fork

---

## Learn in Public
Share your pipeline diagram on LinkedIn — even a rough hand-drawn one gets engagement.

`#90DaysOfDevOps` `#DevOpsKaJosh` `#TrainWithShubham`

Happy Learning!
**TrainWithShubham**
