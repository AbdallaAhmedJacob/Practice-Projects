-- Problem 25: Get make and vehicles that the engine contains 'OHV' and have Cylinders = 4  

USE VehicleMakesDB
GO

SELECT Makes.Make, VehicleDetails.* 
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE VehicleDetails.Engine LIKE '%OHV%' AND VehicleDetails.EngineCylinders = 4
GO
