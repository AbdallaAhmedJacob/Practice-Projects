/**
Problem 2:

Get all vehicles made between 1950 and 2000
**/
USE VehicleMakesDB;
GO

SELECT * 
FROM vwVehicleMasterView
WHERE
	Year BETWEEN  1950 AND 2000;
