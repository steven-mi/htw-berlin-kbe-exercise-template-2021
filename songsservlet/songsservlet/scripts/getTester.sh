#! /bin/sh

#
# Usage:
# ./getTester.sh TEAMNAME 
# Example:
# ./getTester.sh teames
# 

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage: ./getTester.sh TEAMNAME"
    echo "Example: ./getTester.sh teames"
    exit 1
fi

echo "--- REQUESTING SONG NUMBER 4 IN JSON --------"
curl -X GET \
     -H "Accept: application/json" \
     -v "http://localhost:8080/$1/songs?songId=4"

echo "--- REQUESTING ALL SONGs IN JSON --------"
curl -X GET \
     -H "Accept: application/json" \
     -v "http://localhost:8080/$1/songs?all"
echo "---"
echo "--- REQUESTING SONG NUMBER 1 IN XML --------"
curl -X GET \
     -H "Accept: application/xml" \
     -v "http://localhost:8080/$1/songs?songId=4"
echo "---"
echo "--- REQUESTING SONG "2222" IN JSON: should return 404 --------"
curl -X GET \
     -H "Accept: application/json" \
     -v "http://localhost:8080/$1/songs?songId=2222"
echo "---"
echo "--- REQUESTING SONG "aaaa" IN JSON: should return 400 --------"
curl -X GET \
     -H "Accept: application/json" \
     -v "http://localhost:8080/$1/songs?songId=aaaa"
echo "---"
echo "--- Bad param: should return 400 --------"
curl -X GET \
     -H "Accept: application/json" \
     -v "http://localhost:8080/$1/songs?ID=22"
echo "---"
echo "--- GET WITHOUT Accept: should return JSON ---------------"
curl -X GET \
     -v "http://localhost:8080/$1/songs?songId=4"
echo "---"
echo "--- GET WITH Accept=irgendwas: should return 406 or JSON ---------------"
curl -X GET \
     -H "Accept: text/html" \
     -v "http://localhost:8080/$1/songs?songId=4"
echo "---"
echo "DONE"
