-- Problem 21: Get Total Vehicles that number of doors is not specified  

USE VehicleMakesDB
GO

SELECT COUNT(*) AS TotalOfVehicles
FROM VehicleDetails
WHERE VehicleDetails.NumDoors IS NULL
GO