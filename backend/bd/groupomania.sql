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
  `title` varchar(200) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `description` text,
  `subject` varchar(50) NOT NULL,
  `lien_web` varchar(400) DEFAULT NULL,
  `user_id` smallint(5) unsigned NOT NULL,
  `date_post` date NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `fk_article_user` (`user_id`),
  CONSTRAINT `fk_article_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Articles`
--

LOCK TABLES `Articles` WRITE;
/*!40000 ALTER TABLE `Articles` DISABLE KEYS */;
INSERT INTO `Articles` VALUES (1,'Entre promesses d’ouverture et contrôle social strict, les Afghans sous la férule des talibans','entre-promesses-douverture-et-controle-social-strict-les-afghans-sous-la-ferule-des-talibans2021-08-23','Une semaine est passée depuis que les talibans ont pris le pouvoir en entrant, victorieux, le 15 août, dans Kaboul, une capitale tombée sans combattre, au terme d’une offensive dans le pays de seulement quarante-cinq jours.\n\nLa population afghane est de nouveau confrontée à ces fondamentalistes musulmans chassés d’un pouvoir qu’ils ont détenu entre 1996 et 2001. Ils affirment avoir changé, mais ils n’obéissent toujours qu’à la loi de Dieu. Ils jurent avoir abandonné leurs pratiques obscurantistes, telles que les lapidations et les exécutions publiques, et ils ont déclaré avoir ouvert des enquêtes sur les accusations d’exactions. Ils promettent, enfin, un gouvernement « ouvert et inclusif » et veulent entretenir des relations internationales cordiales après avoir été mis au ban des nations.','Média','https://www.lemonde.fr/international/article/2021/08/23/la-population-afghane-sous-la-ferule-talibane_6092089_3210.html',1,'2021-08-23',0),(2,'Ligue 1 : le match Nice-Marseille définitivement arrêté après le refus des joueurs de l’OM de reprendre le jeu','ligue-1-le-match-nice-marseille-definitivement-arrete-apres-le-refus-des-joueurs-de-lom-de-reprendre-le-jeu2021-08-23','Les images sont terribles, et leurs répercussions sur la réputation du football français dramatiques. La rencontre de Ligue 1 entre Nice et Marseille, disputée dimanche 22 août en clôture de la 3e journée, n’est pas allée à son terme, après de nombreux événements pathétiques : jets de bouteilles sur les joueurs, envahissement de terrain par les supporteurs niçois, bagarres… Le lot quasi complet d’un football de rue, loin de ce que doit véhiculer un championnat professionnel, a été proposé à l’Allianz Riviera de Nice.\n\nLe parquet de Nice a fait savoir, lundi, qu’une enquête avait été ouverte. « Une enquête est en cours, mais il n’y a pas de garde à vue » à ce stade, a-t-il également été précisé. L’incident déclencheur s’est produit à la 75e minute quand le joueur marseillais Dimitri Payet a renvoyé vers la tribune des supporteurs de Nice une des nombreuses bouteilles en plastique qu’il recevait à chaque fois qu’il allait tirer un corner. Heurté par un des projectiles, Payet s’est effondré au sol avant de se relever et d’empoigner la bouteille qui l’avait touché pour la lancer vers la tribune. Furieux, des supporteurs sont descendus sur la pelouse pour menacer le joueur de l’Olympique de Marseille (OM), avant que l’arbitre renvoie les joueurs aux vestiaires.','Sport','https://www.lemonde.fr/sport/article/2021/08/23/ligue-1-le-match-nice-marseille-definitivement-arrete-apres-le-refus-des-joueurs-de-l-om-de-reprendre-le-jeu_6092077_3242.html',2,'2021-08-23',0),(3,'Passe sanitaire : 64% des Français approuvent son extension dans les bars et restaurants selon un sondage','passe-sanitaire-64-des-francais-approuvent-son-extension-dans-les-bars-et-restaurants-selon-un-sondage2021-08-23','Selon un sondage Elabe «L\'Opinion en direct» pour BFMTV, entre 64% et 77% des Français cautionnent la mise en place du passe sanitaire selon les lieux, des chiffres en augmentation par rapport à un sondage réalisé le mois dernier juste après les annonces du président de la République.\n\nDans les cafés, bars et restaurants, 64% des Français approuvent l\'extension du passe sanitaire, soit 10 points de plus que dans le précédent sondage réalisé. L\'approbation monte à 72% pour l\'accès aux lieux de culture et à 77% pour les transports (avions, trains, cars longue distance). Pour l\'accès aux hôpitaux, 65% des personnes interrogées approuvent le passe, une baisse d’un point cette fois-ci par rapport au mois dernier.','Société','https://www.lefigaro.fr/actualite-france/passe-sanitaire-64-des-francais-approuvent-son-extension-dans-les-bars-et-restaurants-selon-un-sondage-20210823',3,'2021-08-23',0),(4,'Randonnée originale dans les Alpes Mancelles','randonnee-originale-dans-les-alpes-mancelles2021-08-23','La Sarthe est un département aux mille facettes : qui pourrait soupçonner son joli relief dont les monts culminent à 216 mètres ? Au nord-ouest du département, cette partie du massif armoricain déroule forêts, petits bois, falaises et rochers. Peu après sa naissance dans l\'Orne, la rivière a creusé de véritables gorges dans le grès qui contrastent avec les paisibles plateaux du sud. Un territoire au cœur du parc régional Normandie Maine, où les petites cités médiévales composent un riche patrimoine architectural. C\'est aussi l\'occasion de découvrir les pierriers de Saint-Léonard-des-Bois classés espaces naturels sensibles, des paysages fréquents dans les pays scandinaves mais uniques en dans la région des Pays de la Loire. L\'itinéraire proposé est une courte boucle avec un beau dénivelé qui durcit un peu le parcours qui offre de fabuleux points de vue.','Autre','https://www.lefigaro.fr/voyages/randonnee-originale-dans-les-alpes-mancelles-20210822',4,'2021-08-23',0),(6,'Maladies psychiques : adopter un chien pour gagner en autonomie','maladies-psychiques-adopter-un-chien-pour-gagner-en-autonomie2021-08-23','PSYCHOLOGIE - Des associations forment des chiens d\'assistance pour des patients atteints de troubles psychiques ou autistiques.\n\nEn cette belle matinée printanière, un soleil radieux réchauffe le parc de Belleville, à Paris. Avec sa cape «Handi\'chiens» visible sur le corps, Jingle ne passe pas inaperçue. La jeune chienne labrador noir accompagne depuis deux ans et demi Agnès Léonard, qui a souffert pendant des années de troubles sévères du comportement. «J\'avais des mouvements incontrôlés de mon corps. Mes bras partaient en vrille, je marchais bizarrement. J\'étais épuisée, j\'ai perdu 15 kilos», témoigne la Parisienne de 56 ans, qui a dû être hospitalisée six mois à Sainte-Anne.','Santé','https://www.lefigaro.fr/sciences/maladies-psychiques-adopter-un-chien-pour-gagner-en-autonomie-20210803',7,'2021-08-23',0),(25,'Jeux paralympiques de Tokyo ','jeux-paralympiques-de-tokyo-2021-08-24','Les Jeux paralympiques de Tokyo débutent à partir de mardi. Au total, 138 athlètes et 15 guides ou assistants vont participer à la compétition pour défendre les couleurs de l\'équipe de France. Tour d\'horizon des plus grandes chances de remporter des médailles pour la délégation tricolore.\n\n','Sport','https://www.france24.com/fr/sports/20210823-jeux-paralympiques-de-tokyo-les-dix-athl%C3%A8tes-fran%C3%A7ais-%C3%A0-suivre',6,'2021-08-24',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES (1,'8e004','C\'est terrible !',2,1,'2021-08-23',0),(2,'37f1c','Incroyable :/',3,1,'2021-08-23',0),(4,'fe4bc','A réfléchir pour les prochaines vacances :D :D',6,4,'2021-08-23',0),(11,'ab85c','Finalement c\'est pas si terrible faut croire ?',7,3,'2021-08-23',0),(14,'816a4','Magnifique!!!',7,4,'2021-08-23',0),(31,'f7461','J\'aime les animaux',2,6,'2021-08-23',0),(32,'46ae2','C\'est triste de voir des choses pareils dans le monde du sport :/',1,2,'2021-08-23',0),(33,'8f468','Finalement ça à l\'air de fonctionner après tout ...',1,3,'2021-08-23',0),(35,'7b95f','Ça ne devrait pas arriver dans le monde du sport :/',8,2,'2021-08-23',0),(37,'91b34','Un vrai exemple d\'espoir!',6,6,'2021-08-24',1),(38,'5180b','Un vrai exemple d\'espoir',6,6,'2021-08-24',0),(39,'5e56f','Bonjour',6,1,'2021-08-24',1),(42,'f3200','Bonjour!',6,2,'2021-08-24',1),(43,'963b5','Bonjour !',6,3,'2021-08-24',1),(47,'addca','Bonjour à tous',6,6,'2021-08-24',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Thumbs`
--

LOCK TABLES `Thumbs` WRITE;
/*!40000 ALTER TABLE `Thumbs` DISABLE KEYS */;
INSERT INTO `Thumbs` VALUES (1,2,1,-1,0,1),(2,3,1,-1,0,1),(3,3,2,-1,0,1),(4,6,4,1,1,0),(6,7,1,-1,0,1),(7,7,2,-1,0,1),(8,7,3,1,1,0),(10,7,6,1,1,0),(11,2,6,1,1,0),(13,2,4,1,1,0),(14,2,2,1,1,0),(15,1,2,-1,0,1),(16,1,6,1,1,0),(17,8,1,-1,0,1),(18,8,2,-1,0,1),(19,6,25,1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Germaine','germaine@gmail.com','$2b$10$KyxtnCO/i8JKdDXXx1Ek7uuZg30dmizbllFLelnukaB1w2ssxWX/W','Germaine','Duret',0),(2,'Gerald','gerald@gmail.com','$2b$10$Bc3TNlpBrgusxopdTS7.buJOU3n7jVFdV6NxQmwruPktLadBBuRGu','Gerald','Dubois',0),(3,'Norbert','norbert@gmail.com','$2b$10$5U6VgMYpU.qGylgEXHbdQembOZ1xeq1N7.QBpcGH0LiNaVBvh9ku6','Norbert','Dupont',0),(4,'Francis','francis@gmail.com','$2b$10$oTLUGiaeGEmd0dd8Vks6Y.h2vicPDiPu5t6JifZdoG2Kod/k561ay','Francis','Ducrocq',0),(5,'Admin','admin@gmail.com','$2b$10$cuqYfqAfl68U581rDxUWYeaZEwscIx8Hf0lKdBudNI0KwrrdFk0hS','Admin','Admin',1),(6,'Linette','linette@gmail.com','$2b$10$btzURXd9F6BfPzfk0pBfmOKVBqH5eIZUx938M63ChnXFNaBkbqP9i','Linette','Martin',0),(7,'Francine','francine@gmail.com','$2b$10$Vad24OKcCvDOGUtnbipHKeAD4RW.VbbBRzK5k3lUSOlFAL6CsntGy','Francine','Pascale',0),(8,'Gaelle','gaelle@gmail.com','$2b$10$ZWVex/ptrL04epWf.yUjB.dJ/BaQpXIB24oGsmNA4ESglz4.ypkem','Gaelle','John',0);
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

-- Dump completed on 2021-08-24 10:41:44
