#!/bin/bash

KAFKA_DATA_DIR="/data/broker/kafka-data/"

echo "Searching for Kafka topics with no data (all partitions are 4.0K)..."
echo

find "$KAFKA_DATA_DIR" -mindepth 1 -maxdepth 1 -type d | while read -r partition_path; do
  base=$(basename "$partition_path")

  [[ "$base" == _* || "$base" == __* || "$base" == cleaner-* || "$base" == log-start-* || "$base" == replication-* || "$base" == recovery-* || "$base" == meta.properties ]] && continue

  topic_name="${base%-*}"

  if [[ "$seen" == *",$topic_name,"* ]]; then
    continue
  fi

  seen+=",${topic_name},"

  part_dirs=$(find "$KAFKA_DATA_DIR" -mindepth 1 -maxdepth 1 -type d -name "${topic_name}-*")

  all_empty=true

  for part_dir in $part_dirs; do
    size=$(du -sh "$part_dir" | cut -f1)
    if [[ "$size" != "4.0K" && "$size" != "12K" ]]; then
      all_empty=false
      break
    fi
  done

  if $all_empty; then
    echo "Empty topic detected: $topic_name"
    
  fi
done

echo
echo "Check completed."
