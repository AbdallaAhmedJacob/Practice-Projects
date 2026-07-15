--Problem 9: Get all vehicles that runs with GAS 

USE VehicleMakesDB;
GO

SELECT VehicleDetails.*, FuelTypes.FuelTypeName 
FROM VehicleDetails
INNER JOIN FuelTypes ON FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID
WHERE FuelTypeName = N'GAS'