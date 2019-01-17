Task #1. Import from MySQL to file with Avro and compression.

sqoop import \
--connect "jdbc:mysql://quickstart.cloudera:3306/retail_db" \
--username retail_dba \
--password cloudera \
--table orders \
--as-avrodatafile \
--compression-codec snappy \
--target-dir /user/cloudera/task1/orders \
--fields-terminated-by '|';

[cloudera@quickstart ~]$ hadoop fs -ls task1/orders
Found 5 items
-rw-r--r--   1 cloudera cloudera          0 2019-01-16 11:30 task1/orders/_SUCCESS
-rw-r--r--   1 cloudera cloudera     164090 2019-01-16 11:30 task1/orders/part-m-00000.avro
-rw-r--r--   1 cloudera cloudera     164157 2019-01-16 11:30 task1/orders/part-m-00001.avro
-rw-r--r--   1 cloudera cloudera     164278 2019-01-16 11:30 task1/orders/part-m-00002.avro
-rw-r--r--   1 cloudera cloudera     169339 2019-01-16 11:30 task1/orders/part-m-00003.avro

