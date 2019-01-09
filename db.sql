-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: yiicms
-- ------------------------------------------------------
-- Server version	5.7.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('content_editor','2',1546956123),('super_admin','1',1546951154);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('content_editor',1,'Manages Content of the SCMA CMS',NULL,NULL,1546931691,1546931691),('manageUsers',2,'Manage CMS users',NULL,NULL,1546936080,1546936080),('super_admin',1,'Manages Users and the entire CMS',NULL,NULL,1546931691,1546931691);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('super_admin','content_editor'),('super_admin','manageUsers');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (3,'CSS'),(2,'Java'),(1,'PHP');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-post-user_id` (`user_id`),
  KEY `idx-post-category_id` (`category_id`),
  CONSTRAINT `fk-post-category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-post-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,1,'Testing Posts','<p style=\"padding: 0px; margin: 1.8em 0px 0.6em; color: #ff0000; font-size: 1.25em; line-height: 1.2em; font-family: Arial, \'Helvetica Neue\', Helvetica, sans-serif;\"><strong style=\"padding: 0px; margin: 0px;\">Chemistry is the science that</strong>&nbsp;deals with the properties, composition, and structure of substances (defined as elements and compounds), the transformations that they undergo, and the energy that is released or absorbed during these processes. Every substance, whether naturally occurring or artificially produced, consists of one or more of the hundred-odd species of atoms that have been identified as elements. Although these atoms, in turn, are composed of more elementary particles, they are the basic building blocks of chemical substances; there is no quantity of oxygen, mercury, or gold, for example, smaller than an atom of that substance. Chemistry, therefore, is concerned not with the subatomic domain but with the properties of atoms and the laws governing their combinations and with how the knowledge of these properties can be used to achieve specific purposes.</p>\r\n<h2 style=\"padding: 0px; margin: 1.8em 0px 0.6em; color: #ff0000; font-size: 1.25em; line-height: 1.2em; font-family: Arial, \'Helvetica Neue\', Helvetica, sans-serif;\">Common Alloys</h2>\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em; color: #111111; font-family: Arial, \'Helvetica Neue\', Helvetica, sans-serif; font-size: 16px;\">&nbsp;</p>\r\n<table style=\"padding: 0px; margin: 0px; color: #111111; font-family: Arial, \'Helvetica Neue\', Helvetica, sans-serif; font-size: 16px;\" border=\"1\">\r\n<tbody style=\"padding: 0px; margin: 0px;\">\r\n<tr style=\"padding: 0px; margin: 0px;\">\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font22\" style=\"padding: 0px; margin: 0px; font-weight: bold;\">ALLOY</span></p>\r\n</td>\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font22\" style=\"padding: 0px; margin: 0px; font-weight: bold;\">COMPOSITION</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"padding: 0px; margin: 0px;\">\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">brass</span></p>\r\n</td>\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">55% copper, 45% zinc</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"padding: 0px; margin: 0px;\">\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">bronze</span></p>\r\n</td>\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">copper, tin</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"padding: 0px; margin: 0px;\">\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">cast iron</span></p>\r\n</td>\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">iron, carbon, silicon, manganese,</span></p>\r\n<div style=\"padding: 3px 0px; margin: 3px 0px; float: left;\">&nbsp;</div>\r\n</td>\r\n</tr>\r\n<tr style=\"padding: 0px; margin: 0px;\">\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\">&nbsp;</p>\r\n</td>\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">trace impurities</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"padding: 0px; margin: 0px;\">\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">cupronickel</span></p>\r\n</td>\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">copper, nickel</span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table style=\"padding: 0px; margin: 0px; color: #111111; font-family: Arial, \'Helvetica Neue\', Helvetica, sans-serif; font-size: 16px;\" border=\"1\">\r\n<tbody style=\"padding: 0px; margin: 0px;\">\r\n<tr style=\"padding: 0px; margin: 0px;\">\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font22\" style=\"padding: 0px; margin: 0px; font-weight: bold;\">ALLOY</span></p>\r\n</td>\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font22\" style=\"padding: 0px; margin: 0px; font-weight: bold;\">COMPOSITION</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"padding: 0px; margin: 0px;\">\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">pewter</span></p>\r\n</td>\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">tin, antimony, copper</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"padding: 0px; margin: 0px;\">\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">solder</span></p>\r\n</td>\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">tin, lead</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"padding: 0px; margin: 0px;\">\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">stainless steel</span></p>\r\n</td>\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">iron, carbon, chromium, nickel</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"padding: 0px; margin: 0px;\">\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">steel</span></p>\r\n</td>\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">iron, carbon</span></p>\r\n</td>\r\n</tr>\r\n<tr style=\"padding: 0px; margin: 0px;\">\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">sterling silver</span></p>\r\n</td>\r\n<td style=\"padding: 0px; margin: 0px;\">\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em;\"><span class=\"font23\" style=\"padding: 0px; margin: 0px;\">silver, copper</span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em; color: #111111; font-family: Arial, \'Helvetica Neue\', Helvetica, sans-serif; font-size: 16px;\">&nbsp;</p>\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em; color: #111111; font-family: Arial, \'Helvetica Neue\', Helvetica, sans-serif; font-size: 16px;\">&nbsp;</p>\r\n<h2 style=\"padding: 0px; margin: 1.8em 0px 0.6em; color: #ff0000; font-size: 1.25em; line-height: 1.2em; font-family: Arial, \'Helvetica Neue\', Helvetica, sans-serif;\">Physics</h2>\r\n<p style=\"padding: 0px; margin: 0px 0px 1.5em; color: #111111; font-family: Arial, \'Helvetica Neue\', Helvetica, sans-serif; font-size: 16px;\"><strong style=\"padding: 0px; margin: 0px;\">Physics is the science that</strong>&nbsp;deals with the structure of matter and the interactions between the fundamental constituents of the observable universe. The basic physical science, its aim is the discovery and formulation of the fundamental laws of nature. In the broadest sense, physics (from the Greek physikos) is concerned with all aspects of nature on both the macroscopic and submicroscopic levels. Its scope of study encompasses not only the behavior of objects under the action of given forces but also the nature and origin of gravitational, electromagnetic, and nuclear force fields. Its ultimate objective is the formulation of a few comprehensive principles that bring together and explain all such disparate phenomena. Physics can, at base, be defined as the science of matter, motion, and energy. Its laws are typically expressed with economy and precision in the language of mathematics.</p>','6a258aa029a670c58bced3173687672a.jpg',NULL,'2019-01-08 13:11:48','2019-01-08 13:11:48'),(2,1,2,'Test Editor','<p style=\"box-sizing: border-box; line-height: 24px; margin: 0em 0.2em 0.6em; overflow-wrap: break-word; padding: 0px; text-align: justify; font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif; font-size: 15px !important;\">Requests are represented by the&nbsp;<span style=\"box-sizing: border-box; font-weight: 640;\">yii\\web\\Request</span>&nbsp;object, which provides information about HTTP headers, request parameters, cookies, and so forth.</p>\r\n<p style=\"box-sizing: border-box; line-height: 24px; margin: 0em 0.2em 0.6em; overflow-wrap: break-word; padding: 0px; text-align: justify; font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif; font-size: 15px !important;\">The methods&nbsp;<span style=\"box-sizing: border-box; font-weight: 640;\">get()</span>&nbsp;and&nbsp;<span style=\"box-sizing: border-box; font-weight: 640;\">post()</span>&nbsp;return request parameters of the request component.</p>\r\n<p style=\"box-sizing: border-box; line-height: 24px; margin: 0em 0.2em 0.6em; overflow-wrap: break-word; padding: 0px; text-align: justify; font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif; font-size: 15px !important;\"><span style=\"box-sizing: border-box; font-weight: 640;\">Example</span>&nbsp;&minus;</p>\r\n<pre class=\"prettyprint notranslate prettyprinted\" style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; padding: 5px; margin-top: 15px; margin-bottom: 10px; border-radius: 0px; width: 604px; line-height: 16px; border: 1px solid #d6d6d6; background-color: #eeeeee; font-size: 13px; overflow: auto; color: #313131;\"><span class=\"pln\" style=\"box-sizing: border-box;\">$req </span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">=</span> <span class=\"typ\" style=\"box-sizing: border-box; color: #7f0055;\">Yii</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">::</span><span class=\"pln\" style=\"box-sizing: border-box;\">$app</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">-&gt;</span><span class=\"pln\" style=\"box-sizing: border-box;\">request</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">;</span>\r\n   <span class=\"com\" style=\"box-sizing: border-box; color: #880000;\">/*\r\n   * $get = $_GET;\r\n   */</span><span class=\"pln\" style=\"box-sizing: border-box;\">\r\n   $get </span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">=</span><span class=\"pln\" style=\"box-sizing: border-box;\"> $req</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">-&gt;</span><span class=\"kwd\" style=\"box-sizing: border-box; color: #000088;\">get</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">();</span>\r\n\r\n   <span class=\"com\" style=\"box-sizing: border-box; color: #880000;\">/*\r\n   * if(isset($_GET[\'id\'])) {\r\n   *     $id = $_GET[\'id\'];\r\n   * } else {\r\n   *     $id = null;\r\n   * }\r\n   */</span><span class=\"pln\" style=\"box-sizing: border-box;\">\r\n   $id </span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">=</span><span class=\"pln\" style=\"box-sizing: border-box;\"> $req</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">-&gt;</span><span class=\"kwd\" style=\"box-sizing: border-box; color: #000088;\">get</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">(</span><span class=\"str\" style=\"box-sizing: border-box; color: #008800;\">\'id\'</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">);</span>\r\n	\r\n   <span class=\"com\" style=\"box-sizing: border-box; color: #880000;\">/*\r\n   * if(isset($_GET[\'id\'])) {\r\n   *     $id = $_GET[\'id\'];\r\n   * } else {\r\n   *     $id = 1;\r\n   * }\r\n   */</span><span class=\"pln\" style=\"box-sizing: border-box;\">\r\n   $id </span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">=</span><span class=\"pln\" style=\"box-sizing: border-box;\"> $req</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">-&gt;</span><span class=\"kwd\" style=\"box-sizing: border-box; color: #000088;\">get</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">(</span><span class=\"str\" style=\"box-sizing: border-box; color: #008800;\">\'id\'</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">,</span> <span class=\"lit\" style=\"box-sizing: border-box; color: #006666;\">1</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">);</span>\r\n	\r\n   <span class=\"com\" style=\"box-sizing: border-box; color: #880000;\">/*\r\n   * $post = $_POST;\r\n	*/</span><span class=\"pln\" style=\"box-sizing: border-box;\">\r\n   $post </span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">=</span><span class=\"pln\" style=\"box-sizing: border-box;\"> $req</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">-&gt;</span><span class=\"pln\" style=\"box-sizing: border-box;\">post</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">();</span>\r\n\r\n   <span class=\"com\" style=\"box-sizing: border-box; color: #880000;\">/*\r\n   * if(isset($_POST[\'name\'])) {       \r\n   *     $name = $_POST[\'name\'];          \r\n   * } else {\r\n   *     $name = null;\r\n   * }\r\n   */</span><span class=\"pln\" style=\"box-sizing: border-box;\">\r\n   $name </span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">=</span><span class=\"pln\" style=\"box-sizing: border-box;\"> $req</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">-&gt;</span><span class=\"pln\" style=\"box-sizing: border-box;\">post</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">(</span><span class=\"str\" style=\"box-sizing: border-box; color: #008800;\">\'name\'</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">);</span>\r\n		  \r\n   <span class=\"com\" style=\"box-sizing: border-box; color: #880000;\">/*\r\n   * if(isset($_POST[\'name\'])) {\r\n   *     $name = $_POST[\'name\'];\r\n   * } else {\r\n   *     $name = \'\';\r\n   * }\r\n   */</span><span class=\"pln\" style=\"box-sizing: border-box;\">\r\n   $name </span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">=</span><span class=\"pln\" style=\"box-sizing: border-box;\"> $req</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">-&gt;</span><span class=\"pln\" style=\"box-sizing: border-box;\">post</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">(</span><span class=\"str\" style=\"box-sizing: border-box; color: #008800;\">\'name\'</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">,</span> <span class=\"str\" style=\"box-sizing: border-box; color: #008800;\">\'\'</span><span class=\"pun\" style=\"box-sizing: border-box; color: #666600;\">);</span></pre>\r\n<p style=\"box-sizing: border-box; line-height: 24px; margin: 0em 0.2em 0.6em; overflow-wrap: break-word; padding: 0px; text-align: justify; font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif; font-size: 15px !important;\"><span style=\"box-sizing: border-box; font-weight: 640;\">Step 1</span>&nbsp;&minus; Add an&nbsp;<span style=\"box-sizing: border-box; font-weight: 640;\">actionTestGet</span>&nbsp;function to the&nbsp;<span style=\"box-sizing: border-box; font-weight: 640;\">SiteController</span>&nbsp;of the basic application template.</p>','62e2513d5be7412bf2308f88bdd657f1.jpeg','997ed4ba8ce4eabdf3218924d6aef7af.mp4','2019-01-08 13:20:22','2019-01-08 13:20:22'),(3,1,2,'Testing Posts','<p>file upload test</p>','31f4d79235c23a45395c0d3e447a2154.jpeg','fc402d125143c8932f46e11ce853638c.mp4','2019-01-08 05:50:03','2019-01-08 05:50:03'),(4,1,3,'Testing Posts','<p>edgg</p>','1b3ed3924fec8119da68f8d7174bc284.gif','f9f5d1d68b84f4f0b003838404b5cd11.mp4','2019-01-08 05:51:03','2019-01-08 05:51:03'),(5,2,1,'Yii Installation','<p style=\"box-sizing: border-box; line-height: 24px; margin: 0em 0.2em 0.6em; overflow-wrap: break-word; padding: 0px; text-align: justify; font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif; font-size: 15px !important;\">The most straightforward way to get started with Yii2 is to use the basic application template provided by the Yii2 team. This template is also available through the Composer tool.</p>\r\n<p style=\"box-sizing: border-box; line-height: 24px; margin: 0em 0.2em 0.6em; overflow-wrap: break-word; padding: 0px; text-align: justify; font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif; font-size: 15px !important;\"><span style=\"box-sizing: border-box; font-weight: 640;\">Step 1</span>&nbsp;&minus; Find a suitable directory in your hard drive and download the Composer PHAR (PHP archive) via the following command.</p>\r\n<pre class=\"result notranslate\" style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; padding: 5px; margin-top: 0px; margin-bottom: 0px; border-radius: 0px; width: 604px; border: 1px solid #d6d6d6; background-color: #f1f1f1; font-size: 12px; overflow: auto; color: #313131;\">curl -sS https://getcomposer.org/installer | php\r\n</pre>\r\n<p style=\"box-sizing: border-box; line-height: 24px; margin: 0em 0.2em 0.6em; overflow-wrap: break-word; padding: 0px; text-align: justify; font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif; font-size: 15px !important;\"><span style=\"box-sizing: border-box; font-weight: 640;\">Step 2</span>&nbsp;&minus; Then move this archive to the bin directory.</p>\r\n<pre class=\"result notranslate\" style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; padding: 5px; margin-top: 0px; margin-bottom: 0px; border-radius: 0px; width: 604px; border: 1px solid #d6d6d6; background-color: #f1f1f1; font-size: 12px; overflow: auto; color: #313131;\">mv composer.phar /usr/local/bin/composer\r\n</pre>\r\n<p style=\"box-sizing: border-box; line-height: 24px; margin: 0em 0.2em 0.6em; overflow-wrap: break-word; padding: 0px; text-align: justify; font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif; font-size: 15px !important;\"><span style=\"box-sizing: border-box; font-weight: 640;\">Step 3</span>&nbsp;&minus; With the Composer installed, you can install Yii2 basic application template. Run these commands.</p>\r\n<pre class=\"result notranslate\" style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; padding: 5px; margin-top: 0px; margin-bottom: 0px; border-radius: 0px; width: 604px; border: 1px solid #d6d6d6; background-color: #f1f1f1; font-size: 12px; overflow: auto; color: #313131;\">composer global require \"fxp/composer-asset-plugin:~1.1.1\" \r\ncomposer create-project --prefer-dist yiisoft/yii2-app-basic helloworld \r\n</pre>\r\n<p style=\"box-sizing: border-box; line-height: 24px; margin: 0em 0.2em 0.6em; overflow-wrap: break-word; padding: 0px; text-align: justify; font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif; font-size: 15px !important;\">The first command installs the composer asset plugin, which manages&nbsp;<span style=\"box-sizing: border-box; font-weight: 640;\">npm</span>and bower dependencies. The second command installs Yii2 basic application template in a directory called&nbsp;<span style=\"box-sizing: border-box; font-weight: 640;\">helloworld</span>.</p>\r\n<p style=\"box-sizing: border-box; line-height: 24px; margin: 0em 0.2em 0.6em; overflow-wrap: break-word; padding: 0px; text-align: justify; font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif; font-size: 15px !important;\"><span style=\"box-sizing: border-box; font-weight: 640;\">Step 4</span>&nbsp;&minus; Now open the&nbsp;<span style=\"box-sizing: border-box; font-weight: 640;\">helloworld</span>&nbsp;directory and launch the web server built into PHP.</p>\r\n<pre class=\"result notranslate\" style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; padding: 5px; margin-top: 0px; margin-bottom: 0px; border-radius: 0px; width: 604px; border: 1px solid #d6d6d6; background-color: #f1f1f1; font-size: 12px; overflow: auto; color: #313131;\">php -S localhost:8080 -t web\r\n</pre>\r\n<p style=\"box-sizing: border-box; line-height: 24px; margin: 0em 0.2em 0.6em; overflow-wrap: break-word; padding: 0px; text-align: justify; font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif; font-size: 15px !important;\"><span style=\"box-sizing: border-box; font-weight: 640;\">Step 5</span>&nbsp;&minus; Then open&nbsp;<span style=\"box-sizing: border-box; font-weight: 640;\">http://localhost:8080</span>&nbsp;in your browser. You can see the welcome page.</p>','2dffc066578514fef70b220339b37097.jpg',NULL,'2019-01-08 13:22:33','2019-01-08 13:22:33'),(6,1,2,'Files','<p>Here\'s some files...</p>','d0158c8db7a7bf1b5e486eef33473ec1.jpg',NULL,'2019-01-09 04:28:09','2019-01-09 04:28:09'),(7,1,3,'Test Case for File uploads','<p>test</p>','6d3ecfebccf8b33055acd8879e303347.zip',NULL,'2019-01-09 08:31:54','2019-01-09 08:31:54'),(8,2,3,'Test Editor','<p>sfsf</p>','81a25f0144b4a5e8cb6134e58bfbdd98.jpg',NULL,'2019-01-09 08:52:03','2019-01-09 08:52:03');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'superAdmin','super@scma.com','$2y$13$l4hJfbLpIcusqGXQPen.WuYNX94opknJi1p8WHHGTr884/4P2y9Bi','2019-01-08 02:19:54','2019-01-08 07:09:14'),(2,'editor','editor@scma.com','$2y$13$F0TvhiI7b0r8KC5OXCdT0OTRSgE1Ih2oh6mPrWrM8NTbR3.ni0fne','2019-01-08 08:32:03','2019-01-08 08:32:03');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-09 19:53:49
