Task #3. Import all tables from MySQL into Hive db

[cloudera@quickstart ~]$ hive
hive> CREATE DATABASE hv_retail_db;

sqoop import-all-tables \
--m 1 \
--connect jdbc:mysql://quickstart.cloudera:3306/retail_db \
--username retail_dba \
--password cloudera \
--hive-import \
--hive-overwrite \
--hive-database hv_retail_db \
--warehouse-dir /user/hive/warehouse/hv_retail_db;

hive> show databases;
default
hv_retail_db
hive> use hv_retail_db;
hive> show tables;
categories
customers
departments
order_items
orders
products


