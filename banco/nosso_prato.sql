SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `nosso_prato` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `nosso_prato` ;

-- -----------------------------------------------------
-- Table `nosso_prato`.`grupo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`grupo` (
  `id` INT NOT NULL ,
  `nome` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`salada`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`salada` (
  `id` INT NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  `preparo` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`ingredientes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`ingredientes` (
  `id` INT NOT NULL ,
  `descricao` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`salada_has_ingredientes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`salada_has_ingredientes` (
  `salada_id` INT NOT NULL ,
  `ingredientes_id` INT NOT NULL ,
  PRIMARY KEY (`salada_id`, `ingredientes_id`) ,
  INDEX `fk_salada_has_ingredientes_ingredientes1` (`ingredientes_id` ASC) ,
  CONSTRAINT `fk_salada_has_ingredientes_salada`
    FOREIGN KEY (`salada_id` )
    REFERENCES `nosso_prato`.`salada` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salada_has_ingredientes_ingredientes1`
    FOREIGN KEY (`ingredientes_id` )
    REFERENCES `nosso_prato`.`ingredientes` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`garnicao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`garnicao` (
  `id` INT NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  `preparo` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`garnicao_has_ingredientes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`garnicao_has_ingredientes` (
  `garnicao_id` INT NOT NULL ,
  `ingredientes_id` INT NOT NULL ,
  PRIMARY KEY (`garnicao_id`, `ingredientes_id`) ,
  INDEX `fk_garnicao_has_ingredientes_ingredientes1` (`ingredientes_id` ASC) ,
  CONSTRAINT `fk_garnicao_has_ingredientes_garnicao1`
    FOREIGN KEY (`garnicao_id` )
    REFERENCES `nosso_prato`.`garnicao` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_garnicao_has_ingredientes_ingredientes1`
    FOREIGN KEY (`ingredientes_id` )
    REFERENCES `nosso_prato`.`ingredientes` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`prato_principal`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`prato_principal` (
  `id` INT NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  `preparo` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`prato_principal_has_ingredientes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`prato_principal_has_ingredientes` (
  `prato_principal_id` INT NOT NULL ,
  `ingredientes_id` INT NOT NULL ,
  PRIMARY KEY (`prato_principal_id`, `ingredientes_id`) ,
  INDEX `fk_prato_principal_has_ingredientes_ingredientes1` (`ingredientes_id` ASC) ,
  CONSTRAINT `fk_prato_principal_has_ingredientes_prato_principal1`
    FOREIGN KEY (`prato_principal_id` )
    REFERENCES `nosso_prato`.`prato_principal` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prato_principal_has_ingredientes_ingredientes1`
    FOREIGN KEY (`ingredientes_id` )
    REFERENCES `nosso_prato`.`ingredientes` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`sobremessa`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`sobremessa` (
  `id` INT NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`sobremessa_has_ingredientes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`sobremessa_has_ingredientes` (
  `sobremessa_id` INT NOT NULL ,
  `ingredientes_id` INT NOT NULL ,
  PRIMARY KEY (`sobremessa_id`, `ingredientes_id`) ,
  INDEX `fk_sobremessa_has_ingredientes_ingredientes1` (`ingredientes_id` ASC) ,
  CONSTRAINT `fk_sobremessa_has_ingredientes_sobremessa1`
    FOREIGN KEY (`sobremessa_id` )
    REFERENCES `nosso_prato`.`sobremessa` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sobremessa_has_ingredientes_ingredientes1`
    FOREIGN KEY (`ingredientes_id` )
    REFERENCES `nosso_prato`.`ingredientes` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`refeicao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`refeicao` (
  `id` INT NOT NULL ,
  `sumario` VARCHAR(200) NOT NULL ,
  `grupo_id` INT NOT NULL ,
  `prato_principal_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_refeicao_grupo1` (`grupo_id` ASC) ,
  INDEX `fk_refeicao_prato_principal1` (`prato_principal_id` ASC) ,
  CONSTRAINT `fk_refeicao_grupo1`
    FOREIGN KEY (`grupo_id` )
    REFERENCES `nosso_prato`.`grupo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_refeicao_prato_principal1`
    FOREIGN KEY (`prato_principal_id` )
    REFERENCES `nosso_prato`.`prato_principal` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`salada_has_refeicao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`salada_has_refeicao` (
  `salada_id` INT NOT NULL ,
  `refeicao_id` INT NOT NULL ,
  PRIMARY KEY (`salada_id`, `refeicao_id`) ,
  INDEX `fk_salada_has_refeicao_refeicao1` (`refeicao_id` ASC) ,
  CONSTRAINT `fk_salada_has_refeicao_salada1`
    FOREIGN KEY (`salada_id` )
    REFERENCES `nosso_prato`.`salada` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salada_has_refeicao_refeicao1`
    FOREIGN KEY (`refeicao_id` )
    REFERENCES `nosso_prato`.`refeicao` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`garnicao_has_refeicao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`garnicao_has_refeicao` (
  `garnicao_id` INT NOT NULL ,
  `refeicao_id` INT NOT NULL ,
  PRIMARY KEY (`garnicao_id`, `refeicao_id`) ,
  INDEX `fk_garnicao_has_refeicao_refeicao1` (`refeicao_id` ASC) ,
  CONSTRAINT `fk_garnicao_has_refeicao_garnicao1`
    FOREIGN KEY (`garnicao_id` )
    REFERENCES `nosso_prato`.`garnicao` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_garnicao_has_refeicao_refeicao1`
    FOREIGN KEY (`refeicao_id` )
    REFERENCES `nosso_prato`.`refeicao` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`cadapio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`cadapio` (
  `id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nosso_prato`.`cadapio_has_refeicao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `nosso_prato`.`cadapio_has_refeicao` (
  `cadapio_id` INT NOT NULL ,
  `refeicao_id` INT NOT NULL ,
  PRIMARY KEY (`cadapio_id`, `refeicao_id`) ,
  INDEX `fk_cadapio_has_refeicao_refeicao1` (`refeicao_id` ASC) ,
  CONSTRAINT `fk_cadapio_has_refeicao_cadapio1`
    FOREIGN KEY (`cadapio_id` )
    REFERENCES `nosso_prato`.`cadapio` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cadapio_has_refeicao_refeicao1`
    FOREIGN KEY (`refeicao_id` )
    REFERENCES `nosso_prato`.`refeicao` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
