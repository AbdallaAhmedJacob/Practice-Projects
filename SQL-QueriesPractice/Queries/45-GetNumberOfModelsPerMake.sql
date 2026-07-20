 -- Problem 45: Get Number of Models Per Make  

USE VehicleMakesDB
GO

SELECT Makes.Make, COUNT(*) AS NumberOfModels
FROM MakeModels
INNER JOIN Makes ON Makes.MakeID = Makes.MakeID
WHERE Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
ORDER BY NumberOfModels DESC
GO
