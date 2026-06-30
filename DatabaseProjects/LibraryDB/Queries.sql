-- =========================================================================
-- PART 1: BASIC SEARCH AND RETRIEVAL QUERIES
-- =========================================================================

USE LibraryDB;

-- Query 1.1: Retrieve all books with their respective authors
-- Purpose: Resolves the Many-to-Many relationship between Books and Authors to show a clean catalog.
SELECT 
    b.BookID, 
    b.BookTitle, 
    b.ISBN, 
    b.Genre,
    p.FirstName + ' ' + p.LastName AS AuthorName
FROM Books b
JOIN BookAuthors ba ON b.BookID = ba.BookID
JOIN Authors a     ON ba.AuthorID = a.AuthorID
JOIN Persons p     ON a.PersonID = p.PersonID;


-- Query 1.2: Track inventory and availability status for all physical copies of a specific book
-- Purpose: Allows librarians to see how many physical copies exist for a title and where they are.
SELECT 
    bc.BookCopyID,
    b.BookTitle,
    bc.PublicationDate,
    bc.AvailabilityStatus,
    bc.AdditionalDetails
FROM BookCopies bc
JOIN Books b ON bc.BookID = b.BookID
WHERE b.BookTitle = '1984'; -- You can change the title to look up any book


-- Query 1.3: List all registered library users along with their contact information
-- Purpose: Consolidates user profiles, library cards, multiple emails, and phones into a unified directory.
SELECT 
    u.UserID,
    p.FirstName + ' ' + p.LastName AS FullName,
    u.LibraryCardNumber,
    e.Email,
    ph.Phone
FROM Users u
JOIN Persons p ON u.PersonID = p.PersonID
LEFT JOIN Emails e ON p.PersonID = e.PersonID
LEFT JOIN Phones ph ON p.PersonID = ph.PersonID;

-- =========================================================================
-- PART 2: OPERATIONAL AND OPERATING TRANSACTIONS QUERIES
-- =========================================================================

USE LibraryDB;

-- Query 2.1: Find all currently checked-out books along with borrower details
-- Purpose: Helps librarians see which copies are out, who has them, and when they are expected back.
SELECT 
    br.BorrowingRecordID,
    b.BookTitle,
    bc.BookCopyID,
    p.FirstName + ' ' + p.LastName AS BorrowerName,
    u.LibraryCardNumber,
    br.BorrowingDate,
    br.DueDate
FROM BorrowingRecords br
JOIN BookCopies bc ON br.BookCopyID = bc.BookCopyID
JOIN Books b       ON bc.BookID = b.BookID
JOIN Users u       ON br.UserID = u.UserID
JOIN Persons p     ON u.PersonID = p.PersonID
WHERE br.ActualDate IS NULL; -- ActualDate IS NULL means the book has not been returned yet

-- Query 2.2: Identify all overdue book loans
-- Purpose: Generates a blacklist of users who missed their due date, which is essential for issuing alerts.
SELECT 
    br.BorrowingRecordID,
    b.BookTitle,
    bc.BookCopyID,
    p.FirstName + ' ' + p.LastName AS BorrowerName,
    br.DueDate,
    br.DueDate AS ExpectedReturnDate
FROM BorrowingRecords br
JOIN BookCopies bc ON br.BookCopyID = bc.BookCopyID
JOIN Books b       ON bc.BookID = b.BookID
JOIN Users u       ON br.UserID = u.UserID
JOIN Persons p     ON u.PersonID = p.PersonID
WHERE br.ActualDate IS NULL 
  AND br.DueDate < CURRENT_TIMESTAMP; -- Due date has passed, but the book is still out


-- Query 2.3: Display the reservation queue for copies to ensure fairness (First-Come, First-Served)
-- Purpose: Shows the exact chronological waitlist for popular books based on the precise DATETIME registration.
SELECT 
    r.ReservationID,
    b.BookTitle,
    r.BookCopyID,
    p.FirstName + ' ' + p.LastName AS WaitingUser,
    u.LibraryCardNumber,
    r.ReservationDate
FROM Reservations r
JOIN BookCopies bc ON r.BookCopyID = bc.BookCopyID
JOIN Books b       ON bc.BookID = b.BookID
JOIN Users u       ON r.UserID = u.UserID
JOIN Persons p     ON u.PersonID = p.PersonID
ORDER BY b.BookTitle ASC, r.BookCopyID ASC, r.ReservationDate ASC; 
-- Ordering by ReservationDate ASC ensures that the earliest reservation is shown first (highest priority)

-- =========================================================================
-- PART 3: ADVANCED ANALYTICAL AND FINANCIAL REPORTS
-- =========================================================================

USE LibraryDB;

-- Query 3.1: Financial Dashboard (Total Revenue and Outstanding Penalties)
-- Purpose: Aggregates total fines collected vs. total fines pending to evaluate financial performance and losses.
SELECT 
    SUM(CASE WHEN PaymentStatus = 1 THEN FineAmount ELSE 0 END) AS TotalFinesCollected,
    SUM(CASE WHEN PaymentStatus = 0 THEN FineAmount ELSE 0 END) AS TotalFinesOutstanding,
    SUM(FineAmount) AS TotalGeneratedFines
FROM Fines;


-- Query 3.2: Most Popular Books (Top Borrowed Titles Catalog)
-- Purpose: Ranks books based on historical borrowing frequency, helping management plan future inventory purchases.
SELECT 
    b.BookID,
    b.BookTitle,
    b.Genre,
    COUNT(br.BorrowingRecordID) AS TotalTimesBorrowed
FROM BorrowingRecords br
JOIN BookCopies bc ON br.BookCopyID = bc.BookCopyID
JOIN Books b       ON bc.BookID = b.BookID
GROUP BY b.BookID, b.BookTitle, b.Genre
ORDER BY TotalTimesBorrowed DESC; -- Highest borrowed books appear at the top


-- Query 3.3: Global Inventory Availability Metrics (KPI Report)
-- Purpose: Calculates the percentage of books currently sitting on shelves vs. those out with users.
SELECT 
    AvailabilityStatus,
    COUNT(*) AS TotalCopiesCount,
    -- Calculates exact distribution percentages across statuses using standard casting
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM BookCopies), 2) AS InventoryPercentage
FROM BookCopies
GROUP BY AvailabilityStatus;


-- Query 3.4: Comprehensive User Account Audit Report
-- Purpose: Consolidates user transaction history, total books borrowed, and total unpaid fines in a single look-up.
SELECT 
    u.UserID,
    p.FirstName + ' ' + p.LastName AS MemberName,
    u.LibraryCardNumber,
    COUNT(br.BorrowingRecordID) AS LifetimeBooksBorrowed,
    -- Aggregates outstanding fine balance specific to each user account
    COALESCE(SUM(CASE WHEN f.PaymentStatus = 0 THEN f.FineAmount ELSE 0 END), 0) AS TotalUnpaidFinesOwed
FROM Users u
JOIN Persons p               ON u.PersonID = p.PersonID
LEFT JOIN BorrowingRecords br ON u.UserID = br.UserID
LEFT JOIN Fines f            ON br.BorrowingRecordID = f.BorrowingRecordID
GROUP BY u.UserID, p.FirstName, p.LastName, u.LibraryCardNumber
ORDER BY TotalUnpaidFinesOwed DESC, LifetimeBooksBorrowed DESC;
