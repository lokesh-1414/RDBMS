1.select concat(employees.first_name, ' ', employees.last_name) as fullname
, employees.email
, employees.salary
, departments.department_name
, locations.postal_code
, locations.city
from
  employees
  join departments
on employees.department_id = departments.department_id
join locations
on departments.location_id = locations.location_id;



2.select departments.department_name
, locations.street_address
, locations.state_province
from
  departments
  inner join locations
on locations.location_id = departments.location_id
where
  locations.state_province in ('Jharkhand', 'Jammu&Kashmir');


3.select count(employees.employee_id)
, jobs.job_title
, avg(employees.salary)
from
  employees
  inner join jobs
on jobs.job_id = employees.job_id
group by
  jobs.job_id
having
  avg(employees.salary) > 10000;


4.select employees.first_name
, employees.last_name
from
  employees
union
select
  dependents.first_name
  , dependents.last_name
from
  dependents
order by
  last_name desc;


5.select employees.first_name
, m.first_name
from
  employees
  inner join employees as m
on employees.manager_id = m.employee_id ;



6.select employees.employee_id
, departments.department_name
, locations.city
from
  employees
  inner join departments
on employees.department_id = departments.department_id
inner join locations
on departments.location_id = locations.location_id
where
  city in ('Newyork', 'California')
having
  count(employees.employee_id) > 5 ;
  
  
  7. select e.first_name , e.last_name from employees as e
  inner join dependents as d on d.employee_id = e.employee_id
  inner join departments as dept on dept.department_id = e.department_id
  inner join jobs as j on j.job_id = e.job_id

  where j.job_title like %manager%
  order by dept.department_name;



  8. alter table dependents add column "City" varchar(255);
     update dependents set City='Mumbai' where dependent_id=6;
     update dependents set City='Kolkata' where dependent_id=7;
     update dependents set City='Chennai' where dependent_id=8;
     update dependents set City='Delhi' where dependent_id=9;
     update dependents set City='Banglore' where dependent_id=10;