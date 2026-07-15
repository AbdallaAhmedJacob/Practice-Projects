-- Problem 20: Get all Vehicles that number of doors is not specified  

USE VehicleMakesDB
GO

SELECT * 
FROM VehicleDetails
WHERE VehicleDetails.NumDoors IS NULL
GO