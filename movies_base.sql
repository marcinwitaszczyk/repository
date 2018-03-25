-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               10.1.29-MariaDB - mariadb.org binary distribution
-- Serwer OS:                    Win32
-- HeidiSQL Wersja:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Zrzut struktury tabela movies.migration_versions
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Zrzucanie danych dla tabeli movies.migration_versions: ~1 rows (około)
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` (`version`) VALUES
	('20180321202159');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;

-- Zrzut struktury tabela movies.movies
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_released` datetime NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Zrzucanie danych dla tabeli movies.movies: ~8 rows (około)
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` (`id`, `name`, `date_released`, `genre`, `rating`) VALUES
	(1, 'Movie A', '2018-02-27 00:00:00', 'Action', 5),
	(2, 'Movie B', '2018-05-27 00:00:00', 'Action', 4),
	(3, 'Movie C', '2018-12-05 00:00:00', 'Action', 5),
	(4, 'Movie D', '2018-06-15 00:00:00', 'Action', 3),
	(5, 'Movie E', '2018-02-09 00:00:00', 'Action', 5),
	(6, 'Movie F', '2018-06-19 10:15:00', 'Comedy', 3),
	(7, 'Movie G', '2018-02-19 11:15:00', 'Horror', 1),
	(8, 'Movie H', '2018-03-24 21:25:54', 'Thriller', 2);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
