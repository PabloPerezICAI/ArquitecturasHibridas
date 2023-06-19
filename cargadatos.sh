#!/bin/bash
while true
do
curl --user elastic:jopa2023 -XPOST -k https://localhost:9216/_reindex?pretty -H 'Content-Type: application/json' -d'
{
"source": {
"remote": {
"host": "https://worker01:9200",
"username": "consultas",
"password": "icai4ever"
},
"index": "index-data",
"query": {
"range": {
"@timestamp": {
"gte" : "now-15d/d",
"time_zone" : "+01:00"
}
}
}
},
"dest": {
"index": "index-data"
}
}
'
sleep 30
curl --user elastic:**** -XPOST -k https://localhost:9216/index-data/_delete_by_query?pretty -H 'Content-Type: application/json' -d'
{
"query": {
"range": {
"@timestamp": {
"lte" : "now-15d/d",
"time_zone" : "+01:00"
}
}
}
}
'
sleep 270
done
