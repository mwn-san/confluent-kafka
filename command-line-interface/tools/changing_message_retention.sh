#!/bin/bash
for i in <topic-name>
do
    echo $i
    docker exec -it <broker> kafka-configs --bootstrap-server <host:port> \
       --alter --entity-type topics --partitions 10 --replication-factor 5 \
       --entity-name $i \
       --add-config retention.ms=-1,retention.bytes=1073741824
done
