 -- Problem 57: Get all Makes that have vehicles with both Gas and Electric FuelTypes  

USE VehicleMakesDB
GO

SELECT Makes.Make
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
INNER JOIN FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
WHERE FuelTypes.FuelTypeName IN ('Gas', 'Electric')
GROUP BY Makes.Make
GO
