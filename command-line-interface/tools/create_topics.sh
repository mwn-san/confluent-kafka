#!/bin/bash

# Filename containing the list of topics
TOPICS_FILE="topics-to-create.txt"

# Kafka bootstrap server
BOOTSTRAP_SERVER="<host:port>,<host:port>,<host:port>"

# Docker container name
DOCKER_CONTAINER="BK781"

# Checking if the topic list file exists
if [ ! -f "$TOPICS_FILE" ]; then
  echo "File $TOPICS_FILE Not found!"
  exit 1
fi

# Reading each line in the file and deleting the topic
while IFS= read -r TOPIC
do
  if [ -n "$TOPIC" ]; then
    echo "Creating topic: $TOPIC"
    docker exec -t "$DOCKER_CONTAINER" kafka-topics --create --topic "$TOPIC" --partitions 10 --replication-factor 5 --bootstrap-server "$BOOTSTRAP_SERVER"
  fi
done < "$TOPICS_FILE"

echo "Topic creation process completed."
