 -- Problem 56: Get top 3 most common FuelTypes used in vehicles  
USE VehicleMakesDB
GO
SELECT TOP 3 
    FuelTypes.FuelTypeName, 
    COUNT(*) AS TotalVehicles
FROM VehicleDetails
INNER JOIN FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
GROUP BY FuelTypes.FuelTypeName
ORDER BY TotalVehicles DESC
GO
