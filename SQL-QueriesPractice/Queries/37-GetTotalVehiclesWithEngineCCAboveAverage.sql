 -- Problem 37: Get total vehicles that have Engin_CC above average  

 USE VehicleMakesDB
 GO

 SELECT COUNT(*) AS NumberOfVehiclesAboveAverageEngineCC
 FROM(
	SELECT VehicleDetails.VehicleDisplayName, VehicleDetails.Engine_CC
	FROM VehicleDetails
	WHERE VehicleDetails.Engine_CC > (SELECT AVG(VehicleDetails.Engine_CC) FROM VehicleDetails)
 )R1
 GO
