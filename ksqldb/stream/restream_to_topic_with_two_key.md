
```
CREATE STREAM stream_name AS
  SELECT
    CAST(message->data->field_name_A AS VARCHAR) + '+' + CAST(message->data->field_name_B AS VARCHAR) AS KEY,
    message->data->field_name_A AS field_name_A,
    message->data->field_name_B AS field_name_B,
    message->data->field_name_C AS field_name_C,
    message->headers->field_name_D AS field_name_D
  FROM stream_nested_structured_data;
```
