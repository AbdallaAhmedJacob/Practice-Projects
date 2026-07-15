-- Problem 17: Get total Makes that Mantufactures DriveTypeName=FWD 

USE VehicleMakesDB
GO

SELECT COUNT(DISTINCT Makes.Make) AS MakeWithFWD
FROM DriveTypes
INNER JOIN VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE DriveTypes.DriveTypeName = 'FWD'
GO


--USE VehicleMakesDB
--GO

--SELECT COUNT(*) AS MakeWithFWD
--FROM(
--	SELECT DISTINCT Makes.Make, DriveTypes.DriveTypeName
--	FROM DriveTypes
--	INNER JOIN VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
--	INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
--	WHERE DriveTypes.DriveTypeName = 'FWD'
--)R1
