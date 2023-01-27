#!/bin/bash
while true
do
curl --user elastic:jopa2023 -XPOST -k https://localhost:9216/_reindex?pretty -H 'Content-Type: application/json' -d'
{
"source": {
"remote": {
"host": "http://worker01:9200",
"username": "consultas",
"password": "icai4ever"
},
"index": "index-data"
},
"dest": {
"index": "index-data"
}
}
'
sleep 300
done
