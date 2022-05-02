-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 02, 2022 at 04:01 PM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stripe_subscription`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `subscription_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `subscription_id`, `first_name`, `last_name`, `email`, `password`, `phone`, `created`, `modified`, `status`) VALUES
(3, 'sub_1KZV0wCmcY6YAasUz1QittR2', 'Rajan', 'Panchal', 'rajan.panchal@creolestudios.com', 'Test@123', '8200584741', '2022-03-04 12:23:22', '2022-03-04 12:23:22', 'active'),
(4, 'sub_1KZV6FCmcY6YAasUUoKztjWN', 'R', 'P', 'rajan.panchal51196@gmail.com', 'rajan@123', '8200584741', '2022-03-04 12:28:51', '2022-03-04 12:28:51', 'active'),
(5, 'sub_1KZVX1CmcY6YAasUrudIjELp', 'Rajan', 'Panchal', 'admin@gmail.com', 'v5ldP@3A1#rVaWvUFU', '8200584741', '2022-03-04 12:56:31', '2022-03-04 12:56:31', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions_details`
--

CREATE TABLE `user_subscriptions_details` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `payment_method` enum('stripe') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'stripe',
  `stripe_subscription_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `stripe_customer_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `stripe_plan_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `plan_amount` float(10,2) NOT NULL,
  `plan_amount_currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `plan_interval` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `plan_interval_count` tinyint NOT NULL,
  `payer_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `plan_period_start` datetime NOT NULL,
  `plan_period_end` datetime NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_subscriptions_details`
--

INSERT INTO `user_subscriptions_details` (`id`, `user_id`, `payment_method`, `stripe_subscription_id`, `stripe_customer_id`, `stripe_plan_id`, `plan_amount`, `plan_amount_currency`, `plan_interval`, `plan_interval_count`, `payer_email`, `created`, `plan_period_start`, `plan_period_end`, `status`) VALUES
(1, 1, 'stripe', 'sub_1KZEKaCmcY6YAasU1QB7WvLc', 'cus_LFjoLWEyfWoO5m', 'plan_LFjoRnTwsCDhtM', 25.00, 'usd', 'week', 1, 'rajan.panchal@creolestudios.com', '2022-03-03 18:34:32', '2022-03-03 18:34:32', '2022-03-10 18:34:32', 'active'),
(2, 1, 'stripe', 'sub_1KZEczCmcY6YAasU2uDzbylB', 'cus_LFk7xtKLRRJPPK', 'plan_LFk7FEe2GPYKuO', 80.00, 'usd', 'month', 1, 'deepak@gmail.com', '2022-03-03 18:53:33', '2022-03-03 18:53:33', '2022-04-03 18:53:33', 'active'),
(3, 1, 'stripe', 'sub_1KZEeNCmcY6YAasUIUgqN76G', 'cus_LFk8UapRX1XoJN', 'plan_LFk8mUVoqJOJZo', 25.00, 'usd', 'week', 1, 'mogippp@gmail.com', '2022-03-03 18:54:59', '2022-03-03 18:54:59', '2022-03-10 18:54:59', 'active'),
(4, 1, 'stripe', 'sub_1KZEjlCmcY6YAasUaQoaveGq', 'cus_LFkEuj8unnQHJm', 'plan_LFkEOTWHHsS0Y4', 80.00, 'usd', 'month', 1, 'rajantest@gmail.com', '2022-03-03 19:00:33', '2022-03-03 19:00:33', '2022-04-03 19:00:33', 'active'),
(5, 1, 'stripe', 'sub_1KZEunCmcY6YAasUb88IZK4B', 'cus_LFkPBhvBDlC7ax', 'plan_LFkPueuYmFCJ9L', 80.00, 'usd', 'month', 1, 'test@gmail.com', '2022-03-03 19:11:57', '2022-03-03 19:11:57', '2022-04-03 19:11:57', 'active'),
(6, 1, 'stripe', 'sub_1KZEwACmcY6YAasUqmGXlU6k', 'cus_LFkRvUmAAiB3Nb', 'plan_LFkRXm2IMzJAB7', 80.00, 'usd', 'month', 1, 'rajan.panchal51196@gmail.com', '2022-03-03 19:13:22', '2022-03-03 19:13:22', '2022-04-03 19:13:22', 'active'),
(7, 1, 'stripe', 'sub_1KZUs2CmcY6YAasUFQteRAIz', 'cus_LG0tXUqxNUxOlc', 'plan_LG0tjxrOGEjotl', 80.00, 'usd', 'month', 1, 'rajan.panchal51196@gmail.com', '2022-03-04 12:14:10', '2022-03-04 12:14:10', '2022-04-04 12:14:10', 'active'),
(8, 1, 'stripe', 'sub_1KZUvmCmcY6YAasUU2pTtiYk', 'cus_LG0xB7ziHGTbi8', 'plan_LG0xo5nM5SUide', 25.00, 'usd', 'week', 1, 'testerhe@gmail.com', '2022-03-04 12:18:02', '2022-03-04 12:18:02', '2022-03-11 12:18:02', 'active'),
(9, 1, 'stripe', 'sub_1KZV0wCmcY6YAasUz1QittR2', 'cus_LG13hnT0AoZYK2', 'plan_LG13BKLnHJq8P7', 850.00, 'usd', 'year', 1, 'rajan.panchal@creolestudios.com', '2022-03-04 12:23:22', '2022-03-04 12:23:22', '2023-03-04 12:23:22', 'active'),
(10, 1, 'stripe', 'sub_1KZV6FCmcY6YAasUUoKztjWN', 'cus_LG18j9iDkcDmxs', 'plan_LG18yQJqgIwKuO', 80.00, 'usd', 'month', 1, 'rajan.panchal51196@gmail.com', '2022-03-04 12:28:51', '2022-03-04 12:28:51', '2022-04-04 12:28:51', 'active'),
(11, 1, 'stripe', 'sub_1KZVX1CmcY6YAasUrudIjELp', 'cus_LG1aUwn8SqFkSY', 'plan_LG1aOzIcJVjR4f', 80.00, 'usd', 'month', 1, 'admin@gmail.com', '2022-03-04 12:56:31', '2022-03-04 12:56:31', '2022-04-04 12:56:31', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscriptions_details`
--
ALTER TABLE `user_subscriptions_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_subscriptions_details`
--
ALTER TABLE `user_subscriptions_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
