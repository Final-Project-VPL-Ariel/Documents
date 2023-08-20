student_files="student_folder"
requested_file="link_py.txt" # Name of the file containing student inputt

commit_teacher="8685265"
teacher_link="https://github.com/TalMalchi/Ex8-Python.git" # Link to teacher's git repository
# Read the student's input file and extract the repository URL and commit number
mapfile -t input_lines < "$requested_file"
repo_url="${input_lines[0]}"
commit="${input_lines[1]}"
# Clone the student's repository
git clone --quiet "$repo_url" "$student_files"

# Move to the student's repository directory
cd "$student_files"
git checkout "$commit"
mv ./* ..
cd ..
#ls -l 

git clone --quiet "$teacher_link" "$teacher_files"
cd "$teacher_files"
git checkout "$commit_teacher"
mv ./* ..
cd ..

