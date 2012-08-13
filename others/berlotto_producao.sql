-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 13/08/2012 às 10h37min
-- Versão do Servidor: 5.1.63
-- Versão do PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `berlotto_producao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_message`
--

CREATE TABLE IF NOT EXISTS `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=80 ;

--
-- Extraindo dados da tabela `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add message', 4, 'add_message'),
(11, 'Can change message', 4, 'change_message'),
(12, 'Can delete message', 4, 'delete_message'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add site', 7, 'add_site'),
(20, 'Can change site', 7, 'change_site'),
(21, 'Can delete site', 7, 'delete_site'),
(22, 'Can add comment', 8, 'add_comment'),
(23, 'Can change comment', 8, 'change_comment'),
(24, 'Can delete comment', 8, 'delete_comment'),
(25, 'Can moderate comments', 8, 'can_moderate'),
(26, 'Can add comment flag', 9, 'add_commentflag'),
(27, 'Can change comment flag', 9, 'change_commentflag'),
(28, 'Can delete comment flag', 9, 'delete_commentflag'),
(29, 'Can add flat page', 10, 'add_flatpage'),
(30, 'Can change flat page', 10, 'change_flatpage'),
(31, 'Can delete flat page', 10, 'delete_flatpage'),
(32, 'Can add tag', 11, 'add_tag'),
(33, 'Can change tag', 11, 'change_tag'),
(34, 'Can delete tag', 11, 'delete_tag'),
(35, 'Can add tagged item', 12, 'add_taggeditem'),
(36, 'Can change tagged item', 12, 'change_taggeditem'),
(37, 'Can delete tagged item', 12, 'delete_taggeditem'),
(38, 'Can add theme', 13, 'add_theme'),
(39, 'Can change theme', 13, 'change_theme'),
(40, 'Can delete theme', 13, 'delete_theme'),
(41, 'Can add configuration', 14, 'add_configuration'),
(42, 'Can change configuration', 14, 'change_configuration'),
(43, 'Can delete configuration', 14, 'delete_configuration'),
(44, 'Can add category', 15, 'add_category'),
(45, 'Can change category', 15, 'change_category'),
(46, 'Can delete category', 15, 'delete_category'),
(47, 'Can add links', 16, 'add_links'),
(48, 'Can change links', 16, 'change_links'),
(49, 'Can delete links', 16, 'delete_links'),
(50, 'Can add story', 17, 'add_story'),
(51, 'Can change story', 17, 'change_story'),
(52, 'Can delete story', 17, 'delete_story'),
(53, 'Can add article', 18, 'add_article'),
(54, 'Can change article', 18, 'change_article'),
(55, 'Can delete article', 18, 'delete_article'),
(56, 'Can add gallery', 19, 'add_gallery'),
(57, 'Can change gallery', 19, 'change_gallery'),
(58, 'Can delete gallery', 19, 'delete_gallery'),
(59, 'Can add item', 20, 'add_item'),
(60, 'Can change item', 20, 'change_item'),
(61, 'Can delete item', 20, 'delete_item'),
(62, 'Can add photo', 21, 'add_photo'),
(63, 'Can change photo', 21, 'change_photo'),
(64, 'Can delete photo', 21, 'delete_photo'),
(65, 'Can add snippet', 22, 'add_snippet'),
(66, 'Can change snippet', 22, 'change_snippet'),
(67, 'Can delete snippet', 22, 'delete_snippet'),
(68, 'Can add log entry', 23, 'add_logentry'),
(69, 'Can change log entry', 23, 'change_logentry'),
(70, 'Can delete log entry', 23, 'delete_logentry'),
(71, 'Can add links', 24, 'add_links'),
(72, 'Can change links', 24, 'change_links'),
(73, 'Can delete links', 24, 'delete_links'),
(74, 'Can add news', 25, 'add_news'),
(75, 'Can change news', 25, 'change_news'),
(76, 'Can delete news', 25, 'delete_news'),
(77, 'Can add imagem', 26, 'add_imagem'),
(78, 'Can change imagem', 26, 'change_imagem'),
(79, 'Can delete imagem', 26, 'delete_imagem');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'berlotto', '', '', 'sergio@berlotto.net', 'sha1$71753$87c61d89141b81a58d6fa7011ae472b4690220f6', 1, 1, 1, '2012-08-02 17:19:09', '2012-07-10 21:39:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Extraindo dados da tabela `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2012-07-10 22:14:09', 1, 25, '1', 'Go Back !', 1, ''),
(2, '2012-07-10 23:00:00', 1, 15, '1', 'Programação', 1, ''),
(3, '2012-07-10 23:01:09', 1, 15, '2', 'Open Source', 1, ''),
(4, '2012-07-10 23:02:04', 1, 15, '3', 'Eventos', 1, ''),
(5, '2012-07-10 23:36:33', 1, 16, '1', 'Blog do Gustavo Enrique', 1, ''),
(6, '2012-07-10 23:37:10', 1, 16, '2', 'ArchLinux Brasil', 1, ''),
(7, '2012-07-10 23:43:50', 1, 16, '3', 'Python Brasil', 1, ''),
(8, '2012-07-10 23:44:30', 1, 16, '4', 'Associação Software Livre', 1, ''),
(9, '2012-07-11 00:15:06', 1, 16, '5', 'Dango Sites', 1, ''),
(10, '2012-07-12 13:55:48', 1, 16, '6', 'CommandLineFu', 1, ''),
(11, '2012-07-14 23:35:37', 1, 15, '4', 'Tutoriais', 1, ''),
(12, '2012-07-14 23:35:44', 1, 18, '1', 'Cinnamon no ArchLinux', 1, ''),
(13, '2012-07-23 20:34:09', 1, 18, '2', 'Usando o Python com Virtualenv', 1, ''),
(14, '2012-07-23 20:37:09', 1, 18, '2', 'Usando o Python com Virtualenv', 2, 'Changed body.'),
(15, '2012-07-24 09:31:32', 1, 25, '3', 'Python e virtualenv', 1, ''),
(16, '2012-07-24 22:29:55', 1, 18, '3', 'Upvídeos', 1, ''),
(17, '2012-08-01 18:04:05', 1, 18, '4', 'Como aprender a programar com Python!', 1, ''),
(18, '2012-08-02 17:21:49', 1, 18, '5', 'Um pequeno resumo do Gabinete Digital no FISL13', 1, ''),
(19, '2012-08-02 17:26:50', 1, 18, '5', 'Um pequeno resumo do Gabinete Digital no FISL13', 2, 'Changed body and status.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_comments`
--

CREATE TABLE IF NOT EXISTS `django_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  `object_pk` longtext NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(75) NOT NULL,
  `user_url` varchar(200) NOT NULL,
  `comment` longtext NOT NULL,
  `submit_date` datetime NOT NULL,
  `ip_address` char(15) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_comments_1bb8f392` (`content_type_id`),
  KEY `django_comments_6223029` (`site_id`),
  KEY `django_comments_403f60f` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_comment_flags`
--

CREATE TABLE IF NOT EXISTS `django_comment_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `flag` varchar(30) NOT NULL,
  `flag_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`comment_id`,`flag`),
  KEY `django_comment_flags_403f60f` (`user_id`),
  KEY `django_comment_flags_64c238ac` (`comment_id`),
  KEY `django_comment_flags_111c90f9` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Extraindo dados da tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'message', 'auth', 'message'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'site', 'sites', 'site'),
(8, 'comment', 'comments', 'comment'),
(9, 'comment flag', 'comments', 'commentflag'),
(10, 'flat page', 'flatpages', 'flatpage'),
(11, 'tag', 'tagging', 'tag'),
(12, 'tagged item', 'tagging', 'taggeditem'),
(13, 'theme', 'django_yaba', 'theme'),
(14, 'configuration', 'django_yaba', 'configuration'),
(15, 'category', 'django_yaba', 'category'),
(16, 'links', 'django_yaba', 'links'),
(17, 'story', 'django_yaba', 'story'),
(18, 'article', 'django_yaba', 'article'),
(19, 'gallery', 'django_yaba', 'gallery'),
(20, 'item', 'django_yaba', 'item'),
(21, 'photo', 'django_yaba', 'photo'),
(22, 'snippet', 'dpaste', 'snippet'),
(23, 'log entry', 'admin', 'logentry'),
(24, 'links', 'encurtador', 'links'),
(25, 'news', 'website', 'news'),
(26, 'imagem', 'imagens', 'imagem');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_flatpage`
--

CREATE TABLE IF NOT EXISTS `django_flatpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `template_name` varchar(70) NOT NULL,
  `registration_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_flatpage_a4b49ab` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_flatpage_sites`
--

CREATE TABLE IF NOT EXISTS `django_flatpage_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flatpage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flatpage_id` (`flatpage_id`,`site_id`),
  KEY `django_flatpage_sites_21210108` (`flatpage_id`),
  KEY `django_flatpage_sites_6223029` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7d5e5d1c1c78b9010a975a39d4475c4f', 'NGI3Y2NlZjRiMzgxZWIzNTM5Njg4MzNmZjhmYTk0NTA1ZGJmMDZmOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-07-24 21:51:25'),
('1daa46bf865906e45f45a75ee4e34de4', 'MWMzMzQzMGM2NTcyMDE1OWU2ZGZiNjRmOWI3Njk0MmMwZjgxMmFjOTqAAn1xAShVDHNuaXBwZXRf\nbGlzdHECXXEDKIoBAYoBAooBA2VVCXVzZXJwcmVmc3EEfXEFKFUJZm9udF9zaXplcQZYAgAAADEy\ncQdVDGRlZmF1bHRfbmFtZXEIWAcAAABTw6lyZ2lvcQlVEWRpc3BsYXlfYWxsX2xleGVycQqJVQtm\nb250X2ZhbWlseXELWAQAAABOb25lcQxVC2xpbmVfaGVpZ2h0cQ1YBAAAAE5vbmVxDnVVEl9hdXRo\nX3VzZXJfYmFja2VuZHEPVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2Vu\nZHEQVQ1fYXV0aF91c2VyX2lkcRGKAQF1Lg==\n', '2012-07-26 15:22:13'),
('43b46201d896b4678e722f0d8022eca3', 'NGI3Y2NlZjRiMzgxZWIzNTM5Njg4MzNmZjhmYTk0NTA1ZGJmMDZmOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-08-07 22:28:39'),
('f36745e2b6cc865c1d229a2c22a1d113', 'NGI3Y2NlZjRiMzgxZWIzNTM5Njg4MzNmZjhmYTk0NTA1ZGJmMDZmOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-08-15 18:02:34'),
('da402dab080ff03bf2de25b958557104', 'NGI3Y2NlZjRiMzgxZWIzNTM5Njg4MzNmZjhmYTk0NTA1ZGJmMDZmOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-08-16 17:19:09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_yaba_article`
--

CREATE TABLE IF NOT EXISTS `django_yaba_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `body` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `buttoned` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `tweet_this` tinyint(1) NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `tags` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_yaba_article_56ae2a2a` (`slug`),
  KEY `django_yaba_article_5d52dd10` (`owner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `django_yaba_article`
--

INSERT INTO `django_yaba_article` (`id`, `title`, `slug`, `body`, `owner_id`, `status`, `buttoned`, `created`, `modified`, `tweet_this`, `enable_comments`, `tags`) VALUES
(1, 'Cinnamon no ArchLinux', 'cinnamon-no-archlinux', '<p>Ultimamente tenho trabalhado no meu note com muitos programas abertos, webserver, banco de dados, etc... o que deixou a coisa meio feia em quest&atilde;o de processamento e mem&oacute;ria, j&aacute; que meu note n&atilde;o &eacute; nada de mais. Ent&atilde;o procurei um jeito de amenizar isto trocando meu atual Gnome3 por um ambiente mais leve, n&atilde;o que o Gnome 3 seja pesado, longe disto, mas queria um mais leve ainda.</p>\r\n<p>Ent&atilde;o dei uma pesquisada por ai e lembrei que tinham falado muito bem do tal Cinnamon.</p>\r\n<p>O que &eacute; o Cinnamon ?</p>\r\n<p>O Cinnamon &eacute; um ambiente desktop que tem caracter&iacute;sticas avan&ccedil;adas e inovadoras mantendo a tradicional experi&ecirc;ncia do usu&aacute;rio. O seu layout &eacute; parecida ao tradicional Gnome 2, no entando a tecnologia utlizada &eacute; provida do novo Gnome Shel, que prov&ecirc; novas bibliotecas e um ambiente mais bonito. O foco &eacute; no usu&aacute;rio, querendo lhe dar um ambiente agrad&aacute;vel com uma &oacute;tima experi&ecirc;ncia no desktop.</p>\r\n<p>O Cinnamon, ainda vem crescendo, apesar de ter dado um belo salto j&aacute; neste sentido, utilizando ele senti que &eacute; um ambiente j&aacute; completo e est&aacute;vel, com muito poucos bugs e bem funcional.</p>\r\n<p>Ent&atilde;o vamos a instala&ccedil;&atilde;o dele no arch linux. No Arch este pacote ainda nao est&aacute; no community, mas ele &eacute; facilmente instalado pelo AUR (Arch Linux User Repository).</p>\r\n<pre>$ yaourt -S cinnamon </pre>\r\n<p>Beleza, agora j&aacute; temos o cinnamon instalado.</p>\r\n<p>Se voc&ecirc; utiliza algum login manager como Gdm ou Kdm ent&atilde;o o Cinnamon j&aacute; estar&aacute; dispon&iacute;vel, mas se utiliza algum outro como Slim por exemplo, coloque a seguinte linha no seu ~/.xinitrc</p>\r\n<pre>exec ck-launch-session gnome-session-cinnamon</pre>\r\n<p>E como o Gnome, o Cinnamon tamb&eacute;m possibilita acrescentar extens&otilde;es e temas, e voc&ecirc; pode encontr&aacute;-las no seguinte link: <a href="http://cinnamon-spices.linuxmint.com/">http://cinnamon-spices.linuxmint.com/</a>, mas al&eacute;m disto voc&ecirc; tamb&eacute;m pode instal&aacute;-las via AUR tamb&eacute;m (agrade&ccedil;a aos usu&aacute;rios dos ArchLinux!) veja na lista o que temos dispon&iacute;vel: <a href="http://aur.archlinux.org/packages.php?O=0&amp;K=cinnamon&amp;do_Search=Go">http://aur.archlinux.org/packages.php?O=0&amp;K=cinnamon&amp;do_Search=Go</a></p>\r\n<p>O Cinnamon &eacute; criado pelo time do LinuxMint e o reposit&oacute;rio do seu c&oacute;digo est&aacute; no GitHub ( <a href="https://github.com/linuxmint/Cinnamon/">https://github.com/linuxmint/Cinnamon/</a> ).</p>\r\n<p>Minha esposa me alertou que Cinnamon significa &ldquo;canela&rdquo;, e me disse que tem uma &oacute;tima receita de uns p&atilde;ezinhos chamados &ldquo;Cinnamon Rolls&rdquo;, ent&atilde;o ja''aproveito para deixar a dica ai tamb&eacute;m =&gt; <a href="http://pecadodagula.blogspot.com.br/2006/01/cinnamon-rolls.html">http://pecadodagula.blogspot.com.br/2006/01/cinnamon-rolls.html</a></p>\r\n<p>&Eacute; isto pessoal, agora comentem sobre este desktop e digam o que voc&ecirc;s acham dele. Contem-me alguma das suas experi&ecirc;ncias com ele.</p>', 1, 3, 0, '2012-07-14 23:31:54', '2012-07-14 23:31:54', 0, 1, ''),
(2, 'Usando o Python com Virtualenv', 'usando-o-python-com-virtualenv', '<p>Bom pessoal, o python muita gente j&aacute; conhece, mas alguns ainda n&atilde;o conhecem ou n&atilde;o sabem como utilizar o Virtualenv.<br /><br />O virtualenv &eacute; um programa que o ajuda a isolar um "set" de bibliotecas do seu ambiente padr&atilde;o do Python, ou seja, com ele voc&ecirc; consegue instalar, reinstalar, excluir e testar todo o tipo de libs sem que necessite de permiss&otilde;es de escrita no sistema padr&atilde;o, e sem afet&aacute;-lo tamb&eacute;m.<br /><br />&Eacute; muito simples instal&aacute;-lo, at&eacute; porque existe pacote para ele em praticamente todas as distribui&ccedil;&otilde;es linux. Mas o jeito mais f&aacute;cil e pythonista de fazer isto &eacute; instal&aacute;-lo pelo "pip".<br /><br />O pip &eacute; uma evolu&ccedil;&atilde;o do easy_install, os quais buscam e instalam bibliotecas python atrav&eacute;s do site http://pypi.python.org/pypi .<br /><br />Ent&atilde;o vamos l&aacute;, vamos montar um pequeno ambiente isolado com o FLask (um microframework web).<br /><br />Primeiramente voc&ecirc; necessita ter j&aacute; instalado o pacote "setuptools" do python.<br /><br />Agora instalmos o virtualenv com o comando abaixo:<br /><br /><span style="font-family: courier new,courier;"># pip install virtualenv</span><br /><br />Feito isto, podemos montar nosso ambiente, que vai se chamar "flask_env".<br /><br /><span style="font-family: courier new,courier;">$ virtualenv --no-site-packages flask_env</span><br /><br />Com este comando criamos um ambiente completamente isolado do ambiente geral do python instalado no sistema. Se tirar-mos o par&acirc;metro "--no-site-packages" criamos um ambiente que utiliza tamb&eacute;m as libs instaladas no sistema.<br /><br />Agora, para utilizar seu novo ambiente &eacute; necess&aacute;rio ativ&aacute;-lo, para isto use o comando abaixo:<br /><br /><span style="font-family: courier new,courier;">$ source flask_env/bin/activate</span><br /><br />Assim teremos um prompt mais ou menos neste formato:<br /><br /><span style="font-family: courier new,courier;">(flask_env)berlotto@darthvader ~ $</span> <br /><br />Isto nos informa que estamos utilizando o virtualenv chamado "flask_env". Nele &eacute; que vamos instalar as novas bibliotecas.<br /><br />Ent&atilde;o podemos utilizar o comando pip sem necessidade de utilizar o sudo.<br /><br /><span style="font-family: courier new,courier;">$ pip install flask</span><br /><br />O Flask ser&aacute; instalado a partir do diret&oacute;rio "flask_env".<br /><br />Agora podemos criar nossa aplica&ccedil;&atilde;o e tamb&eacute;m instalar todas as nossas bibliotecas necess&aacute;rias sem interferir na instala&ccedil;&atilde;o python do sistema.<br /><br />Ok ! Agora, para voltar-mos a utilizar nosso ambiente python padr&atilde;o do sistema, devemos desativar o virtualenv. Usamos o comando abaixo:<br /><br /><span style="font-family: courier new,courier;">$ deactivate</span><br /><br />Simples!<br /><br />Ent&atilde;o &eacute; isto, este &eacute; um pequeno tutorial para utilizar o virtualenv, depois vou fazer outro mostrando como utilizar o virtualenv-wrapper, um aplicativo usado para organizar v&aacute;rios ambientes virtuais.<br /><br />At&eacute; l&aacute;.</p>', 1, 3, 0, '2012-07-23 20:30:19', '2012-07-23 20:30:19', 0, 1, ''),
(3, 'Upvídeos', 'upvideos', '<p>O upvideos &eacute; um pequeno software de uploads de videos para serem visualizados embedded em outros sites.<br />A moral dele &eacute; ser um servidor de v&iacute;deos centralizado. Ou seja, voc&ecirc; sobe seus v&iacute;deos em uma m&aacute;quina que somente ir&aacute; fazer isto, e os utiliza incorporado em outro site.<br /><br />Ele n&atilde;o &eacute; feito para ser um youtube da vida, at&eacute; porque ele tem um admin simples e poucas fun&ccedil;&otilde;es, que s&atilde;o basicamente:<br /><br /></p>\r\n<ul>\r\n<li>upload de v&iacute;deos ogg</li>\r\n<li>visualiza&ccedil;&atilde;o do v&iacute;deo</li>\r\n<li>tamanho do v&iacute;deo e poster customiz&aacute;vel</li>\r\n<li>player de v&iacute;deo html5 j&aacute; incorporado</li>\r\n<li>c&oacute;digo de incorpora&ccedil;&atilde;o pronto</li>\r\n<li>exclus&atilde;o de v&iacute;deos</li>\r\n<li>visualiza&ccedil;&atilde;o do poster</li>\r\n<li>controle de login para upload , ativado ou desativado</li>\r\n</ul>\r\n<p><br />Basicamente ele foi feito para a equipe do site softwarelivre.org poder gerenciar mais facilmente seus v&iacute;deos e poder incorpor&aacute;-los no seu site que &eacute; Noosfero.<br /><br />Ele &eacute; feito com o framework Flask e utiliza o player ''videojs''.<br /><br />Seu c&oacute;digo est&aacute; dispon&iacute;vel via Git em: https://bitbucket.org/berlotto/upvideos<br /><br />Basta clonar o reposit&oacute;rio e utiliz&aacute;-lo como quiser, respeitando a GPLv3.<br /><br />Seria legal poder contar com mais alguem para melhorar ainda mais o projeto, pois ele est&aacute; funcional, mas bem simples. <br />Aguardo voc&ecirc;s!<br /><br /></p>', 1, 3, 0, '2012-07-24 22:28:45', '2012-07-24 22:28:45', 0, 1, 'flask,  python, git, vídeo, player'),
(4, 'Como aprender a programar com Python!', 'como-aprender-programar-com-python', '<p>Sabe, volta e meia alguem me pergunta sobre como aprender a programar em Python, principalmente por eu gostar desta linguagem, divulgar bastante isto e por ela estar crescendo muito em visibilidade nos ultimos tempos.<br /><br />Pois bem! Vamos aos pontos !<br /><br />A pergunta que geralmente surge &eacute;: Por onde eu come&ccedil;o para aprender a programar em Python ?<br /><br />Digo, DEPENTE ! Claro, depente de o quanto voc&ecirc; sabe sobre inform&aacute;tica em geral. Programar n&atilde;o &eacute; simplesmente soltar linhas de c&oacute;digo em um editor de texto ou ide completa, cheia de frescuras. Programar &eacute; unir muitas informa&ccedil;&otilde;es e conhecimentos em prol de resolver um problema, seja ele grande ou pequeno. Tudo o que voc&ecirc; sabe &eacute; utilizado na hora de programar, seu conhecimento de redes, sistemas operacionais, processadores, mem&oacute;ria ram, swap, etc. Mas o que rege a programa&ccedil;&atilde;o principalmente &eacute; sua matem&aacute;tica, seu conhecimento de l&oacute;gica.<br /><br />Algoritimos, veja trechos do que diz na wikipedia sobre este assunto:<br /><br />"Um algoritmo &eacute; uma sequ&ecirc;ncia finita de instru&ccedil;&otilde;es bem definidas e n&atilde;o amb&iacute;guas, cada uma das quais pode ser executada mecanicamente num per&iacute;odo de tempo finito e com uma quantidade de esfor&ccedil;o finita.<br /><br />Um algoritmo n&atilde;o representa, necessariamente, um programa de computador, e sim os passos necess&aacute;rios para realizar uma tarefa. Sua implementa&ccedil;&atilde;o pode ser feita por um computador, por outro tipo de aut&ocirc;mato ou mesmo por um ser humano."<br /><br />Ou seja, o algorimito &eacute; o conjunto de instru&ccedil;&otilde;es que resolvem um problema, os passos necess&aacute;rios para realizar uma tarefa. Em um programa de computador &eacute; o que rege prioritariamente o seu funcionamento. Voc&ecirc; precisa, antes de programar, saber o tipo de programa a se fazer, e o que tem que resolver para poder montar seu(s) algor&iacute;timo(s) e depois programar com sua linguagem preferida. Com o tempo, voc&ecirc; j&aacute; cria v&aacute;rios algoritimos na hora, e jai codificando, pois se pega experi&ecirc;ncia ao fazer isto todos os dias. Treino &eacute; importante, e esta &eacute; a raz&atilde;o de ser necess&aacute;rio fazer tantos exerc&iacute;cios.<br /><br />Tamb&eacute;m &eacute; importante voc&ecirc; saber sobre estrutura de dados, sobre a infra-estrutura que ter&aacute; dispon&iacute;vel para seu programa, se for um sistema Web, se for um sistema Desktop, se for um daemon, se for uma programa&ccedil;&atilde;o paralela e/ou em grid, etc, pois tamb&eacute;m isto influenciar&aacute; sua programa&ccedil;&atilde;o. Voc&ecirc; pode muito bem mesclar v&aacute;rias tecnologias destas como por exemplo fazer um sistema web que tem partes que rodam em paralelo.<br /><br />Na maioria dos casos que me dizem que nunca programaram, que tem pouco conhecimento de l&oacute;gica e tal, mas querem aprender Python &eacute; que procurem um curso T&eacute;cnico. Mas da&iacute; voc&ecirc; pergunta: --Mas tem tanto material na internet, porque n&atilde;o d&aacute; para aprender a programar assim ?<br />Minha resposta &eacute;: Voc&ecirc; j&aacute; viu um biol&oacute;go ou eletronico formado na internet, mesmo tendo uma imensid&atilde;o de material na internet ? Claro que n&atilde;o! Isto &eacute; porque aprender algo sobre um pequeno assunto, ou aprimorar seu conhecimento com novas experi&ecirc;ncias &eacute; realmente v&aacute;lido e o material da internet, sendo sempre muito bem selecionado, serve. Agora, buscar um conhecimento com de tamanha grandeza n&atilde;o &eacute; simples, e precisa mesmo de uma estrutura a mais do que a internet, de conhecimentos e explica&ccedil;&otilde;es que geralmente n&atilde;o se encontra na internet.<br /><br />Ent&atilde;o resumindo: se voc&ecirc; n&atilde;o sabe nada busque o conhecimento em um curso t&eacute;cnico, pague um pouco, invista em voc&ecirc;, e depois utilize seu conhecimento como base para se aprimorar com as experi&ecirc;ncias compartilhadas.<br /><br />Da&iacute; se voc&ecirc; tem algum conhecimento, agora podes vir me perguntar sobre Python ! <br />:-)</p>\r\n<p>E ai, o que voc&ecirc; acha sobre isto ? J&aacute; passou por alguma destas ?</p>', 1, 3, 0, '2012-08-01 18:02:43', '2012-08-01 18:02:43', 0, 1, 'python, curso'),
(5, 'Um pequeno resumo do Gabinete Digital no FISL13', 'gabinete-digital-fisl13', '<p><iframe style="border: 0;" src="http://gabinetedigital.rs.gov.br/videos/embed/67" width="490" height="290"></iframe></p>\r\n<p>O maior evento de tecnologia da Am&eacute;rica Latina discute software livre, dados abertos e liberdade na internet, com a presen&ccedil;a do vice-governador do RS, Beto Grill e a equipe do Gabinete Digital, a qual eu perten&ccedil;o atualmente.</p>', 1, 3, 1, '2012-08-02 17:19:24', '2012-08-02 17:19:24', 0, 1, 'fisl13, gabinete, governo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_yaba_article_category`
--

CREATE TABLE IF NOT EXISTS `django_yaba_article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`category_id`),
  KEY `django_yaba_article_category_30525a19` (`article_id`),
  KEY `django_yaba_article_category_42dc49bc` (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `django_yaba_article_category`
--

INSERT INTO `django_yaba_article_category` (`id`, `article_id`, `category_id`) VALUES
(1, 1, 2),
(2, 1, 4),
(6, 2, 4),
(5, 2, 1),
(7, 3, 2),
(8, 4, 1),
(10, 5, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_yaba_category`
--

CREATE TABLE IF NOT EXISTS `django_yaba_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_yaba_category_56ae2a2a` (`slug`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `django_yaba_category`
--

INSERT INTO `django_yaba_category` (`id`, `label`, `slug`) VALUES
(1, 'Programação', 'programacao'),
(2, 'Open Source', 'open-source'),
(3, 'Eventos', 'eventos'),
(4, 'Tutoriais', 'tutoriais');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_yaba_configuration`
--

CREATE TABLE IF NOT EXISTS `django_yaba_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `theme_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_yaba_configuration_56ae2a2a` (`slug`),
  KEY `django_yaba_configuration_1079d5be` (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_yaba_gallery`
--

CREATE TABLE IF NOT EXISTS `django_yaba_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `body` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `tags` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_yaba_gallery_56ae2a2a` (`slug`),
  KEY `django_yaba_gallery_5d52dd10` (`owner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_yaba_gallery_category`
--

CREATE TABLE IF NOT EXISTS `django_yaba_gallery_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gallery_id` (`gallery_id`,`category_id`),
  KEY `django_yaba_gallery_category_34838cc3` (`gallery_id`),
  KEY `django_yaba_gallery_category_42dc49bc` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_yaba_item`
--

CREATE TABLE IF NOT EXISTS `django_yaba_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_yaba_links`
--

CREATE TABLE IF NOT EXISTS `django_yaba_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `site_link` varchar(300) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_yaba_links_56ae2a2a` (`slug`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `django_yaba_links`
--

INSERT INTO `django_yaba_links` (`id`, `label`, `site_link`, `slug`) VALUES
(1, 'Blog do Gustavo Enrique', 'http://blog.gustavohenrique.net/', 'blog-do-gustavo-enrique'),
(2, 'ArchLinux Brasil', 'http://www.archlinux-br.org/', 'archlinux-brasil'),
(3, 'Python Brasil', 'http://www.python.org.br', 'python-brasil'),
(4, 'Associação Software Livre', 'http://softwarelivre.org/asl', 'associacao-software-livre'),
(5, 'Dango Sites', 'http://www.djangosites.org', 'dango-sites'),
(6, 'CommandLineFu', 'http://www.commandlinefu.com/commands/browse', 'commandlinefu');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_yaba_photo`
--

CREATE TABLE IF NOT EXISTS `django_yaba_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `caption` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_yaba_photo_34838cc3` (`gallery_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_yaba_story`
--

CREATE TABLE IF NOT EXISTS `django_yaba_story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `body` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `tweet_this` tinyint(1) NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `tags` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_yaba_story_56ae2a2a` (`slug`),
  KEY `django_yaba_story_5d52dd10` (`owner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_yaba_story_category`
--

CREATE TABLE IF NOT EXISTS `django_yaba_story_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `story_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `story_id` (`story_id`,`category_id`),
  KEY `django_yaba_story_category_a51ddd2` (`story_id`),
  KEY `django_yaba_story_category_42dc49bc` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_yaba_theme`
--

CREATE TABLE IF NOT EXISTS `django_yaba_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_yaba_theme_56ae2a2a` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dpaste_snippet`
--

CREATE TABLE IF NOT EXISTS `dpaste_snippet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `secret_id` varchar(4) NOT NULL,
  `title` varchar(120) NOT NULL,
  `author` varchar(30) NOT NULL,
  `content` longtext NOT NULL,
  `content_highlighted` longtext NOT NULL,
  `lexer` varchar(30) NOT NULL,
  `published` datetime NOT NULL,
  `expires` datetime NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `clicks` int(10) unsigned NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dpaste_snippet_63f17a16` (`parent_id`),
  KEY `dpaste_snippet_42b06ff6` (`lft`),
  KEY `dpaste_snippet_6eabc1a6` (`rght`),
  KEY `dpaste_snippet_102f80d8` (`tree_id`),
  KEY `dpaste_snippet_2a8f42e8` (`level`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `dpaste_snippet`
--

INSERT INTO `dpaste_snippet` (`id`, `secret_id`, `title`, `author`, `content`, `content_highlighted`, `lexer`, `published`, `expires`, `parent_id`, `clicks`, `lft`, `rght`, `tree_id`, `level`) VALUES
(1, 'SCRC', 'Mysql Backup/Recovery', 'Sérgio', '# Criar backup:\r\n\r\nmysqldump -u username -ppassword database_name > FILE.sql \r\n\r\n# Importar dump:\r\n\r\nmysql -u username -ppassword database_name < FILE.sql ', '<span class="c"># Criar backup:</span>\n\nmysqldump -u username -ppassword database_name &gt; FILE.sql \n\n<span class="c"># Importar dump:</span>\n\nmysql -u username -ppassword database_name &lt; FILE.sql \n', 'bash', '2012-07-11 13:50:01', '2111-02-03 13:50:01', NULL, 7, 1, 2, 1, 0),
(2, 'Qf9s', 'Debug no Wordpress', 'Sérgio', '#Altere/Cole as seguintes definicoes em wp-config.php\r\ndefine(''WP_DEBUG'',         true);  // Turn debugging ON\r\ndefine(''WP_DEBUG_DISPLAY'', false); // Turn forced display OFF\r\ndefine(''WP_DEBUG_LOG'',     true);  // Turn logging to wp-content/debug.log ON\r\n\r\n#Imprima assim se for um objeto\r\nerror_log( print_r( $myobject_or_array, true ) );\r\n\r\n#Imprima assim se for um texto\r\nerror_log( ''Minha mensagem e tal'' );\r\n', '<span class="x">#Altere/Cole as seguintes definicoes em wp-config.php</span>\n<span class="x">define(&#39;WP_DEBUG&#39;,         true);  // Turn debugging ON</span>\n<span class="x">define(&#39;WP_DEBUG_DISPLAY&#39;, false); // Turn forced display OFF</span>\n<span class="x">define(&#39;WP_DEBUG_LOG&#39;,     true);  // Turn logging to wp-content/debug.log ON</span>\n\n<span class="x">#Imprima assim se for um objeto</span>\n<span class="x">error_log( print_r( $myobject_or_array, true ) );</span>\n\n<span class="x">#Imprima assim se for um texto</span>\n<span class="x">error_log( &#39;Minha mensagem e tal&#39; );</span>\n', 'php', '2012-07-11 18:10:18', '2111-02-03 18:10:18', NULL, 9, 1, 2, 2, 0),
(3, 'v61e', 'Converção de Vìdeos', 'Sérgio', '#Extrair o MP3 de videos FLV\r\nffmpeg -i video.flv -vn -ar 44100 -ac 2 -ab 192k -f mp3 audio.mp3\r\n\r\n#Converter para avi\r\nmencoder your_video.flv -oac mp3lame -ovc xvid -lameopts preset=standard:fast -xvidencopts pass=1 -o your_video.avi', '<span class="c">#Extrair o MP3 de videos FLV</span>\nffmpeg -i video.flv -vn -ar 44100 -ac 2 -ab 192k -f mp3 audio.mp3\n\n<span class="c">#Converter para avi</span>\nmencoder your_video.flv -oac mp3lame -ovc xvid -lameopts <span class="nv">preset</span><span class="o">=</span>standard:fast -xvidencopts <span class="nv">pass</span><span class="o">=</span>1 -o your_video.avi\n', 'bash', '2012-07-12 12:10:34', '2111-02-04 12:10:34', NULL, 6, 1, 2, 3, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagens`
--

CREATE TABLE IF NOT EXISTS `imagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descricao` longtext NOT NULL,
  `data` date NOT NULL,
  `nome_arquivo` varchar(2000) NOT NULL,
  `tipo` varchar(5) NOT NULL,
  `acessos` int(11) NOT NULL,
  `arquivo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `short` varchar(255) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `acessos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `links`
--

INSERT INTO `links` (`id`, `url`, `short`, `data_criacao`, `acessos`) VALUES
(1, 'http://gabinetedigital.rs.gov.br', 'mtT3cInA', '2012-07-11 13:52:18', 8),
(2, 'http://berlotto.net/blog/article/cinnamon-no-archlinux/', 'ONuTmdMq', '2012-07-15 00:16:52', 25),
(3, 'http://fisl.org.br/13/papers_ng/public/fast_grid?event_id=3', 'geG2hlmk', '2012-07-16 09:57:16', 30),
(4, 'http://lassekongo83.deviantart.com/art/Zukitwo-203936861', 'Mfao0b83', '2012-07-18 11:39:00', 23),
(5, 'http://www.live365.com/genres/heavy%20metal', 'sz2GAv8R', '2012-07-18 11:43:48', 34),
(6, 'http://sistematico.org', 'oBNAkT9Y', '2012-07-18 16:39:32', 5),
(7, 'http://minhaurl.com.br', 'uYaTzXy8', '2012-07-18 16:39:54', 3),
(8, 'http://wp.clicrbs.com.br/grings/2012/07/20/show-historico-de-ozzy-osbourne-sera-lancado-em-dvd/?topo=52,1,1,,219,e219', 'tjs1eqGn', '2012-07-20 14:22:59', 27),
(9, 'http://berlotto.net/blog/article/usando-o-python-com-virtualenv/', 'KugXnBj7', '2012-07-23 21:36:13', 60),
(10, 'blah', 'gz6suSyp', '2012-08-09 22:27:31', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto` longtext NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `news`
--

INSERT INTO `news` (`id`, `texto`, `titulo`, `categoria`, `datetime`) VALUES
(1, 'Desculpem-me a demora pela volta do site ! Muitas coisas boas e não tão boa aconteceram neste meio tempo! Mas agora estamos de volta, e aos poucos iremos reconstruir todo um otimo conteúdo para vocês !', 'Go Back !', 'GERAL', '2012-07-10 22:14:09'),
(2, '<p>O Cinnamon &eacute; um belo ambiente desktop, conhe&ccedil;a ele e saiba como instal&aacute;-lo no ArchLinux. <a href="../../../../blog/article/cinnamon-no-archlinux/">http://berlotto.net/blog/article/cinnamon-no-archlinux/</a></p>', 'Conheça o Cinnamon', 'GERAL', '2012-07-16 09:59:25'),
(3, '<p>Agora um post mais t&eacute;cnico, sobre python e virtualenv para quem ainda n&atilde;o conhe&ccedil;e ! Vale a pena trabalhar com ele.</p>\r\n<p><a href="../../../../blog/article/usando-o-python-com-virtualenv/">http://berlotto.net/blog/article/usando-o-python-com-virtualenv/</a></p>', 'Python e virtualenv', 'GERAL', '2012-07-24 09:31:32');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tagging_tag`
--

CREATE TABLE IF NOT EXISTS `tagging_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `tagging_tag`
--

INSERT INTO `tagging_tag` (`id`, `name`) VALUES
(1, 'flask'),
(2, 'git'),
(3, 'player'),
(4, 'python'),
(5, 'vídeo'),
(6, 'curso'),
(7, 'fisl13'),
(8, 'gabinete'),
(9, 'governo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tagging_taggeditem`
--

CREATE TABLE IF NOT EXISTS `tagging_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_id` (`tag_id`,`content_type_id`,`object_id`),
  KEY `tagging_taggeditem_3747b463` (`tag_id`),
  KEY `tagging_taggeditem_1bb8f392` (`content_type_id`),
  KEY `tagging_taggeditem_7d61c803` (`object_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `tagging_taggeditem`
--

INSERT INTO `tagging_taggeditem` (`id`, `tag_id`, `content_type_id`, `object_id`) VALUES
(1, 1, 18, 3),
(2, 2, 18, 3),
(3, 3, 18, 3),
(4, 4, 18, 3),
(5, 5, 18, 3),
(6, 6, 18, 4),
(7, 4, 18, 4),
(8, 7, 18, 5),
(9, 8, 18, 5),
(10, 9, 18, 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
