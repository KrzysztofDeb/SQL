/* 1. Wy�wietl imiona i nazwiska aktor�w oraz wiek, kt�rych obecny wiek miesci
sie w przedziale [20-30]. Posortuj rosn�co wg wieku*/
select 
    Imie, 
    Nazwisko, 
    floor((months_between(sysdate,DataUrodzenia))/12) "WIEK"
from Aktor
where floor((months_between(sysdate,DataUrodzenia))/12) between 20 and 30
order by floor((months_between(sysdate,DataUrodzenia))/12) asc;

/* 2. Wy�wietl imie, nazwiko, aktora wieku 30-40 lat, kt�ry zagra w wi�cej ni� jednym filmie oraz.
liczbe tych film�w.*/
select a.Imie, a.nazwisko, count(fa.IDAktora) "ILO��"
from Aktor a
join FilmAktor fa on fa.IDAktora = a.IDAktora
having count(fa.IDAktora) > 1
group by a.Imie, a.nazwisko;

/* 3. Wy�wietl uzytkownik�w, kt�rych �rednia wystawionych ocen jest wi�ksza od �redniej ocen z calej
bazy.*/
select u.Imie, u.Nazwisko, avg(o.Ocena)
from Uzytkownik u
join OcenaFilmu o on o.IDUzytkownika = u.IDUzytkownika
having avg(o.Ocena) > (
        select avg(ocena) from OcenaFilmu)
group by u.Imie, u.Nazwisko;

/* 4. Policz ilo�c wystawionych ocen  w bie��cym roku.*/
select count(Ocena) "ILO�� OCEN" from OcenaFilmu 
where to_char(DataWystawienia,'YEAR') = to_char(sysdate,'YEAR');

/* 5. Wysietl tytuly film�w, kt�re miay woja premir� przed narodzinami najmodszego uzytkownika */
select Tytul from Film
where DataPremiery < (
        select min(DataUrodzenia) from Uzytkownik);

/*  6. Wysiwetl tytly filmow, dolacz do nich aktor�w, ktorzy w nim zagrali
i uzytkownikow ktorzy go ocenili.*/
select distinct
    f.Tytul,
    o.ocena,
    a.Imie || ' ' || a.Nazwisko "Aktor",
    u.Nick "Uzytkownik"
from Aktor a
join FilmAktor fa on fa.IDAktora = a.IDAktora
join Film f on f.IDFilmu = fa.IDFilmu
join OcenaFilmu o on o.IDFilmu = f.IDFilmu
join Uzytkownik u on u.IDUzytkownika = o.IDUzytkownika;



/* 8. Policz ilosc filmow ktore mialy swoja premiere niewczesniej niz 19 maja 2000 roku.*/
select count(IDFilmu) from Film
where to_char(DataPremiery,'DD-MM-YYYY') <= '19-05-2000';

/* 9. Wysiwetl akorow i ilosc fimow w ktorych zagrali. Porostuj malejaco wg liczby.*/
select a.Imie, a.Nazwisko, count(fa.IDAktora)
from Aktor a
join FilmAktor fa on fa.IDAktora = a.IDAktora
group by a.Imie, a.Nazwisko
order by count(fa.IDAktora) desc;

/* 10. Wyswietl tytuly filmow i srednia ocen.*/
select f.Tytul, avg(fo.ocena) from Film f
join OcenaFilmu fo on fo.IDFilmu = f.IDFilmu
group by f.Tytul
order by avg(fo.ocena) desc;