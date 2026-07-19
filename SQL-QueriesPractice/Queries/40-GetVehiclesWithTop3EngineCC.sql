 -- Problem 40: Get all vehicles that has one of the Max 3 Engine CC  
USE VehicleMakesDB
GO

SELECT VehicleDetails.VehicleDisplayName
FROM VehicleDetails
WHERE VehicleDetails.Engine_CC  IN (

		SELECT DISTINCT TOP 3 VehicleDetails.Engine_CC
		FROM VehicleDetails
		ORDER BY VehicleDetails.Engine_CC DESC
	)
GO