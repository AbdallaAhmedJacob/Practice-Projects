# SQL Query Challenges

Welcome to the repository for the **SQL Vehicle & Employee Challenges**!  
This project contains solutions to several database problems designed to practice and master core SQL concepts including aggregations, string manipulations, joins, self-joins, filtering, conditional logic, and math functions.

---

## Table of Solutions

| # | Problem Description | File Name |
|---|---------------------|-----------|
| **01** | Create Master View for Vehicle Details | `01-VehicleMasterView.sql` |
| **02** | Get all vehicles made between 1950 and 2000 | `02-VehicleYearFilter.sql` |
| **03** | Get number of vehicles made between 1950 and 2000 | `03-VehicleCountByYearRange.sql` |
| **04** | Get number of vehicles made between 1950 and 2000 per make | `04-VehicleCountByMake.sql` |
| **05** | Get Makes that manufactured more than 20,000 vehicles between 1950 and 2000 | `05-HighVolumeMakesByYear.sql` |
| **06** | Get number of vehicles made between 1950 and 2000 per make and add total vehicles column beside | `06-VehicleCountWithTotalPerMake.sql` |
| **07** | Get number of vehicles made between 1950 and 2000 per make and add total vehicles column beside it, then calculate its percentage | `07-VehiclePercentagePerMake.sql` |
| **08** | Get Make, FuelTypeName and Number of Vehicles per FuelType per Make | `08-VehicleCountByFuelTypeAndMake.sql` |
| **09** | Get all vehicles that runs with GAS | `09-GasVehiclesList.sql` |
| **10** | Get all Makes that runs with GAS | `10-GasVehicleMakes.sql` |
| **11** | Get Total Makes that runs with GAS | `11-TotalGasVehicleMakes.sql` |
| **12** | Count Vehicles by make and order them by NumberOfVehicles from high to low | `12-CountVehiclesByMakeOrdered.sql` |
| **13** | Get all Makes/Count Of Vehicles that manufactures more than 20K Vehicles | `13-GetHighVolumeMakes.sql` |
| **14** | Get all Makes with make starts with 'B' | `14-GetMakesStartingWithB.sql` |
| **15** | Get all Makes with make ends with 'W' | `15-GetMakesEndingWithW.sql` |
| **16** | Get all Makes that manufactures DriveTypeName = FWD | `16-GetMakesByDriveTypeFWD.sql` |
| **17** | Get total Makes that Manufactures DriveTypeName=FWD | `17-GetTotalMakesByDriveTypeFWD.sql` |
| **18** | Get total vehicles per DriveTypeName Per Make and order them per make asc | `18-GetTotalVehiclesPerDriveTypePerMake.sql` |
| **19** | Get total vehicles per DriveTypeName Per Make then filter only results with total > 10,000 | `19-GetVehiclesPerDriveTypePerMakeFilter.sql` |
| **20** | Get all Vehicles that number of doors is not specified | `20-GetVehiclesWithNoDoorsSpecified.sql` |
| **21** | Get Total Vehicles that number of doors is not specified | `21-GetTotalVehiclesWithNoDoorsSpecified.sql` |
| **22** | Get percentage of vehicles that has no doors specified | `22-GetPercentageOfVehiclesWithNoDoors.sql` |
| **23** | Get MakeID, Make, SubModelName for all vehicles that have SubModelName 'Elite' | `23-GetEliteSubModelVehicles.sql` |
| **24** | Get all vehicles that have Engines > 3 Liters and have only 2 doors | `24-GetVehiclesByEngineAndDoors.sql` |
| **25** | Get make and vehicles that the engine contains 'OHV' and have Cylinders = 4 | `25-GetVehiclesByEngineTypeAndCylinders.sql` |
| **26** | Get all vehicles that their body is 'Sport Utility' and Year > 2020 | `26-GetRecentSportUtilityVehicles.sql` |
| **27** | Get all vehicles that their Body is 'Coupe' or 'Hatchback' or 'Sedan' | `27-GetVehiclesByBodyTypes.sql` |
| **28** | Get all vehicles that their body is 'Coupe' or 'Hatchback' or 'Sedan' and manufactured in year 2008 or 2020 or 2021 | `28-GetVehiclesByBodiesAndYears.sql` |
| **29** | Return found=1 if there is any vehicle made in year 1950 | `29-CheckVehiclesInYear1950.sql` |
| **30** | Get all Vehicle_Display_Name, NumDoors and add extra column to describe number of doors by words, and if door is null display 'Not Set' | `30-GetVehiclesWithDoorDescriptions.sql` |
| **31** | Get all Vehicle_Display_Name, year and add extra column to calculate the age of the car then sort the results by age desc | `31-GetVehiclesByAgeSorted.sql` |
| **32** | Get all Vehicle_Display_Name, year, Age for vehicles that their age between 15 and 25 years old | `32-GetVehiclesWithAgeBetween15And25.sql` |
| **33** | Get Minimum Engine CC, Maximum Engine CC, and Average Engine CC of all Vehicles | `33-GetEngineCCStats.sql` |
| **34** | Get all vehicles that have the minimum Engine_CC | `34-GetVehiclesWithMinEngineCC.sql` |
| **35** | Get all vehicles that have the Maximum Engine_CC | `35-GetVehiclesWithMaxEngineCC.sql` |
| **36** | Get all vehicles that have Engin_CC below average | `36-GetVehiclesWithEngineCCBelowAverage.sql` |
| **37** | Get total vehicles that have Engin_CC above average | `37-GetTotalVehiclesWithEngineCCAboveAverage.sql` |
| **38** | Get all unique Engin_CC and sort them Desc | `38-GetUniqueEngineCCSorted.sql` |
| **39** | Get the maximum 3 Engine CC | `39-GetTop3EngineCC.sql` |
| **40** | Get all vehicles that has one of the Max 3 Engine CC | `40-GetVehiclesWithTop3EngineCC.sql` |
| **41** | Get all Makes that manufactures one of the Max 3 Engine CC | `41-GetMakesWithTop3EngineCC.sql` |
| **42** | Get a table of unique Engine_CC and calculate tax per Engine CC | `42-GetUniqueEngineCCTaxTable.sql` |
| **43** | Get Make and Total Number Of Doors Manufactured Per Make | `43-GetTotalDoorsPerMake.sql` |
| **44** | Get Total Number Of Doors Manufactured by 'Ford' | `44-GetTotalDoorsForFord.sql` |
| **45** | Get Number of Models Per Make | `45-GetNumberOfModelsPerMake.sql` |
| **46** | Get the highest 3 manufacturers that make the highest number of models | `46-GetTop3ManufacturersByModelsCount.sql` |
| **47** | Get the highest number of models manufactured | `47-GetHighestNumberOfModels.sql` |
| **48** | Get the highest Manufacturers manufactured the highest number of models | `48-GetTopManufacturersByModels.sql` |
| **49** | Get the Lowest Manufacturers manufactured the lowest number of models | `49-GetLowestManufacturersByModels.sql` |
| **50** | Get all Fuel Types, each time the result should be showed in random order | `50-GetAllFuelTypesRandomOrdered.sql` |
| **51** | Get all employees that have manager along with Manager's name | `51-GetEmployeesWithManager.sql` |
| **52** | Get all employees that have manager or does not have manager along with Manager's name, incase no manager name show null | `52-GetAllEmployeesWithManagerOrNull.sql` |
| **53** | Get all employees that have manager or does not have manager along with Manager's name, incase no manager name show the same employee name as manager to himself | `53-GetAllEmployeesWithSelfManagerIfNull.sql` |
| **54** | Get All Employees managed by 'Mohammed' | `54-GetEmployeesManagedByMohammed.sql` |
| **55** | Get all vehicles that have engine size above average for their specific Make | `55-GetVehiclesAboveAverageEnginePerMake.sql` |
| **56** | Get top 3 most common FuelTypes used in vehicles | `56-GetTop3FuelTypes.sql` |
| **57** | Get all Makes that have vehicles with both Gas and Electric FuelTypes | `57-GetMakesWithGasAndElectric.sql` |
| **58** | Get Total vehicles and average Engine_CC grouped by NumDoors | `58-GetVehiclesStatsByDoors.sql` |
| **59** | Get all vehicles manufactured in the same year as the oldest vehicle in database | `59-GetOldestVehicles.sql` |
| **60** | Get Make, Model, and rank vehicles by Engine_CC within each Make | `60-RankVehiclesByEnginePerMake.sql` |
| **61** | Get all Makes that do not have any vehicle with 8 Cylinders | `61-GetMakesWithout8Cylinders.sql` |

---

## Key Topics Covered
- **Data Filtering & Sorting:** `WHERE`, `LIKE`, `IN`, `ORDER BY`
- **Aggregations & Grouping:** `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING`
- **Joins & Relations:** `INNER JOIN`, `LEFT JOIN`, `SELF JOIN`
- **Subqueries & Conditional Logic:** `CASE WHEN`, Nested Subqueries, `IS NULL`, `COALESCE`
- **Date & Math Logic:** Age calculation, random ordering, percentage formulas

---
*Created as part of SQL Practice & Learning Journey.*