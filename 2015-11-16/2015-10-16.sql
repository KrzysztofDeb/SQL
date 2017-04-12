--1
select
  first_name,
  last_name,
  salary
from employees
where salary > (select
    avg(salary)
    from employees);
    
--2
select * from employees
where department_id = (select department_id
    from employees
    where first_name = 'Alexis'
      and last_name = 'Bull');
      
--3
select
  first_name,
  last_name
from employees
where job_id = (select job_id
    from employees
    where last_name = 'Weiss');

select
  first_name,
  last_name
from employees
where job_id in (select job_id
    from employees
    where last_name = 'King');
    
--4
select
  first_name,
  last_name
from employees
where department_id in (select department_id
    from employees
    where last_name like 'R%');
    
--5
select count(employee_id)
from employees
where department_id in (select department_id
    from employees
    where last_name not like 'R%');

--6
select
  first_name,
  last_name
from employees
where manager_id in (select employee_id
     from employees
     where last_name = 'Hunold')
order by last_name;

--7   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select
  first_name,
  last_name,
  salary
from employees
where salary > any (select salary
    from employees
    where department_id = 70);
    
--8  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select
  first_name,
  last_name,
  salary
from employees
where salary > all (select salary
    from employees
    where department_id = 80);
    
--9
select
  first_name,
  last_name,
  salary
from employees
where salary > all (select e.salary
    from employees e
    join departments d
    on d.department_id = e.department_id
    where department_name = 'Marketing');
    
select
  first_name,
  last_name,
  salary
from employees
where salary > all (select e.salary
    from employees e
    where department_id = (select department_id
        from departments
        where department_name = 'Marketing'));
        
--10
select
  first_name,
  last_name
from employees
where salary > (select avg(salary) from employees)
  and job_id = (select job_id from employees where last_name = 'Abel');
  
--11
select 
  count(employee_id),
  department_id
from employees
group by department_id
having count(employee_id) = (
    select max(count(employee_id))
    from employees
    group by department_id);

select 
  count(employee_id),
  department_id
from employees
group by department_id
having count(employee_id) >= all (
    select count(employee_id)
    from employees
    group by department_id);
--12
select 
  count(e.employee_id),
  d.department_name
from employees e
join departments d
on d.department_id = e.department_id
group by d.department_name
having count(employee_id) = (
    select max(count(employee_id))
    from employees
    group by department_id);

--13
select 
  avg(salary),
  department_id
from employees
group by department_id
having avg(salary) = ( select max(avg(salary))
    from employees
    group by department_id);
    
--14
select 
  avg(e.salary),
  d.department_name
from employees e
join departments d
on d.department_id = e.department_id
group by d.department_name
having avg(salary) = ( select max(avg(salary))
    from employees
    group by department_id);
    
--15         !!!!!!!!!!!!!   zapytanie skorelowane
select
  first_name,
  last_name,
  salary,
  department_id
from employees e
where salary = (select max(salary)
    from employees k
    where e.department_id = k.department_id);
    
--16
select
  first_name,
  last_name,
  salary,
  d.department_name
from employees e
join departments d
on d.department_id = e.department_id
where salary = (select max(salary)
    from employees k
    where e.department_id = k.department_id);
    
--17
select * from (select
    first_name,
    last_name,
    salary
    from employees
    order by salary desc)
where rownum < 6;

--18
select * from (select
    first_name,
    last_name,
    hire_date
    from employees
    order by hire_date asc)
where rownum < 11;

--19
select * from (select
    e.first_name,
    e.last_name,
    e.salary,
    j.job_title
    from employees e
    join jobs j on j.job_id = e.job_id
    where lower(j.job_title) like '%manager%'
    order by e.salary desc)
where rownum < 6;

--20
select first_name, last_name, job_id
from employees
where salary > (select max(salary)
    from employees
    where job_id = 'IT_PROG');
    
--21
select * from (select * from employees
    order by hire_date asc)
where rownum = 1;

--22
select zew.first_name, zew.last_name, zew.job_id
from employees zew
where zew.salary = (select max(wew.salary) from employees wew
    where wew.job_id = zew.job_id);
    
--23
select j.job_title, avg(e.salary)
from jobs j
join employees e on e.job_id = j.job_id
having avg(e.salary) > (select avg(salary) from employees)
group by j.job_title
order by avg(e.salary);

--24
select first_name, last_name, salary from employees
where salary < (select avg(salary) / 2 from employees);

--25
select j.job_title, avg(e.salary)
from jobs j
join employees e on e.job_id = j.job_id
having avg(e.salary) > (select avg(ee.salary) from employees ee
    join jobs jj on jj.job_id = ee.job_id
    where jj.job_title = 'Sales Manager')
group by j.job_title;

