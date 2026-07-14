--Problem 8: Get Make, FuelTypeName and Number of Vehicles per FuelType per Make 

USE VehicleMakesDB;

SELECT Makes.Make, FuelTypes.FuelTypeName, COUNT(*) AS NumberOfVehicle
FROM VehicleDetails
INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID
INNER JOIN FuelTypes ON FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID
GROUP BY Makes.Make, FuelTypes.FuelTypeName
ORDER BY Makes.Make