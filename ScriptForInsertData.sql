DROP database IF EXISTS test;
CREATE database test;
USE test;
DROP TABLE IF EXISTS book;

CREATE TABLE book(
id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
description VARCHAR(255) NOT NULL,
author VARCHAR(255) NOT NULL,
isbn VARCHAR(20) NOT NULL,
printYear INT(4) NOT NULL,
readAlready BIT(1) NOT NULL DEFAULT false
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8; 

INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 1', 'This is a first book', 'Im author', '1234-5678', '2000');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 2', 'This is a second book', 'Im author', '1234-5678', '2001');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 3', 'This is a third book', 'Im author', '1234-5678', '2002');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 4', 'This is a fourth book', 'Im author', '1234-5678', '2003');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 5', 'This is a fifth book', 'Im author', '1234-5678', '2004');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 6', 'This is a sixth book', 'Im author', '1234-5678', '2005');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 7', 'This is a seventh book', 'Im author', '1234-5678', '2006');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 8', 'This is a eighth book', 'Im author', '1234-5678', '2007');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 9', 'This is a ninth book', 'Im author', '1234-5678', '2008');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 10', 'This is a ten book', 'Im author', '1234-5678', '2009');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 11', 'This is a eleventh book', 'Im author', '1234-5678', '2010');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 12', 'This is a twelfth book', 'Im author', '1234-5678', '2011');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 13', 'This is a thirteenth book', 'Im author', '1234-5678', '2012');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 14', 'This is a fourteenth book', 'Im author', '1234-5678', '2013');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 15', 'This is a fifteenth book', 'Im author', '1234-5678', '2014');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 16', 'This is a sixteenth book', 'Im author', '1234-5678', '2015');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 17', 'This is a seventeenth book', 'Im author', '1234-5678', '2016');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 18', 'This is a eighteenth book', 'Im author', '1234-5678', '2017');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 19', 'This is a ninteenth book', 'Im author', '1234-5678', '2018');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 20', 'This is a twentieth book', 'Im author', '1234-5678', '2019');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 21', 'This is a twenty first book', 'Im author', '1234-5678', '2020');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 22', 'This is a twenty second book', 'Im author', '1234-5678', '2021');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 23', 'This is a twenty third book', 'Im author', '1234-5678', '2022');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 24', 'This is a twenty fourth book', 'Im author', '1234-5678', '2023');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 25', 'This is a twenty fifth book', 'Im author', '1234-5678', '2024');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 26', 'This is a twenty sixth book', 'Im author', '1234-5678', '2025');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 27', 'This is a twenty seventh book', 'Im author', '1234-5678', '2026');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 28', 'This is a twenty eighth book', 'Im author', '1234-5678', '2027');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 29', 'This is a twenty ninth book', 'Im author', '1234-5678', '2028');
INSERT INTO book (title, description, author, isbn, printYear) VALUES ('Book number 30', 'This is a thirtieth book', 'Im author', '1234-5678', '2029');