#! /bin/sh

#
# Usage:
# ./putAndDeleteTester.sh TEAMNAME 
# Example:
# ./putAndDeleteTester.sh teames
# 

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage: ./putAndDeleteTester.sh TEAMNAME"
    echo "Example: ./putAndDeleteTester.sh teames"
    exit 1
fi

echo "--- PUTTING SONG 6 IN JSON ---"
curl -X PUT \
     -H "Content-Type: application/json" \
     -d "@einSong.json" \
     -v "http://localhost:8080/$1/songs?songId=6"
echo "---"

echo "--- DELETE A SONG ---"
curl -X DELETE \
     -H "Accept: application/XML" \
     -v "http://localhost:8080/$1/songs?songId=6"
echo "---"
