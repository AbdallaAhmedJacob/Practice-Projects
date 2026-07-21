 -- Problem 47: Get the highest number of models manufactured  
USE VehicleMakesDB
GO

SELECT MAX(R1.TotalNumberOfModels) AS MaxNumberOfModels FROM (
	SELECT COUNT(*) AS TotalNumberOfModels
	FROM MakeModels
	GROUP BY MakeModels.MakeID
)R1
GO
