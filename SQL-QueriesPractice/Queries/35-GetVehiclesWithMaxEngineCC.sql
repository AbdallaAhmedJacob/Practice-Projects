 -- Problem 35: Get all vehicles that have the Maximum Engine_CC  

USE VehicleMakesDB
GO

SELECT VehicleDetails.VehicleDisplayName
FROM VehicleDetails
WHERE VehicleDetails.Engine_CC = (SELECT MAX(VehicleDetails.Engine_CC) FROM VehicleDetails)
ORDER BY Engine_CC
GO