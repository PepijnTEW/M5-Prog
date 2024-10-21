-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbfirst` ;
USE `dbfirst` ;

-- -----------------------------------------------------
-- Table `dbfirst`.`bordspellen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`bordspellen` (
  `idbordspellen` INT NOT NULL AUTO_INCREMENT,
  `naam` VARCHAR(250) NOT NULL,
  `aantal spelers` INT NOT NULL,
  `beschrijving` VARCHAR(400) NOT NULL,
  `coop` INT NOT NULL,
  PRIMARY KEY (`idbordspellen`),
  UNIQUE INDEX `idbordspellen_UNIQUE` (`idbordspellen` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`Profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`Profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `level` INT NOT NULL,
  `bio` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfirst`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`game` (
  `id` INT NOT NULL,
  `library_id` INT NOT NULL,
  `game_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfirst`.`achievments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`achievments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `achievment_name` VARCHAR(45) NOT NULL,
  `achievment_description` VARCHAR(45) NOT NULL,
  `task` VARCHAR(45) NOT NULL,
  `game_id` INT NOT NULL,
  `completed` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `task_UNIQUE` (`task` ASC) VISIBLE,
  UNIQUE INDEX `achievment_description_UNIQUE` (`achievment_description` ASC) VISIBLE,
  UNIQUE INDEX `achievment_name_UNIQUE` (`achievment_name` ASC) VISIBLE,
  INDEX `fk_achievments_game1_idx` (`game_id` ASC) VISIBLE,
  CONSTRAINT `fk_achievments_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `dbfirst`.`game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfirst`.`Profile_has_game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`Profile_has_game` (
  `Profile_id` INT NOT NULL,
  `game_id` INT NOT NULL,
  PRIMARY KEY (`Profile_id`, `game_id`),
  INDEX `fk_Profile_has_game_game1_idx` (`game_id` ASC) VISIBLE,
  INDEX `fk_Profile_has_game_Profile1_idx` (`Profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_Profile_has_game_Profile1`
    FOREIGN KEY (`Profile_id`)
    REFERENCES `dbfirst`.`Profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_has_game_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `dbfirst`.`game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfirst`.`Profile_has_achievments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`Profile_has_achievments` (
  `Profile_id` INT NOT NULL,
  `achievments_id` INT NOT NULL,
  PRIMARY KEY (`Profile_id`, `achievments_id`),
  INDEX `fk_Profile_has_achievments_achievments1_idx` (`achievments_id` ASC) VISIBLE,
  INDEX `fk_Profile_has_achievments_Profile1_idx` (`Profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_Profile_has_achievments_Profile1`
    FOREIGN KEY (`Profile_id`)
    REFERENCES `dbfirst`.`Profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_has_achievments_achievments1`
    FOREIGN KEY (`achievments_id`)
    REFERENCES `dbfirst`.`achievments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
