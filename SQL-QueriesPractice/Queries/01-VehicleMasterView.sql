/**
Problem 1:

Create a Master View that displays all vehicle details 
by joining all related tables 
**/
USE VehicleMakesDB;
GO
CREATE VIEW vwVehicleMasterView AS 
SELECT
	VehicleDetails.ID,
	VehicleDetails.MakeID, 
	Makes.Make, 
	VehicleDetails.ModelID, 
	MakeModels.ModelName, 
	VehicleDetails.SubModelID, 
	SubModels.SubModelName, 
	VehicleDetails.FueltypeID, 
	FuelTypes.FuelTypeName,
	VehicleDetails.DriveTypeID,
	DriveTypes.DriveTypeName,
	VehicleDetails.BodyID,
	Bodies.BodyName,
	VehicleDetails.VehicleDisplayName,
	VehicleDetails.Year,
	VehicleDetails.Engine,
	VehicleDetails.Engine_CC,
	VehicleDetails.EngineCylinders,
	VehicleDetails.EngineLiterDisplay,
	VehicleDetails.NumDoors
FROM VehicleDetails
	INNER JOIN Makes		 ON Makes.MakeID			= VehicleDetails.MakeID 
	INNER JOIN MakeModels ON MakeModels.ModelID  	= VehicleDetails.ModelID  	
	INNER JOIN SubModels	 ON SubModels.SubModelID	= VehicleDetails.SubModelID	
	INNER JOIN FuelTypes	 ON FuelTypes.FuelTypeID	= VehicleDetails.FuelTypeID	
	INNER JOIN DriveTypes ON DriveTypes.DriveTypeID  = VehicleDetails.DriveTypeID  
	INNER JOIN Bodies     ON Bodies.BodyID      		= VehicleDetails.BodyID      	
GO

USE VehicleMakesDB;
SELECT * FROM vwVehicleMasterView;
GO