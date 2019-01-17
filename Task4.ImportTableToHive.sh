Task #4 Import table as Hive table.

hive> create database task4;
hive> use task4;
hive> create table products_hive(product_id int, product_category_id int, product_name varchar(45), product_description varchar(255), product_price float, product_image varchar(255));

sqoop import \
--connect "jdbc:mysql://quickstart.cloudera:3306/retail_db" \
--username "retail_dba" \
--password "cloudera" \
--table products  \
--check-column product_id \
--incremental append \
--last-value 0 \
--hive-import \
--hive-table hive_products \
--hive-database task4;

hive> SELECT * FROM hive_products LIMIT 5;
OK
1	2	Quest Q64 10 FT. x 10 FT. Slant Leg Instant U		59.98	http://images.acmesports.sports/Quest+Q64+10+FT.+x+10+FT.+Slant+Leg+Instant+Up+Canopy
2	2	Under Armour Men's Highlight MC Football Clea		129.99	http://images.acmesports.sports/Under+Armour+Men%27s+Highlight+MC+Football+Cleat
3	2	Under Armour Men's Renegade D Mid Football Cl		89.99	http://images.acmesports.sports/Under+Armour+Men%27s+Renegade+D+Mid+Football+Cleat
4	2	Under Armour Men's Renegade D Mid Football Cl		89.99	http://images.acmesports.sports/Under+Armour+Men%27s+Renegade+D+Mid+Football+Cleat
5	2	Riddell Youth Revolution Speed Custom Footbal		199.99	http://images.acmesports.sports/Riddell+Youth+Revolution+Speed+Custom+Football+Helmet
Time taken: 0.156 seconds, Fetched: 5 row(s)
