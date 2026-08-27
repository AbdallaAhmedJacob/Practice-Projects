 -- Problem 69: Calculate total tax and average tax per Make using CASE WHEN logic, if Engine_CC > 3000 Tax 500, 1600-3000 Tax 300 else 100

USE VehicleMakesDB
GO

SELECT M.Make, COUNT(V.ID) AS TotalVehicles,
SUM(
CASE 
	WHEN V.Engine_CC > 3000 THEN 500 
	WHEN V.Engine_CC BETWEEN 1600 AND 3000 THEN 300 
	ELSE 100 
END
) AS TotalTax , 
AVG(
	CASE 
		WHEN V.Engine_CC > 3000 THEN 500 
		WHEN V.Engine_CC BETWEEN 1600 AND 3000 THEN 300 
		ELSE 100 
	END	
) AS AvgTaxPerVehicle 
FROM VehicleDetails V
INNER JOIN Makes M ON V.MakeID = M.MakeID
GROUP BY M.Make 
GO

