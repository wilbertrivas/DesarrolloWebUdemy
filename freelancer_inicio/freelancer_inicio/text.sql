-- MySQL Workbench Synchronization
-- Generated: 2022-10-31 10:59
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: wrivas

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `oppgrane_radicadofacturas_vg_test`.`usuario` 
ADD COLUMN `us_sede_cdgo` INT(11) NULL DEFAULT NULL AFTER `us_cambiar_clave`,
ADD INDEX `fk_usuario_sede1_idx` (`us_sede_cdgo` ASC) VISIBLE;
;

CREATE TABLE IF NOT EXISTS `oppgrane_radicadofacturas_vg_test`.`perfil_factura_electronica_tipo_anexo` (
  `pfeta_factura_electronica_tipo_anexo_cdgo` INT(11) NOT NULL,
  `pfeta_perfil_cdgo` INT(11) NOT NULL,
  PRIMARY KEY (`pfeta_factura_electronica_tipo_anexo_cdgo`, `pfeta_perfil_cdgo`),
  INDEX `fk_factura_electronica_tipo_anexo_has_perfil_perfil1_idx` (`pfeta_perfil_cdgo` ASC) VISIBLE,
  INDEX `fk_factura_electronica_tipo_anexo_has_perfil_factura_electr_idx` (`pfeta_factura_electronica_tipo_anexo_cdgo` ASC) VISIBLE,
  CONSTRAINT `fk_factura_electronica_tipo_anexo_has_perfil_factura_electron1`
    FOREIGN KEY (`pfeta_factura_electronica_tipo_anexo_cdgo`)
    REFERENCES `oppgrane_radicadofacturas_vg_test`.`factura_electronica_tipo_anexo` (`feta_cdgo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_electronica_tipo_anexo_has_perfil_perfil1`
    FOREIGN KEY (`pfeta_perfil_cdgo`)
    REFERENCES `oppgrane_radicadofacturas_vg_test`.`perfil` (`pf_cdgo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `oppgrane_radicadofacturas_vg_test`.`usuario` 
ADD CONSTRAINT `fk_usuario_sede1`
  FOREIGN KEY (`us_sede_cdgo`)
  REFERENCES `oppgrane_radicadofacturas_vg_test`.`sede` (`sd_cdgo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;