 -- Problem 36: Get all vehicles that have Engin_CC below average  

USE VehicleMakesDB
GO

SELECT VehicleDetails.VehicleDisplayName
FROM VehicleDetails
WHERE VehicleDetails.Engine_CC < (SELECT AVG(VehicleDetails.Engine_CC) FROM VehicleDetails)
GO
