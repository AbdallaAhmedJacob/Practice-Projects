-- Problem 16: Get all Makes that manufactures DriveTypeName = FWD 


USE VehicleMakesDB
GO

SELECT DISTINCT Makes.Make, DriveTypes.DriveTypeName
FROM DriveTypes
INNER JOIN VehicleDetails ON VehicleDetails.DriveTypeID = DriveTypes.DriveTypeID 
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE DriveTypes.DriveTypeName = 'FWD'
GO
