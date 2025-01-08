CREATE DATABASE Bokhandel;

CREATE TABLE Authors
(
    Id INT IDENTITY(0, 1) NOT NULL PRIMARY KEY,
    FName VARCHAR(50),
    LName VARCHAR(50),
    Birthday DATE
);

CREATE TABLE Books
(
    Id INT IDENTITY(0, 1) NOT NULL PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author INT NOT NULL FOREIGN KEY REFERENCES Author(Id),
    Price DECIMAL NOT NULL,
    [Year] VARCHAR(4) NOT NULL
);

CREATE TABLE Sales
(
    Id INT IDENTITY(0, 1) NOT NULL PRIMARY KEY,
    BookId INT NOT NULL FOREIGN KEY REFERENCES Book(Id),
    SaleDate DATE NOT NULL,
    AmountSold INT NOT NULL
);

INSERT INTO Authors
    (FName, LName, Birthday)
VALUES
    ('Astrid', 'Lindgren', '1901/03/11'),
    ('Kevin', 'Larsson', '1987/06/08');

INSERT INTO Books
    (Title, Author, Price, [Year])
VALUES
    ('Första Boken', 0, 124, '1800' ),
    ('Andra Boken', 0, 322, '1813' ),
    ('Tredje Boken', 0, 560, '1824' ),
    ('Fjärde Boken', 1, 982, '1872' ),
    ('Femte Boken', 1, 455, '1887' ),
    ('Sjätte Boken', 1, 171, '1900' ),
    ('Sjunde Boken', 2, 823, '1903' ),
    ('Åttonde Boken', 2, 174, '1910' ),
    ('Nionde Boken', 2, 918, '1924' );

INSERT INTO Sales
    (BookId, SaleDate, AmountSold)
VALUES
    (0, '1801/02/12', 2),
    (1, '1811/12/9', 3),
    (2, '1833/2/2', 2),
    (3, '1882/10/12', 2),
    (4, '1900/11/12', 3),
    (7, '1882/10/12', 5),
    (3, '1920/08/16', 1),
    (7, '1982/01/12', 2),
    (7, '1923/2/1', 3);


--1
SELECT
    Books.*,
    Authors.FName + ' ' + Authors.Lname AS Author_Name
FROM
    Books
    JOIN Authors ON Authors.Id = Books.Author;

--2
SELECT
    Sales.SaleDate,
    Books.Title as Title
FROM
    Sales JOIN
    Books On Sales.BookId = Books.Id;

--3
SELECT
    Sales.*,
    Books.Title AS Title,
    Authors.FName + ' ' + Authors.LName AS 'Author_Name'
FROM Sales
    JOIN Books ON Sales.BookId = Books.Id
    JOIN Authors ON Books.Author = Authors.Id;
