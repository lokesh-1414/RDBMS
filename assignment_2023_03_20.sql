1.select * from employees where last_name like 'Sah%';

2.select * from employees where hire_date between '01-06-2021' and '15-02-2022' limit 10 offset 3;

3.select distinct salary as top5salaries from employees order by salary desc limit 5;

4.select first_name, last_name, email, from employees where salary between 25000 and 45000;

5.select first_name, manager_id, salary from  employeeswhere  department_id = 101order by  salary;

6.select first_name, last_namefrom  employees where  first_name like 'A%'  or last_name like '_TH%'  or last_name like '__TH%';