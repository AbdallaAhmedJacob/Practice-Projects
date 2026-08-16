 -- Problem 63: Get all vehicles where SubModelName contains numbers  

USE VehicleMakesDB
GO

SELECT VehicleDetails.ID, SubModels.SubModelName
FROM VehicleDetails
INNER JOIN SubModels ON VehicleDetails.SubModelID = SubModels.SubModelID
WHERE SubModels.SubModelName LIKE '%[0-9]%'
GO