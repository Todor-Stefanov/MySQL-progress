# 01. One-To-One Relationship

CREATE SCHEMA `exercise`;
USE `exercise`;

CREATE TABLE `people`(
	`person_id` INT UNIQUE AUTO_INCREMENT,
    `first_name` VARCHAR(30) NOT NULL,
    `SALARY` DECIMAL(15, 2),
    `passport_id` INT UNIQUE
);

ALTER TABLE `people`
ADD PRIMARY KEY (`person_id`);

INSERT INTO `people` (`first_name`, `salary`, `passport_id`)
VALUES
('Roberto', 43300.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101);

CREATE TABLE `passports`(
	`passport_id` INT UNIQUE AUTO_INCREMENT,
    `passport_number` VARCHAR(20) NOT NULL
);

ALTER TABLE `passports`
ADD PRIMARY KEY (`passport_id`);

ALTER TABLE `passports`
AUTO_INCREMENT = 101;

ALTER TABLE `passports`
ADD UNIQUE (`passport_number`);

INSERT INTO `passports`(`passport_number`)
VALUES 
('N34FG21B'),
('K65LO4R7'),
('ZE657QP2');

ALTER TABLE `people`
ADD CONSTRAINT `fk_PeoplePassports`
FOREIGN KEY (`passport_id`)
REFERENCES `passports`(`passport_id`);

SELECT * FROM `people`;
SELECT * FROM `passports`
ORDER BY `passport_id`;

# 2. One-To-Many Relationship
CREATE TABLE `manufacturers`(
	`manufacturer_id` INT UNSIGNED UNIQUE AUTO_INCREMENT,
    `name` VARCHAR(10) NOT NULL,
    `established_on` DATE NOT NULL
);

INSERT INTO `manufacturers`(`name`, `established_on`)
VALUES
	('BMW', '1916-03-01'),
    ('Tesla', '2003-01-01'),
    ('Lada', '1966-05-01');

CREATE TABLE `models`(
	`model_id` INT UNSIGNED UNIQUE  AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `manufacturer_id` INT UNSIGNED NOT NULL
)AUTO_INCREMENT = 101;

INSERT INTO `models`(`name`, `manufacturer_id`)
VALUES
	('X1', 1),
    ('i6', 1),
    ('Model S', 2),
    ('Model X', 2),
    ('Model 3', 2),
    ('Nova', 3);
 
 ALTER TABLE `manufacturers`
 ADD CONSTRAINT `pk_manufacturers`
	PRIMARY KEY (`manufacturer_id`);
    
ALTER TABLE `models`
ADD CONSTRAINT `pk_models`
	PRIMARY KEY (`model_id`),
ADD CONSTRAINT `fk_models_manifacurers`
	FOREIGN KEY (`manufacturer_id`)
    REFERENCES `manufacturers`(`manufacturer_id`);
    
SELECT * FROM `manufacturers`;

# 03. Many-To-Many Relationship
CREATE TABLE `students`(
	`student_id` INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(20) NOT NULL
);

INSERT INTO `students` (`name`)
VALUES 
	('Mila'),
    ('Toni'),
    ('Ron');
    
CREATE TABLE `exams`(
	`exam_id` INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL
)AUTO_INCREMENT=101;

INSERT INTO `exams` (`name`)
VALUES 
	('Spring MVC'),
    ('Neo4j'),
    ('Oracle 11g');
    
CREATE TABLE `students_exams`(
	`student_id` INT UNSIGNED,
    `exam_id` INT UNSIGNED,
    CONSTRAINT `pk_students_exams`
    PRIMARY KEY (`student_id`, `exam_id`),
    
    CONSTRAINT `fk_students_exams_students`
    FOREIGN KEY (`student_id`)
    REFERENCES `students`(`student_id`),
    
    CONSTRAINT `fk_students_exams_exams`
    FOREIGN KEY (`exam_id`)
    REFERENCES `exams`(`exam_id`)
);

INSERT INTO `students_exams`
VALUES
	(1, 101),
    (1, 102),
    (2, 101),
    (3, 103),
    (2, 102),
    (2, 103);
    
SELECT * FROM `students_exams`;

# 4. Self-Referencing
CREATE TABLE `teachers`(
	`teacher_id` INT UNSIGNED UNIQUE AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `manager_id` INT UNSIGNED DEFAULT NULL
)AUTO_INCREMENT = 101;

INSERT INTO `teachers` (`name`, `manager_id`)
VALUES 
	('John', NULL),
    ('Maya', 106),
    ('Silvia', 106),
    ('Ted', 105),
    ('Mark', 101),
    ('Greta', 101);

ALTER TABLE `teachers`
  ADD CONSTRAINT `pk_teacher`
    PRIMARY KEY (`teacher_id`),
    
  ADD CONSTRAINT `fk_teacher_manager_id`
	FOREIGN KEY (`manager_id`)
    REFERENCES `teachers`(`teacher_id`);
    
