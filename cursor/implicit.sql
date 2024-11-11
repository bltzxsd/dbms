DROP DATABASE IF EXISTS dbms_cursor;
CREATE DATABASE dbms_cursor;
USE dbms_cursor;

CREATE TABLE students (
	roll INT,
	name VARCHAR(20)
);

INSERT INTO students VALUES (1, "name1");

DELIMITER //

CREATE PROCEDURE get_students()
BEGIN
	DECLARE sname VARCHAR(20);
	SELECT name INTO sname FROM students LIMIT 1;
	SELECT sname;
END //

DELIMITER ;
