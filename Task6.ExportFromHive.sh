Task #6 Export data from hive table into MySQL.

mysql> show databases;
mysql> use retail_db
mysql> CREATE TABLE products_external( \
    ->     product_id INT NOT NULL PRIMARY KEY, \
    ->     product_category_id INT NOT NULL, \
    ->     product_name VARCHAR(45), \
    ->     product_description VARCHAR(255), \
    ->     product_price FLOAT, \
    ->     product_image VARCHAR(255));

sqoop export \
--connect "jdbc:mysql://quickstart.cloudera:3306/retail_db" \
--username "retail_dba" \
--password "cloudera" \
--export-dir /user/hive/warehouse/task4.db/hive_products/ \
--input-fields-terminated-by '\001' \
--update-mode allowinsert \
--update-key product_id \
--columns "product_id, product_category_id, product_name, product_description, product_price, product_image" \
--table products_external;

mysql> select * from products_external limit 5
    -> ;
+------------+---------------------+-----------------------------------------------+---------------------+---------------+---------------------------------------------------------------------------------------+
| product_id | product_category_id | product_name                                  | product_description | product_price | product_image                                                                         |
+------------+---------------------+-----------------------------------------------+---------------------+---------------+---------------------------------------------------------------------------------------+
|          1 |                   2 | Quest Q64 10 FT. x 10 FT. Slant Leg Instant U |                     |         59.98 | http://images.acmesports.sports/Quest+Q64+10+FT.+x+10+FT.+Slant+Leg+Instant+Up+Canopy |
|          2 |                   2 | Under Armour Men's Highlight MC Football Clea |                     |        129.99 | http://images.acmesports.sports/Under+Armour+Men%27s+Highlight+MC+Football+Cleat      |
|          3 |                   2 | Under Armour Men's Renegade D Mid Football Cl |                     |         89.99 | http://images.acmesports.sports/Under+Armour+Men%27s+Renegade+D+Mid+Football+Cleat    |
|          4 |                   2 | Under Armour Men's Renegade D Mid Football Cl |                     |         89.99 | http://images.acmesports.sports/Under+Armour+Men%27s+Renegade+D+Mid+Football+Cleat    |
|          5 |                   2 | Riddell Youth Revolution Speed Custom Footbal |                     |        199.99 | http://images.acmesports.sports/Riddell+Youth+Revolution+Speed+Custom+Football+Helmet |
+------------+---------------------+-----------------------------------------------+---------------------+---------------+---------------------------------------------------------------------------------------+
