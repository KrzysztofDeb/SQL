-- CHAPTER ONE
CREATE TABLE Film (
	IDFilmu INTEGER PRIMARY KEY,
	Tytul VARCHAR2(300) NOT NULL,
	DataPremiery DATE,
	CzasTrwania INTEGER
);

CREATE TABLE Aktor (
	IDAktora INTEGER PRIMARY KEY,
	Imie VARCHAR2(50) NOT NULL,
	Nazwisko VARCHAR2(50) NOT NULL,
	DataUrodzenia DATE NOT NULL
);

CREATE TABLE Uzytkownik (
  IDUzytkownika INTEGER PRIMARY KEY,
  Imie VARCHAR2(50),
  Nazwisko VARCHAR2(50) NOT NULL,
  Nick VARCHAR2(50) NOT NULL,
  DataUrodzenia DATE
);

CREATE TABLE FilmAktor (
  IDFilmu INTEGER,
  IDAktora INTEGER,
  CONSTRAINT fk_idfilmu FOREIGN KEY(IDFilmu) REFERENCES Film(IDFilmu),
  CONSTRAINT fk_idaktora FOREIGN KEY(IDAktora) REFERENCES Aktor(IDAktora)
);

CREATE TABLE OcenaFilmu (
  IDFilmu INTEGER,
  IDUzytkownika INTEGER,
  Ocena FLOAT(10) NOT NULL,
  Tresc VARCHAR2(500) NOT NULL,
  DataWystawienia DATE,
  CONSTRAINT fk_idfilmu2 FOREIGN KEY(IDFilmu) REFERENCES Film(IDFilmu),
  CONSTRAINT fk_iduzytkownika FOREIGN KEY(IDUzytkownika) REFERENCES Uzytkownik(IDUzytkownika)
);

-- CHAPTER TWO

-- -- Film
INSERT INTO Film VALUES
(1, 'Gwiezdne Wojny', '2015-12-06', 180);
INSERT INTO Film VALUES
(2, 'Pisiont Twarzy Greya', '2015-02-14', 120);
INSERT INTO Film VALUES
(3, 'Ted 2', '2015-07-22', 90);
INSERT INTO Film VALUES
(4, 'Titanic', '1997-04-01', 200);
INSERT INTO Film VALUES
(5, 'Listy do M. 2', '2015-11-13', 180);
INSERT INTO Film VALUES
(6, 'Incepcja', '2010-01-01', 148);

-- -- Aktor
INSERT INTO Aktor VALUES
(1, 'Jamie', 'Dornan', '1982-05-01');
INSERT INTO Aktor VALUES
(2, 'Dakota', 'Johnson', '1989-10-04');
INSERT INTO Aktor VALUES
(3, 'Harrison', 'Ford', '1942-07-13');
INSERT INTO Aktor VALUES
(4, 'Carrie', 'Fisher', '1956-10-21');
INSERT INTO Aktor VALUES
(5, 'Seth', 'MacFarlane', '1973-10-26');
INSERT INTO Aktor VALUES
(6, 'Amanda', 'Seyfried', '1985-12-03');
INSERT INTO Aktor VALUES
(7, 'Tomasz', 'Karolak', '1971-06-21');
INSERT INTO Aktor VALUES
(8, 'Roma', 'Gšsiorowska', '1981-01-29');
INSERT INTO Aktor VALUES
(9, 'Leonardo', 'DiKarpio', '1974-11-11');
INSERT INTO Aktor VALUES
(10, 'Kate', 'Winslet', '1975-10-05');

-- -- FilmAktor
INSERT INTO FilmAktor VALUES
(1, 3);
INSERT INTO FilmAktor VALUES
(1, 4);
INSERT INTO FilmAktor VALUES
(2, 1);
INSERT INTO FilmAktor VALUES
(2, 2);
INSERT INTO FilmAktor VALUES
(3, 5);
INSERT INTO FilmAktor VALUES
(3, 6);
INSERT INTO FilmAktor VALUES
(4, 7);
INSERT INTO FilmAktor VALUES
(4, 8);
INSERT INTO FilmAktor VALUES
(5, 9);
INSERT INTO FilmAktor VALUES
(5, 10);
INSERT INTO FilmAktor VALUES
(6, 9);

-- -- Uzytkownik
INSERT INTO Uzytkownik (iduzytkownika, imie, nazwisko, nick, dataurodzenia) VALUES
(1, NULL, 'Nosek', 'Nosek', '1993-01-01');
INSERT INTO Uzytkownik (iduzytkownika, imie, nazwisko, nick, dataurodzenia) VALUES
(2, 'Ellen', 'Page', 'Ariadne', '1987-01-01');
INSERT INTO Uzytkownik (iduzytkownika, imie, nazwisko, nick, dataurodzenia) VALUES
(3, 'Piotr', 'Piotrowski', 'pituch', '2001-01-01');

-- -- OcenaFilmu
INSERT INTO OcenaFilmu VALUES
(1, 3, 2.0, 'denny, już gdzie widzialem', '2015-12-07');
INSERT INTO OcenaFilmu VALUES
(2, 3, 7.0, 'takie o', '2015-12-07');
INSERT INTO OcenaFilmu VALUES
(3, 1, 6.5, 'lepsza jedynka', '2015-08-29');
INSERT INTO OcenaFilmu VALUES
(4, 2, 8.0, 'UWAGA! SPOILER! STATEK ZATONIE, A WINSLETÓWNA ROZWALI SIĘ NA CALEJ TRATWIE, DIKARPIO NIE PRZŻYJE - ZA TO NALEŻY SIĘ OSKAR', '2001-09-11');
INSERT INTO OcenaFilmu VALUES
(5, 1, 6.5, 'lepsza jedynka', '2015-11-16');
INSERT INTO OcenaFilmu VALUES
(6, 2, 10.0, 'gralam tam! polecam!', '2010-08-29');

-- CHAPTER THREE

-- Imię i nazwisko najwczeniej urodzonego aktora
SELECT Imie, Nazwisko FROM (
  SELECT * FROM Aktor
  ORDER BY dataurodzenia asc
) WHERE ROWNUM = 1;

-- Imiona i nazwiska aktorów, którzy zasluguja na Oskara
SELECT Imie, Nazwisko FROM Aktor
WHERE Imie != 'Leonardo' AND Nazwisko != 'DiKarpio';

-- Nazwiska aktorów, którzy zagrali w więcej niż jednym filmie
SELECT Nazwisko, count(*) FROM Aktor a
JOIN FilmAktor fa ON a.IDAktora = fa.IDAktora
GROUP BY Nazwisko
HAVING count(*) > 1;

-- Tytuly filmow, ktorych opinie wystawil uzytkownik o nicku "pituch"
SELECT Tytul FROM Film f
JOIN OcenaFilmu oc ON f.IDFilmu = oc.IDFilmu
JOIN Uzytkownik o ON oc.IDUzytkownika = o.IDUzytkownika
WHERE Nick = 'pituch';

-- Nazwiska wszystkich aktorów występujących w filmach, które ocenił użytkownik o nazwisku "Nosek"
SELECT a.Nazwisko, a.Imie FROM Film f
JOIN OcenaFilmu oc ON f.IDFilmu = oc.IDFilmu
JOIN Uzytkownik o ON oc.IDUzytkownika = o.IDUzytkownika
JOIN FilmAktor fa ON f.IDFilmu = fa.IDFilmu
JOIN Aktor a ON fa.IDAktora = a.IDAktora
WHERE o.Nazwisko = 'Nosek';

