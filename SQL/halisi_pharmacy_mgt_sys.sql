-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2025 at 01:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `halisi_pharmacy_mgt_sys`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'Alphaman King', 'alphaman@gmail.com', 'hey there', '2025-02-27 15:54:57');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone`, `address`) VALUES
(1, 'John Doe', 'johndoe@example.com', '1234567890', '123 Main Street'),
(2, 'Jane Smith', 'janesmith@example.com', '0987654321', '456 High Street'),
(3, 'Alice Cooper', 'alicecooper@example.com', '1112223333', '789 Low Street'),
(4, 'Bob Marley', 'bobmarley@example.com', '4445556666', '1011 Park Avenue');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `specialization` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `name`, `specialization`) VALUES
(1, 'Dr. House', 'Diagnostic Medicine'),
(2, 'Dr. Watson', 'General Practitioner'),
(3, 'Dr. Strange', 'Neurosurgeon'),
(4, 'Dr. Who', 'Time Lord');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`product_id`, `product_name`, `manufacturer`, `description`, `category`, `price`, `quantity`, `expiry_date`) VALUES
(1, 'Aspirin', 'Bayer', 'Painkiller', 'Medicine', 10.00, 100, '2024-12-31'),
(2, 'Band-Aid', 'Johnson & Johnson', 'Adhesive Bandage', 'First Aid', 5.00, 200, NULL),
(3, 'Cough Syrup', 'Robitussin', 'Cough Suppressant', 'Medicine', 15.00, 50, '2024-06-30'),
(4, 'Dental Floss', 'Oral-B', 'Dental Care', 'Hygiene', 3.00, 300, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `CheckoutRequestID` varchar(50) NOT NULL,
  `MerchantRequestID` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `Email`, `Amount`, `Phone`, `CheckoutRequestID`, `MerchantRequestID`, `created_at`, `status`) VALUES
(1, 'user@gmail.com', 1307.00, '254798946785', 'ws_CO_28022025022155541798946785', 'bbcd-4a89-bd1a-6ecdc639893b2991142', '2025-02-27 23:21:56', 'pending'),
(2, 'user@gmail.com', 2100.00, '254798946785', 'ws_CO_28022025105633431798946785', '5fe8-4261-87f6-6d7d41adc6c31204475', '2025-02-28 07:56:35', 'pending'),
(3, 'user@gmail.com', 2488.00, '254798946785', 'ws_CO_28022025125936648798946785', 'bbcd-4a89-bd1a-6ecdc639893b3000615', '2025-02-28 09:59:38', 'pending'),
(4, 'user@gmail.com', 2488.00, '254798946785', 'ws_CO_28022025130429695798946785', '2adc-4be5-8019-05163f8aa67f319345', '2025-02-28 10:04:31', 'pending'),
(5, 'user@gmail.com', 1.00, '254798946785', 'ws_CO_01032025151757869798946785', '2adc-4be5-8019-05163f8aa67f350364', '2025-03-01 12:16:37', 'pending'),
(6, 'user@gmail.com', 2.00, '254798946785', 'ws_CO_01032025153454612798946785', '5fe8-4261-87f6-6d7d41adc6c31229719', '2025-03-01 12:34:56', 'pending'),
(7, 'user@gmail.com', 119.00, '254798946785', 'ws_CO_05032025194114482798946785', '9521-45ee-961d-76f40d475c2d2968', '2025-03-05 16:41:17', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `pharmacy_id` int(11) NOT NULL,
  `pharmacy_name` varchar(100) NOT NULL,
  `location` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`pharmacy_id`, `pharmacy_name`, `location`, `phone`, `email`) VALUES
(1, 'Happy Pharmacy', 'Murang\'a', '0712345678', 'happypharmacy@example.com'),
(2, 'Healthy Pharmacy', 'Nairobi', '0723456789', 'healthypharmacy@example.com'),
(3, 'Hearty Pharmacy', 'Mombasa', '0734567890', 'heartypharmacy@example.com'),
(4, 'Honest Pharmacy', 'Kisumu', '0745678901', 'honestpharmacy@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `prescription_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `prescription_date` date NOT NULL,
  `status` varchar(20) DEFAULT NULL CHECK (`status` in ('pending','filled','cancelled')),
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`prescription_id`, `customer_id`, `doctor_id`, `prescription_date`, `status`, `notes`) VALUES
(1, 2, 3, '2024-01-28', 'filled', 'Take one pill daily'),
(2, 4, 1, '2024-01-27', 'pending', 'Need further tests'),
(3, 3, 2, '2024-01-26', 'cancelled', 'Allergic reaction'),
(4, 1, 4, '2024-01-25', 'filled', 'Do not blink');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `report_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `report_type` varchar(50) NOT NULL,
  `report_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`report_id`, `prescription_id`, `report_date`, `report_type`, `report_content`) VALUES
(1, 4, '2024-01-28 05:16:40', 'Blood Test', 'Normal'),
(2, 3, '2024-01-27 06:15:30', 'X-Ray', 'Fracture'),
(3, 2, '2024-01-26 07:14:20', 'MRI', 'Tumor');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `pharmacy_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `product_id`, `pharmacy_id`, `customer_id`, `sale_date`, `quantity`, `total_amount`) VALUES
(1, 4, 1, 1, '2024-01-28 05:16:40', 10, 30.00),
(2, 3, 2, 2, '2024-01-27 06:15:30', 5, 75.00),
(3, 2, 3, 3, '2024-01-26 07:14:20', 20, 100.00),
(4, 1, 4, 4, '2024-01-25 08:13:10', 15, 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL,
  `setting_name` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_id`, `setting_name`, `setting_value`) VALUES
(1, 'theme', 'dark'),
(2, 'language', 'English'),
(3, 'currency', 'KES'),
(4, 'timezone', 'Africa/Nairobi');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `merchant_request_id` varchar(50) NOT NULL,
  `checkout_request_id` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `status` enum('pending','success','failed') DEFAULT 'pending',
  `mpesa_receipt_number` varchar(50) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `merchant_request_id`, `checkout_request_id`, `amount`, `phone_number`, `status`, `mpesa_receipt_number`, `transaction_date`, `created_at`, `updated_at`) VALUES
(1, '6543-425e-a177-2e84b1462ecd1630041', 'ws_CO_28022025135608558798946785', 152.00, '254798946785', 'pending', NULL, NULL, '2025-02-28 10:54:48', '2025-02-28 10:54:48'),
(2, 'b54f-471d-93d9-f7f3bf3f7c0e3005173', 'ws_CO_28022025135930400798946785', 152.00, '254798946785', 'pending', NULL, NULL, '2025-02-28 10:59:31', '2025-02-28 10:59:31'),
(3, 'bbcd-4a89-bd1a-6ecdc639893b3001607', 'ws_CO_28022025140209610798946785', 152.00, '254798946785', 'pending', NULL, NULL, '2025-02-28 11:00:49', '2025-02-28 11:00:49'),
(4, 'b54f-471d-93d9-f7f3bf3f7c0e3022350', 'ws_CO_01032025090441644798946785', 1.00, '254798946785', 'pending', NULL, NULL, '2025-03-01 06:03:22', '2025-03-01 06:03:22'),
(5, '6543-425e-a177-2e84b1462ecd1652893', 'ws_CO_01032025090404553798946785', 1.00, '254798946785', 'pending', NULL, NULL, '2025-03-01 06:04:06', '2025-03-01 06:04:06'),
(6, '6543-425e-a177-2e84b1462ecd1653118', 'ws_CO_01032025091827844798946785', 1.00, '254798946785', 'pending', NULL, NULL, '2025-03-01 06:17:08', '2025-03-01 06:17:08'),
(7, 'bbcd-4a89-bd1a-6ecdc639893b3018944', 'ws_CO_01032025092222910798946785', 1.00, '254798946785', 'pending', NULL, NULL, '2025-03-01 06:21:03', '2025-03-01 06:21:03'),
(8, '6543-425e-a177-2e84b1462ecd1653285', 'ws_CO_01032025092623485798946785', 1.00, '254798946785', 'pending', NULL, NULL, '2025-03-01 06:26:25', '2025-03-01 06:26:25'),
(9, 'bbcd-4a89-bd1a-6ecdc639893b3019053', 'ws_CO_01032025093111718798946785', 1.00, '254798946785', 'pending', NULL, NULL, '2025-03-01 06:29:51', '2025-03-01 06:29:51'),
(10, '6543-425e-a177-2e84b1462ecd1653880', 'ws_CO_01032025100119132798946785', 1.00, '254798946785', 'success', 'QK12345678', '2025-03-01 12:22:58', '2025-03-01 06:59:59', '2025-03-01 11:22:58'),
(11, '5fe8-4261-87f6-6d7d41adc6c31228665', 'ws_CO_01032025141716329798946785', 1.00, '254798946785', 'pending', NULL, NULL, '2025-03-01 11:17:18', '2025-03-01 11:17:18'),
(12, '5fe8-4261-87f6-6d7d41adc6c31228949', 'ws_CO_01032025144130525798946785', 1.00, '254798946785', 'pending', NULL, NULL, '2025-03-01 11:40:10', '2025-03-01 11:40:10'),
(13, 'bbcd-4a89-bd1a-6ecdc639893b3023740', 'ws_CO_01032025150902546798946785', 1.00, '254798946785', 'pending', NULL, NULL, '2025-03-01 12:09:04', '2025-03-01 12:09:04'),
(14, 'bbcd-4a89-bd1a-6ecdc639893b3023761', 'ws_CO_01032025151117143798946785', 1.00, '254798946785', 'success', 'QK12345678', '2025-03-01 13:12:55', '2025-03-01 12:11:19', '2025-03-01 12:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_log`
--

CREATE TABLE `transaction_log` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_log`
--

INSERT INTO `transaction_log` (`id`, `phone_number`, `transaction_id`, `amount`, `created_at`) VALUES
(1, '254798946785', '7878787888', 2100.00, '2025-02-28 08:47:58'),
(2, '254798946785', '7878787888', 2100.00, '2025-02-28 09:08:54'),
(3, '254798946785', '78787878', 1.00, '2025-03-01 12:17:03'),
(4, '254798946785', 'HQ3E889T21', 2.00, '2025-03-01 12:43:18'),
(5, '254798946785', 'HQ3E889T21', 119.00, '2025-03-05 16:41:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL CHECK (`role` in ('admin','pharmacist','doctor','customer'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `full_name`, `role`) VALUES
(1, 'admin', 'admin123', 'admin@example.com', 'Administrator', 'admin'),
(2, 'pharm1', 'pharm123', 'pharm1@example.com', 'Pharmacist One', 'pharmacist'),
(3, 'doc1', 'doc123', 'doc1@example.com', 'Doctor One', 'doctor'),
(4, 'cust1', 'cust123', 'cust1@example.com', 'Customer One', 'customer'),
(5, 'alphaman', '$2y$10$fdiTEtEPVcKiYhDuAKocxuhdVfZLVZH1Md4W0uHQZe5QDNoST1uQS', 'alphaman@gmail.com', 'Alphaman King', 'pharmacist'),
(6, 'king', '$2y$10$vpHxxtglXceZWTXenDmghOAPr9htWyLvtTS49O.HbzOlhycdnqG.y', 'king@gmail.com', 'alphaman king', 'pharmacist');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_name` (`product_name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`pharmacy_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `prescription_id` (`prescription_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `pharmacy_id` (`pharmacy_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_log`
--
ALTER TABLE `transaction_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `pharmacy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transaction_log`
--
ALTER TABLE `transaction_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`prescription_id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `inventory` (`product_id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`pharmacy_id`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
