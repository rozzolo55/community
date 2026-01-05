-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Gen 05, 2026 alle 18:31
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

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
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome`) VALUES
(1, 'Sport'),
(2, 'Musica'),
(3, 'Tecnologia'),
(4, 'Cucina'),
(5, 'Arte');

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
(1, 'Maratona di Roma', '2025-04-10', 'Roma', 1, 1),
(2, 'Concerto Jazz', '2025-06-15', 'Milano', 2, 1),
(3, 'Fiera della Tecnologia', '2025-09-01', 'Torino', 3, 1),
(4, 'Corso di Cucina Toscana', '2025-03-20', 'Firenze', 4, 1),
(5, 'Mostra di Pittura', '2025-05-18', 'Venezia', 5, 1),
(6, 'Partita Benefica', '2025-07-12', 'Bologna', 1, 1),
(7, 'Festival Rock', '2025-08-22', 'Torino', 2, 1),
(8, 'Hackathon 2025', '2025-11-10', 'Milano', 3, 1),
(9, 'Corsa delle Alpi 2026', '2026-04-14', 'Bolzano', 1, 1),
(10, 'Festival Internazionale di Mus', '2026-07-02', 'Torino', 2, 1),
(11, 'Tech Summit Europe 2026', '2026-10-20', 'Milano', 3, 1),
(12, 'Masterclass di Cucina Mediterr', '2026-03-11', 'Roma', 4, 1),
(13, 'Biennale d’Arte Moderna 2026', '2026-09-18', 'Venezia', 5, 1),
(14, 'Torneo di Basket Estivo 2027', '2027-06-08', 'Firenze', 1, 1),
(15, 'Concerto Symphonic Night', '2027-11-25', 'Zurigo', 2, 1),
(16, 'Innovators Expo 2027', '2027-05-30', 'Parigi', 3, 1),
(17, 'Corso di Pasticceria Avanzata', '2027-02-13', 'Napoli', 4, 1),
(18, 'Mostra Scultorea Europea', '2027-10-07', 'Vienna', 5, 1),
(19, 'Maratona Europea 2028', '2028-04-21', 'Berlino', 1, 1),
(20, 'Mega Festival EDM 2028', '2028-08-16', 'Amsterdam', 2, 1),
(21, 'AI World Congress 2028', '2028-11-12', 'Londra', 3, 1),
(22, 'Laboratorio di Cucina Fusion', '2028-01-28', 'Madrid', 4, 1),
(23, 'Esposizione Internazionale di ', '2028-03-05', 'Milano', 5, 1),
(24, 'gara scacchistica', '2026-01-26', 'casa morocutti', 1, 13),
(25, 'torneo del porcodidio', '2026-01-10', 'Italia', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `interessi`
--

CREATE TABLE `interessi` (
  `id_interessi` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `interessi`
--

INSERT INTO `interessi` (`id_interessi`, `id_categoria`, `id_utente`) VALUES
(1, 1, 1),
(2, 3, 1),
(3, 2, 2),
(4, 5, 2),
(5, 4, 3),
(6, 3, 3),
(7, 5, 4),
(8, 2, 4),
(9, 4, 5),
(10, 1, 6),
(11, 1, 13),
(12, 3, 13);

-- --------------------------------------------------------

--
-- Struttura della tabella `post`
--

CREATE TABLE `post` (
  `id_post` int(11) NOT NULL,
  `voto` int(11) NOT NULL,
  `commento` varchar(100) NOT NULL,
  `id_evento` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `post`
--

INSERT INTO `post` (`id_post`, `voto`, `commento`, `id_evento`, `id_utente`) VALUES
(1, 5, 'Evento fantastico!', 1, 1),
(2, 4, 'Ottima organizzazione', 1, 6),
(3, 3, 'Musica buona ma troppo affollato', 2, 2),
(4, 5, 'Esperienza indimenticabile', 2, 4),
(5, 4, 'Molto interessante!', 3, 1),
(6, 5, 'Ottimi stand e conferenze', 3, 3),
(7, 5, 'Cibo delizioso', 4, 5),
(8, 4, 'Lezione utile e divertente', 4, 2),
(9, 5, 'Quadri stupendi', 5, 4),
(10, 3, 'Partita carina ma troppo caldo', 6, 6),
(11, 4, 'Gran festival!', 7, 1),
(12, 5, 'Atmosfera incredibile', 8, 3),
(13, 4, 'Troppo lunga!', 1, 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id_utente` int(11) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `paese` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`id_utente`, `nickname`, `nome`, `cognome`, `email`, `password`, `paese`) VALUES
(1, 'skywalker', 'Luca', 'Bianchi', 'luca.bianchi@example.com', 'a7594bcb2f5f62de65172c321a940384', 'Italia'),
(2, 'mooncat', 'Sara', 'Rossi', 'sara.rossi@example.com', '82c6b5c09997e76edaff999528e87c04', 'Italia'),
(3, 'techguru', 'Marco', 'Verdi', 'marco.verdi@example.com', '8a318c021846a5045af5ceb8081a6670', 'Svizzera'),
(4, 'artlover', 'Giulia', 'Neri', 'giulia.neri@example.com', '473420c0997ce1282eb3742eaaf0c8fa', 'Francia'),
(5, 'chef88', 'Paolo', 'Gallo', 'paolo.gallo@example.com', '86f62b212e23b86e3abce86a9e5c9931', 'Italia'),
(6, 'wanderer', 'Anna', 'Russo', 'anna.russo@example.com', 'd468b7975e8efd6af548a4d9d8467928', 'Germania'),
(7, 'silentwolf', 'Davide', 'Moretti', 'davide.moretti@example.com', '7f298221b1eb94e4811c879b33d1e626', 'Italia'),
(8, 'traveler22', 'Elena', 'Conti', 'elena.conti@example.com', '4016d63dc9e9ef349f782a28982022df', 'Spagna'),
(9, 'norwegianblue', 'Thomas', 'Berg', 'thomas.berg@example.com', 'd04745eb476ebf32bda9df2f4d8b65c4', 'Norvegia'),
(10, 'quietreader', 'Marta', 'Fontana', 'marta.fontana@example.com', 'bb0b834328492a913dec0f3ac34f2416', 'Svizzera'),
(11, 'newmember', 'Riccardo', 'Pellegrini', 'riccardo.pellegrini@example.co', '3c3966776c941ab1e3899d347c29f423', 'Italia'),
(13, 'nick', 'Nicolò', 'Martinelli', 'martinico@example.com', 'e2e42a07550863f8b67f5eb252581f6d', 'Gambia');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indici per le tabelle `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `utente_id` (`id_utente`);

--
-- Indici per le tabelle `interessi`
--
ALTER TABLE `interessi`
  ADD PRIMARY KEY (`id_interessi`),
  ADD KEY `idcategoria` (`id_categoria`),
  ADD KEY `idutente` (`id_utente`);

--
-- Indici per le tabelle `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `id_evento` (`id_evento`),
  ADD KEY `id_utente` (`id_utente`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id_utente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT per la tabella `interessi`
--
ALTER TABLE `interessi`
  MODIFY `id_interessi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `utente_id` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`);

--
-- Limiti per la tabella `interessi`
--
ALTER TABLE `interessi`
  ADD CONSTRAINT `idcategoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `idutente` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`);

--
-- Limiti per la tabella `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `id_evento` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`),
  ADD CONSTRAINT `id_utente` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
