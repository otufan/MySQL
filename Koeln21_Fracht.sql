-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Fracht
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Fracht` ;

-- -----------------------------------------------------
-- Schema Fracht
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Fracht` DEFAULT CHARACTER SET utf8 ;
USE `Fracht` ;

-- -----------------------------------------------------
-- Table `Fracht`.`Kunde`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fracht`.`Kunde` ;

CREATE TABLE IF NOT EXISTS `Fracht`.`Kunde` (
  `Kunde_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Vorname` VARCHAR(45) NULL,
  `Geburtsdatum` DATE NULL,
  PRIMARY KEY (`Kunde_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Fracht`.`Fracht`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fracht`.`Fracht` ;

CREATE TABLE IF NOT EXISTS `Fracht`.`Fracht` (
  `Fracht_ID` INT NOT NULL,
  `Gewicht` VARCHAR(45) NULL,
  `Fracht_Typ` VARCHAR(45) NULL,
  `Kunde_Kunde_ID` INT NOT NULL,
  PRIMARY KEY (`Fracht_ID`, `Kunde_Kunde_ID`),
 
  CONSTRAINT `fk_Fracht_Kunde`
    FOREIGN KEY (`Kunde_Kunde_ID`)
    REFERENCES `Fracht`.`Kunde` (`Kunde_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Fracht`.`LKW`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fracht`.`LKW` ;

CREATE TABLE IF NOT EXISTS `Fracht`.`LKW` (
  `LKW_ID` INT NOT NULL,
  `Kennzeichnen` VARCHAR(45) NULL,
  PRIMARY KEY (`LKW_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Fracht`.`Fahrer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fracht`.`Fahrer` ;

CREATE TABLE IF NOT EXISTS `Fracht`.`Fahrer` (
  `Fahrer_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Vorname` VARCHAR(45) NULL,
  `Geburtsdatum` VARCHAR(45) NULL,
  PRIMARY KEY (`Fahrer_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Fracht`.`Route`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fracht`.`Route` ;

CREATE TABLE IF NOT EXISTS `Fracht`.`Route` (
  `Route_ID` INT NOT NULL,
  `Routenname` VARCHAR(45) NULL,
  PRIMARY KEY (`Route_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Fracht`.`Lieferfahrt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fracht`.`Lieferfahrt` ;

CREATE TABLE IF NOT EXISTS `Fracht`.`Lieferfahrt` (
  `Lieferfahrt_ID` INT NOT NULL,
  `Express` VARCHAR(5) NULL,
  `LKW_LKW_ID` INT NOT NULL,
  `Fahrer_Fahrer_ID` INT NOT NULL,
  `Route_Route_ID` INT NOT NULL,
  PRIMARY KEY (`Lieferfahrt_ID`, `LKW_LKW_ID`, `Fahrer_Fahrer_ID`, `Route_Route_ID`),
 
  CONSTRAINT `fk_Lieferfahrt_LKW1`
    FOREIGN KEY (`LKW_LKW_ID`)
    REFERENCES `Fracht`.`LKW` (`LKW_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lieferfahrt_Fahrer1`
    FOREIGN KEY (`Fahrer_Fahrer_ID`)
    REFERENCES `Fracht`.`Fahrer` (`Fahrer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lieferfahrt_Route1`
    FOREIGN KEY (`Route_Route_ID`)
    REFERENCES `Fracht`.`Route` (`Route_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Fracht`.`Fracht_Lieferfahrt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fracht`.`Fracht_Lieferfahrt` ;

CREATE TABLE IF NOT EXISTS `Fracht`.`Fracht_Lieferfahrt` (
  `Fracht_Fracht_ID` INT NOT NULL,
  `Lieferfahrt_Lieferfahrt_ID` INT NOT NULL,
  PRIMARY KEY (`Fracht_Fracht_ID`, `Lieferfahrt_Lieferfahrt_ID`),

  CONSTRAINT `fk_Fracht_has_Lieferfahrt_Fracht1`
    FOREIGN KEY (`Fracht_Fracht_ID`)
    REFERENCES `Fracht`.`Fracht` (`Fracht_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fracht_has_Lieferfahrt_Lieferfahrt1`
    FOREIGN KEY (`Lieferfahrt_Lieferfahrt_ID`)
    REFERENCES `Fracht`.`Lieferfahrt` (`Lieferfahrt_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Fracht`.`LKW_Fahrer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fracht`.`LKW_Fahrer` ;

CREATE TABLE IF NOT EXISTS `Fracht`.`LKW_Fahrer` (
  `LKW_LKW_ID` INT NOT NULL,
  `Fahrer_Fahrer_ID` INT NOT NULL,
  PRIMARY KEY (`LKW_LKW_ID`, `Fahrer_Fahrer_ID`),
 
  CONSTRAINT `fk_LKW_has_Fahrer_LKW1`
    FOREIGN KEY (`LKW_LKW_ID`)
    REFERENCES `Fracht`.`LKW` (`LKW_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LKW_has_Fahrer_Fahrer1`
    FOREIGN KEY (`Fahrer_Fahrer_ID`)
    REFERENCES `Fracht`.`Fahrer` (`Fahrer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Fracht`.`Strecke`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fracht`.`Strecke` ;

CREATE TABLE IF NOT EXISTS `Fracht`.`Strecke` (
  `Strecke_ID` INT NOT NULL,
  `Streckenname` VARCHAR(45) NULL,
  PRIMARY KEY (`Strecke_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Fracht`.`Route_Strecke`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fracht`.`Route_Strecke` ;

CREATE TABLE IF NOT EXISTS `Fracht`.`Route_Strecke` (
  `Route_Route_ID` INT NOT NULL,
  `Strecke_Strecke_ID` INT NOT NULL,
  PRIMARY KEY (`Route_Route_ID`, `Strecke_Strecke_ID`),
 
  CONSTRAINT `fk_Route_has_Strecke_Route1`
    FOREIGN KEY (`Route_Route_ID`)
    REFERENCES `Fracht`.`Route` (`Route_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Route_has_Strecke_Strecke1`
    FOREIGN KEY (`Strecke_Strecke_ID`)
    REFERENCES `Fracht`.`Strecke` (`Strecke_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Fracht`.`Lager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fracht`.`Lager` ;

CREATE TABLE IF NOT EXISTS `Fracht`.`Lager` (
  `Lager_ID` INT NOT NULL,
  `Adresse` VARCHAR(45) NULL,
  PRIMARY KEY (`Lager_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Fracht`.`Strecke_Lager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fracht`.`Strecke_Lager` ;

CREATE TABLE IF NOT EXISTS `Fracht`.`Strecke_Lager` (
  `Strecke_Strecke_ID` INT NOT NULL,
  `Lager_Lager_ID` INT NOT NULL,
  PRIMARY KEY (`Strecke_Strecke_ID`, `Lager_Lager_ID`),

  CONSTRAINT `fk_Strecke_has_Lager_Strecke1`
    FOREIGN KEY (`Strecke_Strecke_ID`)
    REFERENCES `Fracht`.`Strecke` (`Strecke_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Strecke_has_Lager_Lager1`
    FOREIGN KEY (`Lager_Lager_ID`)
    REFERENCES `Fracht`.`Lager` (`Lager_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
