-- MySQL Script generated by MySQL Workbench
-- Пнд 07 Ноя 2016 00:06:56
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`University`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`University` (
  `id_university` INT NOT NULL AUTO_INCREMENT,
  `ndme` VARCHAR(45) NULL,
  `sity` VARCHAR(45) NULL,
  `sait` VARCHAR(45) NULL,
  PRIMARY KEY (`id_university`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`Departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`Departments` (
  `id_Departments` INT NOT NULL AUTO_INCREMENT,
  `id_university` INT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Departments`),
  INDEX `fk_Departments_1_idx` (`id_university` ASC),
  CONSTRAINT `fk_Departments_1`
    FOREIGN KEY (`id_university`)
    REFERENCES `university`.`University` (`id_university`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`Students` (
  `id_students` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `Studentscol` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `id_departments` INT NULL,
  PRIMARY KEY (`id_students`),
  INDEX `fk_Students_1_idx` (`id_departments` ASC),
  CONSTRAINT `fk_Students_1`
    FOREIGN KEY (`id_departments`)
    REFERENCES `university`.`Departments` (`id_Departments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`Discipline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`Discipline` (
  `id_discipline` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `id_departments` INT NULL,
  PRIMARY KEY (`id_discipline`),
  INDEX `fk_Discipline_1_idx` (`id_departments` ASC),
  CONSTRAINT `fk_Discipline_1`
    FOREIGN KEY (`id_departments`)
    REFERENCES `university`.`Departments` (`id_Departments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`Teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`Teacher` (
  `id_Teacher` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `id_departments` INT NULL,
  PRIMARY KEY (`id_Teacher`),
  INDEX `fk_Teacher_1_idx` (`id_departments` ASC),
  CONSTRAINT `fk_Teacher_1`
    FOREIGN KEY (`id_departments`)
    REFERENCES `university`.`Departments` (`id_Departments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`Home_work`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`Home_work` (
  `id_home_work` INT NOT NULL AUTO_INCREMENT,
  `discipline` INT NULL,
  PRIMARY KEY (`id_home_work`),
  INDEX `fk_Home_work_1_idx` (`discipline` ASC),
  CONSTRAINT `fk_Home_work_1`
    FOREIGN KEY (`discipline`)
    REFERENCES `university`.`Discipline` (`id_discipline`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`StudentHomeWork`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`StudentHomeWork` (
  `id_StudentHomeWork` INT NOT NULL AUTO_INCREMENT,
  `id_home_work` INT NULL,
  `id_students` INT NULL,
  `result` TINYINT(1) NULL,
  PRIMARY KEY (`id_StudentHomeWork`),
  INDEX `fk_StudentHomeWork_1_idx` (`id_students` ASC),
  INDEX `fk_StudentHomeWork_2_idx` (`id_home_work` ASC),
  CONSTRAINT `fk_StudentHomeWork_1`
    FOREIGN KEY (`id_students`)
    REFERENCES `university`.`Students` (`id_students`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentHomeWork_2`
    FOREIGN KEY (`id_home_work`)
    REFERENCES `university`.`Home_work` (`id_home_work`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`DisciplineTeachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`DisciplineTeachers` (
  `id_DisciplineTeachers` INT NOT NULL AUTO_INCREMENT,
  `id_discipline` INT NULL,
  `id_teacher` INT NULL,
  PRIMARY KEY (`id_DisciplineTeachers`),
  INDEX `fk_DisciplineTeachers_1_idx` (`id_discipline` ASC),
  INDEX `fk_DisciplineTeachers_2_idx` (`id_teacher` ASC),
  CONSTRAINT `fk_DisciplineTeachers_1`
    FOREIGN KEY (`id_discipline`)
    REFERENCES `university`.`Discipline` (`id_discipline`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DisciplineTeachers_2`
    FOREIGN KEY (`id_teacher`)
    REFERENCES `university`.`Teacher` (`id_Teacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
