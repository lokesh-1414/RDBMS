create table jobs(
    job_id serial PRIMARY KEY,
    job_title varchar(255), 
    min_salary int,
    max_salary int
    check (min_salary>1000)   
);
create table regions(
    region_id serial PRIMARY KEY,
    region_name varchar(255)
);
create table countries(
    country_id serial PRIMARY KEY,
    country_name varchar(255),
    region_id int,
    foreign key(region_id) references regions(region_id)
);
create table locations(
    location_id serial PRIMARY KEY,
    street_address varchar(255),
    postal_code varchar(255),
   
    city varchar(255),
    state_province varchar(255),
    country_id int,
    foreign key(country_id) references countries(country_id)
);
create table departments(
    department_id serial PRIMARY KEY,
    department_name varchar(255),
    location_id int,
    foreign key(location_id) references locations(location_id)
);
create table employees(
    employee_id  serial PRIMARY KEY,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    email varchar(255),
    phone_number numeric,
    hire_date date not null,
    job_id int,
    salary int,
    manager_id varchar(255),
    department_id int,
    foreign key(department_id) references departments(department_id),
    foreign key(job_id) references jobs(job_id),
    foreign key(employee_id) references employees(employee_id)
);
create table dependents(
    dependent_id serial PRIMARY KEY,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    relationship varchar(255),
    employee_id int,
    foreign key(employee_id) references employees(employee_id)
);
insert into jobs(job_title,min_salary,max_salary) values
('sde' , 1001, 20000),
('hr', 2000, 30000),
('sales', 3000, 40000),
('manager', 4000, 50000),
('accountant', 5000, 60000);

insert into regions(region_name) values
('Middle_east'),
('east'),
('Middle_west'),
('east_south'),
('central');

insert into countries(country_name , region_id) values
('India', 1),
('Pakistan', 2),
('USA', 3),
('UK', 4),
('France', 5);

insert into locations(street_address,postal_code ,city,state_province,country_id) values
('212',843302 , 'patna' , 'Bihar' , 1),
('312',343302 , 'jaipur' , 'Rajasthan' , 2),
('412',443302 , 'kolkata' , 'WB' , 3),
('512',123302 , 'delhi' , 'Delhi' , 4),
('612',673302 , 'mumbai' , 'Maharastra' , 5);

insert into departments(department_name,location_id) values
('hr',1),
('tech',2),
('accounts',3),
('sports',4),
('Education',5);

insert into employees(first_name,last_name,email,phone_number,hire_date,job_id, salary,manager_id,department_id) values
('lokesh' , 'kumar' , 'lokesh@kreeti.com' , '1292066408' , ' 07-22-2022', 1, 15000,120,5),
('mahfuz','kumar','mahfuz@kreeti.com','1234561234',' 07-22-2022',2,15000,120, 5),
('gaurav','kumar','gaurav@kreeti.com','0664066408',' 07-22-2022',3,15000,120,5),
('ram','kumar','ram@kreeti.com','1234567867',' 07-22-2022',4,15000,120,5),
('sayantan','kumar','sayantan@kreeti.com','1292066408',' 07-22-2022',5,15000,120,5),
('azad','kumar','azad@kreeti.com','1292066408',' 07-22-2022',1,15000,120,5),
('mahesh','kumar','mahesh@kreeti.com','1292066408',' 07-22-2022',2,15000,120,5),
('moyukh','kumar','moyukh@kreeti.com','1292066408',' 07-22-2022',3,15000,120,5),
('naushad','kumar','naushad@kreeti.com','1292066408',' 07-22-2022',4,15000,120,5),
('animesh','kumar','animesh@kreeti.com','1292066408',' 07-22-2022',5,15000,120,5);

insert into dependents(first_name,last_name,relationship,employee_id) values
('lokesh','kumar','No',1),
('Ram','kumar','yes',2),
('Gaurav','kumar','No',3),
('Mahfuz','kumar','yes',4),
('Sayantan','kumar','No',5);

alter table departments add column manager_name varchar(255);
alter table jobs drop column max_salary ;
alter table locations rename postal_code to pincode;