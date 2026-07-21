 -- Problem 46: Get the highest 3 manufacturers that make the highest number of models  
USE VehicleMakesDB
GO

SELECT TOP 3 Makes.Make, COUNT(*) AS NumberOfModels
FROM Makes
INNER JOIN MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
ORDER BY NumberOfModels DESC
GO
