-- Problem 26: Get all vehicles that their body is 'Sport Utility' and Year greater than 2020  

USE VehicleMakesDB
GO

SELECT Bodies.BodyName, VehicleDetails.*
FROM VehicleDetails
INNER JOIN Bodies ON VehicleDetails.BodyID = Bodies.BodyID
WHERE Bodies.BodyName = 'Sport Utility' AND VehicleDetails.Year > 2020
GO
