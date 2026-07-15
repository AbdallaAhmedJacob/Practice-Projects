-- Problem 15: Get all Makes with make ends with 'W' 

USE VehicleMakesDB
GO

SELECT Makes.Make
FROM Makes
WHERE Makes.Make LIKE '%W'
GO