-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2025 at 10:19 AM
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
-- Database: `swiftbus`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `booking_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `schedule_id`, `booking_time`) VALUES
(1, 1, 1, '2025-11-05 06:47:12'),
(2, 1, 9, '2025-11-05 08:58:56');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `title`, `description`) VALUES
(1, 'Ipoh Parade - Universiti Technology Petronas', 'The journey between Ipoh and UTP takes around 35–45 minutes by car via the Ipoh–Lumut Highway (A13). Traveling from Ipoh, head south toward Seri Iskandar, passing Batu Gajah and Tronoh before arriving at UTP’s main entrance. For the return trip, take the same A13 highway northbound from UTP back to Ipoh. The route is direct and easy to follow with clear road signs along the way.'),
(2, 'Ipoh Parade - Universiti Technology Petronas', 'The journey between Ipoh and UTP takes around 35–45 minutes by car via the Ipoh–Lumut Highway (A13). Traveling from Ipoh, head south toward Seri Iskandar, passing Batu Gajah and Tronoh before arriving at UTP’s main entrance. For the return trip, take the same A13 highway northbound from UTP back to Ipoh. The route is direct and easy to follow with clear road signs along the way.'),
(3, 'Ipoh Parade - Universiti Technology Petronas', 'The journey between Ipoh and UTP takes around 35–45 minutes by car via the Ipoh–Lumut Highway (A13). Traveling from Ipoh, head south toward Seri Iskandar, passing Batu Gajah and Tronoh before arriving at UTP’s main entrance. For the return trip, take the same A13 highway northbound from UTP back to Ipoh. The route is direct and easy to follow with clear road signs along the way.'),
(4, 'University Technology Petronas - Kuala Lumpur', 'The trip between UTP and Kuala Lumpur takes about 2 to 2.5 hours by car via the North–South Expressway (E1). From UTP, head toward Seri Iskandar and join the highway at Bidor or Gopeng interchange. Travel south toward Kuala Lumpur, following signs for Kuala Lumpur / Jalan Duta / KL City Centre. For the return trip, take the same highway northbound from Kuala Lumpur and exit toward Seri Iskandar / Tronoh to reach UTP. The route is direct, fast, and well-marked with highway signboards throughout the journey.'),
(5, 'University Technology Petronas- Penang', 'The journey between UTP and Penang takes approximately 1.5 to 2 hours by car. From UTP, travel toward Seri Iskandar and enter the North–South Expressway (E1) at the Bidor or Ipoh interchange. Head north toward Penang, following signs for Penang / Butterworth. Cross the Penang Bridge or the Second Penang Bridge (Sultan Abdul Halim Muadzam Shah Bridge) to reach the island. For the return trip, simply take the same highway southbound and exit toward Seri Iskandar / Tronoh to return to UTP. The route is straightforward and clearly signposted.'),
(6, 'University Technology Petronas - Selangor', 'Traveling between UTP and Selangor generally takes 2 to 2.5 hours, depending on the destination within Selangor. From UTP, head toward Seri Iskandar and join the North–South Expressway (E1) at the Bidor or Ipoh interchange. Drive south toward Kuala Lumpur / Selangor. For destinations like Shah Alam, Klang, Subang Jaya, and Petaling Jaya, follow signboards toward Shah Alam / Klang Valley. For Gombak or northern Selangor, continue toward Rawang. To return to UTP, take the E1 northbound and exit toward Seri Iskandar / Tronoh. The journey is direct and well-signposted.');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `time_slot` varchar(50) DEFAULT NULL,
  `max_seats` int(11) DEFAULT 40,
  `available_seats` int(11) DEFAULT 40
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `route_id`, `time_slot`, `max_seats`, `available_seats`) VALUES
(1, 1, '8.00 AM - 10:30 AM', 50, 49),
(2, 2, '11.00 AM - 12:30 PM', 50, 50),
(3, 2, '13.00 PM - 14.30 PM', 40, 40),
(4, 2, '15.00 PM - 17.30 PM', 50, 50),
(5, 1, '8.00 AM - 10:30 AM', 40, 40),
(6, 1, '13.00 PM - 14.30 PM', 40, 40),
(7, 6, '11.00 AM - 12:30 PM', 40, 40),
(8, 5, '15.00 PM - 17.30 PM', 40, 40),
(9, 4, '13.00 PM - 15.30 PM', 40, 39);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `is_admin`) VALUES
(1, 'admin', 'admin@test.com', '$2y$10$gzWj0MbDdSPGSsm17nHMYuVdmXhCO8gitGitgCfSvfIopCjlk2w9e', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`);

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
