-- select employees.id, checks.employee_id from checks
-- 	inner join employees on checks.employee_id != employees.id
-- 	where checks.employee_id != employees.id 

-- opener emplados que no estan en un sierto mes
-- select * from employees
-- 	where id not in 
-- 		(select employee_id, DATE_TRUNC('month', datetime) as mes from checks 
-- 		 	where DATE_TRUNC('month', datetime) as mes = january 
-- 		 		group by employee_id)
--- attendance
select count (*), datetime from checks 
	where employee_id in (select employees.id from employees where company_id = 3) 
		and checks.check = 'in' 
			group by datetime

-- obtener el mes el empleado y el dia
select employee_id, TO_CHAR(DATE(datetime), 'Month') as mes, datetime from checks
	where checks.check = 'in' and EXTRACT(MONTH FROM datetime) = 12
		group by employee_id, datetime

-- optener checks por dia
select count(DATE_TRUNC('day', datetime)), DATE_TRUNC('day', datetime) as dia  from employees join checks on employees.id = employee_id
	where company_id = 1 and checks.check = 'in'
		group by dia
						
-- select * from employees
-- select * from checks

-- select employee_id, TO_CHAR(DATE(datetime), 'Month') as fecha from checks
-- 	group by employee_id, DATE_TRUNC('month', datetime)
	
	
	
-- select employee_id from checks group by employee_id
