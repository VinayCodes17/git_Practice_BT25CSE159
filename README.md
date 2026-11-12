# Git Practice Assignment - Shell Programming

## Student Information
- **Name:** Vinay Kumrawat
- **Roll Number:** BT25CSE159
- **Section:** CSE
- **Repository URL:** [https://github.com/VinayCodes17/git_Practice_BT25CSE159](https://github.com/VinayCodes17/git_Practice_BT25CSE159)

---

## Assignment Overview
This repository contains the practical solutions and version control history for the Git Practice and Shell Programming assignment. 

Key objectives demonstrated:
- **Version Control with Git:** Strict commit hygiene, feature branching workflows, simulated and resolved merge conflicts, and clear branch integration using non-fast-forward merges.
- **Shell Scripting Proficiency:** Development of modular, POSIX-compliant Bash scripts with robust input validation, stream processing via `awk`, formatted reporting, and error handling.
- **Project Structure & Documentation:** Clear repository hierarchy, reproducible execution instructions, and complete activity logging.

---

## Repository Structure
```text
git_Practice_BT25CSE159/
├── .gitignore
├── README.md
├── git-commands.md
├── exercise-01/
│   ├── evaluate_grades.sh
│   ├── input.txt
│   └── output.txt
└── exercise-02/
    ├── analyze_logs.sh
    ├── input.txt
    └── output.txt
```

---

## Completed Exercises

### Exercise 01: Student Academic Performance & Grade Evaluator
- **Directory:** [`./exercise-01/`](./exercise-01/)
- **Script:** [`evaluate_grades.sh`](./exercise-01/evaluate_grades.sh)
- **Description:** Parses student examination records from a CSV file (`input.txt`), calculates individual subject marks, total score (out of 300), percentage, and assigns letter grades (A+, A, B, C, D, F). In addition, it calculates class-wide metrics: total students evaluated, pass/fail counts, class average percentage, and identifies the highest scorer (topper).
- **Sample Input:** [`exercise-01/input.txt`](./exercise-01/input.txt)
- **Sample Output:** [`exercise-01/output.txt`](./exercise-01/output.txt)

#### Sample Output Preview:
```text
================================================================================
                      STUDENT ACADEMIC PERFORMANCE REPORT                       
================================================================================
Roll No      Name             Physics  Chem     Maths    Total    Percentage   Grade 
--------------------------------------------------------------------------------
BT25CSE001   Aarav Sharma     85       92       78       255      85.00%      A     
BT25CSE002   Bhavna Patel     72       68       75       215      71.67%      B     
BT25CSE003   Chirag Gupta     90       95       94       279      93.00%      A+    
BT25CSE004   Divya Nair       55       60       58       173      57.67%      D     
BT25CSE005   Eshaan Verma     38       42       40       120      40.00%      F     
BT25CSE006   Fatima Khan      88       84       91       263      87.67%      A     
BT25CSE007   Gaurav Singh     45       52       48       145      48.33%      F     
BT25CSE008   Harini Reddy     94       89       96       279      93.00%      A+    
--------------------------------------------------------------------------------
Total Students Evaluated : 8
Passed                   : 6
Failed                   : 2
Class Average Percentage : 72.04%
Highest Scorer (Topper)  : Chirag Gupta (BT25CSE003) with 93.00%
================================================================================
```

---

### Exercise 02: Web Server Access Log & Security Analyzer
- **Directory:** [`./exercise-02/`](./exercise-02/)
- **Script:** [`analyze_logs.sh`](./exercise-02/analyze_logs.sh)
- **Description:** Analyzes web server access log records (`input.txt`), extracting traffic distribution across HTTP status codes (2xx, 3xx, 4xx, 5xx), computing the overall average response latency, ranking the top active client IP addresses, and alerting on suspicious IPs generating multiple 4xx client errors (potential directory enumeration / probing).
- **Sample Input:** [`exercise-02/input.txt`](./exercise-02/input.txt)
- **Sample Output:** [`exercise-02/output.txt`](./exercise-02/output.txt)

#### Sample Output Preview:
```text
================================================================================
                     WEB SERVER ACCESS LOG ANALYSIS REPORT                      
================================================================================
Total Requests Analyzed  : 12
Average Response Time    : 152.08 ms
--------------------------------------------------------------------------------
HTTP Status Code Distribution:
  - 2xx Success          : 7 (58.3%)
  - 3xx Redirection      : 0 (0.0%)
  - 4xx Client Error     : 4 (33.3%)
  - 5xx Server Error     : 1 (8.3%)
--------------------------------------------------------------------------------
Top Client IP Addresses by Activity:
  1. 10.0.0.45          : 4 requests
  2. 192.168.1.105      : 3 requests
  3. 192.168.1.112      : 2 requests
--------------------------------------------------------------------------------
Security Watchlist (IPs with multiple 4xx errors):
  [ALERT] IP 10.0.0.45       generated 4 client errors (potential probing)
================================================================================
```

---

## Instructions to Run the Programs

### Prerequisites
Both programs are written in POSIX-compliant Bash shell script. They require a Unix-like shell environment (Linux, macOS, Git Bash, or WSL on Windows). No external dependencies beyond standard shell utilities (`awk`, `printf`, `bash`) are required.

### 1. Set Execution Permissions
Navigate to the root directory of the repository and grant execute permissions:
```bash
chmod +x exercise-01/evaluate_grades.sh
chmod +x exercise-02/analyze_logs.sh
```

### 2. Execute Exercise 01
Run the script by providing the path to the dataset:
```bash
./exercise-01/evaluate_grades.sh exercise-01/input.txt
```
Alternatively, invoke through the Bash interpreter:
```bash
bash exercise-01/evaluate_grades.sh exercise-01/input.txt
```

### 3. Execute Exercise 02
Run the log analyzer script with the access log file:
```bash
./exercise-02/analyze_logs.sh exercise-02/input.txt
```
Alternatively, invoke through the Bash interpreter:
```bash
bash exercise-02/analyze_logs.sh exercise-02/input.txt
```

---

## Git Practice Record & Merge Conflict Resolution
For the complete catalogue of Git commands used in this assignment and a detailed step-by-step breakdown of how a merge conflict was simulated, identified via conflict markers, and resolved, refer to:
- **[git-commands.md](./git-commands.md)**

---

## Evidence of GitHub Activities

### Issues
- **[Issue #1](https://github.com/VinayCodes17/git_Practice_BT25CSE159/issues/1):** Exercise 1: Implement Student Academic Performance Evaluator
- **[Issue #2](https://github.com/VinayCodes17/git_Practice_BT25CSE159/issues/2):** Exercise 2: Implement Web Server Access Log Analyzer
- **[Issue #3](https://github.com/VinayCodes17/git_Practice_BT25CSE159/issues/3):** Maintenance: Document Git Commands and Merge Conflict Resolution

### Pull Requests
- **[Pull Request #1](https://github.com/VinayCodes17/git_Practice_BT25CSE159/pull/1):** `feature/exercise-01` -> `main` (Merged)
- **[Pull Request #2](https://github.com/VinayCodes17/git_Practice_BT25CSE159/pull/2):** `feature/exercise-02` -> `main` (Merged)
- **[Pull Request #3](https://github.com/VinayCodes17/git_Practice_BT25CSE159/pull/3):** `docs/update-instructions` -> `main` (Merged with conflict resolution)

---

## Submission Checklist
- [x] Repository named with roll number (`git_Practice_BT25CSE159`).
- [x] `README.md` includes student details, problem descriptions, run instructions, and activity links.
- [x] Exercise folders `exercise-01` and `exercise-02` contain code, sample `input.txt`, and `output.txt`.
- [x] `git-commands.md` documents commands used and details merge conflict resolution.
- [x] Meaningful commit history with clear, descriptive commit messages.
- [x] No sensitive credentials, access tokens, or unnecessary binary files tracked.
