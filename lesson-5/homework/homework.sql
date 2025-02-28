--1. Write a query that uses an alias to rename the ProductName column as Name in the Products table.
select ProductName as [Name] from Products

--2. Write a query that uses an alias to rename the Customers table as Client for easier reference.

select * from Customers as Client

--3. Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discontinued.

select ProductName from Products
union
select ProductName from Products_l2 as Products_Discontinued

--4. Write a query to find the intersection of Products and Products_Discontinued tables using INTERSECT.

select ProductName from Products
intersect
select ProductName from Products_l2 as Products_Discontinue

--5. Use UNION ALL to combine two tables, Products and Orders, that have the same structure.

select Quantity from Orders 
union all
select StockQuantity from Products

--6. Write a query to select distinct customer names (CustomerName) and their corresponding Country using SELECT DISTINCT.

select distinct CustomerName, Country from Customers_l2 as Customers

--7. Write a query that uses CASE to create a conditional column that displays 'High' if Price > 100, and 'Low' if Price <= 100.

select productid,productname,case when price>100 then 'High' else 'Low' end from Products

--8. Write a query to filter Employees by Department and group them by Country.

select country,count(*) from employees where department='HR' group by country

--10. Use IIF to create a column that shows 'Yes' if Stock > 100, and 'No' otherwise.

select iif(stock>100,'Yes','No') from stock 
	
--11. Write a query that joins the Orders and Customers tables using INNER JOIN and aliases the CustomerName as ClientName.

select 
	orderid,
	o.customerId,
	c.Name as ClientName,
	OrderDate,
	Quantity,
	TotalAmount 
from
	customers c
inner join 
	orders o on c.customerID=o.customerID;

-- 12. Use UNION to combine results from two queries that select ProductName from Products and ProductName from OutOfStock tables.

select ProductName from Products
union 
select ProductName from OutOfStock

-- 13. Write a query that returns the difference between the Products and DiscontinuedProducts tables using EXCEPT.

select * from Products
except
select * from DiscontinuedProducts

-- 14. Write a query that uses CASE to assign a value of 'Eligible' to customers who have placed more than 5 orders, otherwise 'Not Eligible'.

select 
	o.customerid,
	case 
		when count(*) > 5 then 'Eligible'
		else 'Not Eligible'
	end 
from 
	orders o 
group by o.customerid

-- 15. Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 100, and 'Affordable' if less.

select 
	productname,
	price,
	case when price>100 then 'expensive' else 'Affordable' end 
from 
	products

-- 16. Write a query that uses GROUP BY to count the number of orders per CustomerID in the Orders table.

select 
	customerid,
	count(*) as the_number_of_orders
from 
	orders 
group by customerid

-- 17. Write a query to find employees in the Employees table who have either Age < 25 or Salary > 6000.

select * from employees where age < 25 or salary > 6000

-- 18. Use GROUP BY to find the total sales (SalesAmount) per Region in the Sales table.

select region, sum(SalesAmount) as total_sales from sales group by region

--19. Write a query that combines data from the Customers and Orders tables using LEFT JOIN, and create an alias for OrderDate.

select 
	orderid,
	o.customerId,
	c.Name as ClientName,
	OrderDate,
	Quantity,
	TotalAmount 
from
	customers c
left join 
	orders o on c.customerID=o.customerID

-- 20. Use IF statement to update the salary of an employee based on their department, increase by 10% if they work in 'HR'.
update employees set salary = salary*1.1 where employeeid in (select distinct employeeid from EmployeeDepartments where departmentname='HR')

--21. Write a query that uses UNION ALL to combine two tables, Sales and Returns, and calculate the total sales and returns for each product.

select sum(SaleAmount) as Sales from sales
union all
select sum(SaleAmount) as returns from Sales group by productId

--22. Use INTERSECT to show products that are common between Products and DiscontinuedProducts tables.

select productName from Products 
intersect 
select productName from DiscontinuedProducts

--23. Write a query that uses CASE to assign 'Top Tier' if TotalSales > 10000, 'Mid Tier' if TotalSales BETWEEN 5000 AND 10000, and 'Low Tier' otherwise.

select 
	productId,
	case
		when sum(SaleAmount) > 10000 then 'Top Tier'
		when sum(SaleAmount) between 5000 and 10000 then 'Mid Tier'
		else 'Low Tier'
	end as status 
from 
	Sales
group by productId

--25. Use EXCEPT to find customers who have placed orders but do not have a corresponding record in the Invoices table.

SELECT CustomerID 
FROM Orders
EXCEPT
SELECT CustomerID 
FROM Invoices;

-- 26. Write a query that uses GROUP BY on three columns: CustomerID, ProductID, and Region, and calculates the total sales.

SELECT 
    CustomerID, 
    ProductID, 
    Region, 
    SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID, ProductID, Region;

-- 27. Write a query that uses CASE to apply multiple conditions and returns a Discount column based on the Quantity purchased.

-- 28. Use UNION and INNER JOIN to return all products that are either in the Products or DiscontinuedProducts table and also show if they are currently in stock.

-- 29. Write a query that uses IIF to create a new column StockStatus, where the status is 'Available' if Stock > 0, and 'Out of Stock' if Stock = 0.


select *, iif(stock > 0, 'Available', 'Out of stock') from stock

--30. Write a query that uses EXCEPT to find customers in the Customers table who are not in the VIP_Customers table based on CustomerID.
select customerName from Customers 
except 
select customerName from VIP_Customers 
