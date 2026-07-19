 -- Problem 38: Get all unique Engin_CC and sort them Desc  

 USE VehicleMakesDB
 GO

SELECT DISTINCT VehicleDetails.Engine_CC
FROM VehicleDetails	
ORDER BY VehicleDetails.Engine_CC DESC
GO		