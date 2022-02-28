-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 28 fév. 2022 à 21:53
-- Version du serveur :  10.4.18-MariaDB
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `announceprojet`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

CREATE TABLE `annonce` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomDeAnnonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `télephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatssap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isApprove` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `annonce`
--

INSERT INTO `annonce` (`id`, `titre`, `adress`, `description`, `nomDeAnnonce`, `télephone`, `whatssap`, `user_id`, `created_at`, `updated_at`, `isApprove`) VALUES
(54, 'Maison de 60 m²', 'agadir,morocco', 'Magnifique maison d\'architecte de 2 pièces, d\'une surface habitable de 60 m² (environ) de plain pied, au calme. CARACTÉRISTIQUES Prestations de luxe, excellent état, rénové. ENVIRONNEMENT Lumineux. PIÈCES Cuisine américaine, aménagée et [...]', 'amine', '+212619887328', '+212619887328', 7, '2022-02-27 23:44:23', '2022-02-28 15:52:17', 1),
(55, 'APPT A VENDRE A 2 MARS SUP 140M 3 CHAMBRES SANS VIS A VIS', 'casblanca,morocco', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années ', 'amine', '+2122346735', '+212619887328', 7, '2022-02-27 23:45:06', '2022-02-28 15:52:10', 1),
(58, 'appartement de 60 m2', 'safi,morocco', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années ', 'amine', '+21263936235', '+212619887328', 6, '2022-02-27 23:50:36', '2022-02-28 16:05:51', 1),
(59, 'Appartement à vendre racine', 'tanger,morocco', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années ', 'amine', '+2126363553', '+212619887328', 7, '2022-02-28 07:48:07', '2022-02-28 15:52:11', 1),
(60, 'Appartement à Bahia Saidia', 'ifrane,morocco', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années ', 'amine', '+2126345344', '+212619887328', 7, '2022-02-28 07:48:20', '2022-02-28 15:52:16', 1),
(61, 'Appartement de prestige en vente', 'fes,morocco', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années ', 'amine', '+2122342333', '+212619887328', 7, '2022-02-28 08:16:26', '2022-02-28 08:16:26', 1),
(62, 'CASA SUD VEND UN APPARTEMENT FAMILIAL 3 CHAMBRES à BON PRIX', 'rabat,morocco', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années ', 'amine', '+2126435343', '+212619887328', 7, '2022-02-28 08:16:52', '2022-02-28 08:16:52', 1),
(63, 'Maroc, Casa Sud saisissez cette Villa de 450m² à Petit prix', 'inzgan,morocco', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années ', 'amine', '+2126432423', '+212619887328', 7, '2022-02-28 08:17:04', '2022-02-28 16:08:59', 1),
(69, 'Confortable appartement F3 au centre ville - Pinchos', 'rabat,morroc', 'Appartement moderne et confortable situé en plein centre de la ville ocre.\r\nRésidence neuve et sécurisée.\r\nProche de toutes commodités.Compose deux chambres plus un salon, cuisine bien équipée, Salle de bais Et toilette.', 'amine', '+324622534', '+23423432423', 7, '2022-02-28 15:55:05', '2022-02-28 16:06:40', 0);

-- --------------------------------------------------------

--
-- Structure de la table `gallerie`
--

CREATE TABLE `gallerie` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `annonce_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gallerie`
--

INSERT INTO `gallerie` (`id`, `annonce_id`, `created_at`, `updated_at`, `img`) VALUES
(7, 54, '2022-02-27 23:44:23', '2022-02-27 23:44:23', 'images/annonceImg/img4.jpg'),
(8, 54, '2022-02-27 23:44:23', '2022-02-27 23:44:23', 'images/annonceImg/img5.jpg'),
(9, 54, '2022-02-27 23:44:23', '2022-02-27 23:44:23', 'images/annonceImg/img6.jpg'),
(17, 55, '2022-02-27 23:45:06', '2022-02-27 23:45:06', 'images/annonceImg/img7.jpg'),
(18, 55, '2022-02-27 23:45:06', '2022-02-27 23:45:06', 'images/annonceImg/img8.jpg'),
(19, 55, '2022-02-27 23:45:06', '2022-02-27 23:45:06', 'images/annonceImg/img9.jpg'),
(26, 58, '2022-02-27 23:50:36', '2022-02-27 23:50:36', 'images/annonceImg/img10.jpg'),
(27, 58, '2022-02-27 23:50:36', '2022-02-27 23:50:36', 'images/annonceImg/img11.jpg'),
(28, 59, '2022-02-28 07:48:07', '2022-02-28 07:48:07', 'images/annonceImg/img1.jpg'),
(29, 59, '2022-02-28 07:48:07', '2022-02-28 07:48:07', 'images/annonceImg/img2.jpg'),
(30, 59, '2022-02-28 07:48:07', '2022-02-28 07:48:07', 'images/annonceImg/img3.jpg'),
(31, 60, '2022-02-28 07:48:20', '2022-02-28 07:48:20', 'images/annonceImg/img12.jpg'),
(32, 60, '2022-02-28 07:48:20', '2022-02-28 07:48:20', 'images/annonceImg/img6.jpg'),
(33, 60, '2022-02-28 07:48:20', '2022-02-28 07:48:20', 'images/annonceImg/img9.jpg'),
(34, 61, '2022-02-28 08:16:26', '2022-02-28 08:16:26', 'images/annonceImg/img11.jpg'),
(35, 63, '2022-02-28 08:17:04', '2022-02-28 08:17:04', 'images/annonceImg/img6.jpg'),
(36, 62, NULL, NULL, 'images/annonceImg/img7.jpg'),
(41, 69, '2022-02-28 15:55:05', '2022-02-28 15:55:05', 'images/annonceImg/1646067305_guilherme-petri-PtOfbGkU3uI-unsplash.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_25_082238_create_users_table', 2),
(6, '2022_02_25_082303_create_annonces_table', 2),
(7, '2022_02_25_083510_create_galerie_table', 2),
(8, '2022_02_25_085159_add_is_approve_to_annonces_table', 3),
(9, '2022_02_26_011221_create_personal_access_tokens_table', 4),
(10, '2022_02_26_081220_create_annonce_table', 5),
(11, '2022_02_26_081732_create_gallerie_table', 6),
(12, '2022_02_26_082131_add_img_to_gallerie_table', 7),
(13, '2022_02_26_084827_add_is_approve_to_annonce_table', 8),
(14, '2022_02_27_185419_add_role_to_users_table', 9);

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\users', 1, 'auth_token', '7594606bcc515651424891eeb558781a4e9b8121bfe348e146a8cdc5e46786e8', '[\"*\"]', NULL, '2022-02-26 00:13:21', '2022-02-26 00:13:21'),
(2, 'App\\Models\\users', 3, 'auth_token', '60f3c9943ee115fec1fa47ee4d902ab98f78111ec49b0e25ff7d447385bf3375', '[\"*\"]', NULL, '2022-02-26 00:14:04', '2022-02-26 00:14:04'),
(3, 'App\\Models\\users', 3, 'auth_token', '6e4a3de77d794dec4d63d2d46d0fde97524eae29af581fbd1dff0226ed139d63', '[\"*\"]', NULL, '2022-02-26 06:45:07', '2022-02-26 06:45:07'),
(4, 'App\\Models\\users', 3, 'auth_token', 'ab38bab027c039879ac9bf036af44862b61921df4b9b2b1a369efd9feb1e1a63', '[\"*\"]', NULL, '2022-02-26 06:45:20', '2022-02-26 06:45:20'),
(5, 'App\\Models\\users', 3, 'auth_token', '896decee3e4a519380fa8de5479f09cb8af79719e1a459f64369aefac99359bd', '[\"*\"]', NULL, '2022-02-26 06:46:00', '2022-02-26 06:46:00'),
(6, 'App\\Models\\users', 4, 'auth_token', 'eacaa923d55b1cb9e851c0f687d5e6df9ab080ac01485f28dafa9105fe0d80c8', '[\"*\"]', NULL, '2022-02-26 07:07:20', '2022-02-26 07:07:20'),
(7, 'App\\Models\\users', 5, 'auth_token', '41eeebe669a95c37f4d093cf514dda686dd943c7293b8711277ecf1aa2ba56a3', '[\"*\"]', NULL, '2022-02-26 07:23:19', '2022-02-26 07:23:19'),
(8, 'App\\Models\\users', 5, 'auth_token', 'a44ee26ccdc080902b67f2ddc057d81e8270c829863d0d0c891ed195944b586f', '[\"*\"]', NULL, '2022-02-26 07:41:03', '2022-02-26 07:41:03'),
(9, 'App\\Models\\users', 5, 'auth_token', '94c4d80b2e4e50be9c190faad9787ea0931d4b7e1576f7bf04c968e2dbf26369', '[\"*\"]', NULL, '2022-02-26 07:41:45', '2022-02-26 07:41:45'),
(10, 'App\\Models\\users', 5, 'auth_token', 'a51f61eb81f67f8350b119c2a7becfcf4d2febef5996fea9c3ed925dcf6c3ba3', '[\"*\"]', NULL, '2022-02-26 07:41:47', '2022-02-26 07:41:47'),
(11, 'App\\Models\\users', 5, 'auth_token', '943d04ea40086ce0b401ca2289767bcf82f1a2650789309e3e23e0b0f9ac4952', '[\"*\"]', NULL, '2022-02-26 07:41:55', '2022-02-26 07:41:55'),
(12, 'App\\Models\\users', 5, 'auth_token', '04b485b317af5dd14b9aecf24731a6fbab8b54c606c07c6d9fd273a14f28db0b', '[\"*\"]', NULL, '2022-02-26 07:42:40', '2022-02-26 07:42:40'),
(13, 'App\\Models\\users', 5, 'auth_token', 'fc43eb79775f2cc19a7da15ec7e4cab431271eb8aba9f35ab2565da39303c93d', '[\"*\"]', NULL, '2022-02-26 07:43:00', '2022-02-26 07:43:00'),
(14, 'App\\Models\\users', 5, 'auth_token', 'c325434686ff32ea79be07a6250df2d0eb1f0308801b61fa208acfc8f58442da', '[\"*\"]', NULL, '2022-02-26 07:43:07', '2022-02-26 07:43:07'),
(15, 'App\\Models\\users', 6, 'auth_token', '0e8cbf2a80196ff59bfdcb7a322ef7cdb7bcbe26a9de782bdeb2937c42b9d42d', '[\"*\"]', NULL, '2022-02-26 07:44:11', '2022-02-26 07:44:11'),
(16, 'App\\Models\\users', 5, 'auth_token', 'fe8390497b8f26db2888cbf6729c66ba9c8973b607933a2b9cade2fa19604a09', '[\"*\"]', NULL, '2022-02-26 07:44:19', '2022-02-26 07:44:19'),
(17, 'App\\Models\\users', 5, 'auth_token', '4de37bbf99c8b13666896bb1b748ce1a267c3a7ed6d3fbc96ee4316624d9ed78', '[\"*\"]', NULL, '2022-02-26 07:44:31', '2022-02-26 07:44:31'),
(18, 'App\\Models\\users', 7, 'auth_token', 'a892e55bcfddf7bde2d3abfc746b7d758e02a1a41bcec4cc645c0cc014fa73b2', '[\"*\"]', NULL, '2022-02-27 16:48:16', '2022-02-27 16:48:16'),
(19, 'App\\Models\\users', 8, 'auth_token', 'bdbbe1aff3d04915ae0be477c56bd957104ba165b8d6ab1120f9c832df42f515', '[\"*\"]', NULL, '2022-02-27 16:52:08', '2022-02-27 16:52:08'),
(20, 'App\\Models\\users', 9, 'auth_token', 'fe19835f5dc5e4a4577a3cfd54ff1e0fe44409fc92d93e2e5c1cb3d0dfdf5acb', '[\"*\"]', NULL, '2022-02-27 16:52:48', '2022-02-27 16:52:48'),
(21, 'App\\Models\\users', 7, 'auth_token', 'ad43372772e45fb42fdcafe4caecf79ff0e8ffe056ba4b5ab30a078856d198e9', '[\"*\"]', NULL, '2022-02-27 17:03:25', '2022-02-27 17:03:25'),
(22, 'App\\Models\\users', 7, 'auth_token', '7e0b0cf9e4222647b0bada0b51781297feff5fc5c302c0b5b6736bfe1970c769', '[\"*\"]', NULL, '2022-02-27 17:04:29', '2022-02-27 17:04:29'),
(23, 'App\\Models\\users', 10, 'auth_token', 'cae139f6f1cea599247074b5de8ca8535327a1a450c03dad0048207753a819eb', '[\"*\"]', NULL, '2022-02-27 17:19:25', '2022-02-27 17:19:25'),
(24, 'App\\Models\\users', 11, 'auth_token', '4db5221eebe5b11e550fdd6c68cc44a73aa55b29e7b121dd6bcf874f52b3b815', '[\"*\"]', NULL, '2022-02-27 17:20:23', '2022-02-27 17:20:23'),
(25, 'App\\Models\\users', 7, 'auth_token', '0ac329537351e1564b6b4706cb76f83197ddca8586282030c781f91443c41bb2', '[\"*\"]', NULL, '2022-02-27 17:21:14', '2022-02-27 17:21:14'),
(26, 'App\\Models\\users', 7, 'auth_token', 'd2eb035f2cf7bcadd04827b18754a1adbf40add5c9f0feae13170a798f4af350', '[\"*\"]', NULL, '2022-02-27 17:22:01', '2022-02-27 17:22:01'),
(27, 'App\\Models\\users', 7, 'auth_token', 'e873f5d4e3af5f56c31317f835d9e446475284644f0ccc02a6d8a949b15318e0', '[\"*\"]', NULL, '2022-02-27 17:23:12', '2022-02-27 17:23:12'),
(28, 'App\\Models\\users', 7, 'auth_token', '8cd95d4244bc50b23c0fa0ea4b8a35cc97abb88aeb49e096e3d0b3af696adfa8', '[\"*\"]', NULL, '2022-02-27 17:24:04', '2022-02-27 17:24:04'),
(29, 'App\\Models\\users', 7, 'auth_token', 'a0fb9d6e4ec121606c44e7bd3691d7078e63c98945641658f11c6e057d913c8e', '[\"*\"]', NULL, '2022-02-27 17:24:16', '2022-02-27 17:24:16'),
(30, 'App\\Models\\users', 7, 'auth_token', '0a049352f2339d4298fd71b5ca3cd6f754a865d9affd2208e8e7f93c09a785f7', '[\"*\"]', NULL, '2022-02-27 17:24:30', '2022-02-27 17:24:30'),
(31, 'App\\Models\\users', 7, 'auth_token', '35b0f2ac5155bd0e0d8a9598cd3dfe0bd8cac203c5d151149e960b4a0f7314d2', '[\"*\"]', '2022-02-27 17:56:01', '2022-02-27 17:24:48', '2022-02-27 17:56:01'),
(32, 'App\\Models\\users', 7, 'auth_token', '20d2b10dab4e5768532d85e6131419c65b5b5c9d3706f80f9847cc6956337fbd', '[\"*\"]', '2022-02-27 18:22:06', '2022-02-27 17:57:16', '2022-02-27 18:22:06'),
(33, 'App\\Models\\users', 7, 'auth_token', 'bf1b9e781a988565e4325c6d14018a8102a69d20b29d4b652618dd5a32ec3ae5', '[\"*\"]', '2022-02-27 18:23:17', '2022-02-27 18:23:14', '2022-02-27 18:23:17'),
(34, 'App\\Models\\users', 7, 'auth_token', 'f2241e499799b766f1c7f9ddd3ac9c6443c65ca4bd5f60bc8e92a6b2d635f26c', '[\"*\"]', '2022-02-27 18:23:38', '2022-02-27 18:23:35', '2022-02-27 18:23:38'),
(35, 'App\\Models\\users', 7, 'auth_token', '6a95c5da7041bd631769f4272b55ac1afe831e6f75a13e8130113f74c7a851b5', '[\"*\"]', '2022-02-27 19:51:38', '2022-02-27 18:24:06', '2022-02-27 19:51:38'),
(36, 'App\\Models\\users', 7, 'auth_token', 'cb13111c4a3f023f6b0d3ed1ed0e49243834cb58d3613526f4750b98595a8d93', '[\"*\"]', '2022-02-28 00:22:11', '2022-02-27 19:51:55', '2022-02-28 00:22:11'),
(37, 'App\\Models\\users', 7, 'auth_token', 'cc9febf463c382b00dcbf9bd5243d90bf2ee822d0c5e73a659a66c1d05778334', '[\"*\"]', '2022-02-28 15:45:06', '2022-02-28 07:04:09', '2022-02-28 15:45:06'),
(38, 'App\\Models\\users', 12, 'auth_token', '5a969c64d860fcc372de1e2cb540a75c5a082c09418718d91584143400362c3d', '[\"*\"]', '2022-02-28 15:52:44', '2022-02-28 15:49:35', '2022-02-28 15:52:44'),
(39, 'App\\Models\\users', 7, 'auth_token', 'ba8a9fa5c0acf37262e404357af9b27eae50af505b2bc8625fc420382c956723', '[\"*\"]', '2022-02-28 15:56:28', '2022-02-28 15:52:55', '2022-02-28 15:56:28'),
(40, 'App\\Models\\users', 12, 'auth_token', '6145024ffade8575c8c0395c2285a6db33d64d85c1c15cbc2ebf5d8c5544edb5', '[\"*\"]', '2022-02-28 16:18:00', '2022-02-28 15:56:44', '2022-02-28 16:18:00');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prénome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `raisonsocial` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `prénome`, `age`, `raisonsocial`, `email`, `password`, `created_at`, `updated_at`, `role`) VALUES
(5, 'hassan', 'saji', 25, 'test', 'faical@gmail.com', '$2y$10$q0I0KOtknpXx8yL6ZBkb/epTUwG9oNnLccIHPeyAnTSfiQTswFsvC', '2022-02-26 07:23:19', '2022-02-26 07:23:19', 'user'),
(6, 'redoine', 'ghazir', 25, 'test', 'amine@gmail.com', '$2y$10$46qpm3IKnnes3twVp9uBF.dFwfIuKLpX/h.TJXnXlPEH5K08e8cHu', '2022-02-26 07:44:11', '2022-02-26 07:44:11', 'user'),
(7, 'amine', 'saissi', 77, 'loem', 'abcd@gmail.com', '$2y$10$HswVhR5eJpOfkWDMmlplcOV/5FKyLGhiDQB5hSvhMPKsCTRTRDOd6', '2022-02-27 16:48:16', '2022-02-27 16:48:16', 'user'),
(12, 'faical', 'bahsis', 25, 'lorem', 'faical123@gmail.com', '$2y$10$Ps4auzuMYu4dqx8qXaoBnePZXkJMudt2LFTk1rF/sLMB/H/QtqB/W', '2022-02-28 15:49:35', '2022-02-28 15:49:35', 'admin');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD PRIMARY KEY (`id`),
  ADD KEY `annonce_user_id_foreign` (`user_id`);

--
-- Index pour la table `gallerie`
--
ALTER TABLE `gallerie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallerie_annonce_id_foreign` (`annonce_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `annonce`
--
ALTER TABLE `annonce`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pour la table `gallerie`
--
ALTER TABLE `gallerie`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD CONSTRAINT `annonce_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `gallerie`
--
ALTER TABLE `gallerie`
  ADD CONSTRAINT `gallerie_annonce_id_foreign` FOREIGN KEY (`annonce_id`) REFERENCES `annonce` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
