# submission_reminder_app_Jeremiah-J-Emmanuel

In this assignment, there are two shell scripts -create_enviornment and the copilot_shell_script.sh.
These are the scripts that make up the submission reminder app.
The app is used to check, from a data base, the names of  students that have not submitted a particular assignment.


Content:
1. Description of the Scripts
2. How to setup and use the app
3. Possible errors you can encounter and how to solve them



Description of the scripts
--------------------------

The create_environment.sh script is the responsible for creating the environment that is needed to run
the submission reminder app.

The environent that is created is basically a directory named "submission_reminder_{user_inputted_name}"

The environment created contains four directories and five files.Four out of the five files will each
be contained in one of the four directories, while the fifth file will be in the directory of the environment created, on
the same level as the four directories.
This is a representation of the directory structure
```
submission_reminder_{user_inputted_name}/
|
|----app/
|      |_reminder.sh
|
|----config/
|       |_config.env
|
|----assets/
|         |_submissions.txt
|
|----modules/
|         |_function.sh
|
|----startup.sh
```


The reminder.sh script is the script that is responsible for the final output of the individuals who have not
submitted thier assignment. To do this, it echoes the assignment name and the number of days left, which
is gotten from the config.env file, and by calling the check_submissions function on the submissions.txt file
which then echoes the names of those who have not submitted a particular assignment.
The reminder.sh file is called by the reminder.sh script.

The config.env file contains the assignment name that the user wishes to check submissions and the days left
till the assignment is due.

The submissions.txt file contains the names of students, their assignments and the status of their assignments.

The function.sh script is the script that contains the logic for checking through the submissions.txt file for
students who have not submitted a certain assignment. This is done by the check_submissions function.

The startup.sh is the script that is run by the user to echo the names of students who have not done a certain
assignemt. The startuo.sh file calls the reminder.sh file.



The copilot_shell_script is the script that is used to update the assignment that you wish to check the submissions.
If you have multiple environments in the directory, the copilot_shell_script will update them all.




How to set up and use the app
--------------------------------
STEP 1: Clone this repository from git hub into your terminal or sandbox in order to have local acess to these files.
To do so, run this in your terminal:
git clone https://github.com/Jeremiah-J-Emmanuel/submission_reminder_app_Jeremiah-J-Emmanuel.git

STEP 2: Navigate into the clone directory
RUN : cd submission_reminder_app_Jeremiah-J-Emmanuel

STEP 3: Make the create_environemt.sh and the copilot_shell_scripts executable
RUN: chmod +x *.sh

STEP 4: Create your Environment
RUN: ./create_environment.sh
Here, you will be prompted to enter your name. You can enter any name you wish to enter.
Assuming you entered the name Percival, the name of the environment created will be submission_reminder_Percival

You can have more than one environment created. To do so, run the create_environment.sh script again and enter
a name that is not existing currently. If you enter an existing name, you will reset that existing envronment
to how it initially was.

STEP 5: Move into the new environment.
RUN: cd submission_reminder_{inputted_name}

STEP 6: Run the startup.sh to run the application
RUN: ./startup.sh

STEP 7: Changing the assignment name.
If you wish to change the assignment you are checking, navigate in to the submissions_reminder_app_Jeremiah-J-Emmanuel
and RUN the copilot_shell_script.sh
Enter the assignment you wish to change.
You will get a message that you have updated the assignment name.
NOTE: If you have multiple environments, the copilot_shell_script will run for all of them. This gives you the
ability update multiple environments with the assignment of your choice.
When you have changed the assigment name, you can navigate back to the environment and run the startup.sh file.



Possible Errors You Can Encounter and how to solve them
-------------------------------------------------------

1. Incomplete Environment: If any file is deleted in the environment you created, and you try to run the startup.sh file,
you will get an error message that says:  Your environment is incomplete
                                          Please delete your current environment and create a new one

To solve this error, cd out of the incomplete environemt into the cloned repository, delete it and create another one.
Do so by running: cd ..
                  rm -rf ./submission_reminder_{inputted_name}
                  ./create_environment.sh

2. Missing Environment: This happens when you have not created any environment but try to run the copilot_shell_script.sh.
You will see an error message that says: No submission environments found.
This error is self-resolving as it will run the create_environment script and create the environment, then run the
copilot_shell_script again.

3. Invalid assignments: If you run the copilot_shell_script.sh and you input an assignment which is not in the list of
assignments, you will get an error message stating "The assignment you have entered is invalid." A list of valid assignments
will also be displayed.
To resolve this error, enter a valid assignment name. Note that, the input is case sensitive.
