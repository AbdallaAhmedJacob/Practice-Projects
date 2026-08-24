 -- Problem 67: Get Make and total vehicles count where all its vehicles have at least 4 doors  

USE VehicleMakesDB
GO

SELECT V.MakeID, M.Make, COUNT(*) AS TotalVehicles
FROM VehicleDetails V
INNER JOIN Makes M ON V.MakeID = M.MakeID
GROUP BY V.MakeID, M.Make 
HAVING MIN(V.NumDoors) >= 4



