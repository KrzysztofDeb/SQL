-------------------------------------    Usuniêcie tabel
/*drop table Film;
drop table Aktor;
drop table FilmAktor;
drop table Uzytkownik;
drop table OcenaFilmu;
*/

-------------------------------------- Tworzenie tabel
create table Film (
    IDFilmu integer primary key,
    Tytul varchar2(300) not null,
    DataPremiery date,
    CzasTrwania integer);
create table Aktor (
    IDAktora integer primary key,
    Imie varchar(50) not null,
    Nazwisko varchar(50) not null,
    DataUrodzenia date not null);
create table FilmAktor (
    IDFilmu integer,
    IDAktora integer,
    constraint pk primary key(IDFilmu, IDAktora),
    constraint fk_IDFilmu FOREIGN KEY (IDFilmu) references Film(IDFilmu),
    constraint fk_IDAktora FOREIGN KEY (IDAktora) references Aktor(IDAktora));
create table Uzytkownik (
    IDUzytkownika integer primary key,
    Imie varchar2(50) not null,
    Nazwisko varchar2(50) not null,
    Nick varchar2(50) not null,
    DataUrodzenia date);
create table OcenaFilmu( 
    IDFilmu integer, IDUzytkownika integer,
    Ocena float not null, Tresc varchar2(500) not null, DataWystawienia date,
    constraint pkk primary key(IDFilmu,IDUzytkownika),
    constraint fIDFilmu foreign key(IDFilmu) references Film(IDFilmu),
    constraint fIDUzytkownika foreign key(IDUzytkownika) references Uzytkownik(IDUzytkownika));
    
-------------------------------------------------------------------------------------------------------   Dodanie 10-ciu uzytkowników
insert into Uzytkownik values (1, 'Adam', 'Nowak', 'adidasik25', to_date('25-05-1993','DD-MM-YYYY'));
insert into Uzytkownik values (2, 'Krystyna', 'P¹czek', 'poczus', to_date('20-01-1994','DD-MM-YYYY'));
insert into Uzytkownik values (3, 'Justyna', 'Elektroluks', 'justys55', null);
insert into Uzytkownik values (4, 'Magorzata', 'Kovalsky', 'malgorzatkaaa', to_date('15-02-1993','DD-MM-YYYY'));
insert into Uzytkownik values (5, 'Kamil', 'Novak', 'kamnov69', to_date('31-12-1993','DD-MM-YYYY'));
insert into Uzytkownik values (6, 'Jan', 'Biala', 'bialy10', null);
insert into Uzytkownik values (7, 'Joanna', 'Pszczola', 'pszczolka_maja', null);
insert into Uzytkownik values (8, 'Ryszard', 'Kuœ', 'rysiek58', null);
insert into Uzytkownik values (9, 'Oliwia', 'Bzyk', 'olivka', to_date('01-01-2000','DD-MM-YYYY'));
insert into Uzytkownik values (10, 'Monika', 'Ró¿a', 'roza10', to_date('13-07-199','DD-MM-YYYY'));

--------------------------------------------------------------------------------------------------------    Dodanie 10-ciu aktorów
insert into Aktor values (1, 'Danuta', 'Stenka', to_date('23-04-1964', 'DD-MM-YYYY'));
insert into Aktor values (2, 'Artur', '¯mijewski', to_date('05-05-1965', 'DD-MM-YYYY'));
insert into Aktor values (3, 'Agata', 'Kulesza', to_date('13-01-1970', 'DD-MM-YYYY'));
insert into Aktor values (4, 'Al', 'Pacino', to_date('13-12-1970', 'DD-MM-YYYY'));
insert into Aktor values (5, 'Harrison', 'Ford', to_date('01-12-1981', 'DD-MM-YYYY'));
insert into Aktor values (6, 'Nicolas', 'Cage', to_date('06-10-1979', 'DD-MM-YYYY'));
insert into Aktor values (7, 'Pamela', 'Anderson', to_date('31-05-1981', 'DD-MM-YYYY'));
insert into Aktor values (8, 'Magorzata', 'Socha', to_date('09-02-1985', 'DD-MM-YYYY'));
insert into Aktor values (9, 'Anna', 'Mucha', to_date('10-10-1985', 'DD-MM-YYYY'));
insert into Aktor values (10, 'Mateusz', 'Banasiuk', to_date('08-08-1990', 'DD-MM-YYYY'));

-------------------------------------------------------------------------------------------------------   Dodanie 10-ciu filmów
insert into Film values (1, 'Pianista', to_date('01-02-2002', 'DD-MM-YYYY'), '125');
insert into Film values (2, 'Miasto 44', to_date('10-10-2014', 'DD-MM-YYYY'), '129');
insert into Film values (3, 'Jesteœ Bogiem', to_date('02-07-2012', 'DD-MM-YYYY'), '100');
insert into Film values (4, 'Listy do M.', to_date('14-02-2011', 'DD-MM-YYYY'), null);
insert into Film values (5, 'Skazani na Shawshank', to_date('01-08-1994', 'DD-MM-YYYY'), '150');
insert into Film values (6, 'Incepcja', to_date('31-10-2010', 'DD-MM-YYYY'), '137');
insert into Film values (7, 'Obcy - 8. pasa¿er Nostromo', to_date('15-03-1979', 'DD-MM-YYYY'), '119');
insert into Film values (8, 'Matrix', to_date('19-09-1999', 'DD-MM-YYYY'), '135');
insert into Film values (9, 'Lucy', to_date('15-06-2011', 'DD-MM-YYYY'), '90');
insert into Film values (10, 'Avatar', to_date('13-04-2009', 'DD-MM-YYYY'), '129');

----------------------------------------------------------------------------------------------------------   Dodanie 20-stu wpisów FilmAktor
insert into FilmAktor values (1, 2);
insert into FilmAktor values (1, 4);
insert into FilmAktor values (1, 8);
insert into FilmAktor values (2, 6);
insert into FilmAktor values (3, 10);
insert into FilmAktor values (4, 1);
insert into FilmAktor values (2, 3);
insert into FilmAktor values (5, 5);
insert into FilmAktor values (7, 7);
insert into FilmAktor values (6, 9);
insert into FilmAktor values (10, 10);
insert into FilmAktor values (9, 9);
insert into FilmAktor values (7, 1);
insert into FilmAktor values (5, 10);
insert into FilmAktor values (8, 9);
insert into FilmAktor values (7, 2);
insert into FilmAktor values (6, 5);
insert into FilmAktor values (5, 6);
insert into FilmAktor values (3, 2);
insert into FilmAktor values (2, 1);
------------------------------------------------------------------------------------------------------------    Dodanie 20-stu opini
insert into OcenaFilmu values (1, 1, 10, 'Najlepszy film na œwiecie. Polecam!', to_date('07-12-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (10, 1, 1, 'Niewarto ogl¹daæ. Serdecznie nie polecam.', to_date('07-11-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (2, 2, 5, 'Spodziewaem siê, ¿e bêdzie duzo lepszy.', to_date('07-08-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (3, 3, 5, 'Ocena 5 to chyba i tak, za duzo. Nie warty polecenia.', to_date('12-12-2014','DD-MM-YYYY'));
insert into OcenaFilmu values (4, 4, 9, 'Rewelacyjny!', null);
insert into OcenaFilmu values (5, 5, 8, 'Jeden z lepszych w tym gatunku. Polecam!', null);
insert into OcenaFilmu values (6, 6, 7, 'Bardzo fajny.', to_date('07-12-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (7, 7, 6, 'Bardzo przewidywalne zakoñczenie, ale za to œwietna gra aktorska.', to_date('06-12-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (8, 7, 2, 'Efekty, jak w filmach z lat 90. Nie polecam.', to_date('01-12-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (10, 9, 9, 'Swietny! Ogl¹dajcie.', to_date('07-12-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (10, 2, 9, 'Suuupppeeeerrrrrr. Poooollleeeccccammmm!', to_date('07-10-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (10, 10, 8, 'Warto bylo wybrac sie do kina!', to_date('07-02-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (2, 3, 1, 'Nie polecam.', to_date('07-12-2013','DD-MM-YYYY'));
insert into OcenaFilmu values (6, 7, 1, 'Nie myslcie nawet , ¿eby ogl¹dac ten film. Szkoda czasu.', to_date('07-05-2012','DD-MM-YYYY'));
insert into OcenaFilmu values (3, 1, 5, 'Mo¿e byæ, ale spodziewalem siê wiêcej.', to_date('07-01-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (5, 10, 9, 'Exxxxxxxxtrrraaaaaa!!!', to_date('02-02-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (7, 10, 5, 'Niewarty polecenia.', to_date('25-03-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (10, 3, 10, 'Najlepszy film. <3', to_date('22-06-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (7, 6, 5, 'Sabe efkty specjalne. Dobra gra aktorów.', to_date('30-05-2015','DD-MM-YYYY'));
insert into OcenaFilmu values (8, 1, 8, 'Polecam.', to_date('07-05-2015','DD-MM-YYYY'));
