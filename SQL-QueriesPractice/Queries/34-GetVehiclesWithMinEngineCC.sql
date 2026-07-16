 -- Problem 34: Get all vehicles that have the minimum Engine_CC  

USE VehicleMakesDB
GO

SELECT VehicleDetails.VehicleDisplayName
FROM VehicleDetails
WHERE VehicleDetails.Engine_CC = (SELECT MIN(VehicleDetails.Engine_CC) FROM VehicleDetails) 
GO
