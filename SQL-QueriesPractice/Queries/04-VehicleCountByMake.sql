/**
Problem 4:

Get number vehicles made between 1950 and 2000 per make and order them 
by number of vehicles descending. 
**/

USE VehicleMakesDB;
GO

SELECT Make, COUNT(*) AS NumberOfVehicles
FROM vwVehicleMasterView
WHERE Year BETWEEN 1950 AND 2000
GROUP BY Make 
ORDER BY NumberOfVehicles DESC;
GO