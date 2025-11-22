-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2025 at 07:27 AM
-- Server version: 10.11.11-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `djangodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_permission`
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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add Query', 6, 'add_queries'),
(22, 'Can change Query', 6, 'change_queries'),
(23, 'Can delete Query', 6, 'delete_queries'),
(24, 'Can view Query', 6, 'view_queries'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add Transaction', 8, 'add_transaction'),
(30, 'Can change Transaction', 8, 'change_transaction'),
(31, 'Can delete Transaction', 8, 'delete_transaction'),
(32, 'Can view Transaction', 8, 'view_transaction'),
(33, 'Can add Request', 9, 'add_request'),
(34, 'Can change Request', 9, 'change_request'),
(35, 'Can delete Request', 9, 'delete_request'),
(36, 'Can view Request', 9, 'view_request');

-- --------------------------------------------------------

--
-- Table structure for table `core_queries`
--

CREATE TABLE `core_queries` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `issue` longtext NOT NULL,
  `phone` varchar(10) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_queries`
--

INSERT INTO `core_queries` (`id`, `name`, `email`, `issue`, `phone`, `query`) VALUES
(2, 'The sporty musician', 'alex@gmail.com', 'About site', '7658765908', 'This site is beautiful');

-- --------------------------------------------------------

--
-- Table structure for table `core_request`
--

CREATE TABLE `core_request` (
  `id` int(11) NOT NULL,
  `reason` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `applicant_id_id` bigint(20) NOT NULL,
  `pet_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_request`
--

INSERT INTO `core_request` (`id`, `reason`, `status`, `applicant_id_id`, `pet_id_id`) VALUES
(1, 'i need it', 'Approved', 2, 2),
(2, 'i need it', 'Approved', 2, 1),
(3, 'i need it', 'Rejected', 4, 2),
(4, 'i need it', 'Rejected', 4, 1),
(5, 'i need it', 'Pending', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `core_transaction`
--

CREATE TABLE `core_transaction` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  `img` varchar(100) NOT NULL,
  `animal_type` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `donor_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_transaction`
--

INSERT INTO `core_transaction` (`id`, `name`, `desc`, `img`, `animal_type`, `status`, `donor_id_id`) VALUES
(1, 'Skyler', '\"Meet skyler, a 8 year old with a playful and affectionate personality! He loves to [mention specific activities like playing fetch, going for walks, or cuddling] and is known for [mention positive traits like being gentle, friendly, or intelligent]. skyler is  like being a good fit for a home with children or other pets and is looking for their forever family to share adventures with.\"', 'pics/Screenshot_2025-03-07_145112_fWGgATs.png', 'Dog', 'Accepted', 1),
(2, 'Kittu', 'Meet Kittu – Your Perfect Feline Friend! 🐾  Kittu is a charming and affectionate cat looking for a loving forever home! With his soft fur, playful personality, and gentle purrs, he will quickly become your best companion. Kittu loves to explore his surroundings, chase after toys, and curl up for cozy naps.  He is well-behaved, litter-trained, and enjoys both playtime and quiet moments. Whether you\'re looking for a fun-loving friend or a cuddle buddy, Kittu is the perfect choice. If you\'re ready to give this sweet cat a warm and caring home, Kittu is ready to fill your life with joy and companionship!  🐱 Age: 1 year old 🐾 Personality: Playful, loving, and curious 🏡 Ideal Home: A caring family or individual who can provide love and attention  Adopt Kittu today and bring home a lifetime of love! 💕', 'pics/images_1_yEHLezV.jpeg', 'Cat', 'Accepted', 1),
(3, 'Bully', 'Meet Bully – A Loving 2-Year-Old Pitbull Ready for a Forever Home!  Bully is a strong, sweet, and affectionate 2-year-old pitbull with a heart full of love and loyalty. He’s full of energy and enjoys outdoor walks, playtime, and belly rubs. Despite his tough name, Bully is a gentle soul who gets along well with people and loves cuddles.  He is healthy, fully vaccinated, and has been trained in basic commands. Bully would thrive in a home where he gets plenty of attention, exercise, and love. Whether you\'re looking for a loyal companion or a fun-loving buddy, Bully is ready to be your best friend.  Give Bully a second chance at happiness — adopt him today and bring home a bundle of joy!', 'pics/download.jpeg', 'Dog', 'Pending', 1),
(4, 'Sporty', 'Meet Sporty – Your Playful, Purring Companion! 🐾  Say hello to Sporty, a vibrant and energetic 1-year-old feline with a heart full of love and paws always ready to play! True to his name, Sporty is always on the move – whether he\'s chasing his favorite toy, exploring every nook and cranny, or showing off his zoomies around the house.  This charming boy has a sleek coat, bright curious eyes, and a personality that lights up any room. He adores playtime, but also knows when it’s time to curl up beside you for cuddles and purrs. Sporty gets along well with people and would thrive in a loving home where he can stay active and get lots of affection.  He’s litter-trained, up to date on vaccinations, and ready to find his forever home. If you\'re looking for a furry friend who will keep you entertained, make you smile, and fill your heart with joy — Sporty is the one!  Adopt Sporty today and add some excitement (and a lot of love) to your life! ❤️', 'pics/49748610_986486438204237_6777699179942274812_n-5c4b811fc9e77c0001f32142.jpg', 'Cat', 'Pending', 2),
(5, 'Tuttu', 'Meet Tuttu – Your Colorful, Chatty Feathered Friend! 🦜  Say hello to Tuttu, a lively and intelligent 1-year-old parrot who’s ready to find a forever home filled with love, attention, and plenty of chatter! Tuttu is a social sweetheart who loves to mimic sounds, whistle cheerful tunes, and interact with people around him.  With his vibrant feathers and curious personality, Tuttu is not just a pet – he\'s a little entertainer who’ll brighten up your day with his playful antics and gentle chirps. He enjoys being talked to, munching on fresh fruits, and flapping around during playtime.  Tuttu is healthy, alert, and adapting well to routine training. He would be a great companion for someone who has the time and patience to continue nurturing his social skills and keep him mentally stimulated.  If you’re looking for a feathered buddy who brings joy, color, and personality into your life, Tuttu is the perfect match!  Adopt Tuttu today – and gain a loyal, chatty companion with wings full of love! 💚', 'pics/images_2.jpeg', 'Parrot', 'Pending', 4),
(6, 'Duckling', 'Meet Duckling – A Quirky, Quacky Companion Ready for a New Home! 🦆  Say hello to Duckling, a charming 1-year-old duck with a big personality and an even bigger heart! Don’t let the name fool you—Duckling may be all grown up, but he still carries that adorable, playful spirit of a baby duck.  Duckling loves waddling around the yard, splashing in shallow water, and relaxing in the sun. He’s friendly, calm, and curious—often following people around like a loyal little sidekick. Whether he’s foraging in the garden or softly quacking as he explores, he brings a peaceful, cheerful vibe wherever he goes.  Duckling gets along well with other ducks and farm animals, and he would thrive in a safe outdoor space where he can roam freely and be part of the family routine. He’s healthy, low-maintenance, and full of gentle charm.  If you’ve been dreaming of a lovable farm friend or a sweet backyard buddy, Duckling is waiting to waddle into your life!  Adopt Duckling today – and bring home a quack-tastic little pal! 💛', 'pics/European-wigeon.webp', 'Duck', 'Pending', 4),
(7, 'Rocky', 'Meet Rocky – A Playful, Energetic Squirrel with a Heart Full of Curiosity! 🐿️  Introducing Rocky, a 2-year-old squirrel who’s bursting with energy, charm, and a sense of adventure! With his bright eyes, fluffy tail, and fearless spirit, Rocky is the definition of wild fun in a small, adorable package.  Rocky is incredibly curious and always on the move—he loves to explore, climb, and interact with his surroundings. Whether he’s darting through branches, nibbling on treats, or peeking out to say hello, Rocky brings life and laughter to any space he calls home.  He’s comfortable around humans and can form strong bonds with gentle care and patience. Rocky thrives best in an enriched environment, ideally with safe outdoor access or a large, secure enclosure where he can climb, forage, and express his natural behaviors.  If you’re looking for a unique companion who’s full of character and charm, Rocky is ready to leap into your life and steal your heart with every twitch of his tail.  Adopt Rocky today – your playful forest friend is waiting! 🌰🍂', 'pics/istock-115796521-ab56cfd5611f3b604708c444248c91414f648ba4.jpg', 'Squirrel', 'Pending', 5),
(8, 'Chottu', 'Meet Chottu – The Lovable Goat with a Big Heart! 🐐💚  Introducing Chottu, a 4-year-old goat with a cheerful spirit and a whole lot of love to give! Chottu is gentle, affectionate, and full of personality. Whether he\'s playfully hopping around the yard or enjoying a quiet moment munching on fresh greens, he always brings a smile to everyone’s face.  Chottu is used to being around people and other animals, and he’s very social by nature. He enjoys being petted, responds to his name, and may even follow you around like a faithful friend. He’s calm and easy to care for, making him a great addition to any small farm or animal-loving household with space to roam.  Healthy, active, and full of charm, Chottu is looking for a forever home where he’ll be loved and well cared for. He would do best in a space with shelter, open area for grazing, and maybe even a few goat friends to keep him company.  Adopt Chottu – and bring home not just a goat, but a joyful companion! 🌾❤️', 'pics/goat9-1.jpg', 'Goat', 'Pending', 5);

-- --------------------------------------------------------

--
-- Table structure for table `core_user`
--

CREATE TABLE `core_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `area` varchar(500) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_user`
--

INSERT INTO `core_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `area`, `city`, `country`, `phone`) VALUES
(1, 'pbkdf2_sha256$870000$GH0pnRcQNWrPMmq3LPUyHl$ArGhU53Mh5MGeVJKtn6hLYNvGS9Z1T/FnV1wB+zBKFw=', '2025-04-24 06:18:26.422395', 0, 'Steve', 'steve', 'rogers', 'steve@gmail.com', 0, 1, '2025-03-27 10:28:26.540496', 'brooklyn', 'New York', 'America', '1234567890'),
(2, 'pbkdf2_sha256$870000$1OoZw1yZpJwf3jRIddBUwG$2qRlmJC8qp5ymkd6qx3sPDgwBuWO/kRob0AmoP6u80c=', '2025-04-24 06:17:18.125242', 0, 'Tony1', 'Tony', 'Stark', 'stark@gmail.com', 0, 1, '2025-03-27 11:04:30.422135', '23rd street', 'Los Angeles', 'USA', '7510768435'),
(3, 'pbkdf2_sha256$870000$Q6Ry1mn9IzSIx6ZiP5ugxt$Hbh5QIFUzEthI0cSHYvsxef4G/EYgtr99kPPEsDNYew=', '2025-04-24 06:16:00.079644', 1, 'admin', '', '', '', 1, 1, '2025-03-27 11:21:51.101201', '', '', '', ''),
(4, 'pbkdf2_sha256$870000$Qhl1dIpPjPfpy3N9ntIvF0$mr8hAtM33tEd02hHc5pG9tqy1iXIk5JhgWvfibo7qv8=', '2025-04-22 03:18:25.305779', 0, 'Alfin', 'Alfin', 'hamura', 'alfin@gmail.com', 0, 1, '2025-03-27 15:54:42.968193', 'Al Hamra', 'Riyadh', 'Saudi', '6754324567'),
(5, 'pbkdf2_sha256$870000$gUIZMKtoWKUQp28cO4sxUj$zCvPwr42lTS2Judzg1nTq00eNM1Tpf8QTXd5NI6G1oc=', '2025-04-22 03:23:14.156766', 0, 'Ayush', 'Ayush', 'Ansari', 'ayush@gmail.com', 0, 1, '2025-04-22 03:21:58.859330', 'indore', 'Mumbai', 'India', '9510567279'),
(7, 'pbkdf2_sha256$870000$Ebpep3bY30cpmZwsMjbhNV$PNCx20lTaas9GiDSfcnS5TVSONzvIsrP8DXXZ0k0WXY=', '2025-11-22 06:25:28.629451', 0, 'Bruce', 'Bruce', 'Wayne', 'bruce@gmail.com', 0, 1, '2025-11-22 06:25:27.287331', ' Gotham', 'New Jersey', 'USA', '7634569393');

-- --------------------------------------------------------

--
-- Table structure for table `core_user_groups`
--

CREATE TABLE `core_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_user_user_permissions`
--

CREATE TABLE `core_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(6, 'core', 'queries'),
(9, 'core', 'request'),
(8, 'core', 'transaction'),
(7, 'core', 'user'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-03-27 10:25:30.125442'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-03-27 10:25:30.225090'),
(3, 'auth', '0001_initial', '2025-03-27 10:25:30.684254'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-03-27 10:25:30.754846'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-03-27 10:25:30.765521'),
(6, 'auth', '0004_alter_user_username_opts', '2025-03-27 10:25:30.777973'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-03-27 10:25:30.789991'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-03-27 10:25:30.792355'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-03-27 10:25:30.799502'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-03-27 10:25:30.808603'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-03-27 10:25:30.814615'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-03-27 10:25:30.858454'),
(13, 'auth', '0011_update_proxy_permissions', '2025-03-27 10:25:30.864884'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-03-27 10:25:30.868632'),
(15, 'core', '0001_initial', '2025-03-27 10:25:31.563637'),
(16, 'admin', '0001_initial', '2025-03-27 10:25:31.727703'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-03-27 10:25:31.738352'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-03-27 10:25:31.773672'),
(19, 'sessions', '0001_initial', '2025-03-27 10:25:31.832740');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('filc8exl7fj6e6036mqd1t7rw9xm5o2b', '.eJxVjEEOwiAQRe_C2pDAFKa4dO8ZCMNMpWogKe3KeHdt0oVu_3vvv1RM21ri1mWJM6uzQnX63Sjlh9Qd8D3VW9O51XWZSe-KPmjX18byvBzu30FJvXzrNIkADc4wo0GAYcw85uTFBURwIJ5JPJnA4jGHwQCTyVYmtABiQb0__oc4Qw:1vMh3o:fTgRMdbDdbjfG1SOdoBgRvmvvdvDRtPX4gpIJhvN7Oc', '2025-12-06 06:25:28.633503'),
('gybcr1q505ud9fkbpe7dtjv536fjvfos', '.eJxVjEEOwiAQRe_C2hBkigwu3XsGwjBTqRpISrsy3l2bdKHb_977LxXTupS4dpnjxOqsQB1-N0r5IXUDfE_11nRudZkn0puid9r1tbE8L7v7d1BSL9_a2hMaFBiOxN6goQw-OSbBgCN59ACINpAllwd0PoxkJKBjKwzoRL0_x9k3aQ:1txt2z:oTQikzKvuYPT_-hsyo-0mEJ8F-pnO2cAFMgDguMfsZw', '2025-04-10 19:37:49.132092'),
('h48skx4aasvhgmorg4fo58xn1uwg5j8o', '.eJxVjEEOwiAQRe_C2hBkigwu3XsGwjBTqRpISrsy3l2bdKHb_977LxXTupS4dpnjxOqsQB1-N0r5IXUDfE_11nRudZkn0puid9r1tbE8L7v7d1BSL9_a2hMaFBiOxN6goQw-OSbBgCN59ACINpAllwd0PoxkJKBjKwzoRL0_x9k3aQ:1u6hi5:uuiRDXfKB29Aay2wf0z-FYDWbe5DjZixjMUEpTrvjsE', '2025-05-05 03:20:41.450675'),
('kx2r2xy0d7davtx2wuyjonrqar13oa3g', '.eJxVjDsOwjAQBe_iGln-rhNK-pzBWnsXHEC2FCcV4u4QKQW0b2beS0Tc1hK3zkucSZyFFqffLWF-cN0B3bHemsytrsuc5K7Ig3Y5NeLn5XD_Dgr28q1RY0rZaQWj4cHC4DIoYkPkgrcZAibrHSbOIzk0dPUW0AB4pcmZ4MX7A-s7N78:1u7puk:Ww27BnZLVYF_4zXQNOl9otN6aGuuY9Ium8wkW4QNiJ8', '2025-05-08 06:18:26.424623'),
('zr9dzm82yxhnuqhfx1xy0vnfyi2ycfys', '.eJxVjEEOwiAQRe_C2hCGdgRcuu8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnERKE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLqRE_r4f7d1BCL996AGtsjs6NwQAqDUars80MJsaAQMmljJRHxW6ApHRSTFrRCOgIY3bi_QHLBTei:1u74Cu:UqdzCF7H-QrXAqdVKJXvUckCvDIoPKbh7Uo0DbWt-U8', '2025-05-06 03:22:00.365116');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `core_queries`
--
ALTER TABLE `core_queries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_request`
--
ALTER TABLE `core_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_request_applicant_id_id_be82b898_fk_core_user_id` (`applicant_id_id`),
  ADD KEY `core_request_pet_id_id_fc2ab6af_fk_core_transaction_id` (`pet_id_id`);

--
-- Indexes for table `core_transaction`
--
ALTER TABLE `core_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_transaction_donor_id_id_d879bf4a_fk_core_user_id` (`donor_id_id`);

--
-- Indexes for table `core_user`
--
ALTER TABLE `core_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `core_user_groups`
--
ALTER TABLE `core_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_user_groups_user_id_group_id_c82fcad1_uniq` (`user_id`,`group_id`),
  ADD KEY `core_user_groups_group_id_fe8c697f_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `core_user_user_permissions`
--
ALTER TABLE `core_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_user_user_permissions_user_id_permission_id_73ea0daa_uniq` (`user_id`,`permission_id`),
  ADD KEY `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_core_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `core_queries`
--
ALTER TABLE `core_queries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `core_request`
--
ALTER TABLE `core_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `core_transaction`
--
ALTER TABLE `core_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `core_user`
--
ALTER TABLE `core_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `core_user_groups`
--
ALTER TABLE `core_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_user_user_permissions`
--
ALTER TABLE `core_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `core_request`
--
ALTER TABLE `core_request`
  ADD CONSTRAINT `core_request_applicant_id_id_be82b898_fk_core_user_id` FOREIGN KEY (`applicant_id_id`) REFERENCES `core_user` (`id`),
  ADD CONSTRAINT `core_request_pet_id_id_fc2ab6af_fk_core_transaction_id` FOREIGN KEY (`pet_id_id`) REFERENCES `core_transaction` (`id`);

--
-- Constraints for table `core_transaction`
--
ALTER TABLE `core_transaction`
  ADD CONSTRAINT `core_transaction_donor_id_id_d879bf4a_fk_core_user_id` FOREIGN KEY (`donor_id_id`) REFERENCES `core_user` (`id`);

--
-- Constraints for table `core_user_groups`
--
ALTER TABLE `core_user_groups`
  ADD CONSTRAINT `core_user_groups_group_id_fe8c697f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `core_user_groups_user_id_70b4d9b8_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`);

--
-- Constraints for table `core_user_user_permissions`
--
ALTER TABLE `core_user_user_permissions`
  ADD CONSTRAINT `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `core_user_user_permissions_user_id_085123d3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
