CREATE DATABASE IF NOT EXISTS test;

USE test;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
  id INT(8) NOT NULL AUTO_INCREMENT,
  name VARCHAR(25) NOT NULL,
  age INT(11) NOT NULL,
  isAdmin BIT(1) NOT NULL,
  createdDate TIMESTAMP NOT NULL,
  PRIMARY KEY (id));

INSERT INTO user (name, age, isAdmin) VALUES ('Ivan', '34', TRUE);
INSERT INTO user (name, age, isAdmin) VALUES ('Oleg', '25', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Sergey', '18', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Irina', '22', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Dmitriy', '30', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Victor', '32', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Anna', '27', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Michail', '33', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Yuriy', '21', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Svetlana', '25', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Alexander', '29', TRUE);
INSERT INTO user (name, age, isAdmin) VALUES ('Anton', '20', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Olga', '23', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Igor', '28', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Alexey', '25', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Elena', '23', TRUE);
INSERT INTO user (name, age, isAdmin) VALUES ('Stepan', '30', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Yuliya', '28', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Zahar', '18', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Andrey', '19', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Nataliya', '22', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Artem', '24', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Roman', '19', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Leonid', '26', TRUE);
INSERT INTO user (name, age, isAdmin) VALUES ('Tatyana', '21', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Fedor', '25', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Ekaterina', '23', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Ilya', '30', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Nikolay', '28', FALSE);
INSERT INTO user (name, age, isAdmin) VALUES ('Larisa', '18', FALSE);