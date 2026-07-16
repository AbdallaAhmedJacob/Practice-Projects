 -- Problem 30: Get all VehicleDisplayName, NumDoors and add extra column to describe number of doors by words, and if door is null display 'Not Set'  

 USE VehicleMakesDB
 GO

 SELECT VehicleDetails.VehicleDisplayName, VehicleDetails.NumDoors,
CASE
	WHEN VehicleDetails.NumDoors IS NULL THEN 'Not Set'
	WHEN VehicleDetails.NumDoors = 0 THEN 'Zero Door'
	WHEN VehicleDetails.NumDoors = 1 THEN 'One Door'
	WHEN VehicleDetails.NumDoors = 2 THEN 'Tow Doors'
	WHEN VehicleDetails.NumDoors = 3 THEN 'Three Doors'
	WHEN VehicleDetails.NumDoors = 4 THEN 'Four Doors'
	WHEN VehicleDetails.NumDoors = 5 THEN 'Five Doors'
	WHEN VehicleDetails.NumDoors = 6 THEN 'Six Doors'
	WHEN VehicleDetails.NumDoors = 8 THEN 'Eight Doors'
	ELSE 'Unknown'
END AS DoorsDescription
FROM VehicleDetails
GO
