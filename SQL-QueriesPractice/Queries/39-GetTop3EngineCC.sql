 -- Problem 39: Get the maximum 3 Engine CC  

USE VehicleMakesDB
GO

SELECT DISTINCT TOP 3 VehicleDetails.Engine_CC
FROM VehicleDetails
ORDER BY VehicleDetails.Engine_CC DESC
GO