Stream nested data here:
https://github.com/mwn-san/kafka/blob/mwn/ksqldb/stream/create_stream_nested_data

Adding fields to the stream with key fields in the kafka message:

```
CREATE STREAM stream_name_keyed AS
  SELECT
    message->data->field_name_A AS KEY,
    message->data->field_name_A AS field_name_A,
    message->data->field_name_B AS field_name_B,
    message->data->field_name_B AS field_name_B,
    message->headers->field_name_C AS field_name_C
  FROM stream_nested_data_name;
```
