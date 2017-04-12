/* 1. Wyœwietl imiona i nazwiska aktorów oraz wiek, których obecny wiek miesci
sie w przedziale [20-30]. Posortuj rosn¹co wg wieku*/
select 
    Imie, 
    Nazwisko, 
    floor((months_between(sysdate,DataUrodzenia))/12) "WIEK"
from Aktor
where floor((months_between(sysdate,DataUrodzenia))/12) between 20 and 30
order by floor((months_between(sysdate,DataUrodzenia))/12) asc;

/* 2. Wyœwietl imie, nazwiko, aktora wieku 30-40 lat, który zagra w wiêcej ni¿ jednym filmie oraz.
liczbe tych filmów.*/
select a.Imie, a.nazwisko, count(fa.IDAktora) "ILOŒÆ"
from Aktor a
join FilmAktor fa on fa.IDAktora = a.IDAktora
having count(fa.IDAktora) > 1
group by a.Imie, a.nazwisko;

/* 3. Wyœwietl uzytkowników, których œrednia wystawionych ocen jest wiêksza od œredniej ocen z calej
bazy.*/
select u.Imie, u.Nazwisko, avg(o.Ocena)
from Uzytkownik u
join OcenaFilmu o on o.IDUzytkownika = u.IDUzytkownika
having avg(o.Ocena) > (
        select avg(ocena) from OcenaFilmu)
group by u.Imie, u.Nazwisko;

/* 4. Policz iloœc wystawionych ocen  w bie¿¹cym roku.*/
select count(Ocena) "ILOŒÆ OCEN" from OcenaFilmu 
where to_char(DataWystawienia,'YEAR') = to_char(sysdate,'YEAR');

/* 5. Wysietl tytuly filmów, które miay woja premirê przed narodzinami najmodszego uzytkownika */
select Tytul from Film
where DataPremiery < (
        select min(DataUrodzenia) from Uzytkownik);

/*  6. Wysiwetl tytly filmow, dolacz do nich aktorów, ktorzy w nim zagrali
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