#!/bin/bash
for i in <topic-name> 
do
    echo $i
    docker exec -it <broker> kafka-topics --bootstrap-server <host:port> --delete --topic $i
done
