-- Problem 23: Get MakeID , Make, SubModelName for all vehicles that have SubModelName 'Elite'  

USE VehicleMakesDB
GO 

SELECT DISTINCT VehicleDetails.MakeID, Makes.Make, SubModels.SubModelName
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
INNER JOIN SubModels ON VehicleDetails.SubModelID = SubModels.SubModelID
WHERE SubModelName = 'Elite'
ORDER BY MakeID ASC, Make ASC
GO