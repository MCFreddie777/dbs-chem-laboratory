# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.28)
# Database: nmr2web
# Generation Time: 2020-03-23 12:08:25 AM +0000
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
	(1,'Customer-focused tangible matrices'),
	(2,'Innovative responsive implementation'),
	(3,'Centralized heuristic projection'),
	(4,'Adaptive local neural-net'),
	(5,'Up-sized homogeneous definition'),
	(6,'Synergistic hybrid forecast'),
	(7,'Front-line bi-directional focusgroup'),
	(8,'Secured methodical archive'),
	(9,'Business-focused reciprocal time-frame'),
	(10,'Multi-tiered secondary synergy'),
	(11,'Re-engineered 5thgeneration strategy'),
	(12,'Seamless zeroadministration collaboration'),
	(13,'Expanded local analyzer'),
	(14,'Future-proofed eco-centric workforce'),
	(15,'Cloned empowering parallelism'),
	(16,'Fully-configurable heuristic emulation'),
	(17,'Re-contextualized dynamic focusgroup'),
	(18,'Managed leadingedge policy'),
	(19,'Customer-focused intermediate orchestration'),
	(20,'Secured clear-thinking functionalities');

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
  `amount` int(11) DEFAULT NULL,
  `structure` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
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
	(1,2,'Laborum molestiae ab.',186,'Alice was very like having a game of play with a.','Sit et perferendis et placeat facere.','2020-03-23 01:08:10','2020-03-23 01:08:10',1,NULL,1,1),
	(2,3,'Illo cumque tempore.',156,'Hatter asked triumphantly. Alice did not like.','Ut ad consequuntur officiis.','2020-03-23 01:08:10','2020-03-23 01:08:10',2,NULL,2,2),
	(3,4,'Natus fugiat laboriosam.',248,'Off with his nose, you know?\' \'It\'s the Cheshire.','Aut et unde earum consectetur.','2020-03-23 01:08:10','2020-03-23 01:08:10',3,NULL,3,3),
	(4,5,'Optio vitae placeat numquam.',134,'Queen. First came ten soldiers carrying clubs.','Et et necessitatibus molestiae reprehenderit et.','2020-03-23 01:08:10','2020-03-23 01:08:10',4,NULL,4,4),
	(5,6,'Rerum possimus dolore quam.',270,'Still she went on without attending to her, so.','Porro quis nostrum odit qui.','2020-03-23 01:08:10','2020-03-23 01:08:10',5,NULL,5,5),
	(6,7,'Non consequuntur.',459,'Five! Don\'t go splashing paint over me like.','Consequatur mollitia in odio nulla qui.','2020-03-23 01:08:10','2020-03-23 01:08:10',6,NULL,6,6),
	(7,8,'Voluptas consequatur possimus temporibus.',87,'MARMALADE\', but to get into her face. \'Very,\'.','Tempore iure dolor consequatur.','2020-03-23 01:08:10','2020-03-23 01:08:10',7,NULL,7,7),
	(8,9,'Laborum incidunt repellendus.',421,'The Mock Turtle sighed deeply, and began, in.','Sit natus exercitationem quis corporis.','2020-03-23 01:08:10','2020-03-23 01:08:10',8,NULL,8,8),
	(9,10,'Et aut alias.',116,'Rabbit came near her, about four feet high. \'I.','Nisi dolore ipsa animi reiciendis.','2020-03-23 01:08:10','2020-03-23 01:08:10',9,NULL,9,9),
	(10,11,'Sequi accusantium qui maiores.',9,'Owl, as a last resource, she put one arm out of.','Reiciendis sunt necessitatibus cupiditate repellat asperiores.','2020-03-23 01:08:10','2020-03-23 01:08:10',10,NULL,10,10),
	(11,12,'Voluptas natus quam inventore.',237,'Now I growl when I\'m angry. Therefore I\'m mad.\'.','Itaque doloremque nisi qui nam molestiae cumque.','2020-03-23 01:08:10','2020-03-23 01:08:10',11,NULL,11,11),
	(12,13,'Qui commodi deleniti.',301,'Alice sharply, for she was ready to ask his.','Provident aperiam nostrum mollitia possimus.','2020-03-23 01:08:10','2020-03-23 01:08:10',12,NULL,12,12),
	(13,14,'Ut doloremque id.',447,'I might venture to ask them what the next.','Nobis molestiae et sunt earum animi est molestias incidunt.','2020-03-23 01:08:11','2020-03-23 01:08:11',13,NULL,13,13),
	(14,15,'Blanditiis voluptatum beatae officiis.',60,'I was going off into a large kitchen, which was.','Sint officiis rerum ut voluptatum.','2020-03-23 01:08:11','2020-03-23 01:08:11',14,NULL,14,14),
	(15,16,'Corporis dolor impedit.',490,'Mock Turtle: \'why, if a dish or kettle had been.','Ad temporibus aliquid sequi tempore magnam.','2020-03-23 01:08:11','2020-03-23 01:08:11',15,NULL,15,15),
	(16,17,'Et esse explicabo.',199,'Mouse, turning to the little door into that.','Corrupti et sed similique aut laborum sequi.','2020-03-23 01:08:11','2020-03-23 01:08:11',16,NULL,16,16),
	(17,18,'Tempora fugit ex.',480,'The hedgehog was engaged in a low curtain she.','Asperiores impedit tempora omnis.','2020-03-23 01:08:11','2020-03-23 01:08:11',17,NULL,17,17),
	(18,19,'Recusandae voluptatum ullam harum.',296,'Alice could see, as well be at school at once.\'.','Soluta voluptas excepturi quo eum pariatur tempore quia.','2020-03-23 01:08:11','2020-03-23 01:08:11',18,NULL,18,18),
	(19,20,'Voluptates repellendus sint.',205,'Alice. \'Come on, then!\' roared the Queen, in a.','Deleniti saepe veniam est amet.','2020-03-23 01:08:11','2020-03-23 01:08:11',19,NULL,19,19),
	(20,21,'Voluptate earum suscipit odit.',167,'Allow me to introduce it.\' \'I don\'t know where.','Non eligendi modi molestiae repellendus.','2020-03-23 01:08:11','2020-03-23 01:08:11',20,NULL,20,20);

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
	(1,'veniam'),
	(2,'rem'),
	(3,'laboriosam'),
	(4,'itaque'),
	(5,'quae'),
	(6,'suscipit'),
	(7,'odio'),
	(8,'ex'),
	(9,'incidunt'),
	(10,'esse'),
	(11,'hic'),
	(12,'impedit'),
	(13,'aut'),
	(14,'impedit'),
	(15,'blanditiis'),
	(16,'molestias'),
	(17,'et'),
	(18,'eveniet'),
	(19,'dolores'),
	(20,'ut');

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
	(1,'FL 94465','Veritatis 10578'),
	(2,'CO 26336','Soluta 8784'),
	(3,'TX 8901','Hic 2191'),
	(4,'FL 7958','Quas 2178'),
	(5,'MS 756','Corrupti 738'),
	(6,'KS 31748','Reprehenderit 95346'),
	(7,'AZ 7794','Illum 734'),
	(8,'IL 95185','Explicabo 189'),
	(9,'NY 8285','Eligendi 602'),
	(10,'NC 4054','Et 88892'),
	(11,'NV 6992','Quos 477'),
	(12,'IN 43928','Voluptatem 63204'),
	(13,'MT 4696','Optio 8521'),
	(14,'MN 717','Velit 652'),
	(15,'WI 267','Ducimus 4182'),
	(16,'UT 5727','Animi 730'),
	(17,'VA 794','Nostrum 970'),
	(18,'MS 912','Asperiores 647'),
	(19,'AR 93575','Culpa 488'),
	(20,'NC 95123','Consequuntur 6488');

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
	(1,'admin@admin.sk','$2y$10$/xjh8TRcKscXhNFR9SR3neW8KR13lcfT5tG85TaYLG6.bq/t0SBgG',1),
	(2,'hickle.frida','$2y$10$FnIsHIHsnxQ.J7Ro8q0QWOGi2K/7dCY/PV3cqUmuItOqO7DDnlrGC',2),
	(3,'skye.ziemann','$2y$10$jBGRrinAHX4adpHRviFice/d4QMGt1QumXS103qom0zf0ho52cI5u',4),
	(4,'schiller.mossie','$2y$10$a34suAqqBiG3MjVvfFHYjOEyK6bagEP0Dm0tL5WknYrTQBL9Nd4JG',3),
	(5,'shakira14','$2y$10$vd8Tnhfe.sG6eNeKVAts3Ov688BJWamknF0XFrEwHRhuhB05JR8oG',4),
	(6,'josiah79','$2y$10$BI8rR.9dQulOQZbN9d1.4.mgHuHUBglwxgj7MgfyPbOd1Mols2tQ6',3),
	(7,'aliyah34','$2y$10$mKQwYSQJevSe9iXBg0XRuOc5LPIExGSdrOkB3kDK.2IBBlt1NtiSC',2),
	(8,'adrien.beier','$2y$10$yGKf/IJejIa8LkPThLy1/.Tm0gTC75keV.ipVbAyj5qofYHQQ0glu',3),
	(9,'nickolas.mitchell','$2y$10$ZUAUq.qviRnm5t5nF6qaDunSdn8ZAcJf2CzYmQVucq9.x7/5LBeum',3),
	(10,'juliana55','$2y$10$WBvLBpgArNms8S8u02FeJOHkzfJ9JVYDcoY8yF/JKgnvmjlfzRFkK',2),
	(11,'aryan','$2y$10$U3TNuEkSB0DFNikA1L/mcOL0zWynIZ603CHq7QJ8.Sry2FqVkdUoW',4),
	(12,'ybechtelar','$2y$10$zpH3OEC8i5TIiL6Unxr3ROmMtbOEW1xQaHMFquUJNUfIIy51UVb/m',2),
	(13,'hilbert.haley','$2y$10$P.Nz68uj5JBr9gXYpZ5Nvewd.dbSVnWdNOI.fGWGF7D8mSB0VtAc.',2),
	(14,'alvena74','$2y$10$SXEimnYCCoXCo3CFnv.jCunlXwgV30mZuC57wQhYC/5Nnp.Ne4xTG',2),
	(15,'justice45','$2y$10$mdvqle3/5t43PZYX83XfoOjNpJVAtNKIyKGQqmiJABl4lAB4VY/HC',2),
	(16,'johanna50','$2y$10$OJFUZOZkOMwzdo7P5SvAc.PmhXxvflccChqNVTMAcOTeuty2ocewm',3),
	(17,'stoltenberg.chasity','$2y$10$bojeYPXlDhswWJqXEpTr/euWnA7t6K.Xk04B7p74h1dPyeD8BJ9NO',3),
	(18,'blair19','$2y$10$aSmcWiDg/kA/sU7uJgezIOkt4Cy0//M0eeUpd0Ohv0jInHLt.BDv.',3),
	(19,'lorenz.hettinger','$2y$10$mMCqL4cPLXlnDtvYjFtA1OZUTkEGPTc/jcGa1l1gBgwK792cO31v6',4),
	(20,'wisozk.courtney','$2y$10$As16x6oJZFyVyLMXtioP1eS.xE.1Ugp58PtmfV14dGgGIkL3RYzNK',4),
	(21,'ckreiger','$2y$10$Wtr5HxbDbU8tyosmllLrzuIaXy6g66hXokzpzqb1TAqbX6aGu1fBq',2),
	(22,'wbreitenberg','$2y$10$HcxhmHh6KyyhFk6LFytyPObbaF8/ajgLUN/lRMJ/NUqDN4QUWSnau',2),
	(23,'peyton24','$2y$10$99wSY0sduzk5KIcmmdFPd.ma5W6y2/KAxjg0g2OePR01AS52fU60.',2),
	(24,'omorissette','$2y$10$A0eW3mJF50Rf4XwELf9WBOaqJ3SD4W4mBH35.vpU/si5RhoNlLjY.',4),
	(25,'missouri.olson','$2y$10$ttrf0/m.hWoabdNexPV6YOFfBGDm0cpmC6u2e7QRc6NXCalOaRnE2',3),
	(26,'shessel','$2y$10$DEmvvF//CoyjUGNwhFGszucKaccivDczAXHRHbaDUFoKVq1z/1ohC',4),
	(27,'candelario37','$2y$10$hd1RwAiukyLz622v4CuQJ.qBBQu/.iXsmqsQ0B3KJHKKNsFyza82u',2),
	(28,'davis.jaleel','$2y$10$3Q0hPJ8..IL0rX55Bofh9OPWEqWQ6gsuSyFvZzXTsMhCcsgYAjej2',4),
	(29,'ydavis','$2y$10$81ZDNdbcgSUTyV4VUrdSM.2r0E85WyvA5GOpY.ymg60EvczRh6Y8K',3),
	(30,'blegros','$2y$10$V8/KHXkMIz7Scy7UHtih7O.LuQQMJe52HrmIzpKJJzPFsmK64l55S',4),
	(31,'verlie32','$2y$10$R3UR3zh2zE79JfOuoo6mxenXUwuhRxaIFYTK3KK42g8zUgBMMvxue',4),
	(32,'laurence56','$2y$10$ArrA374SjKkslbYHkFVpG.oSwQeqz/ojH8DLMvtVZfwErKzlhU.Su',4),
	(33,'pierre95','$2y$10$sRHwj7fORJWQM6of6qmh0uhmai6othybxh4O2NbAiw32egjRxA1Oq',3),
	(34,'schmeler.delia','$2y$10$Sm3G.r7N4rb71m1kUzBS2.j/QnwwZWfdslg132bI2HYcRDayIBsGW',3),
	(35,'myron.skiles','$2y$10$fOV/xNYxVtMDp8QwyTxd6uHA0ZnpA0GipiTcPdcA8JjBsbN.c3V6.',4),
	(36,'pagac.joy','$2y$10$z/2Tk8UlTCPd8hmRY6yU9eanG5DIhb667L2uk69vdyNebqYVT2Cee',4),
	(37,'marquardt.mac','$2y$10$jWZvYC.VrdgLPsKMpIZIFemTM4Wi5YAOCl2LmlKrc1MCX.M.NydZq',2),
	(38,'yessenia.zboncak','$2y$10$1nVA75tY9TctwbXUyZtJ5u0JhfUry.3Qtoqo/mWHWt1Ex5J8xDsHO',3),
	(39,'oconnell.nikita','$2y$10$4/RW8B6jHCS8TmCNmtmwsO5VHfLiAfbtXEnv.7jDhMkLSJSfBiJL2',3),
	(40,'jerry.feeney','$2y$10$QRWVWuUYKBFjhOnJlImp/eKIa6HHhyYnVCSN8Qit11p.gH2rAOds2',2),
	(41,'lera.huels','$2y$10$vLcOSza58dupG32IdM9uoOBn/hyZJ0N3SIdED14eMzLh8tsQGPC6q',2);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
