student_files="student_folder"
teacher_files="teacher_folder"
requested_file="link.txt" # Name of the file containing student input

commit_teacher="9a6dd77"
teacher_link="https://github.com/Final-Project-VPL-Ariel/Orgchart-teacher.git" # Link to teacher's git repository

mapfile -t input_lines < "$requested_file"
repo_url="${input_lines[0]}"
commit="${input_lines[1]}"

# Clone the student's repository
git clone --quiet "$repo_url" "$student_files"

# Clone the teacher's repository with the teacher's commit
git clone --quiet "$teacher_link" "$teacher_files"
cd "$teacher_files"
git checkout "$commit_teacher"
cd ..

cd "$student_files"
git checkout "$commit"
cd ..

    # Proceed with the rest of the script
    find "$student_files" -type f -exec cp -n {} "$teacher_files" \;
    find "$student_files" -exec cp -nR {} "$teacher_files" \;
    rm -f -r "$student_files"
    mv "$teacher_files"/* ./

else
    echo "The student's repository does not have the desired commit: $commit_hash"
    # Additional actions or validations for this case
fi
