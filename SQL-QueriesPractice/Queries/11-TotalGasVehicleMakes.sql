--Problem 11: Get Total Makes that runs with GAS 

USE VehicleMakesDB
GO 

SELECT COUNT(DISTINCT Makes.Make) AS TotalMakesRunsOnGas
FROM Makes
INNER JOIN VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID
INNER JOIN FuelTypes ON FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID
WHERE FuelTypes.FuelTypeName = N'GAS'
GO

--USE VehicleMakesDB
--GO 

--SELECT COUNT(*) AS TotalMakesRunsOnGas
--FROM(
--	SELECT DISTINCT Makes.Make, FuelTypes.FuelTypeName
--	FROM Makes
--	INNER JOIN VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID
--	INNER JOIN FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
--	WHERE FuelTypes.FuelTypeName = N'GAS'
--)R1
--GO
