-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Cze 15, 2025 at 05:02 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Kino`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Bilet`
--

CREATE TABLE `Bilet` (
  `BiletId` int(10) NOT NULL,
  `LiczbaMiejsc` int(10) NOT NULL,
  `NazwaSeansu` varchar(50) NOT NULL,
  `GodzinaSeansu` time NOT NULL,
  `DataSeansu` date NOT NULL,
  `Adres` varchar(50) NOT NULL,
  `NumerMiejsca` int(10) NOT NULL,
  `KwotaBiletu` decimal(19,2) NOT NULL,
  `NrRezerwacji` varchar(50) NOT NULL,
  `SeansId` int(10) NOT NULL,
  `PlatnoscId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Klient`
--

CREATE TABLE `Klient` (
  `KlientID` int(10) NOT NULL,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `NrTelefonu` int(9) DEFAULT NULL,
  `BiletId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Platnosc`
--

CREATE TABLE `Platnosc` (
  `PlatnoscId` int(10) NOT NULL,
  `DataPlatnosci` date NOT NULL,
  `Kwota` decimal(19,2) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `FormaPlatnosci` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Pracownik`
--

CREATE TABLE `Pracownik` (
  `PracownikId` int(10) NOT NULL,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `PESEL` int(11) NOT NULL,
  `DataUrodzenia` date NOT NULL,
  `NrTelefonu` int(9) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `MiejsceZamieszkania` varchar(50) NOT NULL,
  `Płeć` varchar(20) NOT NULL,
  `Stanowisko` varchar(50) NOT NULL,
  `StazPracy` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Produkty`
--

CREATE TABLE `Produkty` (
  `ProduktId` int(10) NOT NULL,
  `ProduktNazwa` varchar(50) NOT NULL,
  `ProduktSprzedawca` varchar(255) NOT NULL,
  `ProduktIlosc` int(10) NOT NULL,
  `ProduktCena` decimal(19,2) NOT NULL,
  `ProduktMSRP` decimal(19,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Sala_kinowa`
--

CREATE TABLE `Sala_kinowa` (
  `SalaId` int(10) NOT NULL,
  `SalaNr` int(10) NOT NULL,
  `LiczbaMiejsc` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Seans`
--

CREATE TABLE `Seans` (
  `SeansId` int(10) NOT NULL,
  `SalaId` int(10) NOT NULL,
  `DataSeansu` date NOT NULL,
  `GodzinaSeansu` time NOT NULL,
  `OpisSeansu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Uzytkownicy`
--

CREATE TABLE `Uzytkownicy` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `haslo` varchar(255) NOT NULL,
  `rola` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Uzytkownicy`
--

INSERT INTO `Uzytkownicy` (`id`, `login`, `haslo`, `rola`) VALUES
(1, 'admin', '1234', 'admin'),
(2, 'obs_klienta', '1234', 'obs_klienta'),
(3, 'magazyn', '1234', 'magazyn'),
(4, 'kierownik', '1234', 'kierownik'),
(5, 'klient', '1234', 'klient'),
(6, 'kasa', '1234', 'kasa');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Bilet`
--
ALTER TABLE `Bilet`
  ADD PRIMARY KEY (`BiletId`),
  ADD KEY `FKBilet236086` (`SeansId`),
  ADD KEY `FKBilet952900` (`PlatnoscId`);

--
-- Indeksy dla tabeli `Klient`
--
ALTER TABLE `Klient`
  ADD PRIMARY KEY (`KlientID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `FKKlient625853` (`BiletId`);

--
-- Indeksy dla tabeli `Platnosc`
--
ALTER TABLE `Platnosc`
  ADD PRIMARY KEY (`PlatnoscId`);

--
-- Indeksy dla tabeli `Pracownik`
--
ALTER TABLE `Pracownik`
  ADD PRIMARY KEY (`PracownikId`),
  ADD UNIQUE KEY `PESEL` (`PESEL`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indeksy dla tabeli `Produkty`
--
ALTER TABLE `Produkty`
  ADD PRIMARY KEY (`ProduktId`);

--
-- Indeksy dla tabeli `Sala_kinowa`
--
ALTER TABLE `Sala_kinowa`
  ADD PRIMARY KEY (`SalaId`),
  ADD UNIQUE KEY `SalaNr` (`SalaNr`);

--
-- Indeksy dla tabeli `Seans`
--
ALTER TABLE `Seans`
  ADD PRIMARY KEY (`SeansId`),
  ADD KEY `FKSeans476081` (`SalaId`);

--
-- Indeksy dla tabeli `Uzytkownicy`
--
ALTER TABLE `Uzytkownicy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Bilet`
--
ALTER TABLE `Bilet`
  MODIFY `BiletId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Klient`
--
ALTER TABLE `Klient`
  MODIFY `KlientID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Platnosc`
--
ALTER TABLE `Platnosc`
  MODIFY `PlatnoscId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Produkty`
--
ALTER TABLE `Produkty`
  MODIFY `ProduktId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Sala_kinowa`
--
ALTER TABLE `Sala_kinowa`
  MODIFY `SalaId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Seans`
--
ALTER TABLE `Seans`
  MODIFY `SeansId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Uzytkownicy`
--
ALTER TABLE `Uzytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Bilet`
--
ALTER TABLE `Bilet`
  ADD CONSTRAINT `FKBilet236086` FOREIGN KEY (`SeansId`) REFERENCES `Seans` (`SeansId`),
  ADD CONSTRAINT `FKBilet952900` FOREIGN KEY (`PlatnoscId`) REFERENCES `Platnosc` (`PlatnoscId`);

--
-- Constraints for table `Klient`
--
ALTER TABLE `Klient`
  ADD CONSTRAINT `FKKlient625853` FOREIGN KEY (`BiletId`) REFERENCES `Bilet` (`BiletId`);

--
-- Constraints for table `Seans`
--
ALTER TABLE `Seans`
  ADD CONSTRAINT `FKSeans476081` FOREIGN KEY (`SalaId`) REFERENCES `Sala_kinowa` (`SalaId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
