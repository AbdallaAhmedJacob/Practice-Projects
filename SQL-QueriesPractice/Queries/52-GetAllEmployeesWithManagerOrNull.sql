 -- Problem 52: Get all employees that have manager or does not have manager along with Manager's name, incase no manager name show null  

USE EmployeesDB
GO

SELECT Employees.EmployeeID, Employees.Name, Employees.Salary, Managers.Name AS ManagerName
FROM Employees
LEFT JOIN Employees AS Managers ON Employees.ManagerID = Managers.EmployeeID
GO
