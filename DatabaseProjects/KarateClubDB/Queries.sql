-- ===================================================
-- Karate Club Database System - Operational Queries
-- ===================================================
USE KarateClubDB;
GO

-- ===================================================
-- 1. Get all members with their basic personal details
-- ===================================================
SELECT 
    m.MemberID, 
    p.FirstName, 
    p.LastName, 
    m.DateOfBirth,
    DATEDIFF(YEAR, m.DateOfBirth, GETDATE()) AS Age
FROM Members m
JOIN Persons p ON m.PersonID = p.PersonID;

-- ===================================================
-- 2. List total revenue grouped by payment methods
-- ===================================================
SELECT 
    PaymentMethod, 
    COUNT(PaymentID) AS TotalTransactions, 
    SUM(Amount) AS TotalRevenue
FROM Payments
WHERE PaymentStatus = 1
GROUP BY PaymentMethod;

-- ===================================================
-- 3. Find active subscription periods as of today
-- ===================================================
SELECT 
    s.SubscriptionPeriodID, 
    p.FirstName + ' ' + p.LastName AS MemberName,
    m.MembershipStatus, 
    s.StartDate, 
    s.EndDate
FROM SubscriptionPeriods s
JOIN Members mb ON s.MemberID = mb.MemberID
JOIN Persons p ON mb.PersonID = p.PersonID
JOIN Memberships m ON s.MembershipID = m.MembershipID
WHERE CAST(GETDATE() AS DATE) BETWEEN s.StartDate AND s.EndDate;

-- ===================================================
-- 4. Get full history of belt tests including result and fees paid
-- ===================================================
SELECT 
    t.TestRecordID, 
    pm.FirstName + ' ' + pm.LastName AS MemberName,
    b.BeltRank, 
    t.TestDate, 
    t.Result, 
    pay.Amount AS AmountPaid
FROM TestRecords t
JOIN Belts b ON t.BeltID = b.BeltID
JOIN Payments pay ON t.PaymentID = pay.PaymentID
JOIN Members m ON t.MemberID = m.MemberID
JOIN Persons pM ON m.PersonID = pm.PersonID;

-- ===================================================
-- 5. List all instructors and the number of members they train
-- ===================================================
SELECT 
    i.InstructorID, 
    p.FirstName + ' ' + p.LastName AS InstructorName, 
    COUNT(im.MemberID) AS TotalStudents
FROM Instructors i
JOIN Persons p ON i.PersonID = p.PersonID
LEFT JOIN InstructorMembers im ON i.InstructorID = im.InstructorID
GROUP BY i.InstructorID, p.FirstName, p.LastName;

-- ===================================================
-- 6. Retrieve contact info and emergency contacts for all members
-- ===================================================
SELECT 
    m.MemberID,
    p.FirstName + ' ' + p.LastName AS MemberName,
    (SELECT TOP 1 PhoneNumber FROM Phones WHERE PersonID = p.PersonID) AS MemberPhone,
    ep.FirstName + ' ' + ep.LastName AS EmergencyContactName,
    (SELECT TOP 1 PhoneNumber FROM Phones WHERE PersonID = ep.PersonID) AS EmergencyPhone
FROM Members m
JOIN Persons p ON m.PersonID = p.PersonID
JOIN MemberEmergencyContacts mec ON m.MemberID = mec.MemberID
JOIN Persons ep ON mec.PersonID = ep.PersonID;

-- ===================================================
-- 7. Display the highest progressive belt ranks and their testing fees
-- ===================================================
SELECT TOP 5 
    BeltID, 
    BeltRank, 
    TestFee
FROM Belts
ORDER BY TestFee DESC;

-- ===================================================
-- 8. Identify members who failed their latest belt rank tests
-- ===================================================
SELECT 
    t.TestRecordID, 
    p.FirstName + ' ' + p.LastName AS MemberName, 
    b.BeltRank, 
    t.TestDate, 
    t.Result
FROM TestRecords t
JOIN Belts b ON t.BeltID = b.BeltID
JOIN Members m ON t.MemberID = m.MemberID
JOIN Persons p ON m.PersonID = p.PersonID
WHERE t.Result = 'Fail';

-- ===================================================
-- 9. Calculate total financial earnings from subscriptions vs tests
-- ===================================================
SELECT 
    'Subscriptions' AS RevenueSource, SUM(Amount) AS TotalAmount FROM Payments WHERE PaymentID IN (SELECT PaymentID FROM SubscriptionPeriods)
UNION ALL
SELECT 
    'Belt Tests' AS RevenueSource, SUM(Amount) AS TotalAmount FROM Payments WHERE PaymentID IN (SELECT PaymentID FROM TestRecords);

-- ===================================================
-- 10. List full profiles of instructors with their dynamic qualifications
-- ===================================================
SELECT 
    i.InstructorID, 
    p.FirstName + ' ' + p.LastName AS InstructorName, 
    q.Degree, 
    q.GraduationDate
FROM Instructors i
JOIN Persons p ON i.PersonID = p.PersonID
JOIN Qualifications q ON i.InstructorID = q.InstructorID;

-- ===================================================
-- 11. Find members with expired subscription periods
-- ===================================================
SELECT 
    m.MemberID, 
    p.FirstName + ' ' + p.LastName AS MemberName, 
    MAX(s.EndDate) AS LastExpirationDate
FROM Members m
JOIN Persons p ON m.PersonID = p.PersonID
JOIN SubscriptionPeriods s ON m.MemberID = s.MemberID
GROUP BY m.MemberID, p.FirstName, p.LastName
HAVING MAX(s.EndDate) < CAST(GETDATE() AS DATE);

-- ===================================================
-- 12. List members without any physical address recorded
-- ===================================================
SELECT 
    m.MemberID, 
    p.FirstName + ' ' + p.LastName AS MemberName
FROM Members m
JOIN Persons p ON m.PersonID = p.PersonID
LEFT JOIN Addresses a ON p.PersonID = a.PersonID
WHERE a.AddressID IS NULL;

-- ===================================================
-- 13. Summary count of test results (Pass vs Fail) per belt rank
-- ===================================================
SELECT 
    b.BeltRank, 
    SUM(CASE WHEN t.Result = 'Pass' THEN 1 ELSE 0 END) AS TotalPassed,
    SUM(CASE WHEN t.Result = 'Fail' THEN 1 ELSE 0 END) AS TotalFailed
FROM TestRecords t
JOIN Belts b ON t.BeltID = b.BeltID
GROUP BY b.BeltRank;

-- ===================================================
-- 14. Track payments processed during a specific time frame
-- ===================================================
SELECT 
    PaymentID, 
    Amount, 
    PaymentMethod, 
    PaymentDate 
FROM Payments
WHERE PaymentDate BETWEEN '2026-01-01' AND '2026-06-30'
ORDER BY PaymentDate ASC;

-- ===================================================
-- 15. Retrieve the full physical address details of instructors
-- ===================================================
SELECT 
    i.InstructorID, 
    p.FirstName + ' ' + p.LastName AS InstructorName, 
    a.Street, 
    a.Neighborhood, 
    a.BuildingNumber
FROM Instructors i
JOIN Persons p ON i.PersonID = p.PersonID
JOIN Addresses a ON p.PersonID = a.PersonID;
