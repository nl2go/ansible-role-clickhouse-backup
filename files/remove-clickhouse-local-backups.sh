#bin/bash

for i in $(clickhouse-backup --config /etc/clickhouse-backup/config-daily.yml list | grep local | awk '{print $1}') ;
  do
     clickhouse-backup --config /etc/clickhouse-backup/config-daily.yml delete local $i ;
  done
