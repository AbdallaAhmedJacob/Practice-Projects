-- Problem 24: Get all vehicles that have Engines greater than 3 Liters and have only 2 doors  

USE VehicleMakesDB
GO

SELECT *
FROM VehicleDetails
WHERE VehicleDetails.EngineLiterDisplay > 2 AND VehicleDetails.NumDoors = 2
GO