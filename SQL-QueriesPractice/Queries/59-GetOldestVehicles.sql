 -- Problem 59: Get all vehicles manufactured in the same year as the oldest vehicle in database  

USE VehicleMakesDB
GO

SELECT VehicleDetails.*
FROM VehicleDetails
WHERE VehicleDetails.Year = (SELECT MIN(VehicleDetails.Year) FROM VehicleDetails)
GO
