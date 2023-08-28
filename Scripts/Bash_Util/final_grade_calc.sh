#!/bin/bash

# Source the function script
source calc_reduction.sh

grade=100
# Call the function with an argument (replace 90 with the actual grade)
calc_late_submission $grade

# Capture the return value of the function
new_grade=$?

# Print the new grade
echo "New grade: $new_grade"