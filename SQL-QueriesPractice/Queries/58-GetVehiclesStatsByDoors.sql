 -- Problem 58: Get total vehicles and average Engine_CC grouped by NumDoors  
 USE VehicleMakesDB
 GO

SELECT VehicleDetails.NumDoors,
	   COUNT(*) AS TotalVehicles, 
	   AVG(VehicleDetails.Engine_CC) AS AverageEngineCC
FROM VehicleDetails
GROUP BY VehicleDetails.NumDoors
GO
