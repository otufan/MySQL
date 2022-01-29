-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Kinowelt
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Kinowelt` ;

-- -----------------------------------------------------
-- Schema Kinowelt
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Kinowelt` DEFAULT CHARACTER SET utf8 ;
USE `Kinowelt` ;

-- -----------------------------------------------------
-- Table `Kinowelt`.`Stadt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Stadt` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Stadt` (
  `Stadt_ID` INT NOT NULL,
  `StadtName` VARCHAR(45) NULL,
  PRIMARY KEY (`Stadt_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Kino`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Kino` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Kino` (
  `Kino_ID` INT NOT NULL,
  `KinoName` VARCHAR(45) NULL,
  `Stadt_Stadt_ID` INT NOT NULL,
  PRIMARY KEY (`Kino_ID`, `Stadt_Stadt_ID`),

  CONSTRAINT `fk_Kino_Stadt`
    FOREIGN KEY (`Stadt_Stadt_ID`)
    REFERENCES `Kinowelt`.`Stadt` (`Stadt_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Saal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Saal` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Saal` (
  `Säle_ID` INT NOT NULL,
  `Kino_Kino_ID` INT NOT NULL,
  `Kino_Stadt_Stadt_ID` INT NOT NULL,
  PRIMARY KEY (`Säle_ID`, `Kino_Kino_ID`, `Kino_Stadt_Stadt_ID`),
 
  CONSTRAINT `fk_Säle_Kino1`
    FOREIGN KEY (`Kino_Kino_ID` , `Kino_Stadt_Stadt_ID`)
    REFERENCES `Kinowelt`.`Kino` (`Kino_ID` , `Stadt_Stadt_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`ReiheTyp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`ReiheTyp` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`ReiheTyp` (
  `ReiheTyp_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Preis` VARCHAR(45) NULL,
  PRIMARY KEY (`ReiheTyp_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Reihe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Reihe` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Reihe` (
  `Reihe_ID` INT NOT NULL,
  `Saal_Säle_ID` INT NOT NULL,
  `ReiheTyp_ReiheTyp_ID` INT NOT NULL,
  PRIMARY KEY (`Reihe_ID`, `Saal_Säle_ID`, `ReiheTyp_ReiheTyp_ID`),

  CONSTRAINT `fk_Reihe_Saal1`
    FOREIGN KEY (`Saal_Säle_ID`)
    REFERENCES `Kinowelt`.`Saal` (`Säle_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reihe_ReiheTyp1`
    FOREIGN KEY (`ReiheTyp_ReiheTyp_ID`)
    REFERENCES `Kinowelt`.`ReiheTyp` (`ReiheTyp_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Platz`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Platz` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Platz` (
  `Platz_ID` INT NOT NULL,
  `Reihe_Reihe_ID` INT NOT NULL,
  PRIMARY KEY (`Platz_ID`, `Reihe_Reihe_ID`),
 
  CONSTRAINT `fk_Platz_Reihe1`
    FOREIGN KEY (`Reihe_Reihe_ID`)
    REFERENCES `Kinowelt`.`Reihe` (`Reihe_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Kunde`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Kunde` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Kunde` (
  `Kunde_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Vorname` VARCHAR(45) NULL,
  PRIMARY KEY (`Kunde_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Mitarbeiter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Mitarbeiter` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Mitarbeiter` (
  `Mitarbeiter_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Vorname` VARCHAR(45) NULL,
  PRIMARY KEY (`Mitarbeiter_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Abteilung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Abteilung` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Abteilung` (
  `Abteilung_ID` INT NOT NULL,
  `AbteilungName` VARCHAR(45) NULL,
  `Mitarbeiter_Mitarbeiter_ID` INT NOT NULL,
  PRIMARY KEY (`Abteilung_ID`, `Mitarbeiter_Mitarbeiter_ID`),
 
  CONSTRAINT `fk_Abteilung_Mitarbeiter1`
    FOREIGN KEY (`Mitarbeiter_Mitarbeiter_ID`)
    REFERENCES `Kinowelt`.`Mitarbeiter` (`Mitarbeiter_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Buffet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Buffet` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Buffet` (
  `Buffet_ID` INT NOT NULL,
  `BuffetName` VARCHAR(45) NULL,
  `Preis` VARCHAR(45) NULL,
  PRIMARY KEY (`Buffet_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Kunde_Typ`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Kunde_Typ` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Kunde_Typ` (
  `Typ_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Kunde_Kunde_ID` INT NOT NULL,
  PRIMARY KEY (`Typ_ID`, `Kunde_Kunde_ID`),
 
  CONSTRAINT `fk_Kunde_Typ_Kunde1`
    FOREIGN KEY (`Kunde_Kunde_ID`)
    REFERENCES `Kinowelt`.`Kunde` (`Kunde_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`KundePlatz`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`KundePlatz` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`KundePlatz` (
  `Platz_Platz_ID` INT NOT NULL,
  `Kunde_Kunde_ID` INT NOT NULL,
  `Datum` VARCHAR(45) NULL,
  PRIMARY KEY (`Platz_Platz_ID`, `Kunde_Kunde_ID`),

  CONSTRAINT `fk_Platz_has_Kunde_Platz1`
    FOREIGN KEY (`Platz_Platz_ID`)
    REFERENCES `Kinowelt`.`Platz` (`Platz_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Platz_has_Kunde_Kunde1`
    FOREIGN KEY (`Kunde_Kunde_ID`)
    REFERENCES `Kinowelt`.`Kunde` (`Kunde_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Film`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Film` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Film` (
  `Film_ID` INT NOT NULL,
  `FilmName` VARCHAR(45) NULL,
  PRIMARY KEY (`Film_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Saal_Film`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Saal_Film` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Saal_Film` (
  `Saal_ID` INT NOT NULL,
  `Film_Film_ID` INT NOT NULL,
  `Datum` VARCHAR(45) NULL,
  PRIMARY KEY (`Saal_ID`, `Film_Film_ID`),

  CONSTRAINT `fk_Saal_has_Film_Saal1`
    FOREIGN KEY (`Saal_ID`)
    REFERENCES `Kinowelt`.`Saal` (`Säle_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Saal_has_Film_Film1`
    FOREIGN KEY (`Film_Film_ID`)
    REFERENCES `Kinowelt`.`Film` (`Film_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Art der Bezahlung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Art der Bezahlung` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Art der Bezahlung` (
  `ID` INT NOT NULL,
  `Type` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Ticket` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Ticket` (
  `Ticket_ID` INT NOT NULL,
  `FilmName` VARCHAR(45) NULL,
  PRIMARY KEY (`Ticket_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Kase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Kase` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Kase` (
  `Kase_Id` INT NOT NULL,
  `KaseName` VARCHAR(45) NULL,
  `Kino_Kino_ID` INT NOT NULL,
  `Art der Bezahlung_ID` INT NOT NULL,
  `Ticket_Ticket_ID` INT NOT NULL,
  PRIMARY KEY (`Kase_Id`, `Kino_Kino_ID`, `Art der Bezahlung_ID`, `Ticket_Ticket_ID`),

  CONSTRAINT `fk_Kase_Kino1`
    FOREIGN KEY (`Kino_Kino_ID`)
    REFERENCES `Kinowelt`.`Kino` (`Kino_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kase_Art der Bezahlung1`
    FOREIGN KEY (`Art der Bezahlung_ID`)
    REFERENCES `Kinowelt`.`Art der Bezahlung` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kase_Ticket1`
    FOREIGN KEY (`Ticket_Ticket_ID`)
    REFERENCES `Kinowelt`.`Ticket` (`Ticket_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Kase_Kunde`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Kase_Kunde` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Kase_Kunde` (
  `Kase_Kase_Id` INT NOT NULL,
  `Kunde_Kunde_ID` INT NOT NULL,
  `Datum` VARCHAR(45) NULL,
  PRIMARY KEY (`Kase_Kase_Id`, `Kunde_Kunde_ID`),

  CONSTRAINT `fk_Kase_has_Kunde_Kase1`
    FOREIGN KEY (`Kase_Kase_Id`)
    REFERENCES `Kinowelt`.`Kase` (`Kase_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kase_has_Kunde_Kunde1`
    FOREIGN KEY (`Kunde_Kunde_ID`)
    REFERENCES `Kinowelt`.`Kunde` (`Kunde_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Film_Ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Film_Ticket` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Film_Ticket` (
  `Film_Film_ID` INT NOT NULL,
  `Ticket_Ticket_ID` INT NOT NULL,
  `Datum` VARCHAR(45) NULL,
  PRIMARY KEY (`Film_Film_ID`, `Ticket_Ticket_ID`),

  CONSTRAINT `fk_Film_has_Ticket_Film1`
    FOREIGN KEY (`Film_Film_ID`)
    REFERENCES `Kinowelt`.`Film` (`Film_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Ticket_Ticket1`
    FOREIGN KEY (`Ticket_Ticket_ID`)
    REFERENCES `Kinowelt`.`Ticket` (`Ticket_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Kino_has_Mitarbeiter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Kino_has_Mitarbeiter` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Kino_has_Mitarbeiter` (
  `Kino_Kino_ID` INT NOT NULL,
  `Kino_Stadt_Stadt_ID` INT NOT NULL,
  `Mitarbeiter_Mitarbeiter_ID` INT NOT NULL,
  PRIMARY KEY (`Kino_Kino_ID`, `Kino_Stadt_Stadt_ID`, `Mitarbeiter_Mitarbeiter_ID`),

  CONSTRAINT `fk_Kino_has_Mitarbeiter_Kino1`
    FOREIGN KEY (`Kino_Kino_ID` , `Kino_Stadt_Stadt_ID`)
    REFERENCES `Kinowelt`.`Kino` (`Kino_ID` , `Stadt_Stadt_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kino_has_Mitarbeiter_Mitarbeiter1`
    FOREIGN KEY (`Mitarbeiter_Mitarbeiter_ID`)
    REFERENCES `Kinowelt`.`Mitarbeiter` (`Mitarbeiter_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Kase_Buffet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Kase_Buffet` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Kase_Buffet` (
  `Kase_Kase_Id` INT NOT NULL,
  `Buffet_Buffet_ID` INT NOT NULL,
  `Datum` VARCHAR(45) NULL,
  PRIMARY KEY (`Kase_Kase_Id`, `Buffet_Buffet_ID`),

  CONSTRAINT `fk_Kase_has_Buffet_Kase1`
    FOREIGN KEY (`Kase_Kase_Id`)
    REFERENCES `Kinowelt`.`Kase` (`Kase_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kase_has_Buffet_Buffet1`
    FOREIGN KEY (`Buffet_Buffet_ID`)
    REFERENCES `Kinowelt`.`Buffet` (`Buffet_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Kinowelt`.`Kino_Buffet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kinowelt`.`Kino_Buffet` ;

CREATE TABLE IF NOT EXISTS `Kinowelt`.`Kino_Buffet` (
  `Kino_Kino_ID` INT NOT NULL,
  `Buffet_Buffet_ID` INT NOT NULL,
  PRIMARY KEY (`Kino_Kino_ID`, `Buffet_Buffet_ID`),

  CONSTRAINT `fk_Kino_has_Buffet_Kino1`
    FOREIGN KEY (`Kino_Kino_ID`)
    REFERENCES `Kinowelt`.`Kino` (`Kino_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kino_has_Buffet_Buffet1`
    FOREIGN KEY (`Buffet_Buffet_ID`)
    REFERENCES `Kinowelt`.`Buffet` (`Buffet_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
