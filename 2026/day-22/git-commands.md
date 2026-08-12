# Git Command Reference

## Setup & Config

* **`git --version`**
  * **Description:** Checks the currently installed Git version on your system.
  * **Example:** `git --version`

* **`git config --global user.name`**
  * **Description:** Sets the global identity name attached to your commits.
  * **Example:** `git config --global user.name "Your Name"`

* **`git config --global user.email`**
  * **Description:** Sets the global email address attached to your commits.
  * **Example:** `git config --global user.email "your.email@example.com"`

* **`git config --list`**
  * **Description:** Displays all active configuration key-value pairs.
  * **Example:** `git config --list --global`

## Basic Workflow

* **`git init`**
  * **Description:** Initializes a new, empty Git repository in the current directory.
  * **Example:** `git init`

## Viewing Changes

* **`git status`**
  * **Description:** Shows the state of the working directory and the staging area.
  * **Example:** `git status`

* **`git add`**
  * **Description:** Stages changes in specified files to be included in the next commit.
  * **Example:** `git add git-commands.md`

* **`git commit`**
  * **Description:** Records staged snapshots permanently into the repository history.
  * **Example:** `git commit -m "docs: add new reference guide"`

## Undoing Changes

* **`git restore`**
  * **Description:** Discards unstaged modifications in working directory files.
  * **Example:** `git restore git-commands.md`

* **`git reset`**
  * **Description:** Unstages changes or moves HEAD to a specified commit.
  * **Example:** `git reset HEAD~1`

* **`git revert`**
  * **Description:** Creates a new commit that safely reverses changes from a previous commit.
  * **Example:** `git revert `

