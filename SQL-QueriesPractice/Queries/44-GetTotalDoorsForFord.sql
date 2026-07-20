 -- Problem 44: Get Total Number Of Doors Manufactured by 'Ford'  
USE VehicleMakesDB
GO

SELECT VehicleDetails.MakeID, Makes.Make, SUM(VehicleDetails.NumDoors) AS TotalNumberOfDoors
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE Makes.Make = 'Ford'
GROUP BY VehicleDetails.MakeID, Makes.Make
ORDER BY TotalNumberOfDoors
GO
