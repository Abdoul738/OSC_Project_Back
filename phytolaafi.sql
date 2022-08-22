-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 19 août 2022 à 15:48
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `phytolaafi`
--

-- --------------------------------------------------------

--
-- Structure de la table `ApphytoApp_donneestr`
--

CREATE TABLE `ApphytoApp_donneestr` (
  `id` bigint(20) NOT NULL,
  `temp` double NOT NULL,
  `hamb` double NOT NULL,
  `hsol` double NOT NULL,
  `teau` double DEFAULT NULL,
  `nitr` double DEFAULT NULL,
  `phos` double DEFAULT NULL,
  `pota` double DEFAULT NULL,
  `capteur_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ApphytoApp_donneestr`
--

INSERT INTO `ApphytoApp_donneestr` (`id`, `temp`, `hamb`, `hsol`, `teau`, `nitr`, `phos`, `pota`, `capteur_id_id`) VALUES
(1, 27, 50, 50, 50, 50, 50, 50, 1),
(2, 27, 50, 50, 50, 50, 0, 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `ApphytoApp_equipement`
--

CREATE TABLE `ApphytoApp_equipement` (
  `id` bigint(20) NOT NULL,
  `idcapteur` varchar(20) NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `user_id_id` bigint(20) NOT NULL,
  `lat` bigint(20) DEFAULT NULL,
  `lng` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ApphytoApp_equipement`
--

INSERT INTO `ApphytoApp_equipement` (`id`, `idcapteur`, `statut`, `user_id_id`, `lat`, `lng`) VALUES
(1, 'cap001', 0, 1, 1, 1),
(2, 'cap002', 0, 2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ApphytoApp_users`
--

CREATE TABLE `ApphytoApp_users` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ApphytoApp_users`
--

INSERT INTO `ApphytoApp_users` (`id`, `nom`, `prenom`, `email`, `contact`) VALUES
(1, 'NANA', 'Abdoul', 'abdoul@gmail.com', '75632972'),
(2, 'ILBOUDO', 'Martin', 'martin@gmail.com', '77591525'),
(3, 'test', 'Martin', 'martin@gmail.com', '77591525'),
(5, 'Kiendrebeogo', 'Theo', 'theo@gmail.com', '02029931');

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add users', 7, 'add_users'),
(26, 'Can change users', 7, 'change_users'),
(27, 'Can delete users', 7, 'delete_users'),
(28, 'Can view users', 7, 'view_users'),
(29, 'Can add equipement', 8, 'add_equipement'),
(30, 'Can change equipement', 8, 'change_equipement'),
(31, 'Can delete equipement', 8, 'delete_equipement'),
(32, 'Can view equipement', 8, 'view_equipement'),
(33, 'Can add donneestr', 9, 'add_donneestr'),
(34, 'Can change donneestr', 9, 'change_donneestr'),
(35, 'Can delete donneestr', 9, 'delete_donneestr'),
(36, 'Can view donneestr', 9, 'view_donneestr'),
(37, 'Can add analyse', 10, 'add_analyse'),
(38, 'Can change analyse', 10, 'change_analyse'),
(39, 'Can delete analyse', 10, 'delete_analyse'),
(40, 'Can view analyse', 10, 'view_analyse');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$fiyraBodxATCEt9NDPFNFl$PjLa72Xpkkq+6RMoftb++T0HvVM1JMde06rewow6JbA=', '2022-08-17 11:55:14.506919', 1, 'anonymous', '', '', 'faycalnana1@gmail.com', 1, 1, '2022-08-17 11:53:30.507777');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-08-17 13:37:52.912969', '1', 'users object (1)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-08-17 18:34:20.887659', '1', 'users object (1)', 2, '[]', 7, 1),
(3, '2022-08-17 18:34:45.585711', '1', 'equipement object (1)', 1, '[{\"added\": {}}]', 8, 1),
(4, '2022-08-17 19:26:08.805347', '1', 'donneestr object (1)', 1, '[{\"added\": {}}]', 9, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(10, 'ApphytoApp', 'analyse'),
(9, 'ApphytoApp', 'donneestr'),
(8, 'ApphytoApp', 'equipement'),
(7, 'ApphytoApp', 'users'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-08-17 11:49:14.333592'),
(2, 'auth', '0001_initial', '2022-08-17 11:49:14.819304'),
(3, 'admin', '0001_initial', '2022-08-17 11:49:14.981535'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-08-17 11:49:15.002469'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-08-17 11:49:15.021403'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-08-17 11:49:15.082799'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-08-17 11:49:15.138881'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-08-17 11:49:15.195067'),
(9, 'auth', '0004_alter_user_username_opts', '2022-08-17 11:49:15.211178'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-08-17 11:49:15.258555'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-08-17 11:49:15.263126'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-08-17 11:49:15.277190'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-08-17 11:49:15.295936'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-08-17 11:49:15.321259'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-08-17 11:49:15.344209'),
(16, 'auth', '0011_update_proxy_permissions', '2022-08-17 11:49:15.360713'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-08-17 11:49:15.383260'),
(18, 'sessions', '0001_initial', '2022-08-17 11:49:15.415069'),
(19, 'ApphytoApp', '0001_initial', '2022-08-17 13:23:42.742418'),
(20, 'ApphytoApp', '0002_equipement', '2022-08-17 16:34:14.542992'),
(21, 'ApphytoApp', '0003_rename_users_equipement_user_id_equipement_lat_and_more', '2022-08-17 18:23:58.970658'),
(22, 'ApphytoApp', '0004_alter_analyse_date_analyse_alter_analyse_img_url_and_more', '2022-08-17 18:29:59.811852');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('17hrd1lfs6x02zi4y3j94uuackce0q4l', '.eJxVjEsOwjAMBe-SNYpSF-fDkn3PUMV2TAqolfpZIe4OlbqA7ZuZ9zJ93tbab0uZ-0HMxTTm9LtR5kcZdyD3PN4my9O4zgPZXbEHXWw3SXleD_fvoOalfmufPQPF0mpogyCkhOgCkFdhjeSAtJFI2jKonL0EdegYOCdMCCjm_QHu-zg-:1oOHdi:prwnaKuzKdlgk7mKcB55JPMVo6hLgXDvzg1Y9pjKImg', '2022-08-31 11:55:14.512741');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ApphytoApp_donneestr`
--
ALTER TABLE `ApphytoApp_donneestr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ApphytoApp_donneestr_capteur_id_id_b1e66e01_fk_ApphytoAp` (`capteur_id_id`);

--
-- Index pour la table `ApphytoApp_equipement`
--
ALTER TABLE `ApphytoApp_equipement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ApphytoApp_equipement_user_id_id_7b35cecf_fk_ApphytoApp_users_id` (`user_id_id`);

--
-- Index pour la table `ApphytoApp_users`
--
ALTER TABLE `ApphytoApp_users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ApphytoApp_donneestr`
--
ALTER TABLE `ApphytoApp_donneestr`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `ApphytoApp_equipement`
--
ALTER TABLE `ApphytoApp_equipement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `ApphytoApp_users`
--
ALTER TABLE `ApphytoApp_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ApphytoApp_donneestr`
--
ALTER TABLE `ApphytoApp_donneestr`
  ADD CONSTRAINT `ApphytoApp_donneestr_capteur_id_id_b1e66e01_fk_ApphytoAp` FOREIGN KEY (`capteur_id_id`) REFERENCES `ApphytoApp_equipement` (`id`);

--
-- Contraintes pour la table `ApphytoApp_equipement`
--
ALTER TABLE `ApphytoApp_equipement`
  ADD CONSTRAINT `ApphytoApp_equipement_user_id_id_7b35cecf_fk_ApphytoApp_users_id` FOREIGN KEY (`user_id_id`) REFERENCES `ApphytoApp_users` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
