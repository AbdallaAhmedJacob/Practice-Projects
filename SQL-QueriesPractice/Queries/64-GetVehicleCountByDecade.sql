 -- Problem 64: Get total vehicles count per decade starting from 1950s 

USE VehicleMakesDB
GO

SELECT (V1.Year / 10) * 10 AS Decate,
		COUNT(*) AS TotalVehicles
FROM VehicleDetails V1
WHERE V1.Year >= 1950
GROUP BY (V1.Year / 10) * 10
ORDER BY Decate
GO 
