1. select department_name from departments where department_id in
 (select distinct(department_id)from employees where salary<2000
  );

2. select country_name from countries where country_id not in (
      select country_id from location where location_id in (
            select location_id from departments where department_id in(
                  select distinct (department_id)from employees;
            )
      )
);

   
3. select job_title from jobs where job_id in(
select distinct(job_id) from employees  where department_id in(
      select (e.department_id) from employees e where 2<=(
            select count(d.employee_id) from employees d where d.employee_id = e.employee_id
      )
)
);

4. select c.country_name from countries c
where (select count(l1.city) from locations l1 where l1.country_id=c.country_id) =
(select count(l2.city) from locations l2 where l2.country_id=c.country_id and l2.city like 'a%');

5. select department_name from departments where location_id in
 (select location_id from locations where city is null) or location_id is null;