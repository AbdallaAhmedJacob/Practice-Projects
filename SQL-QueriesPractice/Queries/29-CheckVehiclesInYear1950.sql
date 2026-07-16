 -- Problem 29: Return found = 1 if there is any vehicle made in year 1950  

 USE VehicleMakesDB
 GO

 SELECT FOUND = 1
 WHERE EXISTS(
	SELECT TOP 1 *
	FROM VehicleDetails
	WHERE VehicleDetails.Year IN (1950)
 )
 GO
