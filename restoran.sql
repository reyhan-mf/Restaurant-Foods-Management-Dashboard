-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 21, 2024 at 09:32 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restoran`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `add_id` int(11) NOT NULL,
  `delivery_address` varchar(200) NOT NULL,
  `delivery_city` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`add_id`, `delivery_address`, `delivery_city`) VALUES
(101, 'Cibiru', 'Bandung'),
(102, 'Jatinangor', 'Sumedang'),
(103, 'Ujung Berung', 'Bandung'),
(104, 'Cileunyi', 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cust_id` int(11) NOT NULL,
  `cust_firstname` varchar(50) NOT NULL,
  `cust_lastname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cust_id`, `cust_firstname`, `cust_lastname`) VALUES
(2200638, 'Fatih', 'Alanshori'),
(2201203, 'Ridhwan', 'Nadif'),
(2203167, 'Muhammad', 'Azizi'),
(2203189, 'Reyhan', 'Fabian'),
(2204710, 'Satriatama', 'Putra'),
(2205423, 'Dina', 'Hanifah'),
(2205542, 'Prihatma', 'Nurwahid');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `food` varchar(50) NOT NULL,
  `item_cat` varchar(50) DEFAULT NULL,
  `item_price` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`food`, `item_cat`, `item_price`) VALUES
('Burger BBQ', 'Makanan', 30000),
('Burger Cheese', 'Makanan', 25000),
('Burger Mushroom Swiss', 'Makanan', 30000),
('Fried Chicken Honey Mustard', 'Makanan', 20000),
('Fried Chicken Original', 'Makanan', 15000),
('Fried Chicken Spicy', 'Makanan', 20000),
('Minuman Es Teh', 'Minuman', 5000),
('Minuman Smoothie', 'Minuman', 10000),
('Minuman Soda', 'Minuman', 8000),
('Pizza Meat', 'Makanan', 115000),
('Pizza Pepperoni', 'Makanan', 100000),
('Pizza Vegetarian', 'Makanan', 85000);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `ing_id` int(11) NOT NULL,
  `food` varchar(50) NOT NULL,
  `ing_name` varchar(200) NOT NULL,
  `int_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`ing_id`, `food`, `ing_name`, `int_price`) VALUES
(501, 'Pizza Pepperoni', 'Kulit pizza, Saus tomat, Keju mozzarella, Pepperoni, Oregano, Minyak zaitun', 110000),
(502, 'Pizza Meat', 'Kulit pizza, Saus tomat, Keju mozzarella, Daging sapi cincang, Sosis, Ham, Oregano, Minyak zaitun', 130000),
(503, 'Pizza Vegetarian', 'Kulit pizza, Saus tomat, Keju mozzarella, Jamur, Paprika, Zucchini, Oregano, Minyak zaitun', 100000),
(504, 'Fried Chicken Original', 'Ayam, Tepung terigu, Telur, Garam, Merica, Minyak goreng', 15000),
(505, 'Fried Chicken Spicy', 'Ayam, Tepung terigu, Telur, Garam, Merica, Cabai bubuk, Minyak goreng', 25000),
(506, 'Fried Chicken Honey Mustard', 'Ayam, Tepung terigu, Telur, Garam, Merica, Saus madu mustard, Minyak goreng', 25000),
(507, 'Burger Cheese', 'Roti burger, Patty daging sapi, Keju cheddar, Selada, Tomat, Mayones, Mustard', 25000),
(508, 'Burger BBQ', 'Roti burger, Patty daging sapi, Saus BBQ, Keju mozzarella, Bawang bombay, Selada, Mayones', 30000),
(509, 'Burger Mushroom Swiss', 'Roti burger, Patty daging sapi, Keju Swiss, Jamur sautéed, Selada, Mayones', 28000),
(510, 'Minuman Soda', 'Air soda, Sirup, Es batu, Jeruk nipis', 13000),
(511, 'Minuman Es Teh', 'Teh hitam, Gula, Es batu, Jeruk nipis', 7000),
(512, 'Minuman Smoothie', 'Buah-buahan, Yogurt, Madu, gula, Es batu  ', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inv_id` int(11) NOT NULL,
  `food` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inv_id`, `food`, `quantity`) VALUES
(401, 'Pizza Pepperoni', 20),
(402, 'Pizza Meat', 12),
(403, 'Pizza Vegetarian', 25),
(404, 'Fried Chicken Original', 30),
(405, 'Fried Chicken Spicy', 8),
(406, 'Fried Chicken Honey Mustard', 30),
(407, 'Burger Cheese', 40),
(408, 'Burger BBQ', 14),
(409, 'Burger Mushroom Swiss', 32),
(410, 'Minuman Soda', 17),
(411, 'Minuman Es Teh', 29),
(412, 'Minuman Smoothie', 35);

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `kasir_id` int(20) NOT NULL,
  `unit_restoran_id` int(20) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gaji` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`kasir_id`, `unit_restoran_id`, `first_name`, `last_name`, `gaji`) VALUES
(2001, 1, 'Bunga', 'Lestari', 2000000),
(2002, 1, 'Asep', 'Jaenudin', 2000000);

-- --------------------------------------------------------

--
-- Table structure for table `koki`
--

CREATE TABLE `koki` (
  `koki_id` int(20) NOT NULL,
  `unit_restoran_id` int(20) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gaji` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `koki`
--

INSERT INTO `koki` (`koki_id`, `unit_restoran_id`, `first_name`, `last_name`, `gaji`) VALUES
(1001, 1, 'Didi', 'Sutardi', 3000000),
(1002, 1, 'Dodo', 'Sutarjo', 3000000),
(1003, 2, 'Andi', 'Syaifulloh', 3000000),
(1004, 2, 'Jordan', 'Sadiku', 3000000);

-- --------------------------------------------------------

--
-- Table structure for table `kurir`
--

CREATE TABLE `kurir` (
  `kurir_id` int(20) NOT NULL,
  `unit_restoran_id` int(20) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gaji` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kurir`
--

INSERT INTO `kurir` (`kurir_id`, `unit_restoran_id`, `first_name`, `last_name`, `gaji`) VALUES
(3001, 2, 'Fikri', 'Setiawan', 2000000),
(3002, 2, 'Andhika', 'Setiawan', 2000000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `row_id` int(10) NOT NULL,
  `food` varchar(50) NOT NULL,
  `order_id` int(10) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `unit_restoran_id` int(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `delivery` tinyint(1) NOT NULL,
  `add_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`row_id`, `food`, `order_id`, `date`, `unit_restoran_id`, `quantity`, `cust_id`, `delivery`, `add_id`, `price`) VALUES
(1, 'Pizza Meat', 301, '2024-01-01 00:00:00', 1, 3, 2203167, 1, 102, 345000.00),
(2, 'Minuman Smoothie', 301, '2024-01-01 00:00:00', 1, 1, 2203167, 1, 102, 10000.00),
(3, 'Fried Chicken Spicy', 302, '2024-01-01 00:00:00', 1, 2, 2205542, 1, 101, 40000.00),
(4, 'Minuman Soda', 302, '2024-01-01 00:00:00', 1, 2, 2205542, 1, 101, 16000.00),
(5, 'Fried Chicken Spicy', 303, '2024-01-01 00:00:00', 2, 3, 2203189, 0, NULL, 60000.00),
(6, 'Minuman Es Teh', 303, '2024-01-01 00:00:00', 2, 2, 2203189, 0, NULL, 10000.00),
(7, 'Fried Chicken Spicy', 304, '2024-01-02 00:00:00', 2, 2, 2203189, 0, NULL, 40000.00),
(8, 'Minuman Soda', 304, '2024-01-02 00:00:00', 2, 1, 2203189, 0, NULL, 8000.00),
(9, 'Burger BBQ', 305, '2024-01-03 00:00:00', 1, 2, 2205423, 1, 101, 60000.00),
(10, 'Minuman Smoothie', 305, '2024-01-03 00:00:00', 1, 1, 2205423, 1, 101, 10000.00),
(11, 'Pizza Meat', 306, '2024-01-03 00:00:00', 1, 1, 2204710, 1, 101, 115000.00),
(12, 'Minuman Es Teh', 306, '2024-01-03 00:00:00', 1, 2, 2204710, 1, 101, 10000.00),
(13, 'Burger BBQ', 307, '2024-01-03 00:00:00', 2, 1, 2201203, 0, NULL, 30000.00),
(14, 'Minuman Es Teh', 307, '2024-01-03 00:00:00', 2, 2, 2201203, 0, NULL, 10000.00),
(15, 'Burger BBQ', 308, '2024-01-03 00:00:00', 1, 2, 2203167, 1, 102, 60000.00),
(16, 'Minuman Es Teh', 308, '2024-01-03 00:00:00', 1, 2, 2203167, 1, 102, 10000.00),
(17, 'Fried Chicken Spicy', 309, '2024-01-03 00:00:00', 1, 2, 2203189, 1, 103, 40000.00),
(18, 'Minuman Soda', 309, '2024-01-03 00:00:00', 1, 1, 2203189, 1, 103, 8000.00),
(19, 'Pizza Meat', 310, '2024-01-04 00:00:00', 1, 2, 2200638, 1, 102, 230000.00),
(20, 'Minuman Smoothie', 310, '2024-01-04 00:00:00', 1, 1, 2200638, 1, 102, 10000.00),
(21, 'Fried Chicken Spicy', 311, '2024-01-04 00:00:00', 1, 2, 2203189, 1, 103, 40000.00),
(22, 'Minuman Es Teh', 311, '2024-01-04 00:00:00', 1, 2, 2203189, 1, 103, 10000.00),
(23, 'Fried Chicken Spicy', 312, '2024-01-04 00:00:00', 2, 1, 2204710, 0, NULL, 20000.00),
(24, 'Minuman Soda', 312, '2024-01-04 00:00:00', 2, 1, 2204710, 0, NULL, 8000.00),
(25, 'Pizza Meat', 313, '2024-01-05 00:00:00', 1, 1, 2205423, 1, 101, 115000.00),
(26, 'Minuman Smoothie', 313, '2024-01-05 00:00:00', 1, 1, 2205423, 1, 101, 10000.00),
(27, 'Burger BBQ', 314, '2024-01-05 00:00:00', 2, 2, 2200638, 0, NULL, 60000.00),
(28, 'Minuman Soda', 314, '2024-01-05 00:00:00', 2, 1, 2200638, 0, NULL, 8000.00),
(29, 'Pizza Meat', 315, '2024-01-06 00:00:00', 1, 1, 2201203, 1, 101, 115000.00),
(30, 'Minuman Es Teh', 315, '2024-01-06 00:00:00', 1, 2, 2201203, 1, 101, 10000.00),
(31, 'Burger BBQ', 316, '2024-01-06 00:00:00', 1, 2, 2200638, 1, 102, 60000.00),
(32, 'Minuman Soda', 316, '2024-01-06 00:00:00', 1, 1, 2200638, 1, 102, 8000.00),
(33, 'Pizza Meat', 317, '2024-01-06 00:00:00', 2, 1, 2203189, 0, NULL, 115000.00),
(34, 'Minuman Smoothie', 317, '2024-01-06 00:00:00', 2, 2, 2203189, 0, NULL, 20000.00),
(35, 'Fried Chicken Spicy', 318, '2024-01-06 00:00:00', 1, 3, 2204710, 1, 104, 60000.00),
(36, 'Minuman Smoothie', 318, '2024-01-06 00:00:00', 1, 2, 2204710, 1, 104, 20000.00),
(37, 'Burger BBQ', 319, '2024-01-06 00:00:00', 1, 3, 2205423, 1, 104, 90000.00),
(38, 'Minuman Es Teh', 319, '2024-01-06 00:00:00', 1, 2, 2205423, 1, 104, 10000.00),
(39, 'Fried Chicken Spicy', 320, '2024-01-07 00:00:00', 2, 4, 2205542, 0, NULL, 80000.00),
(40, 'Minuman Smoothie', 320, '2024-01-07 00:00:00', 2, 2, 2205542, 0, NULL, 20000.00);

-- --------------------------------------------------------

--
-- Table structure for table `unit_restoran`
--

CREATE TABLE `unit_restoran` (
  `unit_restoran_id` int(20) NOT NULL,
  `nama_unit` varchar(50) NOT NULL,
  `no_telp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit_restoran`
--

INSERT INTO `unit_restoran` (`unit_restoran_id`, `nama_unit`, `no_telp`) VALUES
(1, 'Dine In', '082134560987'),
(2, 'Delivery', '081243216798');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`add_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`food`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD KEY `food` (`food`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inv_id`),
  ADD KEY `food` (`food`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`kasir_id`),
  ADD KEY `unit_restoran_id` (`unit_restoran_id`);

--
-- Indexes for table `koki`
--
ALTER TABLE `koki`
  ADD PRIMARY KEY (`koki_id`),
  ADD KEY `unit_restoran_id` (`unit_restoran_id`);

--
-- Indexes for table `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`kurir_id`),
  ADD KEY `unit_restoran_id` (`unit_restoran_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `idx_food` (`food`),
  ADD KEY `jadwal_id` (`unit_restoran_id`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `add_id` (`add_id`);

--
-- Indexes for table `unit_restoran`
--
ALTER TABLE `unit_restoran`
  ADD PRIMARY KEY (`unit_restoran_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`food`) REFERENCES `foods` (`food`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`food`) REFERENCES `foods` (`food`);

--
-- Constraints for table `kasir`
--
ALTER TABLE `kasir`
  ADD CONSTRAINT `kasir_ibfk_1` FOREIGN KEY (`unit_restoran_id`) REFERENCES `unit_restoran` (`unit_restoran_id`);

--
-- Constraints for table `koki`
--
ALTER TABLE `koki`
  ADD CONSTRAINT `koki_ibfk_1` FOREIGN KEY (`unit_restoran_id`) REFERENCES `unit_restoran` (`unit_restoran_id`);

--
-- Constraints for table `kurir`
--
ALTER TABLE `kurir`
  ADD CONSTRAINT `kurir_ibfk_1` FOREIGN KEY (`unit_restoran_id`) REFERENCES `unit_restoran` (`unit_restoran_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`unit_restoran_id`) REFERENCES `unit_restoran` (`unit_restoran_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`add_id`) REFERENCES `address` (`add_id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`food`) REFERENCES `foods` (`food`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
