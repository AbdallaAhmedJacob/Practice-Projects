 -- Problem 48: Get the highest Manufacturers manufactured the highest number of models  
USE VehicleMakesDB
GO

SELECT Makes.Make, COUNT(*) AS NumberOfModels
FROM Makes
INNER JOIN MakeModels ON MakeModels.MakeID = Makes.MakeID
GROUP BY Makes.Make
HAVING COUNT(*) = (
	SELECT MAX(R1.NumberOfModels) AS MaxNumberofModels
	FROM(
		SELECT MakeModels.MakeID, COUNT(*) AS NumberOfModels
		FROM MakeModels
		GROUP BY MakeModels.MakeID
	)R1
)
