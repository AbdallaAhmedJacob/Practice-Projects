 -- Problem 32: Get all VehicleDisplayName, year, Age for vehicles that their age between 15 and 25 years old  

 USE VehicleMakesDB
 GO
 SELECT *
 FROM (
	SELECT VehicleDetails.VehicleDisplayName, VehicleDetails.Year, (YEAR(GETDATE()) - VehicleDetails.Year) AS AGE
	FROM VehicleDetails
 )R1
 WHERE R1.AGE BETWEEN 15 AND 25
GO