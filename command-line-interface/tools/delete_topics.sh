#!/bin/bash

# Filename containing the list of topics
TOPICS_FILE="topics-to-delete-control-center.txt"

# Kafka bootstrap server
BOOTSTRAP_SERVER="<host:port>,<host:port>,<host:port>"

# Nama container Docker
DOCKER_CONTAINER="BK781"

# Checking if the topic list file exists
if [ ! -f "$TOPICS_FILE" ]; then
  echo "File $TOPICS_FILE not found!"
  exit 1
fi

# Reading each line in the file and deleting the topic
while IFS= read -r TOPIC
do
  if [ -n "$TOPIC" ]; then
    echo "Deleting topic: $TOPIC"
    docker exec -t "$DOCKER_CONTAINER" kafka-topics --delete --topic "$TOPIC" --bootstrap-server "$BOOTSTRAP_SERVER"
  fi
done < "$TOPICS_FILE"

echo "Topic deletion process completed."
