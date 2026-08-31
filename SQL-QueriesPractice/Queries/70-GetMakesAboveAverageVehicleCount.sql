 -- Problem 70: Get all Makes that have higher total vehicles than the average total vehicles per Make 

USE VehicleMakesDB
GO

SELECT V.MakeID,
	   M.Make, 
	   COUNT(*) AS TotalVehicles,
	   (
	SELECT AVG(R1.TotalVehicles) AS AveragePerMake
		FROM (
			SELECT COUNT(*) AS TotalVehicles
			FROM VehicleDetails V1
			GROUP BY V1.MakeID
		) R1
)  AS GlobalAveragePerMake
FROM VehicleDetails V
INNER JOIN Makes M ON V.MakeID = M.MakeID
GROUP BY V.MakeID, M.Make
HAVING COUNT(*) > (
	SELECT AVG(R1.TotalVehicles) AS AveragePerMake
		FROM (
			SELECT COUNT(*) AS TotalVehicles
			FROM VehicleDetails V1
			GROUP BY V1.MakeID
		) R1
) 
ORDER BY TotalVehicles DESC
