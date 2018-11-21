-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 21-Nov-2018 às 15:25
-- Versão do servidor: 10.1.30-MariaDB
-- PHP Version: 7.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commercez`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `descrição` varchar(250) NOT NULL,
  `preco` int(10) NOT NULL,
  `itensCompoem` varchar(250) NOT NULL,
  `vendedor` varchar(30) NOT NULL,
  `qtdeDisponivel` int(100) NOT NULL,
  `endLoja` varchar(250) NOT NULL,
  `telefone` int(15) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `titulo`, `descrição`, `preco`, `itensCompoem`, `vendedor`, `qtdeDisponivel`, `endLoja`, `telefone`, `image`) VALUES
(1, 'Conjunto de Panelas Tramontina', 'O Conjunto de Panelas Tramontina Turim é perfeito para promover mais praticidade e agilidade em sua cozinha! Você pode preparar as refeições para toda a família em menos tempo, evitando que os alimentos grudem no fundo das panelas.', 16990, '', 'Extra', 10, ' Rua João Pessoa, n° 83 - Piso Mezanino - Sala 02 | São Caetano do Sul - SP - CEP: 09520-010', 1147474777, 'https://a-static.mlcdn.com.br/618x463/conjunto-de-panelas-tramontina-turim-20298-722-antiaderente-10-pecas/magazineluiza/144129900/08f33429a0bee809f24d1058f6b38116.jpg'),
(2, 'Jogo de Facas Tramontina', 'Com este Jogo de Facas Tramontina com Lâmina em Aço Inox com Cabo Preto em Polipropileno 9 Peças da linha Affilata, não vai faltar instrumentos para você arrasar na cozinha.', 17005, '', 'Tramontina', 10, 'Avenida Aruanã, 684 CEP: 06460-010 - São Paulo - SP', 1147564134, 'https://www.extra-imagens.com.br/UtilidadesDomesticas/Faqueiros/ate30pecas/13883582/1051508325/jogo-facas-inox-8-pecas-plenus-preto-23498032-tramontina-13883582.jpg'),
(3, 'Fogao 5 Bocas Brastemp', 'Esse fogao moderno e prático traz diversos recursos que tornam qualquer receita mais simples de ser realizada. ', 128241, '', 'Brastemp', 10, 'Rodovia dos Bandeirantes KM 68,760 - CEP:13213-902 - Louveira/SP', 1112346123, 'https://a-static.mlcdn.com.br/618x463/fogao-5-bocas-brastemp-acendimento-automatico-bfs5ncruna/magazineluiza/012295500/3cb1f7781e1a4632a2036b59b42c65d2.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(10) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(10) NOT NULL,
  `cpf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
