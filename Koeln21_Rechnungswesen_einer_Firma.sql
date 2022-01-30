-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Rechnungswesen_einer_Firma
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Rechnungswesen_einer_Firma` ;

-- -----------------------------------------------------
-- Schema Rechnungswesen_einer_Firma
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Rechnungswesen_einer_Firma` DEFAULT CHARACTER SET utf8 ;
USE `Rechnungswesen_einer_Firma` ;

-- -----------------------------------------------------
-- Table `Rechnungswesen_einer_Firma`.`Lieferant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rechnungswesen_einer_Firma`.`Lieferant` ;

CREATE TABLE IF NOT EXISTS `Rechnungswesen_einer_Firma`.`Lieferant` (
  `LieferantenNr` INT NOT NULL,
  `Firma` VARCHAR(45) NULL,
  `Kontaktperson` VARCHAR(45) NULL,
  PRIMARY KEY (`LieferantenNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Rechnungswesen_einer_Firma`.`Kategorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rechnungswesen_einer_Firma`.`Kategorie` ;

CREATE TABLE IF NOT EXISTS `Rechnungswesen_einer_Firma`.`Kategorie` (
  `KategorieNr` INT NOT NULL,
  `KategorieName` VARCHAR(45) NULL,
  PRIMARY KEY (`KategorieNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Rechnungswesen_einer_Firma`.`Artikel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rechnungswesen_einer_Firma`.`Artikel` ;

CREATE TABLE IF NOT EXISTS `Rechnungswesen_einer_Firma`.`Artikel` (
  `ArtikelNr` INT NOT NULL,
  `Artikelname` VARCHAR(45) NULL,
  `Liefereinheit` VARCHAR(45) NULL,
  `Kategorie_KategorieNr` INT NOT NULL,
  `Lieferant_LieferantenNr` INT NOT NULL,
  PRIMARY KEY (`ArtikelNr`, `Kategorie_KategorieNr`, `Lieferant_LieferantenNr`),
 
  CONSTRAINT `fk_Artikel_Kategorie1`
    FOREIGN KEY (`Kategorie_KategorieNr`)
    REFERENCES `Rechnungswesen_einer_Firma`.`Kategorie` (`KategorieNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artikel_Lieferant1`
    FOREIGN KEY (`Lieferant_LieferantenNr`)
    REFERENCES `Rechnungswesen_einer_Firma`.`Lieferant` (`LieferantenNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Rechnungswesen_einer_Firma`.`Kunde`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rechnungswesen_einer_Firma`.`Kunde` ;

CREATE TABLE IF NOT EXISTS `Rechnungswesen_einer_Firma`.`Kunde` (
  `KundenCode` INT NOT NULL,
  `Firma` VARCHAR(45) NULL,
  `Kontaktperson` VARCHAR(45) NULL,
  PRIMARY KEY (`KundenCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Rechnungswesen_einer_Firma`.`Personal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rechnungswesen_einer_Firma`.`Personal` ;

CREATE TABLE IF NOT EXISTS `Rechnungswesen_einer_Firma`.`Personal` (
  `PersonalNr` INT NOT NULL,
  `Nachname` VARCHAR(45) NULL,
  PRIMARY KEY (`PersonalNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Rechnungswesen_einer_Firma`.`Versandfirma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rechnungswesen_einer_Firma`.`Versandfirma` ;

CREATE TABLE IF NOT EXISTS `Rechnungswesen_einer_Firma`.`Versandfirma` (
  `FirmenNr` INT NOT NULL,
  `Firma` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  PRIMARY KEY (`FirmenNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Rechnungswesen_einer_Firma`.`Bestellung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rechnungswesen_einer_Firma`.`Bestellung` ;

CREATE TABLE IF NOT EXISTS `Rechnungswesen_einer_Firma`.`Bestellung` (
  `BestellNr` INT NOT NULL,
  `Bestelldatum` VARCHAR(45) NULL,
  `Kunde_KundenCode` INT NOT NULL,
  `Personal_PersonalNr` INT NOT NULL,
  `Versandfirma_FirmenNr` INT NOT NULL,
  PRIMARY KEY (`BestellNr`, `Kunde_KundenCode`, `Personal_PersonalNr`, `Versandfirma_FirmenNr`),
 
  CONSTRAINT `fk_Bestellung_Kunde1`
    FOREIGN KEY (`Kunde_KundenCode`)
    REFERENCES `Rechnungswesen_einer_Firma`.`Kunde` (`KundenCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bestellung_Personal1`
    FOREIGN KEY (`Personal_PersonalNr`)
    REFERENCES `Rechnungswesen_einer_Firma`.`Personal` (`PersonalNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bestellung_Versandfirma1`
    FOREIGN KEY (`Versandfirma_FirmenNr`)
    REFERENCES `Rechnungswesen_einer_Firma`.`Versandfirma` (`FirmenNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `Rechnungswesen_einer_Firma`.`Bestellung_has_Artikel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rechnungswesen_einer_Firma`.`Bestellung_has_Artikel` ;

CREATE TABLE IF NOT EXISTS `Rechnungswesen_einer_Firma`.`Bestellung_has_Artikel` (
  `Bestellung_BestellNr` INT NOT NULL,
  `Artikel_ArtikelNr` INT NOT NULL,
  `Einzelpreis` INT NULL,
  `Anzahl` INT NULL,
  `Rabatt` INT NULL,
  PRIMARY KEY (`Bestellung_BestellNr`, `Artikel_ArtikelNr`),
  
  CONSTRAINT `fk_Bestellung_has_Artikel_Bestellung1`
    FOREIGN KEY (`Bestellung_BestellNr`)
    REFERENCES `Rechnungswesen_einer_Firma`.`Bestellung` (`BestellNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bestellung_has_Artikel_Artikel1`
    FOREIGN KEY (`Artikel_ArtikelNr`)
    REFERENCES `Rechnungswesen_einer_Firma`.`Artikel` (`ArtikelNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
