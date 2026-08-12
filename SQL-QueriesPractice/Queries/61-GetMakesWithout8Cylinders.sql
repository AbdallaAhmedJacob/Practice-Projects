 -- Problem 61: Get all Makes that do not have any vehicle with 8 Cylinders  

USE VehicleMakesDB
GO

SELECT DISTINCT Makes.Make, VehicleDetails.EngineCylinders
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE VehicleDetails.MakeID NOT IN (
	SELECT DISTINCT VehicleDetails.MakeID
	FROM VehicleDetails
	WHERE VehicleDetails.EngineCylinders = 8
)
GO
