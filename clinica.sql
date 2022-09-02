-- -----------------------------------------------------
-- Schema clinica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clinica` DEFAULT CHARACTER SET utf8 ;
USE `clinica` ;

-- -----------------------------------------------------
-- Table `clinica`.`especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`especialidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`medico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `crm` VARCHAR(10) NULL,
  `estado_crm` CHAR(2) NULL,
  `data_inclusao` DATE NULL,
  `sexo` ENUM('M','F') NULL,
  `idade` INT NULL,
  `especialidade_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_medico_especialidade_idx` (`especialidade_id` ASC) ,
  CONSTRAINT `fk_medico_especialidade`
    FOREIGN KEY (`especialidade_id`)
    REFERENCES `clinica`.`especialidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`paciente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  `altura` FLOAT(10,2) NOT NULL,
  `peso` INT NOT NULL,
  `tipo_sanguineo` ENUM('A','B','AB','O') NOT NULL,
  `rh` ENUM('+','-') NOT NULL,
  `sexo` ENUM('M', 'F') NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinica`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinica`.`consulta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `medico_id` INT NOT NULL,
  `paciente_id` INT NOT NULL,
  `data_consulta` DATE NULL,
  `hora` TIME NULL,
  `valor` FLOAT(10,2) NULL,
  `turno` ENUM('MANHÃ', 'TARDE', 'NOITE', 'MADRUGADA') NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_consulta_medico1_idx` (`medico_id` ASC) ,
  INDEX `fk_consulta_paciente1_idx` (`paciente_id` ASC) ,
  CONSTRAINT `fk_consulta_medico1`
    FOREIGN KEY (`medico_id`)
    REFERENCES `clinica`.`medico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_paciente1`
    FOREIGN KEY (`paciente_id`)
    REFERENCES `clinica`.`paciente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `clinica`.`especialidade`
-- -----------------------------------------------------
START TRANSACTION;
USE `clinica`;
INSERT INTO `clinica`.`especialidade` (`id`, `nome`) VALUES (1, 'PSIQUIATRIA');
INSERT INTO `clinica`.`especialidade` (`id`, `nome`) VALUES (2, 'ORTOPEDIA');
INSERT INTO `clinica`.`especialidade` (`id`, `nome`) VALUES (3, 'PEDIATRIA');
INSERT INTO `clinica`.`especialidade` (`id`, `nome`) VALUES (4, 'CARDIOLOGIA');

COMMIT;

-- -----------------------------------------------------
-- Data for table `clinica`.`medico`
-- -----------------------------------------------------
START TRANSACTION;
USE `clinica`;
INSERT INTO `clinica`.`medico` (`id`, `nome`, `crm`, `estado_crm`, `data_inclusao`, `sexo`, `idade`, `especialidade_id`) VALUES (1, 'Eduarda Luana Almada', '789', 'AM', '1996-02-19', 'F', 56, 1);
INSERT INTO `clinica`.`medico` (`id`, `nome`, `crm`, `estado_crm`, `data_inclusao`, `sexo`, `idade`, `especialidade_id`) VALUES (2, 'João Geraldo Santos', '545', 'AM', '2020-01-01', 'F', 27, 1);
INSERT INTO `clinica`.`medico` (`id`, `nome`, `crm`, `estado_crm`, `data_inclusao`, `sexo`, `idade`, `especialidade_id`) VALUES (3, 'Sérgio Tiago Yuri Assunção', '1235', 'PA', '2016-12-16', 'M', 44, 2);
INSERT INTO `clinica`.`medico` (`id`, `nome`, `crm`, `estado_crm`, `data_inclusao`, `sexo`, `idade`, `especialidade_id`) VALUES (4, 'Eduardo Danilo Barros', '5645', 'PA', '2019-05-06', 'M', 26, 2);
INSERT INTO `clinica`.`medico` (`id`, `nome`, `crm`, `estado_crm`, `data_inclusao`, `sexo`, `idade`, `especialidade_id`) VALUES (5, 'Olivia Marli Nogueira', '2914', 'RR', '2018-01-30', 'F', 28, 3);
INSERT INTO `clinica`.`medico` (`id`, `nome`, `crm`, `estado_crm`, `data_inclusao`, `sexo`, `idade`, `especialidade_id`) VALUES (6, 'Daniel Tomás Brito', '231', 'RO', '2018-10-03', 'M', 33, 3);
INSERT INTO `clinica`.`medico` (`id`, `nome`, `crm`, `estado_crm`, `data_inclusao`, `sexo`, `idade`, `especialidade_id`) VALUES (7, 'Ayla Fátima Cardoso', '2048', 'SP', '2015-10-15', 'F', 34, 4);
INSERT INTO `clinica`.`medico` (`id`, `nome`, `crm`, `estado_crm`, `data_inclusao`, `sexo`, `idade`, `especialidade_id`) VALUES (8, 'Davi Oliver Assunção', '2013', 'BA', '1997-07-13', 'M', 50, 4);
INSERT INTO `clinica`.`medico` (`id`, `nome`, `crm`, `estado_crm`, `data_inclusao`, `sexo`, `idade`, `especialidade_id`) VALUES (9, 'Maria Silvana Rodrigues', '287', 'AM', '2000-12-31', 'F', 47, 1);
INSERT INTO `clinica`.`medico` (`id`, `nome`, `crm`, `estado_crm`, `data_inclusao`, `sexo`, `idade`, `especialidade_id`) VALUES (10, 'Filipe Renato Levi Farias', '155', 'AC', '1985-09-24', 'M', 58, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clinica`.`paciente`
-- -----------------------------------------------------
START TRANSACTION;
USE `clinica`;
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (1, 'Rita Betina Marcela da Rocha', 43, 1.52, 52, 'AB','-', 'F');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (2, 'Rodrigo Renan Silva', 71, 1.9, 90, 'AB','+', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (3, 'Daiane Rebeca Louise Rodrigues', 19, 1.69, 69, 'B','+', 'F');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (4, 'Raul Felipe da Rocha', 44, 1.71, 71, 'A','-', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (5, 'Kauê Oliver Viana', 44, 1.93, 93, 'A','+', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (6, 'Anderson Heitor Alexandre da Rocha', 55, 1.74, 74, 'B','-', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (7, 'Teresinha Rita Souza', 25, 1.83, 83, 'AB','+', 'F');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (8, 'Cauê José da Rocha', 40, 1.88, 88, 'AB','-', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (9, 'Kauê Edson Calebe Drumond', 71, 1.61, 61, 'B','+', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (10, 'Paulo José Calebe Dias', 56, 1.92, 92, 'AB','+', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (11, 'João Levi Iago Almada', 43, 1.7, 70, 'B','+', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (12, 'Mateus Luiz Bryan da Mota', 59, 1.62, 62, 'B','-', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (13, 'Levi Benjamin Gonçalves', 63, 1.69, 69, 'O','-', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (14, 'Cláudio Nathan Ryan Castro', 49, 1.63, 63, 'B','-', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (15, 'Cristiane Antônia Aragão', 34, 1.51, 51, 'B','-', 'F');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (16, 'Daniel Bernardo Kevin Martins', 55, 1.81, 81, 'O','-', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (17, 'Sandra Rebeca Flávia Moreira', 40, 1.64, 64, 'A','+', 'F');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (18, 'Luiza Liz Figueiredo', 28, 1.82, 82, 'B','+', 'F');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (19, 'Luana Stella Sophia Rezende', 37, 1.74, 74, 'B','-', 'F');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (20, 'Heitor Ryan Roberto Pires', 30, 1.82, 82, 'A','-', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (21, 'Patrícia Lavínia Barbosa', 20, 1.63, 63, 'O','-', 'F');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (22, 'João Nathan Danilo da Luz', 73, 1.63, 63, 'O','+', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (23, 'Roberto Filipe Heitor da Luz', 37, 1.79, 79, 'O','+', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (24, 'Rayssa Silvana Pietra Ferreira', 30, 1.63, 63, 'B','+', 'F');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (25, 'Adriana Fátima Olivia Almeida', 34, 1.61, 61, 'B','-', 'F');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (26, 'Elza Laís Catarina Moraes', 79, 1.83, 83, 'B','+', 'F');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (27, 'Isabela Mirella Rezende', 20, 1.71, 71, 'B','-', 'F');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (28, 'Ana Carolina Sophie da Cunha', 76, 1.79, 79, 'A','-', 'F');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (29, 'Paulo Gabriel da Luz', 48, 1.9, 90, 'B','+', 'M');
INSERT INTO `clinica`.`paciente` (`id`, `nome`, `idade`, `altura`, `peso`, `tipo_sanguineo`,`rh`, `sexo`) VALUES (30, 'Arthur Marcelo Souza', 27, 1.96, 96, 'O','-', 'M');

COMMIT;

START TRANSACTION;
USE `clinica`;
INSERT INTO consulta(medico_id,paciente_id,data_consulta,hora,turno,valor)VALUES
(10,25,'2020-07-04','1:10:00','MADRUGADA',100),
(1,12,'2020-04-22','18:16:00','NOITE',100),
(8,17,'2020-06-08','13:14:00','TARDE',200),
(8,11,'2020-08-27','0:32:00','MADRUGADA',250),
(10,5,'2020-05-25','12:44:00','TARDE',50),
(8,4,'2020-06-20','3:39:00','MADRUGADA',100),
(2,29,'2020-06-17','17:2:00','TARDE',150),
(2,1,'2020-05-10','12:50:00','TARDE',100),
(7,17,'2020-05-23','15:4:00','TARDE',250),
(8,9,'2020-08-05','20:26:00','NOITE',250),
(3,11,'2020-08-01','5:2:00','MADRUGADA',250),
(6,1,'2020-05-16','3:0:00','MADRUGADA',250),
(9,10,'2020-08-11','14:5:00','TARDE',50),
(1,10,'2020-07-13','1:51:00','MADRUGADA',100),
(9,30,'2020-08-12','18:53:00','NOITE',50),
(9,3,'2020-06-05','7:51:00','MANHA',50),
(3,2,'2020-05-20','1:13:00','MADRUGADA',150),
(10,19,'2020-05-30','18:12:00','NOITE',200),
(4,4,'2020-08-30','12:44:00','TARDE',250),
(8,16,'2020-05-17','4:39:00','MADRUGADA',50),
(6,10,'2020-04-30','22:38:00','NOITE',100),
(6,14,'2020-04-15','6:55:00','MANHA',200),
(2,13,'2020-08-01','8:1:00','MANHA',250),
(7,14,'2020-04-29','20:57:00','NOITE',50),
(5,27,'2020-07-19','10:20:00','MANHA',50),
(4,3,'2020-08-03','0:2:00','MADRUGADA',50),
(5,7,'2020-05-26','15:35:00','TARDE',50),
(10,21,'2020-07-19','22:50:00','NOITE',150),
(1,12,'2020-05-01','5:44:00','MADRUGADA',250),
(2,19,'2020-06-30','12:13:00','TARDE',150),
(3,24,'2020-08-20','15:34:00','TARDE',150),
(9,28,'2020-06-08','3:58:00','MADRUGADA',200),
(7,26,'2020-06-29','22:54:00','NOITE',250),
(8,8,'2020-05-09','3:12:00','MADRUGADA',100),
(1,28,'2020-05-12','18:39:00','NOITE',100),
(10,15,'2020-05-02','5:7:00','MADRUGADA',100),
(5,11,'2020-04-02','4:37:00','MADRUGADA',200),
(8,23,'2020-08-15','13:58:00','TARDE',100),
(5,6,'2020-06-02','20:51:00','NOITE',100),
(1,11,'2020-04-12','3:41:00','MADRUGADA',50),
(2,25,'2020-07-05','13:13:00','TARDE',200),
(8,18,'2020-08-15','8:16:00','MANHA',100),
(5,30,'2020-06-21','23:0:00','NOITE',100),
(3,11,'2020-05-23','19:44:00','NOITE',50),
(4,27,'2020-07-30','7:18:00','MANHA',150),
(6,1,'2020-05-16','6:59:00','MANHA',200),
(2,23,'2020-05-16','17:21:00','TARDE',250),
(6,6,'2020-07-20','13:26:00','TARDE',100),
(3,11,'2020-08-11','21:16:00','NOITE',200),
(6,30,'2020-07-13','23:35:00','NOITE',100),
(6,13,'2020-07-23','6:43:00','MANHA',100),
(2,23,'2020-06-16','10:11:00','MANHA',250),
(4,8,'2020-06-12','20:35:00','NOITE',100),
(6,5,'2020-04-07','15:14:00','TARDE',50),
(10,28,'2020-06-29','22:45:00','NOITE',100),
(1,26,'2020-04-16','4:19:00','MADRUGADA',200),
(7,15,'2020-06-11','11:49:00','MANHA',50),
(6,12,'2020-06-16','17:50:00','TARDE',150),
(8,14,'2020-08-10','10:31:00','MANHA',250),
(4,12,'2020-08-06','13:22:00','TARDE',150),
(4,20,'2020-04-28','3:56:00','MADRUGADA',200),
(8,11,'2020-04-23','11:14:00','MANHA',150),
(8,29,'2020-08-13','3:42:00','MADRUGADA',50),
(9,25,'2020-08-19','16:0:00','TARDE',100),
(2,26,'2020-06-24','10:43:00','MANHA',200),
(4,24,'2020-04-25','14:59:00','TARDE',250),
(1,6,'2020-05-12','4:30:00','MADRUGADA',50),
(3,30,'2020-07-20','17:11:00','TARDE',250),
(8,17,'2020-06-15','22:10:00','NOITE',150),
(1,5,'2020-04-07','16:1:00','TARDE',100),
(7,20,'2020-04-05','4:55:00','MADRUGADA',250),
(1,3,'2020-04-13','6:56:00','MANHA',200),
(10,7,'2020-06-15','17:4:00','TARDE',250),
(1,19,'2020-07-19','5:37:00','MADRUGADA',250),
(8,6,'2020-06-03','9:51:00','MANHA',250),
(5,1,'2020-08-04','19:20:00','NOITE',50),
(10,18,'2020-08-20','22:14:00','NOITE',200),
(6,20,'2020-05-22','0:9:00','MADRUGADA',250),
(1,17,'2020-04-20','2:32:00','MADRUGADA',100),
(5,4,'2020-04-07','23:30:00','NOITE',150),
(10,30,'2020-04-22','4:10:00','MADRUGADA',200),
(2,20,'2020-04-09','19:44:00','NOITE',50),
(8,13,'2020-08-08','20:8:00','NOITE',250),
(10,25,'2020-07-09','16:8:00','TARDE',250),
(3,20,'2020-04-05','11:37:00','MANHA',150),
(4,4,'2020-04-21','12:25:00','TARDE',100),
(3,14,'2020-05-15','0:57:00','MADRUGADA',250),
(3,19,'2020-06-25','9:33:00','MANHA',250),
(4,22,'2020-06-28','7:32:00','MANHA',150),
(6,16,'2020-05-20','4:6:00','MADRUGADA',250),
(5,1,'2020-05-28','19:10:00','NOITE',200),
(8,21,'2020-04-22','9:55:00','MANHA',250),
(5,27,'2020-06-10','10:3:00','MANHA',150),
(7,30,'2020-07-28','8:14:00','MANHA',200),
(2,22,'2020-08-15','1:2:00','MADRUGADA',200),
(6,30,'2020-04-01','10:28:00','MANHA',50),
(7,11,'2020-05-26','14:33:00','TARDE',200),
(2,7,'2020-07-18','1:12:00','MADRUGADA',100),
(6,6,'2020-05-11','14:25:00','TARDE',50),
(6,13,'2020-06-12','18:34:00','NOITE',100);

COMMIT;
