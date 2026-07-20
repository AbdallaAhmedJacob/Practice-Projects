 -- Problem 43: Get Make and Total Number Of Doors Manufactured Per Make  

USE VehicleMakesDB
GO

SELECT VehicleDetails.MakeID, Makes.Make, SUM(VehicleDetails.NumDoors) AS TotalNumberOfDoors
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY VehicleDetails.MakeID, Makes.Make
ORDER BY TotalNumberOfDoors DESC
GO
