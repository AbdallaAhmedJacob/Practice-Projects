/**
Problem 3:

Get number vehicles made between 1950 and 2000 
**/
USE VehicleMakesDB;
GO

SELECT COUNT(*) AS NumberOfVehicles
FROM vwVehicleMasterView
WHERE Year BETWEEN 1950 AND 2000;
