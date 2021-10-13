-- CREATE DATABASE --
DROP DATABASE IF EXISTS booklist;
CREATE DATABASE booklist;

USE booklist;

-- USERS TABLE --
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(25) NOT NULL UNIQUE,
    userPassword VARCHAR(75) NOT NULL,
    admin BOOLEAN default 0,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50)
);

-- BOOKS TABLE --
CREATE TABLE books (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

-- AUTHORS TABLE --
CREATE TABLE authors (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL
);

-- BOOKS AND AUTHORS TABLE --
CREATE TABLE bookandauthor (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bookId INT NOT NULL,
    authorId INT NOT NULL,
    FOREIGN KEY (bookId) REFERENCES books(id),
    FOREIGN KEY (authorId) REFERENCES authors(id)
);

-- BOOK PRIORITY TABLE --
CREATE TABLE bookpriority (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    priorityLevel VARCHAR(6) NOT NULL
);

-- LISTS TABLE --
CREATE TABLE readinglist (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    listName VARCHAR(30) NOT NULL,
    userId INT NOT NULL,
    bookId INT NOT NULL,
    priorityId INT DEFAULT 1,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (bookId) REFERENCES books(id),
    FOREIGN KEY (priorityId) REFERENCES bookpriority(id)
);