#!/bin/bash

shopt -s nullglob # This turns on the shell option null glob
#If the shell option, null glob is turned off, it will  return the literal string submission_reminder_* if there is no match

matches=(./submission_reminder_*) #This stores in an array, all the expansions of the submission_reminder


if [ ${#matches[@]} -eq 0 ]; then
        echo "No submission environments found."
        ./create_environment.sh
        echo "                                      "
        echo "running copilot_shell_script.sh again..."
        ./copilot_shell_script.sh

else
        for dir in "${matches[@]}"; do


                echo -e "The environment $dir has been found."
                read -p "What is the name of the assignment that you want to check?: " reply


                assignments=("Shell Navigation" "Git" "Shell Basics" "vi" "Emacs")
                is_present="false"

                for assignment in "${assignments[@]}"; do

                        if [[ "$reply" == "$assignment" ]]; then
                                is_present="true"
                                break
                        else
                                :

                        fi

                done



                if [ $is_present == "false" ]; then
                        echo "The assignment, $reply, you have entered is invalid"
                        echo "Valid assignments: vi, Git, Shell Basics, Git, Emacs"
                        echo "NOTE: The case of your input matters"

                else
                        sed -i "2cASSIGNMENT=\"$reply\"" "$dir/config/config.env"
                        echo "Updating $dir........"
                        echo "The config file in $dir has been updated."
                        echo "You can now run the startup.sh file"
                        echo "___________________________________________"
                        echo "-------------------------------------------"
fi

        done

fi
