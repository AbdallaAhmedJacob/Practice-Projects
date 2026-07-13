/**
Problem 4:

Get number vehicles made between 1950 and 2000 per make and order them 
by number of vehicles descending. 
**/

USE VehicleMakesDB;
GO
SELECT Makes.Make, COUNT(*) AS NumberOfVehicles
FROM VehicleDetails
INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID
WHERE Year BETWEEN 1950 AND 2000
GROUP BY Make 
ORDER BY NumberOfVehicles DESC;
GO
