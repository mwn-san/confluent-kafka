Stream nested data here:

https://github.com/mwn-san/kafka/blob/mwn/ksqldb/stream/nested_structured_data.md


Adding fields to the stream with key fields in the kafka message:

```
CREATE STREAM stream_name_keyed AS
  SELECT
    message->data->field_name_A AS KEY,
    message->data->field_name_A AS field_name_A,
    message->data->field_name_B AS field_name_B,
    message->data->field_name_C AS field_name_C,
    message->headers->field_name_D AS field_name_D
  FROM stream_nested_data_name;
```
