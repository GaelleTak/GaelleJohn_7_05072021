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
  `title` varchar(100) NOT NULL,
  `slug` varchar(300) NOT NULL,
  `description` text,
  `subject` varchar(500) NOT NULL,
  `lien_web` varchar(400) DEFAULT NULL,
  `user_id` smallint(5) unsigned NOT NULL,
  `date_post` date NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `fk_article_user` (`user_id`),
  CONSTRAINT `fk_article_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Articles`
--

LOCK TABLES `Articles` WRITE;
/*!40000 ALTER TABLE `Articles` DISABLE KEYS */;
INSERT INTO `Articles` VALUES (1,'Dans l’Ouest américain, une sécheresse millénaire aux conséquences inédites','dans-louest-americain-une-secheresse-millenaire-aux-consequences-inedites2021-07-27','Pour la première fois depuis la conquête de ce territoire, l’aridité dans le bassin du Colorado menace la production hydroélectrique, l’agriculture et certaines industries.\n\n« Zone brûlée ». A l’embranchement de la route 14, un panneau barre la circulation. La forêt est interdite « à tous les usagers ». En ce mois de juillet, on ne peut pas accéder à la source du Colorado, au lac du col de la Poudre. C’est de là que s’élance le grand fleuve de l’Ouest américain, à 3 100 m d’altitude, à l’ombre des Never Summer Mountains, les montagnes qui ne voient jamais l’été. D’habitude, c’est une destination prisée des randonneurs. Mais le paysage est aujourd’hui défiguré.\n\nL’an dernier, cette région du nord du Colorado, qui s’étend le long de la rivière Cache la Poudre, a subi le plus grand incendie qu’ait connu l’Etat. « On a été évacués trois mois », dit Tasha Collins, la propriétaire du Trading Post Resort, un établissement situé près du village de Rustic, doté d’un ours empaillé et de cabanes de rondins appréciées des amateurs de pêche à la mouche. L’incendie, le Cameron Peak Fire, n’a été déclaré circonscrit qu’en décembre 2020, après cent douze jours : seule la neige en est venue à bout. Il a laissé derrière lui une mosaïque de troncs brûlés et une rivière remplie de cendres.','Climat','https://www.lemonde.fr/climat/article/2021/07/27/dans-l-ouest-americain-une-secheresse-millenaire-aux-consequences-inedites_6089624_1652612.html',1,'2021-07-27',0),(2,'Policiers blessés dans le Val-de-Marne : Darmanin dénonce une «véritable tentative d\'assassinat»','policiers-blesses-dans-le-val-de-marne-darmanin-denonce-une-veritable-tentative-dassassinat2021-07-27','«On a frôlé le drame». L\'expression est du ministre de l\'Intérieur Gérald Darmanin, qui s\'est rendu lundi 26 juillet dans la soirée à Bonneuil-sur-Marne (Val-de-Marne) pour «apporter son plein soutien» aux forces de l\'ordre au lendemain de ce qu\'il qualifie de «véritable tentative d\'assassinat».\nDimanche soir, en pleine intervention dans le quartier Saint-Exupéry pour un rodéo de motos «impliquant une quarantaine d\'individus» selon la préfecture de police de Paris, une voiture de police de la Brigade anti-criminalité (BAC) de Créteil a été victime d\'un tir de mortier d\'artifice.','Société','https://www.lefigaro.fr/faits-divers/policiers-blesses-dans-le-val-de-marne-darmanin-denonce-une-veritable-tentative-d-assassinat-20210727',2,'2021-07-27',0),(3,'Dans les facs françaises, des travaux dirigés par Pékin','dans-les-facs-francaises-des-travaux-diriges-par-pekin2021-07-27','Partenariats alléchants, pressions sur les chercheurs… Elaborée au sommet de l’Etat-Parti, la stratégie d’influence de la Chine s’étend dans les universités, aidée par la naïveté d’un milieu académique hexagonal peu conscient des risques.\nC’est un enseignant-chercheur qui fait des bonds à la terrasse d’un café, ­furieux contre la direction de son université qui a signé à tout-va des partenariats avec la Chine. C’est cette conférence sur le Xinjiang qui a tourné au pugilat après l’intervention de deux employés du consulat chinois. Ou encore ce jeune chercheur spécialiste de la Chine qui répond que, «bien sûr», il parle du Tibet dans ses cours mais «en mettant les formes» et la boule au ventre que son prochain visa soit refusé.','Politique','https://www.liberation.fr/international/asie-pacifique/dans-les-facs-francaises-des-travaux-diriges-par-pekin-20210726_SXMOA4LHSBFZJAE2HNWSWRHEVE/',3,'2021-07-27',0),(4,'« Kaamelott premier volet » : à la table ronde des éclopés','kaamelott-premier-volet-a-la-table-ronde-des-eclopes2021-07-27','Le voici, le voilà, fermement attendu par quelques fans si l’on en croit les chiffres de la série de quatre cent cinquante-huit épisodes qui inspire ce film : diffusée sur M6 de 2005 à 2009, Kaamelott, parodie de la légende arthurienne, réalisée et interprétée par Alexandre Astier, attira en moyenne trois millions et demi de spectateurs par épisode. Sa déclinaison cinématographique, annoncée dès 2009, se heurta cependant à de multiples avanies, depuis le conflit juridique sur ses droits jusqu’à la pandémie de Covid-19.\nC’est dire si ce premier volet de ce qui se présente d’ores et déjà comme une future trilogie suscite l’impatience des fidèles. Et sans doute aussi la circonspection des cinéphiles tant il y a loin, en matière d’écriture, de souffle et de dramaturgie, entre l’univers d’une série au format unitaire réduit et une œuvre de cinéma.\nAlexandre Astier, de son côté, ignore superbement ou minimise habilement – selon les points de vue – ce hiatus en faisant de son film la suite de la série là où elle s’était interrompue, les dix ans d’écart qui se sont écoulés dans la réalité entre les deux étant transposés dans la fiction.','Culture','https://www.lemonde.fr/culture/article/2021/07/21/kaamelott-premier-volet-a-la-table-ronde-des-eclopes_6088997_3246.html',4,'2021-07-27',0),(5,'Le mercato en direct: avec la vente de Varane à Manchester, le Real Madrid pense encore à Mbappé','le-mercato-en-direct-avec-la-vente-de-varane-a-manchester-le-real-madrid-pense-encore-a-mbappe2021-07-27','Le Real devrait perdre Raphaël Varane. Le défenseur français, en partance pour Manchester United, devrait rapporter 50 millions d\'euros au club merengue. Selon Marca, les Madrilènes cherchent à économiser de l\'argent et accumuler les ventes pour pouvoir s\'offrir Kylian Mbappé. Ainsi, le journal espagnol annonce que le Real ne fera plus aucun achat sur ce mercato, si ce n\'est l\'attaquant du PSG (22 ans) en fin de contrat dans un an. Alors que le Real a perdu ses deux défenseurs centraux (avec Sergio Ramos, parti au... PSG), seule l\'arrivée de David Alaba va donc combler ces départs. \n','Sport','https://www.lefigaro.fr/sports/football/transferts/le-mercato-en-direct-varane-du-real-madrid-a-manchester-united-une-question-d-heures-20210727',4,'2021-07-27',0),(6,'Covid-19 en France : 40 millions de personnes sont primo-vaccinées','covid-19-en-france-40-millions-de-personnes-sont-primo-vaccinees2021-07-27','Quarante millions de personnes en France ont reçu au moins une dose de vaccin contre le Covid-19, soit près de 60 % de la population, a annoncé Emmanuel Macron sur Twitter, lundi 26 juillet. « C’est tous ensemble que nous vaincrons le virus. On continue ! » a encouragé le chef de l’Etat, qui se trouve actuellement en Polynésie française.\n\nLe gouvernement, qui compte notamment sur le renforcement de la vaccination pour tenter d’endiguer l’active circulation du SARS-CoV-2 en France sous l’effet du variant Delta, très contagieux, s’était fixé comme objectif ces 40 millions avant la fin de juillet. Il vise désormais l’objectif de 50 millions de primo-vaccinés d’ici à la fin du mois d’août.\n\nSelon le dernier bilan officiel, 49,3 % de la population française (33,2 millions de personnes) est désormais intégralement vaccinée contre le Covid-19, soit une couverture vaccinale largement inférieure au niveau requis pour atteindre l’immunité collective. Dans un avis du conseil scientifique, cette proportion est estimée à 95 %.','Santé','https://www.lemonde.fr/societe/article/2021/07/26/covid-19-en-france-40-millions-de-personnes-sont-primo-vaccinees_6089567_3224.html',6,'2021-07-27',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES (1,'896a7','Article très intéressant qui devrait nous mener à la plus grande vigilance pour l\'avenir.',2,1,'2021-07-27',0),(2,'46a7f','Super encourageant pour l\'avenir ... :(',3,2,'2021-07-27',0),(3,'6cf90','Il est temps que l\'on fasse un meilleur usage de nos océans pour approvisionner nos terres et nos foyers, en convertissant cette eau salée en eau douce.',3,1,'2021-07-27',0),(4,'e7940','Hahahaha le propagande chinoise jusque sur le banc de nos facs !!!',4,3,'2021-07-27',0),(5,'73dbd','Je ne comprends pas pourquoi le foot suscite tant d\'intérêt.\nAprès tout, ils ne font que courir derrière un ballon.\nCertains sports demandent plus d\'implications et de rigueur mais sont moins mis de l\'avant.',5,5,'2021-07-27',0),(6,'4e1f4','Trop envie de le voir !!!!',5,4,'2021-07-27',0),(7,'d74b1','Quand est-ce-que les choses vont enfin changer ????',5,2,'2021-07-27',0),(8,'de593','Ça n\'empêche pas la propagation mais c\'est un bon début !',1,6,'2021-07-27',0),(9,'51c6f',':( :( :(',1,3,'2021-07-27',0),(10,'08d14','TOP :D',1,4,'2021-07-27',0),(11,'4b448','<script> alert(\'toto\')</script>',1,1,'2021-07-29',1),(12,'278a0','test ',1,1,'2021-07-29',1);
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
INSERT INTO `Thumbs` VALUES (1,2,1,1,1,0),(2,3,2,-1,0,1),(4,3,1,1,1,0),(5,4,1,-1,0,1),(6,4,2,-1,0,1),(7,5,5,-1,0,1),(8,5,4,1,1,0),(9,5,3,-1,0,1),(10,5,1,1,1,0),(11,5,2,-1,0,1),(12,6,5,1,1,0),(13,1,6,1,1,0),(14,1,2,-1,0,1),(15,1,4,1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Germaine','germaine@gmail.com','$2b$10$PkyQuMDJDJf1uWAyWy0ss.TtItQtwnk3CkjnbABWTEqVHV9umYbqi','Germaine','Duret',0),(2,'Gérald','gerald@gmail.com','$2b$10$WpsNLpIzvbap/L1o3swO7efajZzt9ontozj1XPOkrY7VXEBrb9ynO','Gérald','Dubois',0),(3,'Norbert','norbert@gmail.com','$2b$10$VNQtXwrd2hrHF9POrKng1eGhbOh2JS2unHONjOhKg7TCT8AakxMdi','Norbert','Dupont',0),(4,'Francis','francis@gmail.com','$2b$10$uZfGxLQNpRl/n..ujzxI2OgbBBIrtbdG88LTGWMQtENEhCH5pLz6q','Francis','Ducrocq',0),(5,'Linette','linette@gmail.com','$2b$10$d.n7TsCuU6LfsrSZ.RBNquET2NKX1JC5ixkg3un/Jf1wDYLSsVxGa','Linette','Martin',0),(6,'Francine','francine@gmail.com','$2b$10$6Vnr8kZUuugfgZilGwzJ8e7Ev33RRuE3uLHwqekSGxU7RIWYv66ka','Francine','Pascale',0),(7,'Admin','admin@gmail.com','admin01','Admin','Admin',1);
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

-- Dump completed on 2021-07-29 12:22:22
