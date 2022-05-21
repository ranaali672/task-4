-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2022 at 08:44 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nti_e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `street` varchar(20) NOT NULL,
  `building` varchar(20) NOT NULL,
  `floor` varchar(10) NOT NULL,
  `notes` varchar(20) NOT NULL,
  `flat` varchar(10) NOT NULL,
  `region-id` bigint(20) UNSIGNED NOT NULL,
  `user-id` bigint(20) UNSIGNED NOT NULL,
  `created-at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated-at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(320) NOT NULL,
  `code` int(5) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 - active\r\n0 - non active',
  `phone-verified` timestamp NULL DEFAULT NULL,
  `email-verified` timestamp NULL DEFAULT NULL,
  `created-at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated-at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name-en` varchar(32) NOT NULL,
  `name-ar` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 <active\r\n0<not active',
  `image` varchar(64) NOT NULL,
  `product-id` bigint(20) UNSIGNED NOT NULL,
  `created-at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated-at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `user-id` bigint(20) UNSIGNED NOT NULL,
  `product-id` bigint(20) UNSIGNED NOT NULL,
  `quantity` smallint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name-en` varchar(512) NOT NULL,
  `name-ar` varchar(512) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT ' 1<active\r\n0<not active',
  `image` varchar(64) NOT NULL,
  `created-at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated-at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `name-en` varchar(512) NOT NULL,
  `name-ar` varchar(512) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `long` varchar(20) NOT NULL,
  `distance` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 - active\r\n0 -non active',
  `created-at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated-at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `complains-replies`
--

CREATE TABLE `complains-replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(320) NOT NULL,
  `user-id` bigint(20) UNSIGNED NOT NULL,
  `reply-id` bigint(20) UNSIGNED NOT NULL,
  `created-at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated-at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `copouns`
--

CREATE TABLE `copouns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(5) DEFAULT NULL,
  `discount` decimal(10,0) UNSIGNED NOT NULL,
  `discount-type` decimal(7,2) UNSIGNED NOT NULL,
  `min-order-price` decimal(7,2) UNSIGNED NOT NULL,
  `max-discount value` decimal(7,2) UNSIGNED NOT NULL,
  `max-number of usage` decimal(7,2) UNSIGNED NOT NULL,
  `max-number-of usage-per person` decimal(7,2) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 <active\r\n0 <not active',
  `start-datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `end-datetime` timestamp NULL DEFAULT NULL,
  `created-at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated-at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favs`
--

CREATE TABLE `favs` (
  `user-id` bigint(20) UNSIGNED NOT NULL,
  `product-id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title-en` varchar(20) NOT NULL,
  `title-ar` varchar(20) NOT NULL,
  `image` varchar(64) DEFAULT 'default.png',
  `discount` decimal(10,0) NOT NULL,
  `discount-type` decimal(10,0) NOT NULL,
  `start-datetime` date NOT NULL,
  `end-datetime` date NOT NULL,
  `created-at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated-at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(5) DEFAULT NULL,
  `total-price` decimal(10,0) UNSIGNED NOT NULL,
  `payment` varchar(20) NOT NULL,
  `deliverd-at` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 >active\r\n0 < not active',
  `copoun-id` bigint(20) UNSIGNED NOT NULL,
  `address-id` bigint(20) UNSIGNED NOT NULL,
  `created-at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated-at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name-ar` varchar(512) NOT NULL,
  `name-en` varchar(512) NOT NULL,
  `details-ar` mediumtext NOT NULL,
  `details-en` mediumtext NOT NULL,
  `price` decimal(7,2) UNSIGNED NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `code` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 <- active\r\n0 <- non active',
  `image` varchar(64) NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created-at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated-at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products-offers`
--

CREATE TABLE `products-offers` (
  `price-after-discount` decimal(7,2) UNSIGNED NOT NULL,
  `offer-id` bigint(20) UNSIGNED NOT NULL,
  `product-id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products-orders`
--

CREATE TABLE `products-orders` (
  `price` decimal(7,2) UNSIGNED NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `product-id` bigint(20) UNSIGNED NOT NULL,
  `order-id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products-specs`
--

CREATE TABLE `products-specs` (
  `product-id` bigint(20) UNSIGNED NOT NULL,
  `spec-id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(320) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `name-en` varchar(512) NOT NULL,
  `name-ar` varchar(512) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `distance` varchar(20) NOT NULL,
  `long` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 - active\r\n0 -not active',
  `city-id` bigint(10) UNSIGNED NOT NULL,
  `created-at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated-at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `user-id` bigint(20) UNSIGNED NOT NULL,
  `product-id` bigint(20) UNSIGNED NOT NULL,
  `comment` text DEFAULT NULL,
  `rate` tinyint(1) DEFAULT 0,
  `created-at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated-at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(520) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subgategories`
--

CREATE TABLE `subgategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name-en` varchar(32) NOT NULL,
  `name-ar` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1<-active\r\n0<-not active',
  `image` varchar(64) NOT NULL,
  `category-id` bigint(20) UNSIGNED NOT NULL,
  `created-at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated-at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email` varchar(320) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code` int(5) DEFAULT NULL,
  `gender` enum('m','f') NOT NULL,
  `birthdate` date NOT NULL,
  `remember-token` varchar(255) DEFAULT NULL,
  `image` varchar(64) NOT NULL DEFAULT 'default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user-address fk` (`user-id`),
  ADD KEY `region-address fk` (`region-id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`user-id`,`product-id`),
  ADD KEY `products-cart fk` (`product-id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complains-replies`
--
ALTER TABLE `complains-replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complain-replies- fk` (`reply-id`),
  ADD KEY `complain-replies fk` (`user-id`);

--
-- Indexes for table `copouns`
--
ALTER TABLE `copouns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `favs`
--
ALTER TABLE `favs`
  ADD PRIMARY KEY (`user-id`,`product-id`),
  ADD KEY `products-favs fk` (`product-id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `copoun-order fk` (`copoun-id`),
  ADD KEY `address-orders fk` (`address-id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `products-subcategories fk` (`subcategory_id`),
  ADD KEY `products-brands-fk` (`brand_id`);

--
-- Indexes for table `products-offers`
--
ALTER TABLE `products-offers`
  ADD KEY `product-offer fk` (`product-id`),
  ADD KEY `offer-products offer fk` (`offer-id`);

--
-- Indexes for table `products-orders`
--
ALTER TABLE `products-orders`
  ADD PRIMARY KEY (`product-id`,`order-id`),
  ADD KEY `product-order-fk` (`order-id`);

--
-- Indexes for table `products-specs`
--
ALTER TABLE `products-specs`
  ADD PRIMARY KEY (`product-id`,`spec-id`),
  ADD KEY `specs-products-specs` (`spec-id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities-region-fk` (`city-id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`user-id`,`product-id`),
  ADD KEY `products-reviews-fk` (`product-id`);

--
-- Indexes for table `specs`
--
ALTER TABLE `specs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subgategories`
--
ALTER TABLE `subgategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories-subgategory fk` (`category-id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complains-replies`
--
ALTER TABLE `complains-replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `copouns`
--
ALTER TABLE `copouns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specs`
--
ALTER TABLE `specs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subgategories`
--
ALTER TABLE `subgategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `region-address fk` FOREIGN KEY (`region-id`) REFERENCES `regions` (`id`),
  ADD CONSTRAINT `user-address fk` FOREIGN KEY (`user-id`) REFERENCES `users` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `products-cart fk` FOREIGN KEY (`product-id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `users-carts-fk` FOREIGN KEY (`user-id`) REFERENCES `users` (`id`);

--
-- Constraints for table `complains-replies`
--
ALTER TABLE `complains-replies`
  ADD CONSTRAINT `complain-replies fk` FOREIGN KEY (`user-id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `complain-replies- fk` FOREIGN KEY (`reply-id`) REFERENCES `complains-replies` (`id`);

--
-- Constraints for table `favs`
--
ALTER TABLE `favs`
  ADD CONSTRAINT `products-favs fk` FOREIGN KEY (`product-id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `users-favs-fk` FOREIGN KEY (`user-id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `address-orders fk` FOREIGN KEY (`address-id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `copoun-order fk` FOREIGN KEY (`copoun-id`) REFERENCES `copouns` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products-brands-fk` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products-subcategories fk` FOREIGN KEY (`subcategory_id`) REFERENCES `subgategories` (`id`);

--
-- Constraints for table `products-offers`
--
ALTER TABLE `products-offers`
  ADD CONSTRAINT `offer-products offer fk` FOREIGN KEY (`offer-id`) REFERENCES `offers` (`id`),
  ADD CONSTRAINT `product-offer fk` FOREIGN KEY (`product-id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products-orders`
--
ALTER TABLE `products-orders`
  ADD CONSTRAINT `product-order-fk` FOREIGN KEY (`order-id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `products-order product-fk` FOREIGN KEY (`product-id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products-specs`
--
ALTER TABLE `products-specs`
  ADD CONSTRAINT `products-specs-fk` FOREIGN KEY (`product-id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `specs-products-specs` FOREIGN KEY (`spec-id`) REFERENCES `specs` (`id`);

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `cities-region-fk` FOREIGN KEY (`city-id`) REFERENCES `cities` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `products-reviews-fk` FOREIGN KEY (`product-id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `users-reviews-fk` FOREIGN KEY (`user-id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subgategories`
--
ALTER TABLE `subgategories`
  ADD CONSTRAINT `categories-subgategory fk` FOREIGN KEY (`category-id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
