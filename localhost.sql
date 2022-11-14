# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.34)
# Database: flutter_teste
# Generation Time: 2022-10-29 02:29:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table access_levels
# ------------------------------------------------------------

CREATE TABLE `access_levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `access_levels` WRITE;
/*!40000 ALTER TABLE `access_levels` DISABLE KEYS */;

INSERT INTO `access_levels` (`id`, `name`)
VALUES
	(1,'Administrador'),
	(2,'Colaborador'),
	(3,'Analista'),
	(4,'Fornecedor');

/*!40000 ALTER TABLE `access_levels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID do usuário',
  `name` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nome completo do usuário;',
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL COMMENT 'E-mail do usuário (opcional)',
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '' COMMENT 'Identificação do usuário',
  `password` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'Senha do usuário',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Usuário ativo ou inativo: inativo não conseguem realizar o login',
  `access_level_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Data/Hora de registro',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Data/Hora da ultima alteração realizada',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `access_level_id` (`access_level_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`access_level_id`) REFERENCES `access_levels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `active`, `access_level_id`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Japonha',X'74657374654074657374652C636F6D',X'7465737465','$2y$10$XG.Q5JOCxc/h58EcTN1P9.rYRrwY/To6iLQPsbmsE1RLaLPyRSr8i',1,1,NULL,'2022-10-27 22:27:28','2022-10-27 22:27:28'),
	(5,'Allan Neves',X'616C6C616E616A736A736A407368687368642E636F6D',X'616B616A736A736A','$2y$10$8wsNZEWcpRnAF95XFP26eOzobGKM1cnioQw6qw1reDZblJSyPvTGe',1,3,'2022-10-27 20:58:05','2022-10-27 20:58:05',NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
