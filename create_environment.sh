#!/bin/bash

read -p "What is your name: " name

echo "creating new environment............"

sub_dir="submission_reminder_$name"

mkdir -p ./$sub_dir

mkdir -p ./$sub_dir/app/ ./$sub_dir/modules/ ./$sub_dir/assets/ ./$sub_dir/config


#This is the creation of the  submissions file in the assets folder
cat << 'EOF' > ./$sub_dir/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Matthew, Emacs, not submitted
Irakoze,vi, submitted
Odihambo,vi, not submitted
Maria, vi, submitted
Cosmas, Emacs, submitted
Theophilus, vi, submitted
Anthony,Emacs, submitted
George, Git, not submitted
David, Shell Basics, not submitted
Jonathan, Shell Navigation, submitted
Goodluck, Shell Navigation, not submitted
Nelson, Shell Navigation, not submitted
EOF



#This is the creation of the functions.sh file in the Modules directory
#The cat << EOF syntax is called a here document syntax and it is used to easily write multiline documents within a script]

cat << 'EOF' > ./$sub_dir/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF



#This is the creation of the config.env file in the config folder
cat << 'EOF' > ./$sub_dir/config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF


#This is the creation of the reminder.sh file in the app folder
cat << 'EOF' > ./$sub_dir/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

EOF



#This is the writing of the startup.sh file in the submission reminder directory
cat << 'EOF' > ./$sub_dir/startup.sh

#The condition below checks if all the necessary files in the environment are there.

if [ -f ./app/reminder.sh ] && [ -f ./modules/functions.sh ] && [ -f ./config/config.env ] && [ -f ./assets/submissions.txt ]; then
        ./app/reminder.sh

else
        echo "Your Environment is incomplete."
        echo "Please delete your current environment and create a new one"
fi

EOF


#Granting permissions to all shell scripts, using the asterisk wildcard
find ./$sub_dir -type f -name "*.sh" -exec chmod +x {} \;
#The above command recursively grants execute permissions to all shell scripts in the environment and its sub directories.

echo "Your environment has been created! All the best!
