student_files="student_folder"
requested_file="link_py.txt" # Name of the file containing student inputt

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
rm -rf "$student_files"

