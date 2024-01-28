Stream nested to flateen with keyed:

https://github.com/mwn-san/kafka/blob/mwn/ksqldb/stream/nested_to_flatten_with_keyed.md


```
CREATE STREAM stream_name
  WITH (kafka_topic='new_topic_name', value_format='AVRO')
AS
  SELECT * FROM stream_name_nested_to_flatten
  PARTITION BY KEY;
```
