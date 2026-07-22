 -- Problem 49: Get the Lowest Manufacturers manufactured the lowest number of models  

USE VehicleMakesDB
GO

SELECT Makes.Make, COUNT(*) AS NumberOfModels
FROM Makes
INNER JOIN MakeModels ON MakeModels.MakeID = Makes.MakeID
GROUP BY Makes.Make
HAVING COUNT(*) = (
	SELECT MIN(R1.NumberOfModels) AS MinNumberOfModels
	FROM (
		SELECT MakeModels.MakeID, COUNT(*) AS NumberOfModels
		FROM MakeModels
		GROUP BY MakeModels.MakeID
	)R1
)
GO
