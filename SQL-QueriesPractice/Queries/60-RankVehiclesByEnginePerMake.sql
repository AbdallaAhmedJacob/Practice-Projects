 -- Problem 60: Get Make, Model, and rank vehicles by Engine_CC within each Make  

USE VehicleMakesDB
GO

SELECT Makes.Make, 
	   MakeModels.ModelName,
	   V1.Engine_CC,
	   (
			SELECT COUNT(DISTINCT V2.Engine_CC)
			FROM VehicleDetails AS V2
			WHERE V2.MakeID = Makes.MakeID
			  AND V2.Engine_CC > V1.Engine_CC	   
	   ) + 1 AS Rank
FROM VehicleDetails AS V1
INNER JOIN Makes ON V1.MakeID = Makes.MakeID
INNER JOIN MakeModels ON V1.ModelID = MakeModels.ModelID
ORDER BY Makes.Make, Rank
GO
