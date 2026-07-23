 -- Problem 53: Get all employees that have manager or does not have manager along with Manager's name, incase no manager name the same employee name as manager to himself  

USE EmployeesDB
GO

SELECT Employees.EmployeeID, Employees.Name, Employees.Salary, 
		CASE
			WHEN Employees.ManagerID IS NULL THEN Employees.Name
			WHEN Employees.ManagerID IS NOT NULL THEN Managers.Name
		END AS ManagerName
FROM Employees
LEFT JOIN Employees AS Managers ON Employees.ManagerID = Managers.EmployeeID
GO
