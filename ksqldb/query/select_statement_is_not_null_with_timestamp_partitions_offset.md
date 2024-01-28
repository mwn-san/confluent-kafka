```
SELECT
    ROWTIME AS MESSAGE_TIMESTAMP,
    ROWPARTITION AS PARTITION,
    ROWOFFSET AS OFFSET,
    message->data->field_name_A AS field_name_A,
    message->data->field_name_B AS field_name_B,
    message->data->field_name_C AS field_name_C,
    message->headers->field_name_D AS field_name_D
FROM
    stream_name
WHERE
    message->data->field_name_A IS NOT NULL and message->headers->field_name_B='UPDATE'
EMIT CHANGES;
```
