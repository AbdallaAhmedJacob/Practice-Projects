-- Problem 14: Get all Makes with make starts with 'B' 

USE VehicleMakesDB
GO

SELECT Makes.Make
FROM Makes
WHERE Makes.Make LIKE 'B%'
GO