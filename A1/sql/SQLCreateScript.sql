SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `test` ;
CREATE SCHEMA IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `test` ;

-- -----------------------------------------------------
-- Table `test`.`Manager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`Manager` ;

CREATE TABLE IF NOT EXISTS `test`.`Manager` (
  `idManager` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idManager`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`City`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`City` ;

CREATE TABLE IF NOT EXISTS `test`.`City` (
  `city_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`city_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`Province`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`Province` ;

CREATE TABLE IF NOT EXISTS `test`.`Province` (
  `province_id` INT NOT NULL AUTO_INCREMENT,
  `city_id` INT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`province_id`),
  CONSTRAINT `province_to_city`
    FOREIGN KEY (`city_id`)
    REFERENCES `test`.`City` (`city_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`Store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`Store` ;

CREATE TABLE IF NOT EXISTS `test`.`Store` (
  `store_id` INT NOT NULL AUTO_INCREMENT,
  `manager_id` INT NOT NULL,
  `province_id` INT NOT NULL,
  PRIMARY KEY (`store_id`),
  CONSTRAINT `store_to_manager`
    FOREIGN KEY (`manager_id`)
    REFERENCES `test`.`Manager` (`idManager`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `store_to_province`
    FOREIGN KEY (`province_id`)
    REFERENCES `test`.`Province` (`province_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`Customer` ;

CREATE TABLE IF NOT EXISTS `test`.`Customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NOT NULL,
  `dob` DATE NOT NULL,
  `sex` BIT NOT NULL COMMENT '0 for Male or 1 for Female\n',
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`Product` ;

CREATE TABLE IF NOT EXISTS `test`.`Product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NULL,
  `price` FLOAT NULL,
  `initialcost` FLOAT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`ProductGroup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`ProductGroup` ;

CREATE TABLE IF NOT EXISTS `test`.`ProductGroup` (
  `productGroup_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NULL,
  `product_id` INT NULL,
  PRIMARY KEY (`productGroup_id`),
  CONSTRAINT `ProductGroup_To_Product`
    FOREIGN KEY (`product_id`)
    REFERENCES `test`.`Product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`Sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`Sales` ;

CREATE TABLE IF NOT EXISTS `test`.`Sales` (
  `sale_id` INT NOT NULL AUTO_INCREMENT,
  `store_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `productgroup_id` INT NOT NULL,
  `qty` INT NOT NULL,
  `year` INT NOT NULL,
  PRIMARY KEY (`sale_id`),
  CONSTRAINT `sales_to_store`
    FOREIGN KEY (`store_id`)
    REFERENCES `test`.`Store` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sales_to_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `test`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sales_to_product`
    FOREIGN KEY (`productgroup_id`)
    REFERENCES `test`.`ProductGroup` (`productGroup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`AgeGroup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`AgeGroup` ;

CREATE TABLE IF NOT EXISTS `test`.`AgeGroup` (
  `ageGroup_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `begin` INT NULL,
  `end` INT NULL,
  PRIMARY KEY (`ageGroup_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`Account` ;

CREATE TABLE IF NOT EXISTS `test`.`Account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sortOrder` BIT NULL,
  `typeId` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`Payee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`Payee` ;

CREATE TABLE IF NOT EXISTS `test`.`Payee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`Category` ;

CREATE TABLE IF NOT EXISTS `test`.`Category` (
  `id` INT NOT NULL,
  `term` VARCHAR(45) NULL,
  `descr` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `test`.`Website`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`Website` ;

CREATE TABLE IF NOT EXISTS `test`.`Website` (
  `id` INT NOT NULL,
  `uri` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `other` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`State`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`State` ;

CREATE TABLE IF NOT EXISTS `test`.`State` (
  `id` INT NOT NULL,
  `abbrev` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`Frequency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`Frequency` ;

CREATE TABLE IF NOT EXISTS `test`.`Frequency` (
  `id` INT NOT NULL,
  `term` VARCHAR(45) NULL,
  `descr` VARCHAR(45) NULL,
  `days` VARCHAR(45) NULL,
  `simpBudgetQuery` VARCHAR(45) NULL,
  `cplxBudgetQuery` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`PopulationByYearByProvince`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`PopulationByYearByProvince` ;

CREATE TABLE IF NOT EXISTS `test`.`PopulationByYearByProvince` (
  `idPopulationByYearByProvince` INT NOT NULL AUTO_INCREMENT,
  `province` VARCHAR(45) NOT NULL,
  `year09` FLOAT NOT NULL,
  `year10` FLOAT NOT NULL,
  `year11` FLOAT NOT NULL,
  `year12` FLOAT NOT NULL,
  `year13` FLOAT NOT NULL,
  PRIMARY KEY (`idPopulationByYearByProvince`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`OntarioTopBabyNames`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`OntarioTopBabyNames` ;

CREATE TABLE IF NOT EXISTS `test`.`OntarioTopBabyNames` (
  `idOntarioTopBabyNames` INT NOT NULL AUTO_INCREMENT,
  `year` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `frequency` INT NOT NULL,
  `gender` BIT NOT NULL,
  PRIMARY KEY (`idOntarioTopBabyNames`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`LifeExpectency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`LifeExpectency` ;

CREATE TABLE IF NOT EXISTS `test`.`LifeExpectency` (
  `idLifeExpectency` INT NOT NULL AUTO_INCREMENT,
  `year_from` INT NOT NULL,
  `year_to` INT NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `male_count` INT NOT NULL,
  `female_count` INT NOT NULL,
  PRIMARY KEY (`idLifeExpectency`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`.`Definition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`Definition` ;

CREATE TABLE IF NOT EXISTS `test`.`Definition`
(   `id` INT NOT NULL AUTO_INCREMENT,
    `table_name` VARCHAR(45) NOT NULL,
    `column_name` VARCHAR(45) NOT NULL,
    `description` VARCHAR(45) NOT NULL
    PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `test`.`Definition`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;

INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "city", "city_name", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );
INSERT INTO `test`.`Definition` (`table_name`, `column_name`,`description`) VALUES ( "", "", "" );

COMMIT;

-- -----------------------------------------------------
-- Data for table `test`.`Manager`
-- -----------------------------------------------------

START TRANSACTION;
USE `test`;
INSERT INTO `test`.`Manager` (`idManager`, `name`) VALUES (1, 'Bob Young');
INSERT INTO `test`.`Manager` (`idManager`, `name`) VALUES (2, 'Jim Carey');
INSERT INTO `test`.`Manager` (`idManager`, `name`) VALUES (3, 'Mark Ewing');
INSERT INTO `test`.`Manager` (`idManager`, `name`) VALUES (4, 'George Freeman');
INSERT INTO `test`.`Manager` (`idManager`, `name`) VALUES (5, 'Dorthy Tailer');

COMMIT;


-- -----------------------------------------------------
-- Data for table `test`.`City`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`City` (`city_id`, `name`) VALUES (1, 'Toronto');
INSERT INTO `test`.`City` (`city_id`, `name`) VALUES (2, 'Vancouver');
INSERT INTO `test`.`City` (`city_id`, `name`) VALUES (3, 'Ottawa');
INSERT INTO `test`.`City` (`city_id`, `name`) VALUES (4, 'Victoria');
INSERT INTO `test`.`City` (`city_id`, `name`) VALUES (5, 'Ottawa');

COMMIT;


-- -----------------------------------------------------
-- Data for table `test`.`Province`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`Province` (`province_id`, `city_id`, `name`) VALUES (1, 1, 'Ontario');
INSERT INTO `test`.`Province` (`province_id`, `city_id`, `name`) VALUES (2, 2, 'Ontario');
INSERT INTO `test`.`Province` (`province_id`, `city_id`, `name`) VALUES (3, 3, 'Ontario');
INSERT INTO `test`.`Province` (`province_id`, `city_id`, `name`) VALUES (4, 4, 'Ontario');
INSERT INTO `test`.`Province` (`province_id`, `city_id`, `name`) VALUES (5, 5, 'Ontario');

COMMIT;


-- -----------------------------------------------------
-- Data for table `test`.`Store`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`Store` (`store_id`, `manager_id`, `province_id`) VALUES (1, 1, 1);
INSERT INTO `test`.`Store` (`store_id`, `manager_id`, `province_id`) VALUES (2, 2, 1);
INSERT INTO `test`.`Store` (`store_id`, `manager_id`, `province_id`) VALUES (3, 2, 1);
INSERT INTO `test`.`Store` (`store_id`, `manager_id`, `province_id`) VALUES (4, 3, 1);
INSERT INTO `test`.`Store` (`store_id`, `manager_id`, `province_id`) VALUES (5, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `test`.`Customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`Customer` (`customer_id`, `customer_name`, `dob`, `sex`) VALUES (1, 'Fred Gilton', '01-10-1985', 0);
INSERT INTO `test`.`Customer` (`customer_id`, `customer_name`, `dob`, `sex`) VALUES (2, 'Jim Carey', '04-21-1988', 0);
INSERT INTO `test`.`Customer` (`customer_id`, `customer_name`, `dob`, `sex`) VALUES (3, 'Tina Hawks', '07-12-1982', 1);
INSERT INTO `test`.`Customer` (`customer_id`, `customer_name`, `dob`, `sex`) VALUES (4, 'Sarah Rodrigues', '19-11-1983', 1);
INSERT INTO `test`.`Customer` (`customer_id`, `customer_name`, `dob`, `sex`) VALUES (5, 'Ivan Penny', '21-09-1984', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `test`.`Product`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (1, 'Bayers Hockey Puck', 49.99, 23.99);
INSERT INTO `test`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (2, 'York Graduation Plaque', 29.99, 4.89);
INSERT INTO `test`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (3, 'Raptors Jersey', 59.99, 14.99);
INSERT INTO `test`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (4, 'Maple Leaf Jersey', 22.99, 12.99);
INSERT INTO `test`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (5, 'Fridge Magnet', 1.11, 0.05);
INSERT INTO `test`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (6, 'Celtics Jersey', 22.83, 14.69);
INSERT INTO `test`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (7, 'Ontario License', 120.99, 63.99);
INSERT INTO `test`.`Product` (`product_id`, `product_name`, `price`, `initialcost`) VALUES (8, 'Children Bedroom Signs', 123.99, 52.22);

COMMIT;


-- -----------------------------------------------------
-- Data for table `test`.`ProductGroup`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (1, 'Personalized Golf Clubs', 1);
INSERT INTO `test`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (2, 'Magnets', 2);
INSERT INTO `test`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (3, 'Bedroom Door Signs', 3);
INSERT INTO `test`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (4, 'Graduation Plaques', 4);
INSERT INTO `test`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (5, 'Bedroom Door Signs', 5);
INSERT INTO `test`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (6, 'Retirement Plaques', 6);
INSERT INTO `test`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (7, 'Sports Jersey', 7);
INSERT INTO `test`.`ProductGroup` (`productGroup_id`, `product_name`, `product_id`) VALUES (8, 'Custom License Plates', 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `test`.`Sales`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`Sales` (`sale_id`, `store_id`, `customer_id`, `productgroup_id`, `qty`, `year`) VALUES (1, 1, 5, 3, 7, 2014);
INSERT INTO `test`.`Sales` (`sale_id`, `store_id`, `customer_id`, `productgroup_id`, `qty`, `year`) VALUES (2, 1, 3, 4, 1, 2014);
INSERT INTO `test`.`Sales` (`sale_id`, `store_id`, `customer_id`, `productgroup_id`, `qty`, `year`) VALUES (3, 1, 2, 5, 4, 2014);
INSERT INTO `test`.`Sales` (`sale_id`, `store_id`, `customer_id`, `productgroup_id`, `qty`, `year`) VALUES (4, 1, 1, 1, 4, 2014);
INSERT INTO `test`.`Sales` (`sale_id`, `store_id`, `customer_id`, `productgroup_id`, `qty`, `year`) VALUES (5, 1, 4, 2, 2, 2014);

COMMIT;


-- -----------------------------------------------------
-- Data for table `test`.`AgeGroup`
-- -----------------------------------------------------
START TRANSACTION;
USE `test`;
INSERT INTO `test`.`AgeGroup` (`ageGroup_id`, `name`, `begin`, `end`) VALUES (1, 'Infant/ Young Children', 0, 12);
INSERT INTO `test`.`AgeGroup` (`ageGroup_id`, `name`, `begin`, `end`) VALUES (2, 'Teenagers / Young Adults', 13, 25);
INSERT INTO `test`.`AgeGroup` (`ageGroup_id`, `name`, `begin`, `end`) VALUES (3, 'Adults', 26, 59);
INSERT INTO `test`.`AgeGroup` (`ageGroup_id`, `name`, `begin`, `end`) VALUES (4, 'Elderly', 60, 999);

COMMIT;

