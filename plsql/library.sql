DROP DATABASE IF EXISTS dbms_plsql; 
CREATE DATABASE dbms_plsql;
USE dbms_plsql;

CREATE TABLE borrowers (
    borrow_id INT,
    name VARCHAR(20),
    book VARCHAR(20),
    status VARCHAR(1),
    issue_date DATE,
    PRIMARY KEY (borrow_id)
);

CREATE TABLE fines (
    borrow_id INT,
    return_date DATE,
    amt INT,
    FOREIGN KEY (borrow_id) REFERENCES borrowers(borrow_id)
);

INSERT INTO borrowers VALUES 
    (1, 'student1', 'book1', 'B', '2024-01-01'),
    (2, 'student2', 'book2', 'B', '2024-01-02'),
    (3, 'student3', 'book3', 'B', '2024-01-03'),
    (4, 'student4', 'book4', 'B', '2024-01-03'),
    (5, 'student5', 'book5', 'B', '2024-01-03');

DELIMITER // 

CREATE PROCEDURE calc_fine(IN borrow INT)
BEGIN
    DECLARE fine INT DEFAULT 0;
    DECLARE ndays INT;
    DECLARE idate DATE;

    SELECT issue_date INTO idate FROM borrowers WHERE borrow_id = borrow;
    SELECT DATEDIFF(CURDATE(), idate) INTO ndays;

    IF ndays > 15 AND ndays <= 30 THEN
        SET fine = ndays * 5;
        INSERT INTO fines (borrow_id, return_date, amt) VALUES (borrow, CURDATE(), fine);
    ELSEIF ndays > 30 THEN
        SET fine = (15 * 5) + ((ndays - 30) * 50);
		INSERT INTO fines (borrow_id, return_date, amt) VALUES (borrow, CURDATE(), fine);
        UPDATE borrowers SET status = 'R' WHERE borrow_id = borrow;
    END IF;
END //

DELIMITER ;

CALL calc_fine(1);
CALL calc_fine(2);
CALL calc_fine(3);

