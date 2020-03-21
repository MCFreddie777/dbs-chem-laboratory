# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.28)
# Database: nmr2web
# Generation Time: 2020-03-21 6:28:38 PM +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table grant_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grant_user`;

CREATE TABLE `grant_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `grant_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grant_user_user_id_foreign` (`user_id`),
  KEY `grant_user_grant_id_foreign` (`grant_id`),
  CONSTRAINT `grant_user_grant_id_foreign` FOREIGN KEY (`grant_id`) REFERENCES `grants` (`id`),
  CONSTRAINT `grant_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table grants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grants`;

CREATE TABLE `grants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `grants` WRITE;
/*!40000 ALTER TABLE `grants` DISABLE KEYS */;

INSERT INTO `grants` (`id`, `name`)
VALUES
	(1,'Universal foreground complexity'),
	(2,'Function-based client-server migration'),
	(3,'Reverse-engineered heuristic projection'),
	(4,'Front-line foreground framework'),
	(5,'Polarised methodical moderator'),
	(6,'Robust well-modulated utilisation'),
	(7,'Multi-tiered leadingedge algorithm'),
	(8,'Compatible 24hour firmware'),
	(9,'Re-contextualized upward-trending archive'),
	(10,'Switchable national blockchain'),
	(11,'Cross-group human-resource hierarchy'),
	(12,'Down-sized web-enabled flexibility'),
	(13,'Distributed fresh-thinking hardware'),
	(14,'Quality-focused hybrid hub'),
	(15,'Total context-sensitive model'),
	(16,'Quality-focused tertiary capacity'),
	(17,'Enterprise-wide high-level groupware'),
	(18,'Switchable attitude-oriented installation'),
	(19,'Digitized nextgeneration initiative'),
	(20,'Virtual national standardization');

/*!40000 ALTER TABLE `grants` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table labs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `labs`;

CREATE TABLE `labs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `labs_user_id_foreign` (`user_id`),
  CONSTRAINT `labs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2020_03_21_164255_create_roles_table',1),
	(2,'2020_03_21_164300_create_users_table',1),
	(3,'2020_03_21_164521_create_grants_table',1),
	(4,'2020_03_21_164603_create_solvents_table',1),
	(5,'2020_03_21_164631_create_spectrometers_table',1),
	(6,'2020_03_21_164814_create_grant_user_table',1),
	(7,'2020_03_21_164929_create_labs_table',1),
	(8,'2020_03_21_165052_create_samples_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`)
VALUES
	(1,'admin'),
	(2,'laborant'),
	(3,'garant'),
	(4,'user');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table samples
# ------------------------------------------------------------

DROP TABLE IF EXISTS `samples`;

CREATE TABLE `samples` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `structure` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `spectrometer_id` bigint(20) unsigned NOT NULL,
  `lab_id` bigint(20) unsigned DEFAULT NULL,
  `solvent_id` bigint(20) unsigned NOT NULL,
  `grant_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `samples_user_id_foreign` (`user_id`),
  KEY `samples_spectrometer_id_foreign` (`spectrometer_id`),
  KEY `samples_lab_id_foreign` (`lab_id`),
  KEY `samples_solvent_id_foreign` (`solvent_id`),
  KEY `samples_grant_id_foreign` (`grant_id`),
  CONSTRAINT `samples_grant_id_foreign` FOREIGN KEY (`grant_id`) REFERENCES `grants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `samples_lab_id_foreign` FOREIGN KEY (`lab_id`) REFERENCES `labs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `samples_solvent_id_foreign` FOREIGN KEY (`solvent_id`) REFERENCES `solvents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `samples_spectrometer_id_foreign` FOREIGN KEY (`spectrometer_id`) REFERENCES `spectrometers` (`id`),
  CONSTRAINT `samples_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `samples` WRITE;
/*!40000 ALTER TABLE `samples` DISABLE KEYS */;

INSERT INTO `samples` (`id`, `user_id`, `name`, `amount`, `structure`, `note`, `created_at`, `updated_at`, `spectrometer_id`, `lab_id`, `solvent_id`, `grant_id`)
VALUES
	(1,2,'Ad doloremque amet deleniti.',234.00,'ONE.\' \'One, indeed!\' said the sage, as he said.','Sed qui qui exercitationem vitae quaerat laudantium.','2020-03-21 18:28:14','2020-03-21 18:28:14',1,NULL,1,1),
	(2,3,'Et ad temporibus.',407.00,'Alice asked in a great crowd assembled about.','Quia ex voluptates in ex.','2020-03-21 18:28:14','2020-03-21 18:28:14',2,NULL,2,2),
	(3,4,'Optio aliquid quidem.',51.00,'King. (The jury all looked puzzled.) \'He must.','Ab labore quia sunt eos et assumenda.','2020-03-21 18:28:14','2020-03-21 18:28:14',3,NULL,3,3),
	(4,5,'Quia velit.',486.00,'I\'ll look first,\' she said, \'and see whether.','Repellendus cum minima rerum impedit quas accusamus dolor.','2020-03-21 18:28:14','2020-03-21 18:28:14',4,NULL,4,4),
	(5,6,'Dolorum ut quae.',42.00,'Lobster Quadrille is!\' \'No, indeed,\' said Alice.','Aliquid ducimus quo similique.','2020-03-21 18:28:14','2020-03-21 18:28:14',5,NULL,5,5),
	(6,7,'Assumenda dignissimos quasi dolorem iste.',68.00,'It was so large in the sand with wooden spades.','Error ipsam atque unde.','2020-03-21 18:28:14','2020-03-21 18:28:14',6,NULL,6,6),
	(7,8,'Dolor quidem velit.',228.00,'Bill! the master says you\'re to go nearer till.','Doloremque soluta minima est temporibus quis quaerat nam dolore.','2020-03-21 18:28:14','2020-03-21 18:28:14',7,NULL,7,7),
	(8,9,'Nam quisquam explicabo.',58.00,'In another minute the whole court was in March.\'.','Consequuntur illo ipsum blanditiis asperiores.','2020-03-21 18:28:14','2020-03-21 18:28:14',8,NULL,8,8),
	(9,10,'In quo nostrum.',97.00,'But at any rate, there\'s no use in knocking,\'.','A quam ut rerum ab consequatur delectus fugiat ad.','2020-03-21 18:28:14','2020-03-21 18:28:14',9,NULL,9,9),
	(10,11,'Ex nihil vel minima.',186.00,'Gryphon, with a cart-horse, and expecting every.','Possimus architecto ut velit esse.','2020-03-21 18:28:14','2020-03-21 18:28:14',10,NULL,10,10),
	(11,12,'Aut nesciunt nisi libero.',230.00,'Footman continued in the lap of her hedgehog.','Commodi deleniti totam eaque est dolores itaque.','2020-03-21 18:28:14','2020-03-21 18:28:14',11,NULL,11,11),
	(12,13,'Nisi praesentium suscipit.',154.00,'Alice did not sneeze, were the cook, and a.','Animi sunt qui sit voluptatem accusamus non harum.','2020-03-21 18:28:15','2020-03-21 18:28:15',12,NULL,12,12),
	(13,14,'Sint quidem temporibus velit.',291.00,'Alice like the three gardeners, but she knew the.','Odit magnam occaecati quam deserunt quas.','2020-03-21 18:28:15','2020-03-21 18:28:15',13,NULL,13,13),
	(14,15,'Pariatur repudiandae et.',306.00,'I can reach the key; and if it began ordering.','Aut facere voluptatem laudantium facere consequuntur sed excepturi earum.','2020-03-21 18:28:15','2020-03-21 18:28:15',14,NULL,14,14),
	(15,16,'Quos quod cupiditate.',309.00,'Cat in a confused way, \'Prizes! Prizes!\' Alice.','Sed est aut dolores harum rerum.','2020-03-21 18:28:15','2020-03-21 18:28:15',15,NULL,15,15),
	(16,17,'Ut voluptas facere.',140.00,'Queen, \'and he shall tell you what year it is?\'.','Voluptatem expedita quo voluptas illum consequuntur doloribus.','2020-03-21 18:28:15','2020-03-21 18:28:15',16,NULL,16,16),
	(17,18,'Aut vel.',57.00,'Yet you finished the guinea-pigs!\' thought.','Autem amet deleniti cupiditate nulla.','2020-03-21 18:28:15','2020-03-21 18:28:15',17,NULL,17,17),
	(18,19,'Voluptates reprehenderit a at.',35.00,'Caterpillar. Here was another long passage, and.','Tempora dolor sint minus inventore.','2020-03-21 18:28:15','2020-03-21 18:28:15',18,NULL,18,18),
	(19,20,'Ut quia non facere non.',499.00,'I can do without lobsters, you know. So you see.','Velit sint perferendis praesentium dicta nulla sunt.','2020-03-21 18:28:15','2020-03-21 18:28:15',19,NULL,19,19),
	(20,21,'Explicabo consequatur et.',256.00,'King was the White Rabbit blew three blasts on.','Consequatur voluptatibus quod molestias qui molestiae.','2020-03-21 18:28:15','2020-03-21 18:28:15',20,NULL,20,20);

/*!40000 ALTER TABLE `samples` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table solvents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `solvents`;

CREATE TABLE `solvents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `solvents` WRITE;
/*!40000 ALTER TABLE `solvents` DISABLE KEYS */;

INSERT INTO `solvents` (`id`, `name`)
VALUES
	(1,'culpa'),
	(2,'sint'),
	(3,'quidem'),
	(4,'provident'),
	(5,'sed'),
	(6,'qui'),
	(7,'itaque'),
	(8,'accusamus'),
	(9,'at'),
	(10,'non'),
	(11,'sint'),
	(12,'deleniti'),
	(13,'vitae'),
	(14,'quia'),
	(15,'aliquid'),
	(16,'excepturi'),
	(17,'reiciendis'),
	(18,'est'),
	(19,'dolorum'),
	(20,'error');

/*!40000 ALTER TABLE `solvents` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spectrometers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spectrometers`;

CREATE TABLE `spectrometers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `spectrometers` WRITE;
/*!40000 ALTER TABLE `spectrometers` DISABLE KEYS */;

INSERT INTO `spectrometers` (`id`, `name`, `type`)
VALUES
	(1,'WY 878','Mollitia 9796'),
	(2,'SC 74223','Et 33976'),
	(3,'VT 98582','Laborum 4464'),
	(4,'WY 971','Itaque 404'),
	(5,'DE 183','Ut 86430'),
	(6,'AK 34266','Vel 1910'),
	(7,'HI 6911','Ullam 83188'),
	(8,'FL 698','Quo 4650'),
	(9,'MI 179','Vero 1592'),
	(10,'OH 1191','Officia 756'),
	(11,'CA 632','Et 34491'),
	(12,'NM 521','Sed 849'),
	(13,'MT 49125','Cumque 583'),
	(14,'DC 455','Labore 724'),
	(15,'CT 24539','Nisi 67493'),
	(16,'MS 733','Rerum 51964'),
	(17,'NV 882','Et 237'),
	(18,'CA 9598','Eaque 1649'),
	(19,'MO 66132','Maxime 9753'),
	(20,'KY 111','Totam 91343');

/*!40000 ALTER TABLE `spectrometers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_login_unique` (`login`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `login`, `password`, `role_id`)
VALUES
	(1,'admin@admin.sk','$2y$10$FW23GCZagV/NtYMU/C6LQOg/SuOqI2Lwa1HndJObDV4L9ZwMzYDMO',1),
	(2,'jkirlin','$2y$10$ZQdaEKTfnkil.GAa4bZHLuP6GZd.rkC8rw5Y0R07Kf2uiV3lj4N32',4),
	(3,'eleazar58','$2y$10$qJKKWugdoxvlcINJ9Jdvm.qCblhYEd0m6Hsdj9IdtU26fc88eyuVq',3),
	(4,'lueilwitz.abby','$2y$10$QugoLaeSuiBlsAn8zsKF1e/4WLvfWh7kONyeTYJtDqUyyUWvA646e',2),
	(5,'mueller.mitchell','$2y$10$m5EzSLdJwiMAwyfNRoItVO6ADSafCs4OF/Cv6UbyVddpj.0VjWO7C',2),
	(6,'modesto.kuvalis','$2y$10$NjkjYeCT65556Lw3scawO.QWIOSbr/ArI9xRbznFqoc0dXlgYJaBC',3),
	(7,'christop.wolff','$2y$10$4zhNu0YomQzN3S7DAbvht.dB4ch/pNjYkLWYbzui23uRqVYUz9WAG',3),
	(8,'cokeefe','$2y$10$thwzp.HbLVH1XNzbLVBO4.TvIqtVnwbHnWFG4Hn6Dkxc0V7xOPeim',3),
	(9,'larson.dillon','$2y$10$NCe/N9Bnr5myi1GF/HNDL.LCr4aTP8uPIw38/yJIBRt9Iase3ZPue',4),
	(10,'hsmith','$2y$10$5tKEx8Iy1CHBYBt3/xIOUucY62yZDr0fGPLcP8RtmNLvHsv8SjAfC',2),
	(11,'sheldon22','$2y$10$Qlc86JxWe2xOUTStxsF9eumCjraP.2QjBMcMlZVflfLYYwCNSJNxO',4),
	(12,'tiana.schuppe','$2y$10$c3afxvI2S30O9vyjtiCkBeHhj52hW2G50IdxUOTuJMvtRsNKNrlpm',2),
	(13,'dora.gleichner','$2y$10$sxeVbb/Y6jP6P/xnIor7VeKtgQndQhQdydQY9AYJJ19ylojW.Jlm2',4),
	(14,'drew76','$2y$10$NhXB9pWfQ4Emef9lVg1e0.MU/vG7mUaVbGwV.qoV519TbUuYiUsly',3),
	(15,'norberto48','$2y$10$zRk2R/Hx6Naz1dmoQ272LOLXpxhjLIMy2nhdEqoAgCxIAQyq8Fipm',3),
	(16,'kitty20','$2y$10$bnNYFPTyc7WOKIHFsL5Du.rnfzMryV3tL/HMSXXi6L71nlADdZIza',2),
	(17,'pamela.kautzer','$2y$10$/ea8jJdKjVpeWqRhs3PtT.NHJtNFkMPneEgRuLQr3qgzEwiC4kgeO',3),
	(18,'isauer','$2y$10$OLI8H4g4mwnB6J2BWgo49uVSAcZo7bg28RoadGWgTSNDOjbHVEmti',3),
	(19,'orpha.hickle','$2y$10$oSxx13cxPqQcG2fFH.4nRe3VliP015pW4bMLgaZAr8qU8.SNxPYku',4),
	(20,'aric62','$2y$10$759W98c5mzkNTojKXH615uI8CxIYTmgKS68Bs8/0g1hml3sMonmde',3),
	(21,'lind.jazmin','$2y$10$cur6rH1oTome5tpWVEg14umNfR584/WDb/hKwcn3u.BUUIvmRxAmS',2),
	(22,'jhintz','$2y$10$vae9g4PmW0AfN.ndiX1NguRJMPZihHUtsHfjS64lEfMYYCKylk8Se',3),
	(23,'hessel.jaida','$2y$10$S4lLG9YSsyxv1pcImoQLXuiuXCmLvCPT82Z36EN0uthrZ/OEQ5Bty',2),
	(24,'brekke.london','$2y$10$7UDesoY5f.LPPcoJUSNbG.OId0Zefkm4AfKtgL1mqcVn.06UEBcW2',3),
	(25,'zemlak.sheridan','$2y$10$jL8ZdrGs47d6RPsFxh3U5.PY93g2nmvh2jm2IeSFSU.Ouk11HZvFK',2),
	(26,'myles.abernathy','$2y$10$je4ZBLFKXRCNMkb.eXlNR.ctQv5utIg5qNrvi9PsaWTIlzuk3woze',2),
	(27,'brielle81','$2y$10$CCdIwCjQvHwcQ9/AFYjzNuml0llFUa8SPEx3qTkrONujoip3buAeC',4),
	(28,'tiana38','$2y$10$gle5DVg9Lmq7b5CT7VuvVOdrBQ29wD1k2PZDxMsADm6x5BR0vqak6',2),
	(29,'jaunita.renner','$2y$10$gCraKsqoY1CoeGVoUqgCVu4BZlscQtLy8.Fd46QlRvinykJftYC/.',4),
	(30,'hyatt.alberta','$2y$10$5npOrkYKROF9/7.0dGtmYuyrom.kX88WXYqUo8kq9FdkWdorZC3EO',4),
	(31,'norwood.hill','$2y$10$GqeD3IlXv6KQjXay/RZhaens2QmCMdr2OvyMg4MDsx5wRvO7XqGEO',2),
	(32,'nellie.bernhard','$2y$10$i.qNqRvR2CIXTg/1YdTjxOO8q/x5D28QNMKK8XHNfrEG4LNSMD62C',3),
	(33,'crawford89','$2y$10$D67yieiRwJZ1Gdcg/xL7fujPoGIDiYr6aJ/s3YpHSEuuTUKFhO5X6',3),
	(34,'pherzog','$2y$10$km97YW9uDgkh2bXiPxJ9CunJc9mTDIqwu.6KNWgMQ6oAmX3VMCnE6',2),
	(35,'torp.leslie','$2y$10$JU40jr2VcciFLhW3XjyH8.s4XN1ZwGdoCW6ztNSoZxIqJZr3lBtoO',3),
	(36,'wintheiser.donato','$2y$10$aFp6DSOhjAGTrGEjbvHZKeUafHQf7F7tfRkYxtCWbi47y8W8WbGaS',2),
	(37,'gutmann.kaelyn','$2y$10$ZjHB91OBXsuDswsRA1qv7eY85nce9q6XtWMWRmmh2kemQMJ1Qke3K',3),
	(38,'jada.kub','$2y$10$lzRmDUFhSD/OTtI8xh.xJOiR0r2u1OZWhAB6dtePXiAfodj1wRs4C',4),
	(39,'louvenia.effertz','$2y$10$z6XsXFZOSDvoGxi4bFAYceYM/l8ChYoN4XvCijlZP9b6Hu3uAv9VC',3),
	(40,'gabriel74','$2y$10$Yt0qGn0z.7aj6jpW8RlOXO8Msu4tNXVWP6YF32DaYQo2cA2bESrky',3),
	(41,'jacquelyn.lemke','$2y$10$hbN69snj8Tec2383.u7RW.KhN.FBq8w3Rsk5PXwlgWtvEAj23k6mW',4);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
