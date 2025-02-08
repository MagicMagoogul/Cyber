# Change passwords.
# TODO: generate CSVs for the password changes according to the specified format (https://anonymfile.com/6Q6D/seccdc-24-team-packet.pdf)

host=$(hostname)
adminUsers=("jeremy.rover" "maxwell.starling" "jack.harris" "emily.chen" "william.wilson" "melissa.chen" "john.taylor" "laura.harris" "alan.chen" "anna.wilson" "matthew.taylor")
normalUsers=("emily.lee" "chris.harris" "danielle.wilson" "heather.chen" "james.taylor" "ashley.lee" "mark.wilson" "rachel.harris" "alan.taylor" "amy.wilson" "kathleen.chen" "dave.harris" "jeff.taylor" "julie.wilson" "tom.harris" "sarah.taylor" "micheal.chen" "christine.wilson" "alan.harris" "emily.lee" "tony.taylor" "tiffany.wilson" "sharon.harris" "amy.wilson" "terry.chen" "rachel.wilson" "tiffany.harris" "amy.taylor" "terry.wilson")

# Change password for administrative users
for user in "${adminUsers[@]}"; do
    # Check if user exists
    if id $user &>/dev/null; then
        # Generate a random password for each user
        pword=$(head -c 100 /dev/urandom | tr -dc 'a-zA-Z0-9@#$%&!?:*-+=' | cut -c1-23)

        # Change password and echo to std output for use in csv file
        echo "${user}:${pword}" | chpasswd > /dev/null
        echo "${host}-ssh,${user},${pword}"
    fi
done

# Change password for normal users
for user in "${normalUsers[@]}"; do
    # Check if user exists
    if id $user &>/dev/null; then
        # Generate a random password for each user
        pword=$(head -c 100 /dev/urandom | tr -dc 'a-zA-Z0-9@#$%&!?:*-+=' | cut -c1-23)

        # Change password and echo to std output for use in csv file
        echo "${user}:${pword}" | chpasswd > /dev/null
        echo "${host}-ssh,${user},${pword}"
    fi
done
echo "Passwords successfully changed.  Paste this into Team19_${host}-ssh_PWD and submit to black team"
