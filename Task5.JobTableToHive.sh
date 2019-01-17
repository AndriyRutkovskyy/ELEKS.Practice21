Task #5. Create job for import to Hive.

hive> create database task5;
hive> use task5;
hive> create table orders_hive(order_id int, order_date timestamp, order_customer_id int, order_status string);

sqoop job --create load2hive \
-- import \
--connect "jdbc:mysql://quickstart.cloudera:3306/retail_db" \
--username "retail_dba" \
--password "cloudera" \
--table orders --m 1 \
--check-column order_id \
--incremental append \
--last-value 0 \
--hive-import \
--hive-table orders_hive \
--hive-database task5;

sqoop job --exec load2hive

hive> use task5;
hive> show tables;
orders_hive
hive> select * from orders_hive limit 5;

1	2013-07-25 00:00:00	11599	CLOSED
2	2013-07-25 00:00:00	256	PENDING_PAYMENT
3	2013-07-25 00:00:00	12111	COMPLETE
4	2013-07-25 00:00:00	8827	CLOSED
5	2013-07-25 00:00:00	11318	COMPLETE
