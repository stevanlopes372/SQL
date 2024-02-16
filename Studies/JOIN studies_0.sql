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