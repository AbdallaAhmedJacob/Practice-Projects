-- Problem 19: Get total vehicles per DriveTypeName Per Make then filter only results with total greater than 10,000  

USE VehicleMakesDB
GO

SELECT Makes.Make, DriveTypes.DriveTypeName, COUNT(*) AS Total
FROM VehicleDetails
INNER JOIN DriveTypes ON VehicleDetails.DriveTypeID = DriveTypes.DriveTypeID
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY DriveTypeName, Make
HAVING COUNT(*) > 10000
ORDER BY Make ASC, Total DESC
GO