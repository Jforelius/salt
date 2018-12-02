CREATE DATABASE testjuskadatabase;
USE testjuskadatabase;
GRANT ALL ON testjuskadatabase.* TO testjuskadatabase@localhost identified by 'dothuej1xuch2nohTohd';
CREATE TABLE testjuskadatabase (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100));
INSERT INTO testjuskadatabase(name) VALUES ("juska");
INSERT INTO testjuskadatabase(name) VALUES ("testi");
INSERT INTO testjuskadatabase(name) VALUES ("hello");
UPDATE testjuskadatabase SET name="terve" WHERE name="testi";
DELETE FROM testjuskadatabase WHERE id=3;

