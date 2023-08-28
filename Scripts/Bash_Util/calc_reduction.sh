#!/bin/bash
# read grade (int) from stdin

secondsperday=86400

function calc_late_submission() {
local grade="$1"
# Parse the file line by line
while IFS= read -r line; do
    # Extract variable name and value using 'cut'
    line=$(echo "$line" | sed -e 's/^export //')
    line=$(echo "$line" | sed -e 's/^[[:space:]]*//')
    line=$(echo "$line" | sed -e 's/[[:space:]]*$//')

    variable_name=$(echo "$line" | cut -d= -f1)
    value=$(echo "$line" | cut -d= -f2- | tr -d "'")

    # Assign values to variables based on variable names
    case "$variable_name" in
        VPL_DUEDATE)
            vpl_duedate="$value"
            ;;
        VPL_STARTDATE)
            vpl_startdate="$value"
            ;;
        VPL_REDUCTION_POINTS)
            vpl_reduction_points="$value"
            ;;
        VPL_DUEDATE_OVERRIDE)
            vpl_duedate_override="$value"
            ;;
        VPL_SUBMISSION_DATE)
            vpl_submission_date="$value"
            ;;
    esac
done < "vpl_environment.sh"


# Calculate grades based on conditions
if [ -n "$vpl_duedate_override" ]; then
    if [ -f "fail_penalty.txt" ]; then
        while IFS=':' read -r days reduction; do
            if [ $((vpl_submission_date - vpl_duedate)) -gt $((days * secondsperday)) ]; then
                vpl_reduction_points=$reduction
            fi
        done < "fail_penalty.txt"
    fi

        if [ -n "$vpl_reduction_points" ]; then
        # Calculate the grade
        new_grade=$((grade - vpl_reduction_points))
    fi

fi

return $new_grade
}

