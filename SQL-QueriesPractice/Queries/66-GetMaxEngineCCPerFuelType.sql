 -- Problem 66: Get all vehicles that have maximum Engine_CC for each FuelType  

USE VehicleMakesDB
GO

WITH MaxEngines AS (
	SELECT MAX(VD.Engine_CC) AS MaxEngenCC, VD.FuelTypeID AS FT
	FROM VehicleDetails VD
	GROUP BY VD.FuelTypeID
)
SELECT V.Engine_CC, V.VehicleDisplayName, V.ID, F.FuelTypeName 
FROM VehicleDetails AS V, MaxEngines AS M
INNER JOIN FuelTypes AS F ON M.FT = F.FuelTypeID
WHERE V.Engine_CC = M.MaxEngenCC AND V.FuelTypeID = M.FT
ORDER BY V.Engine_CC DESC, F.FuelTypeName ASC
GO


