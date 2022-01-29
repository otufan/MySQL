-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Carsharing
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Carsharing
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Carsharing` DEFAULT CHARACTER SET utf8 ;
USE `Carsharing` ;

-- -----------------------------------------------------
-- Table `Carsharing`.`Kunde`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Carsharing`.`Kunde` (
  `Kunden_Nr` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Vorname` VARCHAR(45) NULL,
  PRIMARY KEY (`Kunden_Nr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Carsharing`.`Rechnung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Carsharing`.`Rechnung` (
  `Rechnungnummer` INT NOT NULL,
  `Rechnungsdatum` VARCHAR(45) NULL,
  `Kunde_Kunden_Nr` INT NOT NULL,
  PRIMARY KEY (`Rechnungnummer`, `Kunde_Kunden_Nr`),
 
  CONSTRAINT `fk_Rechnung_Kunde`
    FOREIGN KEY (`Kunde_Kunden_Nr`)
    REFERENCES `Carsharing`.`Kunde` (`Kunden_Nr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Carsharing`.`Nutzer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Carsharing`.`Nutzer` (
  `NutzerID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Vorname` VARCHAR(45) NULL,
  PRIMARY KEY (`NutzerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Carsharing`.`Kennzeichnen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Carsharing`.`Kennzeichnen` (
  `KennzeichnenNr` INT NOT NULL,
  PRIMARY KEY (`KennzeichnenNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Carsharing`.`Fahrt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Carsharing`.`Fahrt` (
  `FahrtID` INT NOT NULL,
  `Nutzer_NutzerID` INT NOT NULL,
  `Rechnung_Rechnungnummer` INT NOT NULL,
  `Kennzeichnen_KennzeichnenNr` INT NOT NULL,
  PRIMARY KEY (`FahrtID`, `Nutzer_NutzerID`, `Rechnung_Rechnungnummer`, `Kennzeichnen_KennzeichnenNr`),

  CONSTRAINT `fk_Fahrt_Nutzer1`
    FOREIGN KEY (`Nutzer_NutzerID`)
    REFERENCES `Carsharing`.`Nutzer` (`NutzerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fahrt_Rechnung1`
    FOREIGN KEY (`Rechnung_Rechnungnummer`)
    REFERENCES `Carsharing`.`Rechnung` (`Rechnungnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fahrt_Kennzeichnen1`
    FOREIGN KEY (`Kennzeichnen_KennzeichnenNr`)
    REFERENCES `Carsharing`.`Kennzeichnen` (`KennzeichnenNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Carsharing`.`Fahrzeug_Typ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Carsharing`.`Fahrzeug_Typ` (
  `Fahrzeug_Typ` INT NOT NULL,
  `Kennzeichnen_KennzeichnenNr` INT NOT NULL,
  PRIMARY KEY (`Fahrzeug_Typ`, `Kennzeichnen_KennzeichnenNr`),
  
  CONSTRAINT `fk_Fahrzeug_Typ_Kennzeichnen1`
    FOREIGN KEY (`Kennzeichnen_KennzeichnenNr`)
    REFERENCES `Carsharing`.`Kennzeichnen` (`KennzeichnenNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
