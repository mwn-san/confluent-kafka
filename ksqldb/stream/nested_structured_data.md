```
CREATE STREAM stream_name (
  message STRUCT<
        data STRUCT<
            field_name_A VARCHAR,
            field_name_B BIGINT,
            field_name_C INT
		>,
        headers STRUCT<
            field_name_D VARCHAR
		>
	>
) WITH (
  kafka_topic='topic_name',
  value_format='AVRO',
  partitions=10
);
```
