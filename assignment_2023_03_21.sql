
-- 1. Write the query to get the department and department wise total(sum) salary,
-- display it in ascending order according to salary.

select d.department_name , sum(e.salary) as total_sum
from employees e , departments d
where e.department_id = d.department_id
group by d.department_name
order by sum(e.salary);

-- 2. Write the query to get the department, total no. employee of each department,
-- total(sum) salary y to get the department, total no. employee of each department,
-- total(sum) salary witwith respect to department from "Employee" table.

select d.department_name , count(*) , sum(e.salary) as total_sum
from employees e , departments d
where e.department_id = d.department_id
group by d.department_name;



-- 3. Get department wise maximum salary from "Employee" table order by salary
-- ascending

select d.department_name ,max(e.salary) as max_salary
from departments d , employees e
where e.department_id = d.department_id
order by max(e.salary); 


-- 4. Write a query to get the departments where average salary is more than 60k
    select d.department_name as avg_salary
    from departments d , employees e
    where e.department_id = d.department_id
    group by d.departments.name
    having avg(e.salary)>60000;


-- 5. Write down the query to fetch department name assign to more than one
-- Employee

  select d.department_name
  from departments d , employees e
  where e.department_id = d.department_id
  group by d.department_name
  having count(e.employee_id)>1;


-- 6 . Write a query to show department_name and assignedTo where assignedTo
-- will be “One candidate” if its assigned to only one employee otherwise
-- “Multiple candidates”

select d.department_name,
case
when count(e.employee.id)=1 then 'one Candidate'
else 'Multiple Candidates'
end as "assignedTo"
from departments d , employees e
where e.department_id = d.department_id
group by d.department_name