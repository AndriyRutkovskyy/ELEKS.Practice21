Task #2. Import from MySQL into textfile

sqoop import \
--connect "jdbc:mysql://quickstart.cloudera:3306/retail_db" \
--username retail_dba \
--password cloudera \
--table orders \
--as-textfile \
--target-dir /user/cloudera/task2/text \
--fields-terminated-by '|' \
--lines-terminated-by '\n';

[cloudera@quickstart ~]$ hadoop fs -ls task2/text
Found 5 items
-rw-r--r--   1 cloudera cloudera          0 2019-01-16 12:11 task2/text/_SUCCESS
-rw-r--r--   1 cloudera cloudera     741614 2019-01-16 12:11 task2/text/part-m-00000
-rw-r--r--   1 cloudera cloudera     753022 2019-01-16 12:11 task2/text/part-m-00001
-rw-r--r--   1 cloudera cloudera     752368 2019-01-16 12:11 task2/text/part-m-00002
-rw-r--r--   1 cloudera cloudera     752940 2019-01-16 12:11 task2/text/part-m-00003

