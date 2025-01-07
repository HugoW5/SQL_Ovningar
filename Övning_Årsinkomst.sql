CREATE TABLE Adressregister
(
    Personnummer VARCHAR(12) PRIMARY KEY NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Adress VARCHAR(50) NOT NULL,
    Age DECIMAL NOT NULL,
    Gender VARCHAR(5),
    City VARCHAR(100)
);


CREATE TABLE Taxeringskalender(
    Personnummer VARCHAR(12),
    Årsinkomst DECIMAL,
    FOREIGN KEY (Personnummer) REFERENCES Adressregister(Personnummer)
);

INSERT INTO Adressregister (Personnummer, Name, Adress, Age, Gender, City) VALUES
('198504123456', 'Anna Svensson', 'Storgatan 12', 39, 'F', 'Stockholm'),
('199003223478', 'Erik Johansson', 'Lillgatan 8', 34, 'M', 'Gothenburg'),
('197802113457', 'Maria Andersson', 'Parkvägen 5', 47, 'F', 'Malmö'),
('200112015643', 'Karl Berg', 'Skogsstigen 3', 23, 'M', 'Uppsala'),
('198702123478', 'Emma Nilsson', 'Växthusvägen 2', 36, 'F', 'Lund'),
('199512345678', 'Johan Lind', 'Björkvägen 14', 29, 'M', 'Helsingborg'),
('200502145678', 'Sara Holm', 'Tallvägen 10', 20, 'F', 'Örebro'),
('196310293478', 'Lars Gustavsson', 'Södra Vägen 7', 61, 'M', 'Västerås'),
('197405123478', 'Linda Eriksson', 'Norrvägen 16', 50, 'F', 'Linköping'),
('199910293478', 'David Persson', 'Ekvägen 20', 25, 'M', 'Jönköping');


INSERT INTO Taxeringskalender(Personnummer, Årsinkomst) VALUES
('196310293478', 2500000),
('197405123478', 3250000),
('197802113457', 6000000),
('198504123456', 1850000),
('198702123478', 6350000),
('199003223478', 4250000),
('199512345678', 7050000),
('199910293478', 9050000),
('200112015643', 3550000),
('200502145678', 7850000);

SELECT * from Adressregister;
SELECT * from Taxeringskalender;


SELECT
    Adressregister.*,
    Taxeringskalender.Årsinkomst
FROM
    Adressregister
    JOIN
    Taxeringskalender
    ON
Taxeringskalender.Personnummer = Adressregister.Personnummer
ORDER BY Personnummer ASC;