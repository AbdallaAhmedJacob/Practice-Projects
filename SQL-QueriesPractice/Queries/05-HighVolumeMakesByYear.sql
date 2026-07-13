/**
Problem 5: 

Get All Makes that have manufactured more than 12000 Vehicles in years 1950 to 2000
**/

USE VehicleMakesDB;
GO

SELECT Make, COUNT(*) AS NumberOfVehicles
FROM VehicleDetails
INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID
WHERE Year BETWEEN 1950 AND 2000
GROUP BY Make
HAVING COUNT(*) >= 12000 
ORDER BY NumberOfVehicles DESC;
GO

--SELECT * FROM (
--SELECT Make, COUNT(*) AS NumberOfVehicles
--FROM VehicleDetails
--INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID
--WHERE Year BETWEEN 1950 AND 2000
--GROUP BY Make
--)  R1
--WHERE R1.NumberOfVehicles >= 12000 
--GO
