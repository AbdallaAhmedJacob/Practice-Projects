--Problem 6: Get number of vehicles made between 1950 and 2000 per make and add total vehicles column beside
 
 USE VehicleMakesDB;
 GO

 SELECT Makes.Make, COUNT(*) AS TotalMake,  (SELECT COUNT(*)FROM VehicleDetails) AS TotalVehicles 
 FROM VehicleDetails
 INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID
 WHERE Year BETWEEN 1950 AND 2000
 GROUP BY Make
GO