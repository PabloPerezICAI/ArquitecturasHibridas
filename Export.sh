#!/bin/bash

fechaHoy=$(date '+%Y-%m-%d')
fechaAyer=$(date '+%Y-%m-%d' -d'1 day ago')
nombreFichero='/home/alumnos/ah16/export/export-'$(date '+%Y%m%d')'.txt'
keystore=/home/alumnos/ah16/elasticsearch-7.16.1/config/mykeystore.jks

java -jar /home/shared/export.jar -c elastic:icai4ever -f '@timestamp' -from $fechaAyer -i 'index-data' -k $keystore -o $nombreFichero -s icai4ever -to $fechaHoy -u https://localhost:9216

gzip $nombreFichero
