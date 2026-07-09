USE CarRental;
GO

-- =====================================================================
-- 1. Available Fleet Overview
-- List all vehicles currently available for rent with category and fuel details.
-- =====================================================================
SELECT 
    V.VehicleID,
    V.MadeIn AS Make,
    V.Model,
    V.MakeYear,
    V.PlatNumber,
    C.Category,
    F.FuelType,
    V.RentalRate
FROM Vehicles V
INNER JOIN Categories C ON V.CategoryID = C.CategoryID
INNER JOIN Fuels F ON V.FuelID = F.FuelID
WHERE V.IsAvailableForRent = 1;

-- =====================================================================
-- 2. Comprehensive Booking History per Customer
-- Retrieve complete rental history including customer details and vehicle booked.
-- =====================================================================
SELECT 
    VB.VehicleBookingID,
    CONCAT(Cust.FirstName, ' ', Cust.LastName) AS CustomerName,
    Cust.PhoneNumber,
    CONCAT(V.MadeIn, ' ', V.Model, ' (', V.PlatNumber, ')') AS VehicleDetails,
    VB.RentalStartDate,
    VB.RentalEndDate,
    VB.InitialRentalDate AS DaysBooked,
    VB.InitialTotalDueAmount
FROM VehicleBookings VB
INNER JOIN Customers Cust ON VB.CustomerID = Cust.CustomerID
INNER JOIN Vehicles V ON VB.VehicleID = V.VehicleID
ORDER BY VB.RentalStartDate DESC;

-- =====================================================================
-- 3. Outstanding Payments Report
-- Identify customers with unpaid or remaining balances after vehicle return.
-- =====================================================================
SELECT 
    VR.VehicleReturnID,
    VB.VehicleBookingID,
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    C.PhoneNumber,
    VR.ActualFinalAmount,
    VR.ReminaingAmount AS BalanceDue,
    VR.ActualReturnDate
FROM VehicleReturns VR
INNER JOIN VehicleBookings VB ON VR.VehicleBookingID = VB.VehicleBookingID
INNER JOIN Customers C ON VB.CustomerID = C.CustomerID
WHERE VR.ReminaingAmount > 0;

-- =====================================================================
-- 4. Active Rentals Breakdown
-- List vehicles that are currently rented out (booked but not yet returned).
-- =====================================================================
SELECT 
    VB.VehicleBookingID,
    CONCAT(C.FirstName, ' ', C.LastName) AS RenterName,
    V.PlatNumber,
    CONCAT(V.MadeIn, ' ', V.Model) AS Vehicle,
    VB.RentalStartDate,
    VB.RentalEndDate,
    VB.PickupLocation,
    VB.DropLocation
FROM VehicleBookings VB
INNER JOIN Customers C ON VB.CustomerID = C.CustomerID
INNER JOIN Vehicles V ON VB.VehicleID = V.VehicleID
LEFT JOIN VehicleReturns VR ON VB.VehicleBookingID = VR.VehicleBookingID
WHERE VR.VehicleReturnID IS NULL;

-- =====================================================================
-- 5. Fleet Maintenance Expense Log
-- Show all maintenance logs with vehicle details and accumulated cost.
-- =====================================================================
SELECT 
    M.MaintenanceID,
    CONCAT(V.MadeIn, ' ', V.Model) AS Vehicle,
    V.PlatNumber,
    M.MaintenanceDescription,
    M.Maintenance AS ServiceDate,
    M.Cost
FROM Maintenance M
INNER JOIN Vehicles V ON M.VehicleID = V.VehicleID
ORDER BY M.Maintenance DESC;

-- =====================================================================
-- 6. Total Revenue by Payment Method
-- Calculate financial revenue distribution across payment methods.
-- =====================================================================
SELECT 
    PaymentMethod,
    COUNT(RentalTransactionID) AS TransactionCount,
    SUM(PaymentAmount) AS TotalRevenueCollected
FROM RentalTransactions
WHERE PaymentStatus = 1
GROUP BY PaymentMethod;

-- =====================================================================
-- 7. Late Returns Analysis
-- Track rentals where the actual rental days exceeded the initial agreement.
-- =====================================================================
SELECT 
    VR.VehicleReturnID,
    VB.VehicleBookingID,
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    VB.InitialRentalDate AS ContractedDays,
    VR.ActualRentalDays AS ActualDays,
    (VR.ActualRentalDays - VB.InitialRentalDate) AS DaysOverdue,
    VR.VehicleCheckNotes
FROM VehicleReturns VR
INNER JOIN VehicleBookings VB ON VR.VehicleBookingID = VB.VehicleBookingID
INNER JOIN Customers C ON VB.CustomerID = C.CustomerID
WHERE VR.ActualRentalDays > VB.InitialRentalDate;

-- =====================================================================
-- 8. Additional Charges Log
-- Detailed breakdown of extra fines/charges incurred during returns.
-- =====================================================================
SELECT 
    Ch.ChargeID,
    VR.VehicleReturnID,
    CONCAT(Cust.FirstName, ' ', Cust.LastName) AS CustomerName,
    Ch.ChargeAmount,
    CASE WHEN Ch.ChargeStatus = 1 THEN 'Paid' ELSE 'Pending' END AS PaymentStatus,
    Ch.Notes AS Reason
FROM Charges Ch
INNER JOIN VehicleReturns VR ON Ch.VehicleReturnID = VR.VehicleReturnID
INNER JOIN VehicleBookings VB ON VR.VehicleBookingID = VB.VehicleBookingID
INNER JOIN Customers Cust ON VB.CustomerID = Cust.CustomerID;

-- =====================================================================
-- 9. Most Popular Vehicle Categories
-- Rank categories by total number of bookings generated.
-- =====================================================================
SELECT 
    Cat.Category,
    COUNT(VB.VehicleBookingID) AS TotalBookings,
    SUM(VB.InitialTotalDueAmount) AS GrossBookingValue
FROM VehicleBookings VB
INNER JOIN Vehicles V ON VB.VehicleID = V.VehicleID
INNER JOIN Categories Cat ON V.CategoryID = Cat.CategoryID
GROUP BY Cat.Category
ORDER BY TotalBookings DESC;

-- =====================================================================
-- 10. Mileage Consumption Analysis
-- Track total distance driven per vehicle return for wear-and-tear inspection.
-- =====================================================================
SELECT 
    VR.VehicleReturnID,
    CONCAT(V.MadeIn, ' ', V.Model, ' - ', V.PlatNumber) AS Vehicle,
    VR.ConsumedMileage AS DistanceDrivenKM,
    V.Mileage AS CurrentOdometer,
    VR.ActualReturnDate
FROM VehicleReturns VR
INNER JOIN VehicleBookings VB ON VR.VehicleBookingID = VB.VehicleBookingID
INNER JOIN Vehicles V ON VB.VehicleID = V.VehicleID;

-- =====================================================================
-- 11. Top Revenue-Generating Customers
-- List VIP customers sorted by total spending across all transactions.
-- =====================================================================
SELECT TOP 5
    C.CustomerID,
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    C.Email,
    COUNT(VB.VehicleBookingID) AS TotalRentals,
    SUM(RT.PaymentAmount) AS TotalSpent
FROM Customers C
INNER JOIN VehicleBookings VB ON C.CustomerID = VB.CustomerID
INNER JOIN RentalTransactions RT ON VB.VehicleBookingID = RT.VehicleBookingID
WHERE RT.PaymentStatus = 1
GROUP BY C.CustomerID, C.FirstName, C.LastName, C.Email
ORDER BY TotalSpent DESC;

-- =====================================================================
-- 12. Vehicles Requiring Inspection or Maintenance
-- Identify vehicles currently flagged as unavailable or with recent maintenance.
-- =====================================================================
SELECT 
    V.VehicleID,
    CONCAT(V.MadeIn, ' ', V.Model) AS Vehicle,
    V.PlatNumber,
    V.IsAvailableForRent,
    MAX(M.Maintenance) AS LastMaintenanceDate,
    ISNULL(SUM(M.Cost), 0) AS TotalMaintenanceSpent
FROM Vehicles V
LEFT JOIN Maintenance M ON V.VehicleID = M.VehicleID
WHERE V.IsAvailableForRent = 0
GROUP BY V.VehicleID, V.MadeIn, V.Model, V.PlatNumber, V.IsAvailableForRent;

-- =====================================================================
-- 13. Financial Reconciliation (Initial vs Actual Due)
-- Compare initial booking quotes against final return totals including extra fees.
-- =====================================================================
SELECT 
    VB.VehicleBookingID,
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    VB.InitialTotalDueAmount AS EstimatedQuote,
    VR.ActualFinalAmount AS FinalBillingAmount,
    (VR.ActualFinalAmount - VB.InitialTotalDueAmount) AS Variance
FROM VehicleBookings VB
INNER JOIN VehicleReturns VR ON VB.VehicleBookingID = VR.VehicleBookingID
INNER JOIN Customers C ON VB.CustomerID = C.CustomerID;

-- =====================================================================
-- 14. Rental Fuel Type Distribution
-- Show vehicle fleet count and rental demand based on fuel types.
-- =====================================================================
SELECT 
    F.FuelType,
    COUNT(DISTINCT V.VehicleID) AS FleetCount,
    COUNT(VB.VehicleBookingID) AS TotalBookingsRecorded
FROM Fuels F
LEFT JOIN Vehicles V ON F.FuelID = V.FuelID
LEFT JOIN VehicleBookings VB ON V.VehicleID = VB.VehicleID
GROUP BY F.FuelType;

-- =====================================================================
-- 15. Pending Charges Summary Report
-- Summary of all unpaid additional charges grouped by vehicle return session.
-- =====================================================================
SELECT 
    VR.VehicleReturnID,
    VB.VehicleBookingID,
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    SUM(Ch.ChargeAmount) AS TotalPendingCharges
FROM Charges Ch
INNER JOIN VehicleReturns VR ON Ch.VehicleReturnID = VR.VehicleReturnID
INNER JOIN VehicleBookings VB ON VR.VehicleBookingID = VB.VehicleBookingID
INNER JOIN Customers C ON VB.CustomerID = C.CustomerID
WHERE Ch.ChargeStatus = 0
GROUP BY VR.VehicleReturnID, VB.VehicleBookingID, C.FirstName, C.LastName;
GO