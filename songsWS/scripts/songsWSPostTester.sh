#! /bin/sh

if [ "$#" -ne 1 ]; then
  echo "Illegal number of parameters"
  echo "Usage: ./songsWSPostTester.sh songsWS-TEAMNAME"
  echo "Example: ./songsWSPostTester.sh songsWS-TEAMNAME"
  exit 1
fi

echo "--- CHECK mmuster with correct password ------------------------"
curl -X POST \
  -H "Content-Type: application/json" \
  -v "https://localhost:8443/$1/rest/auth" \
  -d '{"userId":"mmuster","password":"pass1234"}' \
  -k
echo "------------------------------------------------"

echo "--- CHECK eschuler with correct password ------------------------"
curl -X POST \
  -H "Content-Type: application/json" \
  -v "https://localhost:8443/$1/rest/auth" \
  -d '{"userId":"eschuler","password":"pass1234"}' \
  -k

echo "------------------------------------------------"

echo "--- CHECK mmuster with wrong password ------------------------"
curl -X POST \
  -H "Content-Type: application/json" \
  -v "https://localhost:8443/$1/rest/auth" \
  -d '{"userId":"mmuster","password":"geheim"}' \
  -k

echo "------------------------------------------------"

echo "--- CHECK without userid ------------------------"

curl -X POST \
  -H "Content-Type: application/json" \
  -v "https://localhost:8443/$1/rest/auth" \
  -d '{"password":"pass1234"}' \
  -k

echo "------------------------------------------------"
