#!/bin/bash

# Resetting the oath on the yubikey
echo "y" | ykman oath reset

# For every file appenned to the script
for FILE in "$@"
do
	# Decrypting the file if it is encrypted by gpg
	if [[ $FILE =~ gpg$ ]]
	then
		gpg --output /tmp/otp.json --decrypt $1
		FILE=/tmp/otp.json
	fi

	# If the file is not json then stop here
	if [[ ! $FILE =~ json$ ]]
	then
		exit
	fi

	# Declaration of variables
	SECRET="empty"
	i="0"

	# Add every oath
	while [ -n "$SECRET" ]
	do
		# Parsing the json
		SECRET="$(cat $FILE | python3 -c "import sys, json; print(json.load(sys.stdin)[$i]['secret'])" 2> /dev/null)"
		LABEL="$(cat $FILE | python3 -c "import sys, json; print(json.load(sys.stdin)[$i]['label'])" 2> /dev/null)"

		# Adding the oath
		ykman oath add $LABEL $SECRET

		let "i++"
	done
	# Remove the temporary file
	if [[ "$SECRET"  == "/tmp/otp/json" ]]
	then
		rm $SECRET
	fi
done
