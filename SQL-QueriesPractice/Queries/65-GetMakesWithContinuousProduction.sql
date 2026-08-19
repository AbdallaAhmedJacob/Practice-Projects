 -- Problem 65: Get all Makes that have manufactured vehicles in every single year between 2015 and 2020  

USE VehicleMakesDB
GO 

SELECT DISTINCT VehicleDetails.MakeID, Makes.Make
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE VehicleDetails.Year BETWEEN 2015 AND 2020
GROUP BY VehicleDetails.MakeID, Makes.Make
HAVING COUNT(DISTINCT VehicleDetails.Year) = 6
GO
