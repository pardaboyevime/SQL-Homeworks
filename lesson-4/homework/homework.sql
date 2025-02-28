--1. Write a query to select the top 5 employees from the Employees table.

select top 5 * from employees

-- 2. Use SELECT DISTINCT to select unique ProductName values from the Products table.

select distinct ProductName from Products

-- 3. Write a query that filters the Products table to show products with Price > 100.

select	* from products where price > 100

-- 4. Write a query to select all CustomerName values that start with 'A' using the LIKE operator.

select * from customers where CustomerName like 'A%'

-- 5. Order the results of a Products query by Price in ascending order.

select * from products order by price asc

-- 6. Write a query that uses the WHERE clause to filter for employees with Salary >= 5000 and Department = 'HR'.

select * from employees where salary >= 5000 and Department = 'HR'

--7. Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".

select isnull(email,'noemail@gmail.com') from customers

--8. Write a query that shows all products with Price BETWEEN 50 AND 100.

select * from products where price between 50 and 100

--9. Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.

select distinct Category , ProductName from products

-- 10. Order the results by ProductName in descending order.

select distinct Category , ProductName from products order by ProductName desc

--11. Write a query to select the top 10 products from the Products table, ordered by Price DESC.

select top 10 * from products order by price desc

-- 12. Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.

select coalesce(FirstName, LastName,'No Name') from employees

-- 13. Write a query that selects distinct Category and Price from the Products table.

select distinct category, price from products 

-- 14. Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.

select * from Employees where age between 30 and 40 or Department = 'Marketing'

-- 15. Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.

select * from Employees order by salary offset 10 rows fetch next 10 rows only

--16. Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.

select * from products where price <= 1000 and stock > 50 order by stock asc

--17. Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.


select * from products where ProductName like '%e%'

-- 18. Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.

select * from Employees where department in ('HR','IT','Finance')

-- 19. Write a query that uses the ANY operator to find employees who earn more than the average salary of all employees.

select  * from employees where salary > any(select avg(salary) from employees)

-- 20. Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.

select * from customers order by city asc,PostalCode desc

--21. Write a query that selects the top 10 products with the highest sales, using TOP(10) and ordered by SalesAmount DESC.

select top 10 * from Sales order by SaleAmount

-- 22. Use COALESCE to combine FirstName and LastName into one column named FullName in the Employees table.

select coalesce(fisrtName+LastName, FirstName, LastName,'No Name') from employees

-- 23. Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.

select distinct category, ProductName, Price from products where price > 50

-- 24. Write a query that selects products whose Price is within 10% of the average price in the Products table.

select * from products where price < (select avg(price) from products)*1.1 and price > (select avg(price) from products)*0.9

-- 25. Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.

select * from employees where age <= 30 and department in ('HR','IT')

-- 26. Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.

select * from customers_l1 where email like '%@gmail.com'

-- 27. Write a query that uses the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department.

select * from Employees where salary > all(select max(salary) from employees where department = 'Sales')

-- 28. Use ORDER BY with OFFSET-FETCH to show employees with the highest salaries, displaying 10 employees at a time (pagination).

select * from Employees order by salary offset 0 rows fetch next 10 rows only

-- 29. Write a query that filters the Orders table for orders placed in the last 30 days using BETWEEN and CURRENT_DATE.

select * from orders where datediff(day,orderDate,GETDATE())<=30 

-- Use ANY with a subquery to select all employees who earn more than the average salary for their department.

with cte as (
	select 
		department,
		avg(salary) as average
	from employees
)
select employees.* from employees join cte on cte.department=employees.department where employees.salary>cte.average;
