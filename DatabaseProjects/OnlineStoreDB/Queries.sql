USE OnlineStoreDB;
GO

-- =========================================================================
-- QUERY 1: Retrieve all products with their basic inventory and price details
-- =========================================================================
SELECT 
    ProductID, 
    ProductName, 
    Quantity AS StockLevel, 
    Price, 
    Availability
FROM Products
ORDER BY ProductName;

-- =========================================================================
-- QUERY 2: Track active shipping status for all ongoing orders
-- =========================================================================
SELECT 
    S.ShippingID,
    O.OrderID,
    C.CustomerName,
    SS.ShippingStatus,
    S.TrackingNumber,
    S.EstimatedDeliveryDate
FROM Shipping S
INNER JOIN Orders O ON S.OrderID = O.OrderID
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
INNER JOIN ShippingStatuses SS ON S.ShippingStatusID = SS.ShippingStatusID
WHERE SS.ShippingStatus IN ('Processing', 'Out for Delivery', 'Delayed');

-- =========================================================================
-- QUERY 3: Calculate the total financial revenue collected from payments
-- =========================================================================
SELECT 
    SUM(Amount) AS TotalRevenue,
    COUNT(PaymentID) AS TotalSuccessfulTransactions
FROM Payments;

-- =========================================================================
-- QUERY 4: List customers who have spent the most money in the store (KPI)
-- =========================================================================
SELECT TOP 3
    C.CustomerID,
    C.CustomerName,
    SUM(P.Amount) AS TotalSpent
FROM Customers C
INNER JOIN Payments P ON C.CustomerID = P.CustomerID
GROUP BY C.CustomerID, C.CustomerName
ORDER BY TotalSpent DESC;

-- =========================================================================
-- QUERY 5: Display detailed breakdowns of items inside each placed order
-- =========================================================================
SELECT 
    O.OrderID,
    O.OrderDate,
    P.ProductName,
    OI.Quantity,
    OI.Price AS UnitPrice,
    (OI.Quantity * OI.Price) AS ItemSubtotal
FROM OrderItems OI
INNER JOIN Orders O ON OI.OrderID = O.OrderID
INNER JOIN Products P ON OI.ProductID = P.ProductID
ORDER BY O.OrderID;

-- =========================================================================
-- QUERY 6: Aggregate average product ratings and total review counts
-- =========================================================================
SELECT 
    P.ProductID,
    P.ProductName,
    AVG(CAST(R.RatingScore AS DECIMAL(3,2))) AS AverageRating,
    COUNT(R.ReviewID) AS TotalReviews
FROM Products P
LEFT JOIN Reviews R ON P.ProductID = R.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY AverageRating DESC;
GO