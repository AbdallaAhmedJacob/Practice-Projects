 -- Problem 33: Get Minimum Engine CC , Maximum Engine CC , and Average Engine CC of all Vehicles  

USE VehicleMakesDB
GO

SELECT MIN(VehicleDetails.Engine_CC) AS MinimumEngineCC, 
	   MAX(VehicleDetails.Engine_CC) AS MaxmumEngineCC,
	   AVG(VehicleDetails.Engine_CC) AS AvarageEngineCC
FROM VehicleDetails
GO