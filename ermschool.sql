-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2020 at 10:42 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ermschool`
--

-- --------------------------------------------------------

--
-- Table structure for table `classofstudents`
--

CREATE TABLE `classofstudents` (
  `class_id` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `form_edu_id` int(11) DEFAULT NULL,
  `function_in_class` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `curriculum`
--

CREATE TABLE `curriculum` (
  `curriculum_id` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `extent_theory` int(4) DEFAULT NULL,
  `extent_practice` int(4) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `form_of_edu`
--

CREATE TABLE `form_of_edu` (
  `form_edu_id` int(11) NOT NULL,
  `curriculum_id` int(11) DEFAULT NULL,
  `form_edu_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `grade_id` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `semester_grade_1` int(1) DEFAULT NULL,
  `semester_grade_2` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `person_role` varchar(30) DEFAULT NULL,
  `person_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `salarygroup`
--

CREATE TABLE `salarygroup` (
  `salary_id` int(11) NOT NULL,
  `salary_factor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `person_id` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `function_in_class` varchar(50) DEFAULT NULL,
  `is_se_guardian` bit(1) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student_in_class`
--

CREATE TABLE `student_in_class` (
  `student_in_class_id` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stu_par`
--

CREATE TABLE `stu_par` (
  `stu_par_id` int(11) NOT NULL,
  `person1_id` int(11) DEFAULT NULL,
  `person2_id` int(11) DEFAULT NULL,
  `child_is_se_guardian` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(50) DEFAULT NULL,
  `salary_factor` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_dep`
--

CREATE TABLE `teacher_dep` (
  `department_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `is_headed_by` int(11) DEFAULT NULL,
  `is_master_dep_of` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teach_sub`
--

CREATE TABLE `teach_sub` (
  `teach_sub_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classofstudents`
--
ALTER TABLE `classofstudents`
  ADD PRIMARY KEY (`class_id`),
  ADD UNIQUE KEY `person_id` (`person_id`,`form_edu_id`),
  ADD KEY `form_edu_id` (`form_edu_id`);

--
-- Indexes for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`curriculum_id`),
  ADD UNIQUE KEY `subject_id` (`subject_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `form_of_edu`
--
ALTER TABLE `form_of_edu`
  ADD PRIMARY KEY (`form_edu_id`),
  ADD UNIQUE KEY `curriculum_id` (`curriculum_id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`grade_id`),
  ADD UNIQUE KEY `person_id` (`person_id`,`subject_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`person_id`),
  ADD UNIQUE KEY `person_id` (`person_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `salarygroup`
--
ALTER TABLE `salarygroup`
  ADD PRIMARY KEY (`salary_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`person_id`),
  ADD UNIQUE KEY `person_id` (`person_id`,`class_id`,`parent_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `student_in_class`
--
ALTER TABLE `student_in_class`
  ADD PRIMARY KEY (`student_in_class_id`),
  ADD UNIQUE KEY `student_id` (`student_id`,`class_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `stu_par`
--
ALTER TABLE `stu_par`
  ADD PRIMARY KEY (`stu_par_id`),
  ADD UNIQUE KEY `person1_id` (`person1_id`,`person2_id`),
  ADD KEY `person2_id` (`person2_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `salary_factor` (`salary_factor`,`person_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`person_id`),
  ADD UNIQUE KEY `person_id` (`person_id`);

--
-- Indexes for table `teacher_dep`
--
ALTER TABLE `teacher_dep`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `person_id` (`person_id`,`is_headed_by`,`is_master_dep_of`),
  ADD KEY `is_headed_by` (`is_headed_by`),
  ADD KEY `is_master_dep_of` (`is_master_dep_of`);

--
-- Indexes for table `teach_sub`
--
ALTER TABLE `teach_sub`
  ADD PRIMARY KEY (`teach_sub_id`),
  ADD UNIQUE KEY `person_id` (`person_id`,`subject_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classofstudents`
--
ALTER TABLE `classofstudents`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `curriculum`
--
ALTER TABLE `curriculum`
  MODIFY `curriculum_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_of_edu`
--
ALTER TABLE `form_of_edu`
  MODIFY `form_edu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salarygroup`
--
ALTER TABLE `salarygroup`
  MODIFY `salary_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_in_class`
--
ALTER TABLE `student_in_class`
  MODIFY `student_in_class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stu_par`
--
ALTER TABLE `stu_par`
  MODIFY `stu_par_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_dep`
--
ALTER TABLE `teacher_dep`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teach_sub`
--
ALTER TABLE `teach_sub`
  MODIFY `teach_sub_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classofstudents`
--
ALTER TABLE `classofstudents`
  ADD CONSTRAINT `classofstudents_ibfk_1` FOREIGN KEY (`form_edu_id`) REFERENCES `form_of_edu` (`form_edu_id`);

--
-- Constraints for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD CONSTRAINT `curriculum_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`);

--
-- Constraints for table `form_of_edu`
--
ALTER TABLE `form_of_edu`
  ADD CONSTRAINT `form_of_edu_ibfk_1` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`curriculum_id`);

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `student` (`person_id`),
  ADD CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`);

--
-- Constraints for table `parent`
--
ALTER TABLE `parent`
  ADD CONSTRAINT `parent_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`person_id`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classofstudents` (`class_id`);

--
-- Constraints for table `student_in_class`
--
ALTER TABLE `student_in_class`
  ADD CONSTRAINT `student_in_class_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`person_id`),
  ADD CONSTRAINT `student_in_class_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classofstudents` (`class_id`);

--
-- Constraints for table `stu_par`
--
ALTER TABLE `stu_par`
  ADD CONSTRAINT `stu_par_ibfk_1` FOREIGN KEY (`person1_id`) REFERENCES `student` (`person_id`),
  ADD CONSTRAINT `stu_par_ibfk_2` FOREIGN KEY (`person2_id`) REFERENCES `parent` (`person_id`);

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`salary_factor`) REFERENCES `salarygroup` (`salary_id`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `teacher_dep`
--
ALTER TABLE `teacher_dep`
  ADD CONSTRAINT `teacher_dep_ibfk_1` FOREIGN KEY (`is_headed_by`) REFERENCES `teacher` (`person_id`),
  ADD CONSTRAINT `teacher_dep_ibfk_2` FOREIGN KEY (`is_master_dep_of`) REFERENCES `teacher` (`person_id`),
  ADD CONSTRAINT `teacher_dep_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  ADD CONSTRAINT `teacher_dep_ibfk_4` FOREIGN KEY (`person_id`) REFERENCES `teacher` (`person_id`);

--
-- Constraints for table `teach_sub`
--
ALTER TABLE `teach_sub`
  ADD CONSTRAINT `teach_sub_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `teacher` (`person_id`),
  ADD CONSTRAINT `teach_sub_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
