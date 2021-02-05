#! /bin/sh

#
# Usage:
# ./postTester.sh TEAMNAME 
# Example:
# ./postTester.sh teames
# 

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage: ./postTester.sh TEAMNAME"
    echo "Example: ./postTester.sh teames"
    exit 1
fi

echo "--- Posting JSON song ---"
curl -X POST \
     -H "Content-Type: application/json" \
     -v "http://localhost:8080/$1/songs" \
     -d '{"title":"Wrecking Ball","artist":"MILEY CYRUS","label":"RCA","released":2013}'
echo "---"

echo "--- Posting JSON song with just a title ---"
curl -X POST \
     -H "Content-Type: application/json" \
     -v "http://localhost:8080/$1/songs" \
     -d '{"title":"Dodge Ball"}'
echo "---"

echo "--- Posting XML ---"
curl -X POST \
     -H "Content-Type: application/xml" \
     -v "http://localhost:8080/$1/songs" \
     -d '<song>stuff</song>'
echo "---"

echo "--- Posting non-JSON song  ---"
curl -X POST \
     -H "Content-Type: application/json" \
     -v "http://localhost:8080/$1/songs" \
     -d 'This is not a love song'
echo "---"

echo "--- Posting empty payload  ---"
curl -X POST \
     -H "Content-Type: application/json" \
     -v "http://localhost:8080/$1/songs"
echo "---"

