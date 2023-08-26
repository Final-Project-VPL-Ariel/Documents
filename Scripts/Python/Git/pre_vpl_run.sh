student_files="student_folder"
teacher_files="teacher_folder"
requested_file="link_py.txt" #must be change to the same name in the requested file

commit_teacher="3cac178"
teacher_link="https://github.com/TalMalchi/Ex8-Python.git" # Link to teacher's git repository

# Read the student's input file and extract the repository URL and commit number
mapfile -t input_lines < "$requested_file"
repo_url="${input_lines[0]}"
commit="${input_lines[1]}"
# Clone the student's repository

git clone --quiet "$repo_url" "$student_files"
# Move to the student's repository directory
sleep 5 
cd "$student_files" 
git checkout "$commit"
mv ./* ..
cd ..
rm -f -r "$student_files"
rm -f -r "$teacher_files"

git clone --quiet "$teacher_link" "$teacher_files"
sleep 5 
cd "$teacher_files"
git checkout "$commit_teacher"
# move all the files to main directory ecxept  __pycache__
find . -maxdepth 1 -type f ! -path "./__pycache__/*" -exec mv {} .. \;
cd ..
