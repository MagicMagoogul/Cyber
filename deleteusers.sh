#!/bin/bash

# Define allowed users
adminUsers=("jeremy.rover" "maxwell.starling" "jack.harris" "emily.chen" "william.wilson" "melissa.chen" "john.taylor" "laura.harris" "alan.chen" "anna.wilson" "matthew.taylor")
normalUsers=("emily.lee" "chris.harris" "danielle.wilson" "heather.chen" "james.taylor" "ashley.lee" "mark.wilson" "rachel.harris" "alan.taylor" "amy.wilson" "kathleen.chen" "dave.harris" "jeff.taylor" "julie.wilson" "tom.harris" "sarah.taylor" "micheal.chen" "christine.wilson" "alan.harris" "emily.lee" "tony.taylor" "tiffany.wilson" "sharon.harris" "amy.wilson" "terry.chen" "rachel.wilson" "tiffany.harris" "amy.taylor" "terry.wilson")

# Merge all allowed users into one list
allowedUsers=("${adminUsers[@]}" "${normalUsers[@]}")

# Get list of all users on the system (excluding system accounts)
allUsers=$(awk -F: '($3 >= 1000) {print $1}' /etc/passwd)

# Loop through users and delete those not in the allowed list
for user in $allUsers; do
    if [[ ! " ${allowedUsers[@]} " =~ " ${user} " ]]; then
        echo "Removing user: $user"
        sudo userdel -r "$user"
    fi
done

echo "Cleanup complete!"
