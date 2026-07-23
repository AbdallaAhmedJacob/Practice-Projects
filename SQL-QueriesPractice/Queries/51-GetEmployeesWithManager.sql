 -- Problem 51: Get all employees that have manager along with Manager's name.  
USE EmployeesDB
GO

SELECT Employees.EmployeeID, Employees.Name, Employees.Salary, Employees.ManagerID, Managers.Name AS ManagerName
FROM Employees
INNER JOIN Employees AS Managers ON Employees.ManagerID = Managers.EmployeeID
GO
