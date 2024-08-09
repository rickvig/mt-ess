#!/bin/bash

name_list="tables.txt"

# Template string with placeholder
template="in:
  type: jdbc
  driver_path: /opt/jars/mssql-jdbc-9.2.0.jre8.jar
  driver_class: com.microsoft.sqlserver.jdbc.SQLServerDriver
  url: jdbc:sqlserver://;serverName=10.0.0.26;port=1433;databaseName=DCC
  user: reportread
  password: fpY)K946
  table: {{TABLE_NAME}}
  #column_options:
  #  FERTIMESTAMP2: {value_type: string}

out:
  type: s3
  path_prefix: raw/{{TABLE_NAME}}
  file_ext: .csv
  bucket: datalake
  endpoint: http://10.0.0.5:9000
  access_key_id: oHiVRUP6xfQzZ4r2loVH
  secret_access_key: 7Oo6aR0Bv9mGVKXel5099CwauYkUCLPeuJLcJJNL
  use_path_style: true
  formatter:
    type: csv
  "

while IFS= read -r name; do
    name_trim="${name//[[:space:]]/}"
    personalized_text="${template//\{\{TABLE_NAME\}\}/$name_trim}"
    filename="ingest_${name_trim}.yaml"

    echo "$personalized_text" > "$filename"
    echo "Created file: $filename"
done < "$name_list"
