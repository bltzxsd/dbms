DROP DATABASE IF EXISTS dbms_cursor;

CREATE DATABASE dbms_cursor;
USE dbms_cursor;

CREATE TABLE students (
    roll INT,
    name VARCHAR(20)
);

INSERT INTO students VALUES 
	(1, "name1"), (2, "name2"), (3, "name3");

DELIMITER //

CREATE PROCEDURE get_all_students() 
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sname VARCHAR(20);
    
    DECLARE scursor CURSOR FOR SELECT name FROM students;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN scursor; 
    
    read_loop: LOOP
        FETCH scursor INTO sname;
        IF done THEN 
            LEAVE read_loop; 
        END IF;
        SELECT sname;
    END LOOP;

    CLOSE scursor;
END //

DELIMITER ;
