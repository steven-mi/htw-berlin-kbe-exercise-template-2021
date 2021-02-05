#! /bin/sh
 

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage: ./songsWSTester.sh TEAMNAME"
    echo "Example: ./songsWSTester.sh teames"
    exit 1
fi

echo "--- POSTING A JSON SONG ------------------------"
curl -X POST \
     -H "Content-Type: application/json" \
     -d '{"title" : "777 title", "artist" : "artist 777", "label" : "label 777", "released" : 2017}' \
     -v "http://localhost:8080/$1/rest/songs"
echo "------------------------------------------------"

echo "--- POSTING A JSON SONG WITHOUT A TITLE: 400----"
curl -X POST \
     -H "Content-Type: application/json" \
     -d '{"artist" : "artist 777", "label" : "label 777", "released" : 2017}' \
     -v "http://localhost:8080/$1/rest/songs"
echo "------------------------------------------------"

echo "--- REQUESTING ALL SONGS IN JSON ---------------"
curl -X GET \
     -H "Accept: application/json" \
     -v "http://localhost:8080/$1/rest/songs"
echo "------------------------------------------------"

echo "--- REQUESTING SONG 6 IN JSON ------------------"
curl -X GET \
     -H "Accept: application/json" \
     -v "http://localhost:8080/$1/rest/songs/6"
echo "------------------------------------------------"

echo "--- REQUESTING ALL XML SONGS--------------------"
curl -X GET \
     -H "Accept: application/xml" \
     -v "http://localhost:8080/$1/rest/songs"
echo "------------------------------------------------"

echo "--- REQUESTING SONG 6 IN XML--------------------"
curl -X GET \
     -H "Accept: application/xml" \
     -v "http://localhost:8080/$1/rest/songs/6"
echo "------------------------------------------------"

echo "--- REQUESTING NON-EXISTING SONG 2222: ---------"
curl -X GET \
     -H "Accept: application/json" \
     -v "http://localhost:8080/$1/rest/songs/2222"
echo "------------------------------------------------"

echo "--- UPDATING JSON-SONG 6 -----------------------"
curl -X PUT \
     -H "Content-Type: application/json" \
     -d '{"id": 6,"title": "Wrecking Ball","artist": "MILEY CYRUS","label": "RCA","released": 2013}' \
     -v "http://localhost:8080/$1/rest/songs/6"
echo "------------------------------------------------"

echo "--- REQUESTING UPDATED SONG 6 ------------------"
curl -X GET \
     -H "Accept: application/json" \
     -v "http://localhost:8080/$1/rest/songs/6"
echo "------------------------------------------------"

echo "--- UPDATING NON-EXISTING SONG 2222 WITH PAYLOAD SONG 6 -"
echo "--- SHOULD RETURN 404 or 400 -------------------"
curl -X PUT \
     -H "Content-Type: application/json" \
     -d '{"id": 6,"title": "Wrecking Ball","artist": "MILEY CYRUS","label": "RCA","released": 2013}' \
     -v "http://localhost:8080/$1/rest/songs/2222"
echo "------------------------------------------------"

echo "--- UPDATING SONG 7 WITH PAYLOAD SONG 6: 400 ---"
curl -X PUT \
     -H "Content-Type: application/json" \
     -d '{"id": 6,"title": "Wrecking Ball","artist": "MILEY CYRUS","label": "RCA","released": 2013}' \
     -v "http://localhost:8080/$1/rest/songs/7"
echo "------------------------------------------------"

echo "--- DELETING SONG 2 ----------------------------"
curl -X DELETE \
     -v "http://localhost:8080/$1/rest/songs/2"
echo "------------------------------------------------"

echo "--- DELETING SONG 2 AGAIN: SHOULD PRODUCE 404 --"
curl -X DELETE \
     -v "http://localhost:8080/$1/rest/songs/2"
echo "------------------------------------------------"

