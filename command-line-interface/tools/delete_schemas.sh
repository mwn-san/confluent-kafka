#!/bin/bash
for i in <schema-name-value>
do
    echo $i
    curl -X DELETE http://<host:port>/subjects/$i
done
