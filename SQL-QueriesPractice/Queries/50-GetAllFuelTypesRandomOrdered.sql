 -- Problem 50: Get all Fuel Types , each time the result should be showed in random order 

USE VehicleMakesDB
GO

SELECT FuelTypes.FuelTypeID, FuelTypes.FuelTypeName 
FROM FuelTypes
ORDER BY NEWID()
GO
