-- Problem 22: Get percentage of vehicles that has no doors specified  

USE VehicleMakesDB
GO

SELECT(
	CAST( (SELECT COUNT(*) FROM VehicleDetails WHERE VehicleDetails.NumDoors IS NULL) AS float)
	/
	CAST( (SELECT COUNT(*) FROM VehicleDetails) AS float)	
) AS PercOfNoSpecifiedDoors
GO
