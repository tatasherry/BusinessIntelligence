LOAD DATA LOCAL INFILE 'abc.csv' INTO TABLE abc
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(col1, col2, col3, col4, col5...) 

