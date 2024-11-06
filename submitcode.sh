term="fa2024"

# verify that jq is installed
if which jq >/dev/null
then
  echo -n ''
else
  echo 'ERROR: Missing jq; try running' >&2
  echo '    sudo apt-get install jq' >&2
  exit 1
fi


# get a username and password
echo -n "Username: "
read username

echo -n "Password: "
read -s password
echo

bundle=$(echo -n $username:$password | base64)

curl -s "https://courses.grainger.illinois.edu/cs340/fa2024/secure/put.php?f=${username}/mp7/chunkservice.py" -u "$username:$password" --ntlm -X POST --data-binary @chunkservice.py -H 'Content-Type: text/x-python' | jq '{"bytes uploaded": .["mp7/chunkservice.py"].len}' 2>/dev/null || echo 'Invalid credentials'
