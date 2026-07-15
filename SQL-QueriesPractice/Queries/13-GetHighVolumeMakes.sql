-- Problem 13: Get all Makes/Count Of Vehicles that manufactures more than 20K Vehicles 

USE VehicleMakesDB
GO

SELECT Makes.Make, COUNT(*) AS NumberOfVehicles
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY Make
HAVING COUNT(*) > 20000
ORDER BY NumberOfVehicles DESC

--SELECT * FROM (
--SELECT Makes.Make, COUNT(*) AS NumberOfVehicles
--FROM VehicleDetails
--INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
--GROUP BY Make) R1
--WHERE NumberOfVehicles > 20000
--ORDER BY R1.NumberOfVehicles DESC
