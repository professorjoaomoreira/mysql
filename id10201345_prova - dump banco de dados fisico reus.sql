-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 28-Ago-2019 às 22:57
-- Versão do servidor: 10.3.16-MariaDB
-- versão do PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id10201345_prova`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `nome_cid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_cid` int(10) NOT NULL,
  `populacao_cid` int(10) DEFAULT NULL,
  `codigo_Estado` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `nomeSoci_cli` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomeReal_cli` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_cli` int(10) NOT NULL,
  `cpf_cli` int(11) DEFAULT NULL,
  `codigo_cid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `nomeEstado` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sigla` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_Estado` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornece`
--

CREATE TABLE `fornece` (
  `cod_prod` int(10) DEFAULT NULL,
  `codigo_forn` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `codigo_forn` int(10) NOT NULL,
  `razao_forn` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_forn` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnpj` int(20) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `codigo_cid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `cod_prod` int(10) NOT NULL,
  `Desc_prod` int(10) DEFAULT NULL,
  `Valor_unit_prod` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`codigo_cid`),
  ADD KEY `codigo_Estado` (`codigo_Estado`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cli`),
  ADD KEY `codigo_cid` (`codigo_cid`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`codigo_Estado`);

--
-- Indexes for table `fornece`
--
ALTER TABLE `fornece`
  ADD KEY `cod_prod` (`cod_prod`),
  ADD KEY `codigo_forn` (`codigo_forn`);

--
-- Indexes for table `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`codigo_forn`),
  ADD KEY `codigo_cid` (`codigo_cid`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`cod_prod`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`codigo_Estado`) REFERENCES `estado` (`codigo_Estado`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`codigo_cid`) REFERENCES `cidade` (`codigo_cid`);

--
-- Limitadores para a tabela `fornece`
--
ALTER TABLE `fornece`
  ADD CONSTRAINT `fornece_ibfk_1` FOREIGN KEY (`cod_prod`) REFERENCES `produto` (`cod_prod`),
  ADD CONSTRAINT `fornece_ibfk_2` FOREIGN KEY (`codigo_forn`) REFERENCES `fornecedor` (`codigo_forn`);

--
-- Limitadores para a tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fornecedor_ibfk_1` FOREIGN KEY (`codigo_cid`) REFERENCES `cidade` (`codigo_cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
