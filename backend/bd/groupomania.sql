-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: groupomania
-- ------------------------------------------------------
-- Server version	5.7.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Articles`
--

DROP TABLE IF EXISTS `Articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Articles` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(600) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` text,
  `subject` varchar(1000) NOT NULL,
  `lien_web` varchar(400) DEFAULT NULL,
  `user_id` smallint(5) unsigned NOT NULL,
  `date_post` date NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `fk_article_user` (`user_id`),
  CONSTRAINT `fk_article_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Articles`
--

LOCK TABLES `Articles` WRITE;
/*!40000 ALTER TABLE `Articles` DISABLE KEYS */;
INSERT INTO `Articles` VALUES (1,'Tokyo-2021 : les dix athlètes paralympiques français à suivre','tokyo-2021-les-dix-athletes-paralympiques-francais-a-suivre2021-08-25','Les Jeux paralympiques de Tokyo débutent à partir de mardi. Au total, 138 athlètes et 15 guides ou assistants vont participer à la compétition pour défendre les couleurs de l\'équipe de France. Tour d\'horizon des plus grandes chances de remporter des médailles pour la délégation tricolore.\n\nDeux semaines après les Jeux olympiques, c\'est au tour des paralympiques de débuter à Tokyo. Du 24 août au 5 septembre, 4 400 athlètes vont prendre part à la compétition dans 22 sports dont deux nouveaux cette année, le taekwondo et le badminton. La France sera représentée par 138 sportifs.\n\nIl y a cinq ans à Rio, l\'équipe tricolore avait pris la 12e place du classement des nations avec 28 médailles, dont 9 en or, 5 en argent et 14 en bronze. À l\'approche des Jeux de Paris en 2024, c\'est un objectif de 35 médailles qui a été fixé au Japon pour les athlètes paralympiques par la présidente du Comité national olympique et sportif français, Brigitte Henriques. France 24 vous propose de découvrir les athlètes français à suivre tout au long de cette quinzaine.\n\n','Sport','https://www.france24.com/fr/sports/20210823-jeux-paralympiques-de-tokyo-les-dix-athl%C3%A8tes-fran%C3%A7ais-%C3%A0-suivre',1,'2021-08-25',0),(2,'Qui sont les groupes de hackers les plus dangereux de la planète ?','qui-sont-les-groupes-de-hackers-les-plus-dangereux-de-la-planete-2021-08-25','Ils se font appeler Fancy Bear, Equation Group ou encore Bureau 121 et sont à l\'origine des plus grandes cybertattaques de ces dernières années. Tour d\'horizon.\nIls ont espionné des institutions politiques, infecté des centaines de milliers d\'ordinateurs, dérobé des documents sensibles... et ont en commun d\'être classés par les experts comme les groupes de hackers les plus dangereux de la planète. Comment se financent-ils ? Quels sont leurs faits d\'armes ? Quels sont leurs soutiens ?','Autre','https://lexpansion.lexpress.fr/high-tech/infographie-qui-sont-les-groupes-de-hackers-les-plus-dangereux-de-la-planete_2157163.html',2,'2021-08-25',0),(3,'Hausse \"astronomique\" des prix du café : votre petit noir est-il menacé ?','hausse-astronomique-des-prix-du-cafe-votre-petit-noir-est-il-menace-2021-08-25','Déjà en forte hausse, les cours du café ont connu une poussée de fièvre cette semaine, notamment poussés par la météo et des troubles géopolitiques, mais les consommateurs n’en subissent pas encore les conséquences et celles-ci devraient rester limitées.\n\nHausse des coûts, troubles politiques...\n\"Plusieurs raisons sont à même d’expliquer la hausse astronomique des prix du café\" sur les marchés, relève Carlos Mera, analyste chez Rabobank, qui cite en vrac le renchérissement du transport, les troubles politiques en Colombie, troisième producteur mondial, qui ont gêné ses exportations et surtout les conditions météorologiques dévastatrices au Brésil.\n\nAprès un épisode sec plus tôt dans l’année, une vague de gel a en effet frappé cette semaine les plantations du Minas Gerais, l’Etat qui produit 70% de l’arabica brésilien.\n\nLes températures négatives \"provoquent une défoliation des arbres et peuvent même tuer les plus jeunes, de quoi affecter le rendement de la future récolte\" du premier producteur et exportateur de café au monde, reprend M. Mera.','Climat','https://www.dna.fr/economie/2021/07/26/hausse-astronomique-des-prix-du-cafe-votre-petit-noir-est-il-menace',3,'2021-08-25',0),(4,'Covid-19 : la rentrée scolaire repoussée au 13 septembre dans les Antilles françaises et dans une partie de la Guyane','covid-19-la-rentree-scolaire-repoussee-au-13-septembre-dans-les-antilles-francaises-et-dans-une-partie-de-la-guyane2021-08-25','Alors que les premiers signes d’une stabilisation de la situation sanitaire se dessinent en métropole, celle des Antilles françaises inquiète toujours. Face à des taux d’incidence record, le gouvernement a annoncé, mercredi 25 août, le report de la rentrée scolaire au 13 septembre en Guadeloupe, en Martinique, à Saint-Martin et Saint-Barthélemy ainsi que « dans les zones rouges de Guyane ».\n\nEn conséquence, le porte-parole du gouvernement Gabriel Attal a ajouté, lors d’une conférence de presse à l’issue du conseil des ministres, que l’état d’urgence sanitaire serait prolongé « jusqu’au 15 novembre aux Antilles, en Guyane et en Polynésie française », avec un projet de loi présenté « la semaine prochaine ».','Santé','https://www.lemonde.fr/planete/article/2021/08/25/covid-19-la-rentree-repoussee-au-13-septembre-dans-les-antilles-francaises-et-dans-une-partie-de-la-guyane_6092310_3244.html',5,'2021-08-25',0),(5,'Quintenas : en montgolfière, un voyage majestueux dans le ciel','quintenas-en-montgolfiere-un-voyage-majestueux-dans-le-ciel2021-08-25','Dans le nord de l’Ardèche, il suffit de lever les yeux pour rêver. À l’intérieur de la nacelle, le songe est fabuleux. Les paysages s’étirent lentement tandis que le mont Gerbier de Jonc se cache dans les derniers rayons du soleil.','Autre','https://www.ledauphine.com/culture-loisirs/2021/08/24/quintenas-en-montgolfiere-un-voyage-majestueux-dans-le-ciel',6,'2021-08-25',0);
/*!40000 ALTER TABLE `Articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comments` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cryptoslug` varchar(50) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `user_id` smallint(5) unsigned NOT NULL,
  `article_id` smallint(5) unsigned NOT NULL,
  `date_post` date NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cryptoslug` (`cryptoslug`),
  UNIQUE KEY `content` (`content`),
  KEY `fk_comment_article` (`article_id`),
  KEY `fk_comment_user` (`user_id`),
  CONSTRAINT `fk_comment_article` FOREIGN KEY (`article_id`) REFERENCES `Articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES (1,'1867d','Un véritable exemple à suivre. C\'est génial!!!!',7,1,'2021-08-25',1),(2,'b8211','Symbole d\'espoir!!',3,1,'2021-08-25',0),(3,'8f7b0','Personne n\'est plus en sécurité :/',3,2,'2021-08-25',0),(4,'3de0c','Super',4,1,'2021-08-25',0),(5,'bbc85','Très rassurant ',4,2,'2021-08-25',0),(6,'a647b','Que faut-il de plus pour comprendre que notre planète est malade ?!',4,3,'2021-08-25',0),(7,'4392a','Il ne faut rien lâcher!!',5,1,'2021-08-25',0),(8,'e4fbd',':( :( :( ',5,2,'2021-08-25',0),(9,'037c2','Ça va pas aller en s\'améliorant ',5,3,'2021-08-25',0),(19,'e4d04','Superbe région. A voir absolument!!!',1,5,'2021-08-25',0);
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Thumbs`
--

DROP TABLE IF EXISTS `Thumbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Thumbs` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) unsigned NOT NULL,
  `article_id` smallint(5) unsigned NOT NULL,
  `thumb` tinyint(4) DEFAULT '0',
  `liked` tinyint(3) unsigned DEFAULT '0',
  `disliked` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_thumb_article` (`article_id`),
  KEY `fk_thumb_user` (`user_id`),
  CONSTRAINT `fk_thumb_article` FOREIGN KEY (`article_id`) REFERENCES `Articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_thumb_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Thumbs`
--

LOCK TABLES `Thumbs` WRITE;
/*!40000 ALTER TABLE `Thumbs` DISABLE KEYS */;
INSERT INTO `Thumbs` VALUES (1,2,1,1,1,0),(2,3,2,-1,0,1),(3,3,1,1,1,0),(4,4,1,1,1,0),(5,4,2,1,1,0),(6,4,3,-1,0,1),(7,5,1,1,1,0),(8,5,2,-1,0,1),(9,5,3,-1,0,1),(10,5,4,-1,0,1),(11,6,5,1,1,0),(12,6,4,-1,0,1),(13,7,5,1,1,0),(14,7,4,-1,0,1),(15,1,5,1,1,0),(16,1,4,-1,0,1);
/*!40000 ALTER TABLE `Thumbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Germaine','germaine@gmail.com','$2b$10$eGy38WUao.hnkVGofl7RmO0RC1Xt3SVptpGf2t5pvUFwfNyWfZAf.','Germaine','Duret',0),(2,'Gerald','gerald@gmail.com','$2b$10$Z2gRZl3Dw5tZvf.SZ7GLHOAdHlojiLoD8FeiiH1n0qYmeywz6cou2','Gerald','Dupont',0),(3,'Norbert','norbert@gmail.com','$2b$10$p4Ino8UAfHKmMTrYs0VC6.mucqJzfOxIqP5GccZf5NQHA91/0B/b.','Norbert','Ducrocq',0),(4,'Francis','francis@gmail.com','$2b$10$2/XjS61t5uGOBehJe62Uy.0MbUEV9THvumzxHnIDcHqywV3Pc0oNq','Francis','Bonheur',0),(5,'Linette','linette@gmail.com','$2b$10$lTQdCJDunpGgjpSzqwkfZet/vvFPNLJM5CTPXrcw5aAWjdN0Db.NK','Linette','Papillon',0),(6,'Francine','francine@gmail.com','$2b$10$4vI6KGSNzBjhKXdzC0i.wu1Apfzon0XrgWrwQbPu6gG6gC8WXs9NW','Francine','Auto',0),(7,'Admin','admin@gmail.com','$2b$10$SV6oOIul54yKxWmDxBRcvua3dDy75MS2dA9DbuTGgMqMloHptK8XG','Admin','Admin',1);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-25 17:14:52
