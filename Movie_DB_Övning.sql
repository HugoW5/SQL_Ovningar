USE MovieDb;


CREATE TABLE Movie
(
    Id INT IDENTITY(0, 1) NOT NULL PRIMARY KEY,
    Title VARCHAR(50) NOT NULL,
    [Year] VARCHAR(50) NOT NULL,
    DateOfRelease Date NOT NULL,
    Langugae VARCHAR(50) NOT NULL,
    ReleaseContry VARCHAR(50) NOT NULL
);

CREATE TABLE Actor
(
    Id INT IDENTITY(0, 1) NOT NULL PRIMARY KEY,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) NOT NULL,
    Gender CHAR(1)
);

CREATE TABLE Director
(
    Id INT IDENTITY(0, 1) NOT NULL PRIMARY KEY,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) NOT NULL
);

CREATE TABLE Reviewer
(
    Id INT IDENTITY(0, 1) NOT NULL PRIMARY KEY,
    revName VARCHAR(50) NOT NULL,
);

CREATE TABLE MovieType
(
    Id INT IDENTITY(0, 1) NOT  NULL PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL
);

CREATE TABLE Rating
(
    Id INT IDENTITY(0,1) NOT NULL PRIMARY KEY,
    MovieId INT FOREIGN KEY REFERENCES MOVIE(Id),
    ReviewerId INT FOREIGN KEY REFERENCES Reviewer(Id),
    Revstar TINYINT NOT NULL
);


INSERT INTO Movie
    (Title, [Year], DateOfRelease, Langugae, ReleaseContry)
VALUES
    ('Inception', 2010, '2010-07-16', 'English', 'USA'),
    ('Parasite', 2019, '2019-05-30', 'Korean', 'South Korea'),
    ('Spirited Away', 2001, '2001-07-20', 'Japanese', 'Japan'),
    ('The Godfather', 1972, '1972-03-24', 'English', 'USA'),
    ('Amélie', 2001, '2001-04-25', 'French', 'France');

SELECT *
FROM Movie;


INSERT INTO Actor
    (FName, LName, Gender)
VALUES
    ('Leonardo', 'DiCaprio', 'M'),
    ('Scarlett', 'Johansson', 'F'),
    ('Denzel', 'Washington', 'M'),
    ('Emma', 'Watson', 'F'),
    ('Tom', 'Hanks', 'M');

SELECT *
FROM Actor;

INSERT INTO Director
    (FName, LName)
VALUES
    ('Christopher', 'Nolan'),
    ('Quentin', 'Tarantino'),
    ('Steven', 'Spielberg'),
    ('Greta', 'Gerwig'),
    ('Bong', 'Joon-ho');

SELECT *
FROM Director;

INSERT INTO Reviewer
    (revName)
VALUES
    ('Roger Ebert'),
    ('Peter Travers'),
    ('Richard Roeper'),
    ('Manohla Dargis'),
    ('A. O. Scott');

SELECT *
FROM Reviewer;


INSERT INTO MovieType
    (TypeName)
VALUES
    ('Action'),
    ('Drama'),
    ('Comedy'),
    ('Horror'),
    ('Science Fiction');

SELECT *
FROM MovieType;

SELECT *
FROM Actor;
SELECT *
FROM Director;
SELECT *
FROM Movie;
SELECT *
FROM MovieType;
SELECT *
FROM Rating;
SELECT *
FROM Reviewer;