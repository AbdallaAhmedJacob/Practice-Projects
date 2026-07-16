 -- Problem 31: Get all VehicleDisplayName, year and add extra column to calculate the age of the car then sort the results by age desc.  

 USE VehicleMakesDB
 GO

 SELECT VehicleDetails.VehicleDisplayName, VehicleDetails.Year, (YEAR(GETDATE()) - VehicleDetails.Year) AS AGE
 FROM VehicleDetails
 ORDER BY AGE DESC
 GO