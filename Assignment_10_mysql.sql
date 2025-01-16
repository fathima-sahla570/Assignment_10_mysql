-- 1. Create the teachers table and insert rows
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers (id, name, subject, experience, salary)
VALUES
(1, 'Alice', 'Mathematics', 5, 50000),
(2, 'Bob', 'Physics', 12, 60000),
(3, 'Charlie', 'Chemistry', 8, 55000),
(4, 'Diana', 'Biology', 4, 48000),
(5, 'Eve', 'Computer Science', 15, 70000),
(6, 'Frank', 'History', 10, 45000),
(7, 'Grace', 'English', 3, 40000),
(8, 'Hank', 'Geography', 7, 52000);
select* from teachers;
-- 2. Create a before insert trigger to raise an error for negative salary
DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END $$

DELIMITER ;
-- 3. Create teacher_log table and an after insert trigger
CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);
DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END $$

DELIMITER ;
-- 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years
DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with more than 10 years of experience';
    END IF;
END $$
DELIMITER ;
 -- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END$$

DELIMITER ;
select * from teachers;
select * from teacher_log;










