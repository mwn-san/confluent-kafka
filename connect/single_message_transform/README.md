# NESTED TO FLATTEN
    "transforms": "ExtractField",
    "transforms.ExtractField.type": "org.apache.kafka.connect.transforms.ExtractField$Value",
    "transforms.ExtractField.field": "data"

# REPLACE FIELD
    "transforms": "ReplaceField",
    "transforms.ReplaceField.type": "org.apache.kafka.connect.transforms.ReplaceField$Value",
    "transforms.ReplaceField.include": "CREATE_BY, UPDATE_BY",
    "transforms.ReplaceField.renames": "CREATE_BY:create_by, UPDATE_BY:update_by"

# CAST
    "transforms.CastTransform.type": "org.apache.kafka.connect.transforms.Cast$Value",
    "transforms.CastTransform.spec": "version:float32"

# TIMESTAMP
    "transforms.TimestampConverter.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
    "transforms.TimestampConverter.field": "create_date",
    "transforms.TimestampConverter.target.type": "Timestamp",
    "transforms.TimestampConverter.format": "yyyy-MM-dd HH:mm:ss.SSSSSS"  

# DATE
    "transforms.DateConverter.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
    "transforms.DateConverter.format": "yyyy-MM-dd",
    "transforms.DateConverter.target.type": "Date",
    "transforms.DateConverter.field": "last_unblocked"

# VALUE TO KEY
    "transforms": "ValueToKey",
    "transforms.ValueToKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
    "transforms.ValueToKey.fields": "CIF,PRICE"

# FIELD WHITELIST
    "fields.whitelist": "CIF, VERSION"
  
