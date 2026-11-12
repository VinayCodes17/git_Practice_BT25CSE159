#!/usr/bin/env bash
# ==============================================================================
# Script Name: evaluate_grades.sh
# Description: Processes student marks from a CSV file, calculates total,
#              percentage, and letter grades, and outputs a formatted report.
# Author: Vinay Kumrawat (BT25CSE159)
# ==============================================================================

set -euo pipefail

INPUT_FILE="${1:-}"

# Check if input file is supplied
if [ -z "$INPUT_FILE" ]; then
    echo "Error: No input file specified." >&2
    echo "Usage: $0 <path_to_student_data_csv>" >&2
    exit 1
fi

# Check if file exists and is readable
if [ ! -f "$INPUT_FILE" ] || [ ! -r "$INPUT_FILE" ]; then
    echo "Error: Cannot read input file '$INPUT_FILE'." >&2
    exit 1
fi

echo "================================================================================"
echo "                      STUDENT ACADEMIC PERFORMANCE REPORT                       "
echo "================================================================================"
printf "%-12s %-16s %-8s %-8s %-8s %-8s %-12s %-6s\n" \
    "Roll No" "Name" "Physics" "Chem" "Maths" "Total" "Percentage" "Grade"
echo "--------------------------------------------------------------------------------"

awk -F',' '
NR == 1 { next } # Skip header line
NF >= 5 {
    roll = $1
    name = $2
    phy = $3 + 0
    chem = $4 + 0
    math = $5 + 0

    total = phy + chem + math
    pct = total / 3.0

    if (pct >= 90.0)      grade = "A+"
    else if (pct >= 80.0) grade = "A"
    else if (pct >= 70.0) grade = "B"
    else if (pct >= 60.0) grade = "C"
    else if (pct >= 50.0) grade = "D"
    else                  grade = "F"

    printf "%-12s %-16s %-8d %-8d %-8d %-8d %-11.2f%% %-6s\n", \
        roll, name, phy, chem, math, total, pct, grade

    count++
    sum_pct += pct

    if (pct >= 50.0) passed++
    else failed++

    if (pct > max_pct) {
        max_pct = pct
        topper_name = name
        topper_roll = roll
    }
}
END {
    print "--------------------------------------------------------------------------------"
    if (count > 0) {
        avg_pct = sum_pct / count
        printf "Total Students Evaluated : %d\n", count
        printf "Passed                   : %d\n", passed
        printf "Failed                   : %d\n", failed
        printf "Class Average Percentage : %.2f%%\n", avg_pct
        printf "Highest Scorer (Topper)  : %s (%s) with %.2f%%\n", topper_name, topper_roll, max_pct
    } else {
        print "No student records found to evaluate."
    }
    print "================================================================================"
}
' "$INPUT_FILE"
