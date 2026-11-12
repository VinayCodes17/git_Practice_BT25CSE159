# Git Practice Record

This document records all Git commands utilized during this project, explains their operational purpose, and provides a comprehensive breakdown of the merge conflict encountered and resolved during repository maintenance.

---

## 1. Summary of Git Commands Used

### Repository Setup and Configuration
| Command | Purpose |
| :--- | :--- |
| `git init` | Initializes a brand-new local Git repository in the project folder. |
| `git config user.name "<name>"` | Configures the committer name attached to Git commits. |
| `git config user.email "<email>"` | Configures the committer email associated with project commits. |
| `git remote add origin <url>` | Links the local Git repository to the remote GitHub repository. |
| `git remote -v` | Displays all configured remote connection URLs (fetch and push). |

### Staging and Status Inspection
| Command | Purpose |
| :--- | :--- |
| `git status` | Displays the working tree state, staged files, uncommitted changes, and untracked files. |
| `git add <file>` | Stages specified file changes for the next commit. |
| `git add .` | Stages all modified, created, and deleted files in the repository. |

### Commits and History
| Command | Purpose |
| :--- | :--- |
| `git commit -m "<message>"` | Commits staged changes to the repository with a concise description. |
| `git log` | Views commit history in reverse chronological order. |
| `git log --graph --oneline --all` | Displays a visual ASCII graph of all branches and merge histories in single-line format. |

### Branching and Merging
| Command | Purpose |
| :--- | :--- |
| `git branch` | Lists local branches and highlights the currently active branch. |
| `git checkout -b <branch>` | Creates a new branch from current HEAD and immediately switches to it. |
| `git checkout <branch>` | Switches the working tree to the specified existing branch. |
| `git merge --no-ff <branch>` | Merges the specified branch into the current branch, preserving the branch topology via a dedicated merge commit. |

### Remote Synchronization
| Command | Purpose |
| :--- | :--- |
| `git push -u origin <branch>` | Pushes the local branch commits to the remote repository and sets upstream tracking. |
| `git pull origin <branch>` | Fetches and integrates changes from the remote branch into the current local branch. |

---

## 2. Merge Conflict Encounter and Resolution

### Context
A merge conflict occurred during the integration of branch `docs/update-instructions` into `main`. Both branches introduced simultaneous edits to the **Instructions to Run the Programs** section of `README.md`.

- **Branch `main`:** Added a quick start command reference block.
- **Branch `docs/update-instructions`:** Added execution prerequisites (`chmod +x`) and direct execution syntax.

### Step 1: Triggering the Merge
While checked out on `main`, the merge was initiated:
```bash
git checkout main
git merge docs/update-instructions
```

### Step 2: Conflict Notification
Git halted the merge and alerted that automated conflict resolution was not possible:
```text
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
```

Checking `git status` confirmed that `README.md` was unmerged (`both modified: README.md`).

### Step 3: Examining Conflict Markers
Opening `README.md` showed the Git conflict delimiters:
```markdown
<<<<<<< HEAD
### Quick Start Commands
Execute the scripts directly via bash interpreter passing the sample input file:

- **Exercise 1 (Grade Evaluation):**
  ```bash
  bash exercise-01/evaluate_grades.sh exercise-01/input.txt
  ```

- **Exercise 2 (Log Analyzer):**
  ```bash
  bash exercise-02/analyze_logs.sh exercise-02/input.txt
  ```
=======
### Execution Prerequisites
Ensure bash is available and grant executable permissions to the shell scripts before running:
```bash
chmod +x exercise-01/evaluate_grades.sh
chmod +x exercise-02/analyze_logs.sh
```

### Executing Exercise 01
Run the grade evaluation script with `exercise-01/input.txt`:
```bash
./exercise-01/evaluate_grades.sh exercise-01/input.txt
```
>>>>>>> docs/update-instructions
```

### Step 4: Resolution Strategy
Rather than discarding either change, both sets of instructions were combined logically:
1. Retained the execution permission prerequisite (`chmod +x`) so users avoid permission denial errors.
2. Grouped the execution instructions by exercise, offering both direct execution (`./script.sh`) and interpreter invocation (`bash script.sh`).

The conflict markers were removed, resulting in the resolved section:
```markdown
## Instructions to Run the Programs

### 1. Prerequisites and File Permissions
Ensure you are running in a Linux, macOS, or Git Bash / WSL terminal environment. Make both scripts executable before running:
```bash
chmod +x exercise-01/evaluate_grades.sh
chmod +x exercise-02/analyze_logs.sh
```

### 2. Running Exercise 01 (Student Grade Evaluator)
Execute with the sample CSV dataset:
```bash
./exercise-01/evaluate_grades.sh exercise-01/input.txt
# Or run with bash directly:
bash exercise-01/evaluate_grades.sh exercise-01/input.txt
```

### 3. Running Exercise 02 (Web Server Access Log Analyzer)
Execute with the sample access log file:
```bash
./exercise-02/analyze_logs.sh exercise-02/input.txt
# Or run with bash directly:
bash exercise-02/analyze_logs.sh exercise-02/input.txt
```
```

### Step 5: Staging and Finalizing the Merge
The resolved file was staged and committed:
```bash
git add README.md
git commit -m "Resolve merge conflict in README.md by consolidating execution prerequisites and commands"
```

The merge was successfully committed, preserving a clean and truthful history of the conflict resolution.
