#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <path>"
    exit 1
fi

PATH_PARAM="$1"

if [ ! -d "$PATH_PARAM" ]; then
    echo "Error: The path '$PATH_PARAM' does not exist or is not a directory."
    exit 1
fi


name_list="$PATH_PARAM/tables.txt"

template="in:
  type: jdbc
  driver_path: /opt/jars/mssql-jdbc-9.2.0.jre8.jar
  driver_class: com.microsoft.sqlserver.jdbc.SQLServerDriver
  url: jdbc:sqlserver://;serverName=10.0.0.26;port=1433;databaseName={{DATABASE}}
  user: reportread
  password: fpY)K946
  query: |
    SELECT * FROM {{SCHEMA}}.{{TABLE}}
  #column_options:
  #  FERTIMESTAMP2: {value_type: string}

out:
  type: parquet
  path_prefix: \"s3a://datalake/raw/{{TABLE}}/{{TABLE}}_\"
  extra_configurations:
    fs.s3a.endpoint: http://10.0.0.5:9000
    fs.s3a.access.key: oHiVRUP6xfQzZ4r2loVH
    fs.s3a.secret.key: 7Oo6aR0Bv9mGVKXel5099CwauYkUCLPeuJLcJJNL
  sequence_format: \"%05d\"
  addUTF8: \"true\"
  compression_codec: SNAPPY"
 

while IFS= read -r name; do
    name_trim="${name//[[:space:]]/}"
    
    arr=(${name_trim//./ })
    DATABASE=${arr[0]}
    SCHEMA=${arr[1]}
    TABLE=${arr[2]}

    final_file="${template//\{\{DATABASE\}\}/$DATABASE}"
    final_file="${final_file//\{\{SCHEMA\}\}/$SCHEMA}"
    final_file="${final_file//\{\{TABLE\}\}/$TABLE}"
    
    filename="ingest_${DATABASE}_${SCHEMA}_${TABLE}.yaml"

    echo "$final_file" > "$PATH_PARAM/$filename"
    echo "Created file: $filename"
done < "$name_list"
