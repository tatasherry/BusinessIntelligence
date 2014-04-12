



-- -----------------------------------------------------
-- Data for table `mydb`.`Manager`
-- -----------------------------------------------------

START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Manager` (`idManager`, `name`) VALUES (1, 'Bob Young');
INSERT INTO `mydb`.`Manager` (`idManager`, `name`) VALUES (2, 'Jim Carey');
INSERT INTO `mydb`.`Manager` (`idManager`, `name`) VALUES (3, 'Mark Ewing');
INSERT INTO `mydb`.`Manager` (`idManager`, `name`) VALUES (4, 'George Freeman');
INSERT INTO `mydb`.`Manager` (`idManager`, `name`) VALUES (5, 'Dorthy Tailer');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`City`
-- -----------------------------------------------------

START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`City` (`city_id`, `name`) VALUES (1, 'Toronto');
INSERT INTO `mydb`.`City` (`city_id`, `name`) VALUES (2, 'Vancouver');
INSERT INTO `mydb`.`City` (`city_id`, `name`) VALUES (3, 'Ottawa');
INSERT INTO `mydb`.`City` (`city_id`, `name`) VALUES (4, 'Victoria');
INSERT INTO `mydb`.`City` (`city_id`, `name`) VALUES (5, 'Ottawa');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Province`
-- -----------------------------------------------------

START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Province` (`province_id`, `city_id`, `name`) VALUES (1, 1, 'Ontario');
INSERT INTO `mydb`.`Province` (`province_id`, `city_id`, `name`) VALUES (2, 2, 'Ontario');
INSERT INTO `mydb`.`Province` (`province_id`, `city_id`, `name`) VALUES (3, 3, 'Ontario');
INSERT INTO `mydb`.`Province` (`province_id`, `city_id`, `name`) VALUES (4, 4, 'Ontario');
INSERT INTO `mydb`.`Province` (`province_id`, `city_id`, `name`) VALUES (5, 5, 'Ontario');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Store`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Store` (`store_id`, `manager_id`, `province_id`) VALUES (1, 1, 1);
INSERT INTO `mydb`.`Store` (`store_id`, `manager_id`, `province_id`) VALUES (2, 2, 1);
INSERT INTO `mydb`.`Store` (`store_id`, `manager_id`, `province_id`) VALUES (3, 2, 1);
INSERT INTO `mydb`.`Store` (`store_id`, `manager_id`, `province_id`) VALUES (4, 3, 1);
INSERT INTO `mydb`.`Store` (`store_id`, `manager_id`, `province_id`) VALUES (5, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Customer` (`customer_id`, `customer_name`, `dob`, `sex`) VALUES (1, 'Fred Gilton', '01-10-1985', 0);
INSERT INTO `mydb`.`Customer` (`customer_id`, `customer_name`, `dob`, `sex`) VALUES (2, 'Jim Carey', '04-21-1988', 0);
INSERT INTO `mydb`.`Customer` (`customer_id`, `customer_name`, `dob`, `sex`) VALUES (3, 'Tina Hawks', '07-12-1982', 1);
INSERT INTO `mydb`.`Customer` (`customer_id`, `customer_name`, `dob`, `sex`) VALUES (4, 'Sarah Rodrigues', '19-11-1983', 1);
INSERT INTO `mydb`.`Customer` (`customer_id`, `customer_name`, `dob`, `sex`) VALUES (5, 'Ivan Penny', '21-09-1984', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Product`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (1, 'Bayers Hockey Puck', 49.99, 23.99);
INSERT INTO `mydb`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (2, 'York Graduation Plaque', 29.99, 4.89);
INSERT INTO `mydb`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (3, 'Raptors Jersey', 59.99, 14.99);
INSERT INTO `mydb`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (4, 'Maple Leaf Jersey', 22.99, 12.99);
INSERT INTO `mydb`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (5, 'Fridge Magnet', 1.11, 0.05);
INSERT INTO `mydb`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (6, 'Celtics Jersey', 22.83, 14.69);
INSERT INTO `mydb`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (7, 'Ontario License', 120.99, 63.99);
INSERT INTO `mydb`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (8, 'Children Bedroom Signs', 123.99, 52.22);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`ProductGroup`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (1, 'Personalized Golf Clubs', 1);
INSERT INTO `mydb`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (2, 'Magnets', 2);
INSERT INTO `mydb`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (3, 'Bedroom Door Signs', 3);
INSERT INTO `mydb`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (4, 'Graduation Plaques', 4);
INSERT INTO `mydb`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (5, 'Bedroom Door Signs', 5);
INSERT INTO `mydb`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (6, 'Retirement Plaques', 6);
INSERT INTO `mydb`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (7, 'Sports Jersey', 7);
INSERT INTO `mydb`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (8, 'Custom License Plates', 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Sales`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Sales` (`sale_id`, `store_id`, `customer_id`, `productgroup_id`, `qty`, `year`) VALUES (1, 1, 5, 3, 7, 2014);
INSERT INTO `mydb`.`Sales` (`sale_id`, `store_id`, `customer_id`, `productgroup_id`, `qty`, `year`) VALUES (2, 1, 3, 4, 1, 2014);
INSERT INTO `mydb`.`Sales` (`sale_id`, `store_id`, `customer_id`, `productgroup_id`, `qty`, `year`) VALUES (3, 1, 2, 5, 4, 2014);
INSERT INTO `mydb`.`Sales` (`sale_id`, `store_id`, `customer_id`, `productgroup_id`, `qty`, `year`) VALUES (4, 1, 1, 1, 4, 2014);
INSERT INTO `mydb`.`Sales` (`sale_id`, `store_id`, `customer_id`, `productgroup_id`, `qty`, `year`) VALUES (5, 1, 4, 2, 2, 2014);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`AgeGroup`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`AgeGroup` (`ageGroup_id`, `name`, `begin`, `end`) VALUES (1, 'Infant/ Young Children', 0, 12);
INSERT INTO `mydb`.`AgeGroup` (`ageGroup_id`, `name`, `begin`, `end`) VALUES (2, 'Teenagers / Young Adults', 13, 25);
INSERT INTO `mydb`.`AgeGroup` (`ageGroup_id`, `name`, `begin`, `end`) VALUES (3, 'Adults', 26, 59);
INSERT INTO `mydb`.`AgeGroup` (`ageGroup_id`, `name`, `begin`, `end`) VALUES (4, 'Elderly', 60, 999);

COMMIT;

--- -----------------------------------------------------
--- Data for table `mydb`.`Definition`
--- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "Sales", "sale_id", " A unique number given to identify a single sale of any quantity of product " );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "Sales", "customer_id", " The customer id of a given customer who purchases an product" );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "Sales", "store_id", "Indentifier number of a specific store that processed the sale." );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "Sales", "productgroup_id", "Products are divided into groups and in this case I am categorizing them into product groups." );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "Sales", "qty", "Tracking the number of items sold for a given sale. To be used for calculating revenue." );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "Sales", "year", "This is when the sale occurred." );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "Store", "manager_id", "The manager that approved the sale." );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "Store", "province_id", "The location where the sale occurred," );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "Province", "city_id", "The city where the sale occurred" );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "Customer","customer_name", "The customer who bought the item" );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "Customer", "dob", "The customers date of birth" );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "Customer", "sex", "The customers gender 0 - male and  1 - female." );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "AgeGroup", "begin", "To have a range of when an agegroup starts I'm using this begin column to track that" );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "AgeGroup", "end", "To have a range of when an agegroup ends I'm using this 'end' column to track that" );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "OntarioTopBabyNames", "gender", "This is reference tables and I track gender by using  0 - male and  1 - female." );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "OntarioTopBabyNames", "frequency", "The number of times a name occurs" );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "OntarioTopBabyNames", "year", "The year that the person was named" );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "LifeExpectency", "year_from", "The age when it started" );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "LifeExpectency", "year_to", "The age when it ends" );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "LifeExpectency", "male_count", "number of people that where male" );
INSERT INTO `mydb`.`Definition`  (`table_name`, `column_name`,`description`) VALUES ( "LifeExpectency", "female_count", "number of people that where female" );

COMMIT;
