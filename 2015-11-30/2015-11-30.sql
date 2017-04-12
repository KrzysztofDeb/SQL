--1
create table Wydawnictwa (
    id_wydawnictwa number(4,0) primary key,
    nazwa varchar2(10),
    miejscowosc varchar2(20)
);

--2
desc Wydawnictwa;

--3
alter table Wydawnictwa modify (nazwa varchar2(30) not null);

--4
insert into Wydawnictwa (id_wydawnictwa, nazwa, miejscowosc)
values (1, 'Helion', 'Gliwice');

--5   nie wykona sie, bo juz istnieje id = 1
insert into Wydawnictwa VALUES (1, 'PWN', 'Warszawa');

--6    nie wykona sie, bo nie mozmey wstawic wartosci null
insert into Wydawnictwa values (2, null, 'Warszawa');

--7
select * from Wydawnictwa;,

--8
insert into Wydawnictwa values (3, 'Otwarte', '£ódŸ');
insert into Wydawnictwa values (4, 'KUL', 'Lublin');
insert into Wydawnictwa values (5, 'PWN', 'Warszawa');
insert into Wydawnictwa values (6, 'Karaina Snów', 'Poznañ');

--9
select nazwa from Wydawnictwa order by nazwa desc;

--10
select * from Wydawnictwa
where miejscowosc like 'L%';

--11
select count(id_wydawnictwa), miejscowosc
from Wydawnictwa
group by miejscowosc
order by miejscowosc desc;

--12.1
create table Ksiazki (
    id_ksiazki NUMBER(4,0) primary key,
    tytul VARCHAR2(30),
    autor VARCHAR2(20),
    strony NUMBER(4,0),
    cena NUMBER(6,2),
    id_wydawnictwa NUMBER(4,0) references Wydawnictwa(id_wydawnictwa)
);

--12.2
alter table Ksiazki modify (cena check(cena>0), autor varchar(50) not null);

--13
select * from user_constraints
where table_name = 'Ksiazki';

--14
insert into Ksiazki values (1, 'Igrzyska œmierci', 'Colins', '325', '59', 1);
insert into Ksiazki values (2, 'W pierscieniu ognia', 'Brown', '225', '49', 1);
insert into Ksiazki values (3, '50 twarzy Greya', 'Mons', '199', '99', 4);
insert into Ksiazki values (4, 'Starter', 'Reds', '501', '89', 2);
insert into Ksiazki values (5, 'Ender', 'Reds', '600', '79', 4);
insert into Ksiazki values (6, 'Books', 'Yellow', '101', '35', 6);
insert into Ksiazki values (7, 'Tower', 'Novak', '250', '39', 5);

--15
select * from Ksiazki;

--16
select
    avg(cena) as Œrednia,
    sum(cena) as Suma
from Ksiazki;

--17
select k.tytul, w.nazwa
from Ksiazki k
join Wydawnictwa w on w.id_wydawnictwa = k.id_wydawnictwa;

select k.tytul, w.nazwa
from Ksiazki k
join Wydawnictwa w using (id_wydawnictwa);

--18
select autor, tytul from Ksiazki
order by tytul;

--19
select * from ksiazki
where strony = (select max(strony) from Ksiazki);

--20
select autor from Ksiazki
where tytul like 'T%' or tytul like 'B%';





