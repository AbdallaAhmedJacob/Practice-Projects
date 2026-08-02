 -- Problem 55: Get all vehicles that have engine size above average for their specific Make  
USE VehicleMakesDB
GO

SELECT 
    VehicleDetails.ID AS VehicleID, 
    VehicleDetails.VehicleDisplayName AS Name, 
    Makes.Make AS Make, 
    VehicleDetails.MakeID,
    MakeModels.ModelName AS Model, 
    VehicleDetails.Engine_CC AS Engine_CC,
(
	SELECT AVG(V2.Engine_CC) 
	FROM VehicleDetails V2 
	WHERE V2.MakeID = VehicleDetails.MakeID
) AS MakeAvgEngineCC
    FROM VehicleDetails 
    INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID 
    INNER JOIN MakeModels ON VehicleDetails.ModelID = MakeModels.ModelID 
WHERE VehicleDetails.Engine_CC > ( 
    SELECT AVG(V2.Engine_CC) 
    FROM VehicleDetails V2 
    WHERE V2.MakeID = VehicleDetails.MakeID
);
