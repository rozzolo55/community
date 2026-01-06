-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 06, 2026 alle 23:27
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `community`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL,
  `titolo` varchar(30) NOT NULL,
  `data` date NOT NULL,
  `luogo` varchar(30) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `evento`
--

INSERT INTO `evento` (`id_evento`, `titolo`, `data`, `luogo`, `id_categoria`, `id_utente`) VALUES
(1, 'Maratona di Roma', '2025-04-10', 'Roma', 1, 4),
(2, 'Concerto Jazz', '2025-06-15', 'Milano', 2, 3),
(3, 'Fiera della Tecnologia', '2025-09-01', 'Torino', 3, 11),
(4, 'Corso di Cucina Toscana', '2025-03-20', 'Firenze', 4, 10),
(5, 'Mostra di Pittura', '2025-05-18', 'Venezia', 5, 10),
(6, 'Partita Benefica', '2025-07-12', 'Bologna', 1, 10),
(7, 'Festival Rock', '2025-08-22', 'Torino', 2, 7),
(8, 'Hackathon 2025', '2025-11-10', 'Milano', 3, 6),
(9, 'Corsa delle Alpi 2026', '2026-04-14', 'Bolzano', 1, 10),
(10, 'Festival Internazionale di Mus', '2026-07-02', 'Torino', 2, 4),
(11, 'Tech Summit Europe 2026', '2026-10-20', 'Milano', 3, 4),
(12, 'Masterclass di Cucina Mediterr', '2026-03-11', 'Roma', 4, 11),
(13, 'Biennale d’Arte Moderna 2026', '2026-09-18', 'Venezia', 5, 13),
(14, 'Torneo di Basket Estivo 2027', '2027-06-08', 'Firenze', 1, 11),
(15, 'Concerto Symphonic Night', '2027-11-25', 'Zurigo', 2, 4),
(16, 'Innovators Expo 2027', '2027-05-30', 'Parigi', 3, 2),
(17, 'Corso di Pasticceria Avanzata', '2027-02-13', 'Napoli', 4, 13),
(18, 'Mostra Scultorea Europea', '2027-10-07', 'Vienna', 5, 13),
(19, 'Maratona Europea 2028', '2028-04-21', 'Berlino', 1, 10),
(20, 'Mega Festival EDM 2028', '2028-08-16', 'Amsterdam', 2, 9),
(21, 'AI World Congress 2028', '2028-11-12', 'Londra', 3, 4),
(22, 'Laboratorio di Cucina Fusion', '2028-01-28', 'Madrid', 4, 11),
(23, 'Esposizione Internazionale di ', '2028-03-05', 'Milano', 5, 13),
(24, 'gara scacchistica', '2026-01-26', 'Brescia', 1, 4),
(25, 'torneo di Natale', '2026-01-10', 'Italia', 1, 1),
(26, 'Concerto Rovere', '2024-11-22', 'Brescia', 2, 14);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `utente_id` (`id_utente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `utente_id` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
