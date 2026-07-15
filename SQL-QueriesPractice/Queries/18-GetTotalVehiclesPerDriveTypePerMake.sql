-- Problem 18: Get total vehicles per DriveTypeName Per Make and order them per make asc then per total Desc

USE VehicleMakesDB
GO

SELECT Makes.Make, DriveTypes.DriveTypeName, COUNT(*) AS Total
FROM VehicleDetails
INNER JOIN Makes 	  ON VehicleDetails.MakeID = Makes.MakeID
INNER JOIN DriveTypes ON VehicleDetails.DriveTypeID = DriveTypes.DriveTypeID
GROUP BY Make, DriveTypeName
ORDER BY Make ASC, Total DESC
GO
