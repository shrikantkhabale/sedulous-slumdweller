-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2020 at 01:26 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coding thunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `srno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`srno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'firstpost', '123456789', 'firstpost', '2020-04-12 16:59:26', 'firstpost@gmail.com'),
(2, 'Shrikant Khabale', '09664383802', 'hi', '2020-04-13 15:46:39', 'shrikantkhabale@gmail.com'),
(3, 'Shrikant Khabale', '09664383802', 'hi', '2020-04-13 15:52:25', 'shrikantkhabale@gmail.com'),
(4, 'Shrikant Khabale', '09664383802', 'hi', '2020-04-13 15:53:10', 'shrikantkhabale@gmail.com'),
(5, 'Shrikant Khabale', '09664383802', 'hitowo', '2020-04-15 00:53:03', 'shrikantkhabale@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `srno` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `slug` varchar(25) NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `tag_line` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`srno`, `title`, `content`, `date`, `slug`, `img_file`, `tag_line`) VALUES
(1, 'Lets learn about stock market', 'Stock (also capital stock) of a corporation, is all of the shares into which ownership of the corporation is divided.[1] In American English, the shares are collectively known as \"stock\".[1] A single share of the stock represents fractional ownership of the corporation in proportion to the total number of shares. This typically entitles the stockholder to that fraction of the company\'s earnings, proceeds from liquidation of assets (after discharge of all senior claims such as secured and unsecured debt),[2] or voting power, often dividing these up in proportion to the amount of money each stockholder has invested. Not all stock is necessarily equal, as certain classes of stock may be issued for example without voting rights, with enhanced voting rights, or with a certain priority to receive profits or liquidation proceeds before or after other classes of shareholders', '2020-04-13 18:51:58', 'first-post', 'about-bg.jpg', 'This is first post'),
(2, 'What is Shares?', 'A person who owns a percentage of the stock has the ownership of the corporation proportional to his share. The shares form stock. The stock of a corporation is partitioned into shares, the total of which are stated at the time of business formation. Additional shares may subsequently be authorized by the existing shareholders and issued by the company. In some jurisdictions, each share of stock has a certain declared par value, which is a nominal accounting value used to represent the equity on the balance sheet of the corporation. In other jurisdictions, however, shares of stock may be issued without associated par value.', '2020-04-13 21:47:03', 'second-post', 'about-bg.jpg', 'best post ever'),
(4, 'Crashes', 'A stock market crash is often defined as a sharp dip in share prices of stocks listed on the stock exchanges. In parallel with various economic factors, a reason for stock market crashes is also due to panic and investing public\'s loss of confidence. Often, stock market crashes end speculative economic bubbles.', '2020-04-16 00:55:55', 'third-post', 'about-bg.jpg', 'Loss'),
(5, 'Stock market index', 'The movements of the prices in global, regional or local markets are captured in price indices called stock market indices, of which there are many, e.g. the S&P, the FTSE and the Euronext indices. Such indices are usually market capitalization weighted, with the weights reflecting the contribution of the stock to the index. The constituents of the index are reviewed frequently to include/exclude stocks in order to reflect the changing business environment.', '2020-04-16 00:57:16', 'forth-post', 'about-bg.jpg', ''),
(6, 'Taxation', 'Taxation is a consideration of all investment strategies; profit from owning stocks, including dividends received, is subject to different tax rates depending on the type of security and the holding period. Most profit from stock investing is taxed via a capital gains tax. In many countries, the corporations pay taxes to the government and the shareholders once again pay taxes when they profit from owning the stock, known as \"double taxation\".', '2020-04-16 00:58:13', 'fifth-post', 'about-bg.jpg', 'Tax on stocks'),
(7, 'Stock exchange', 'A stock exchange, securities exchange or bourse[note 1] is a facility where stockbrokers and traders can buy and sell securities, such as shares of stock and bonds and other financial instruments. Stock exchanges may also provide facilities for the issue and redemption of such securities and instruments and capital events including the payment of income and dividends.[citation needed] Securities traded on a stock exchange include stock issued by listed companies, unit trusts, derivatives, pooled investment products and bonds. Stock exchanges often function as \"continuous auction\" markets with buyers and sellers consummating transactions via open outcry at a central location such as the floor of the exchange or by using an electronic trading platform.[5]', '2020-04-16 00:59:31', 'sixth-post', 'about-bg.jpg', ''),
(8, 'Role of stock exchanges', 'Besides the borrowing capacity provided to an individual or firm by the banking system, in the form of credit or a loan, a stock exchange provides companies with the facility to raise capital for expansion through selling shares to the investing public.[18]\r\n\r\nCapital intensive companies, particularly high tech companies, always need to raise high volumes of capital in their early stages. For this reason, the public market provided by the stock exchanges has been one of the most important funding sources for many capital intensive startups. After the 1990s and early-2000s hi-tech listed companies\' boom and bust in the world\'s major stock exchanges[clarification needed (confusing syntax)], it has been much more demanding for the high-tech entrepreneur to take his/her company public, unless either the company is already generating sales and earnings, or the company has demonstrated credibility and potential from successful outcomes: clinical trials, market research, patent registrations, etc. This is quite different from the situation of the 1990s to early-2000s period, when a number of companies (particularly Internet boom and biotechnology companies) went public in the most prominent stock exchanges around the world in the total absence of sales, earnings, or any type of well-documented promising outcome. Though it\'s not as common, it still happens that highly speculative and financially unpredictable hi-tech startups are listed for the first time in a major stock exchange. Additionally, there are smaller, specialized entry markets for these kind of companies with stock indexes tracking their performance (examples include the Alternext, CAC Small,', '2020-04-16 01:01:13', 'seventh-post', 'about-bg.jpg', 'Raising capital for businesses'),
(9, 'Ownership', 'Stock exchanges originated as mutual organizations, owned by its member stockbrokers. However, the major stock exchanges have demutualized, where the members sell their shares in an initial public offering. In this way the mutual organization becomes a corporation, with shares that are listed on a stock exchange. Examples are Australian Securities Exchange (1998), Euronext (merged with New York Stock Exchange), NASDAQ (2002), Bursa Malaysia (2004), the New York Stock Exchange (2005), Bolsas y Mercados Españoles, and the São Paulo Stock Exchange (2007).\r\n\r\nThe Shenzhen Stock Exchange and Shanghai Stock Exchange can be characterized as quasi-state institutions insofar as they were created by government bodies in China and their leading personnel are directly appointed by the China Securities Regulatory Commission.\r\n\r\nAnother example is Tashkent Stock Exchange established in 1994, three years after the collapse of the Soviet Union, mainly state-owned but has a form of a public corporation (joint-stock company). Korea Exchange (KRX) owns 25% less one share of the Tashkent Stock Exchange.[22]\r\n\r\nIn 2018, there were 15 licensed stock exchanges in the United States, of which 13 actively traded securities. All of these exchanges were owned by three publicly traded multinational companies, Intercontinental Exchange, Nasdaq, Inc., and Cboe Global Markets, except one, IEX.[23][24] In 2019, a group of financial corporations announced plans to open a members owned exchange, MEMX, an ownership structure similar to the mutual organizations of earlier exchanges', '2020-04-16 01:02:08', 'eighth-post', 'about-bg.jpg', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`srno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`srno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
