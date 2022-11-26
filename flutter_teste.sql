# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.34)
# Database: flutter_teste
# Generation Time: 2022-11-26 17:08:23 +0000
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


# Dump of table orders
# ------------------------------------------------------------

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `driver` varchar(100) DEFAULT '',
  `car` varchar(100) DEFAULT '',
  `origin` varchar(100) NOT NULL,
  `destiny` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT '',
  `account` varchar(50) NOT NULL,
  `cost_center` varchar(45) NOT NULL,
  `obs` text,
  `value` decimal(11,2) DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_statuses1_idx` (`status_id`),
  KEY `fk_orders_users1_idx` (`user_id`),
  CONSTRAINT `fk_orders_statuses1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dump of table statuses
# ------------------------------------------------------------

CREATE TABLE `statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;

INSERT INTO `statuses` (`id`, `name`)
VALUES
	(1,'Enviado ao fornecedor'),
	(2,'Em análise'),
	(3,'Aceito'),
	(4,'Cancelado');

/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID do usuário',
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
	(2,'Allan Nevess',X'616C6C616E6665726E616E646F6D6E40676D61696C2E636F6D',X'616E616C69737461','$2y$10$CmhyKBuBGdMCfQ0T.apCZe7.C8Kk4t98lYo.vAQTzaLgD.PJu8lHu',1,3,'2022-11-12 20:33:26','2022-11-23 22:03:37',NULL),
	(3,'Allan Colaborador',X'616C6C616E6665726E616E646F6D6E40676D61696C2E636F6D',X'616C6C616E636F6C61626F7261646F72','$2y$10$CmhyKBuBGdMCfQ0T.apCZe7.C8Kk4t98lYo.vAQTzaLgD.PJu8lHu',1,2,'2022-11-21 23:43:35','2022-11-23 21:55:22',NULL),
	(5,'Fornecedor',X'616C6C616E6665726E616E646F6D6E40676D61696C2E636F6D',X'666F726E656365646F72','$2y$10$0jAKwbQadtnvo/gvQwOTM.s.bBPabA8rfSdkr0IVkn59.8nTpBVCq',1,4,'2022-11-23 22:04:21','2022-11-23 22:04:21',NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
