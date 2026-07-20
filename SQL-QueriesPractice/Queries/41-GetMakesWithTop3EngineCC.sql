 -- Problem 41: Get all Makes that manufactures one of the Max 3 Engine CC 

USE VehicleMakesDB
GO

SELECT DISTINCT Makes.Make
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE VehicleDetails.Engine_CC IN (
	SELECT DISTINCT TOP 3 VehicleDetails.Engine_CC
	FROM VehicleDetails
	ORDER BY VehicleDetails.Engine_CC DESC
)
GO
