-- Problem 7: Get number of vehicles made between 1950 and 2000 per make and add total vehicles column beside it, then calculate it's percentage

 USE VehicleMakesDB;
 GO
 SELECT *, CAST(R1.TotalMake AS float) / CAST(R1.TotalVehicles AS float) AS Perc FROM(
 SELECT Makes.Make, COUNT(*) AS TotalMake, (SELECT COUNT(*)FROM VehicleDetails) AS TotalVehicles
 FROM VehicleDetails
 INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID
 WHERE Year BETWEEN 1950 AND 2000
 GROUP BY Make
) AS R1
ORDER BY R1.TotalMake DESC
GO
