 -- Problem 54: Get All Employees managed by 'Mohammed' 

USE EmployeesDB
GO

SELECT Employees.EmployeeID, Employees.Name, Employees.Salary, Managers.Name AS ManagerName
FROM Employees
INNER JOIN Employees AS Managers ON Employees.ManagerID = Managers.EmployeeID
WHERE Managers.Name = 'Mohammed'
GO
