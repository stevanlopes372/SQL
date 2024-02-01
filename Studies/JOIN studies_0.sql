CREATE TABLE estudosaleatorios.employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

CREATE TABLE estudosaleatorios.departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO estudosaleatorios.departments (department_id, department_name)
VALUES (1, 'Marketing'), (2, 'Sales'), (3, 'HR'), (6, 'Engineering');

INSERT INTO estudosaleatorios.employees (employee_id, first_name, last_name, department_id)
VALUES 
    (1, 'John', 'Doe', 1),
    (2, 'Jane', 'Smith', 2),
    (3, 'Mary', 'Johnson', 3),
    (4, 'James', 'Brown', 4),
    (5, 'Emily', 'Davis', 1),
    (6, 'Michael', 'Miller', 2),
    (7, 'Sarah', 'Wilson', 3),
    (8, 'David', 'Moore', 4);
    
-- quais os departamentos de cada funcionário? Traga apenas os funcionários com departamento cadastrado
select
	employee_id
    , first_name
    , last_name
    , department_name
from estudosaleatorios.employees
inner join estudosaleatorios.departments
on employees.department_id = departments.department_id;

-- quais funcionários não possuem departamento cadastrado?
select
	employee_id
    , first_name
    , last_name
    , department_name
from estudosaleatorios.employees
left join estudosaleatorios.departments
on employees.department_id = departments.department_id
where departments.department_name is null;





-- quais departamentos não possuem nenhum funcionário cadastrado?
select
	departments.department_id
    , department_name
from estudosaleatorios.departments
left join estudosaleatorios.employees
on departments.department_id = employees.department_id
where employees.department_id is null;



drop table estudosaleatorios.departments;
drop table estudosaleatorios.employees;