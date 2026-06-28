-- =========================================================================
-- PART 2: SYSTEM SETTINGS AND CORE PERSONAL IDENTITIES
-- =========================================================================

USE LibraryDB;

-- 1. Populating the Settings Table (Global Application Configurations)
INSERT INTO Settings (DefaultBorrowDays, DefaultFinePerDay) 
VALUES (14, 1.50);


-- 2. Populating the Persons Table (Base Profiles for Users and Authors)
-- IDs 1 to 5 will be allocated for Library Members (Users)
-- IDs 6 to 10 will be allocated for Authors
INSERT INTO Persons (FirstName, LastName) VALUES ('John', 'Doe');       -- PersonID: 1
INSERT INTO Persons (FirstName, LastName) VALUES ('Jane', 'Smith');     -- PersonID: 2
INSERT INTO Persons (FirstName, LastName) VALUES ('Robert', 'Johnson'); -- PersonID: 3
INSERT INTO Persons (FirstName, LastName) VALUES ('Emily', 'Davis');     -- PersonID: 4
INSERT INTO Persons (FirstName, LastName) VALUES ('Michael', 'Brown');   -- PersonID: 5

INSERT INTO Persons (FirstName, LastName) VALUES ('George', 'Orwell');   -- PersonID: 6
INSERT INTO Persons (FirstName, LastName) VALUES ('Agatha', 'Christie'); -- PersonID: 7
INSERT INTO Persons (FirstName, LastName) VALUES ('J.K.', 'Rowling');    -- PersonID: 8
INSERT INTO Persons (FirstName, LastName) VALUES ('Stephen', 'King');    -- PersonID: 9
INSERT INTO Persons (FirstName, LastName) VALUES ('Isaac', 'Asimov');    -- PersonID: 10


-- 3. Populating the Emails Table (Linked via FK to PersonID)
INSERT INTO Emails (PersonID, Email) VALUES (1, 'john.doe@example.com');
INSERT INTO Emails (PersonID, Email) VALUES (2, 'jane.smith@example.com');
INSERT INTO Emails (PersonID, Email) VALUES (3, 'robert.j@example.com');
INSERT INTO Emails (PersonID, Email) VALUES (4, 'emily.davis@example.com');
INSERT INTO Emails (PersonID, Email) VALUES (5, 'michael.b@example.com');
INSERT INTO Emails (PersonID, Email) VALUES (6, 'george.orwell@authors.org');
INSERT INTO Emails (PersonID, Email) VALUES (7, 'agatha.christie@mystery.com');
INSERT INTO Emails (PersonID, Email) VALUES (8, 'jk.rowling@wizardingworld.com');
INSERT INTO Emails (PersonID, Email) VALUES (9, 'stephen.king@horrorbooks.com');
INSERT INTO Emails (PersonID, Email) VALUES (10, 'isaac.asimov@scifi.org');


-- 4. Populating the Phones Table (Linked via FK to PersonID)
INSERT INTO Phones (PersonID, Phone) VALUES (1, '+1-555-0101');
INSERT INTO Phones (PersonID, Phone) VALUES (2, '+1-555-0102');
INSERT INTO Phones (PersonID, Phone) VALUES (3, '+1-555-0103');
INSERT INTO Phones (PersonID, Phone) VALUES (4, '+1-555-0104');
INSERT INTO Phones (PersonID, Phone) VALUES (5, '+1-555-0105');
INSERT INTO Phones (PersonID, Phone) VALUES (6, '+44-20-7946-0912');
INSERT INTO Phones (PersonID, Phone) VALUES (7, '+44-20-7946-0957');
INSERT INTO Phones (PersonID, Phone) VALUES (8, '+44-131-496-0182');
INSERT INTO Phones (PersonID, Phone) VALUES (9, '+1-207-555-0199');
INSERT INTO Phones (PersonID, Phone) VALUES (10, '+1-212-555-0143');

-- =========================================================================
-- PART 2: LIBRARY ASSETS (BOOKS, AUTHORS, RELATIONSHIPS, AND COPIES)
-- =========================================================================

USE LibraryDB;

-- 1. Populating the Books Table (Core Book Metadata)
INSERT INTO Books (BookTitle, ISBN, Genre) VALUES ('1984', '978-0451524935', 'Dystopian');        -- BookID: 1
INSERT INTO Books (BookTitle, ISBN, Genre) VALUES ('Animal Farm', '978-0451526342', 'Satire');      -- BookID: 2
INSERT INTO Books (BookTitle, ISBN, Genre) VALUES ('Murder on the Orient Express', '978-0007119318', 'Mystery'); -- BookID: 3
INSERT INTO Books (BookTitle, ISBN, Genre) VALUES ('Harry Potter and the Philosophers Stone', '978-0747532699', 'Fantasy'); -- BookID: 4
INSERT INTO Books (BookTitle, ISBN, Genre) VALUES ('The Shining', '978-0307743657', 'Horror');       -- BookID: 5
INSERT INTO Books (BookTitle, ISBN, Genre) VALUES ('Foundation', '978-0553293357', 'Sci-Fi');       -- BookID: 6


-- 2. Populating the Authors Table (Mapping Authors back to their PersonID from Part 1)
-- PersonID 6 to 10 were designated for authors in Part 1
INSERT INTO Authors (PersonID) VALUES (6);  -- AuthorID: 1 (George Orwell)
INSERT INTO Authors (PersonID) VALUES (7);  -- AuthorID: 2 (Agatha Christie)
INSERT INTO Authors (PersonID) VALUES (8);  -- AuthorID: 3 (J.K. Rowling)
INSERT INTO Authors (PersonID) VALUES (9);  -- AuthorID: 4 (Stephen King)
INSERT INTO Authors (PersonID) VALUES (10); -- AuthorID: 5 (Isaac Asimov)


-- 3. Populating the BookAuthors Table (Associative Table for Many-to-Many Relationship)
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (1, 1); -- '1984' written by George Orwell
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (2, 1); -- 'Animal Farm' written by George Orwell
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (3, 2); -- 'Murder on the Orient Express' written by Agatha Christie
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (4, 3); -- 'Harry Potter' written by J.K. Rowling
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (5, 4); -- 'The Shining' written by Stephen King
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (6, 5); -- 'Foundation' written by Isaac Asimov


-- 4. Populating the BookCopies Table (Physical Inventory Control)
-- Creating multiple physical copies for some books to test inventory states
INSERT INTO BookCopies (BookID, PublicationDate, AvailabilityStatus, AdditionalDetails) 
VALUES (1, '1949-06-08', 'Available', 'Hardcover edition - Main shelf');    -- BookCopyID: 1

INSERT INTO BookCopies (BookID, PublicationDate, AvailabilityStatus, AdditionalDetails) 
VALUES (1, '2003-05-06', 'Checked Out', 'Paperback copy - Secondary shelf'); -- BookCopyID: 2

INSERT INTO BookCopies (BookID, PublicationDate, AvailabilityStatus, AdditionalDetails) 
VALUES (2, '1945-08-17', 'Available', 'Special collector edition');         -- BookCopyID: 3

INSERT INTO BookCopies (BookID, PublicationDate, AvailabilityStatus, AdditionalDetails) 
VALUES (3, '1934-01-01', 'Checked Out', 'Slightly worn cover');             -- BookCopyID: 4

INSERT INTO BookCopies (BookID, PublicationDate, AvailabilityStatus, AdditionalDetails) 
VALUES (4, '1997-06-26', 'Available', 'Brand new copy');                     -- BookCopyID: 5

INSERT INTO BookCopies (BookID, PublicationDate, AvailabilityStatus, AdditionalDetails) 
VALUES (4, '1997-06-26', 'Checked Out', 'Damaged page 45 - Needs review');   -- BookCopyID: 6

INSERT INTO BookCopies (BookID, PublicationDate, AvailabilityStatus, AdditionalDetails) 
VALUES (5, '1977-01-28', 'Available', 'Standard paperback');                 -- BookCopyID: 7

INSERT INTO BookCopies (BookID, PublicationDate, AvailabilityStatus, AdditionalDetails) 
VALUES (6, '1951-06-01', 'Available', 'Classic sci-fi collection');         -- BookCopyID: 8

-- =========================================================================
-- PART 3: OPERATIONAL TRANSACTIONS (USERS, RESERVATIONS, LOANS, AND FINES)
-- =========================================================================

USE LibraryDB;

-- 1. Populating the Users Table (Registering Library Members)
-- Mapping back to PersonID 1 to 5 created in Part 1
INSERT INTO Users (PersonID, LibraryCardNumber) VALUES (1, 'LC-2026-0001'); -- UserID: 1 (John Doe)
INSERT INTO Users (PersonID, LibraryCardNumber) VALUES (2, 'LC-2026-0002'); -- UserID: 2 (Jane Smith)
INSERT INTO Users (PersonID, LibraryCardNumber) VALUES (3, 'LC-2026-0003'); -- UserID: 3 (Robert Johnson)
INSERT INTO Users (PersonID, LibraryCardNumber) VALUES (4, 'LC-2026-0004'); -- UserID: 4 (Emily Davis)
INSERT INTO Users (PersonID, LibraryCardNumber) VALUES (5, 'LC-2026-0005'); -- UserID: 5 (Michael Brown)


-- 2. Populating the BorrowingRecords Table (Lending Transactions)
-- Scenario A: Completed loan returned on time (No Fines)
INSERT INTO BorrowingRecords (BookCopyID, UserID, BorrowingDate, DueDate, ActualDate)
VALUES (1, 1, '2026-05-10 09:00:00', '2026-05-24 09:00:00', '2026-05-20 14:30:00'); -- BorrowingRecordID: 1

-- Scenario B: Completed loan returned late (Will link to a fine record below)
INSERT INTO BorrowingRecords (BookCopyID, UserID, BorrowingDate, DueDate, ActualDate)
VALUES (3, 2, '2026-05-01 10:15:00', '2026-05-15 10:15:00', '2026-05-20 11:00:00'); -- BorrowingRecordID: 2 (Late by 5 days)

-- Scenario C: Active loan currently out with the user (BookCopyID 2 is 'Checked Out')
INSERT INTO BorrowingRecords (BookCopyID, UserID, BorrowingDate, DueDate, ActualDate)
VALUES (2, 3, '2026-06-20 12:00:00', '2026-07-04 12:00:00', NULL);                -- BorrowingRecordID: 3

-- Scenario D: Active loan that is currently Overdue (BookCopyID 4 is 'Checked Out', no return date yet)
INSERT INTO BorrowingRecords (BookCopyID, UserID, BorrowingDate, DueDate, ActualDate)
VALUES (4, 4, '2026-06-01 15:45:00', '2026-06-15 15:45:00', NULL);                -- BorrowingRecordID: 4 (Currently late)

-- Scenario E: Completed loan with structural asset damage (Will link to a fine below)
INSERT INTO BorrowingRecords (BookCopyID, UserID, BorrowingDate, DueDate, ActualDate)
VALUES (5, 5, '2026-05-12 08:30:00', '2026-05-26 08:30:00', '2026-05-25 16:00:00'); -- BorrowingRecordID: 5


-- 3. Populating the Reservations Table (Hold Queue for Checked-Out Copies)
-- Users can only reserve books currently checked out (Copies 2, 4, 6)
-- Precise DATETIME tracks reservation order timestamp to ensure fairness
INSERT INTO Reservations (UserID, BookCopyID, ReservationDate)
VALUES (1, 2, '2026-06-21 14:22:05'); -- First person in queue for copy 2

INSERT INTO Reservations (UserID, BookCopyID, ReservationDate)
VALUES (2, 2, '2026-06-22 09:11:43'); -- Second person in queue for copy 2 (Fairly tracked)

INSERT INTO Reservations (UserID, BookCopyID, ReservationDate)
VALUES (5, 4, '2026-06-05 11:30:00'); -- Holding a spot for the overdue copy 4


-- 4. Populating the Fines Table (Penalty Operations)
-- Linked to BorrowingRecordID 2 (Returned late by 5 days: 5 days * $1.50 = $7.50)
INSERT INTO Fines (BorrowingRecordID, FineAmount, NumberOfLateDays, PaymentStatus)
VALUES (2, 7.50, 5, 1); -- PaymentStatus: 1 (Paid)

-- Linked to BorrowingRecordID 4 (Active overdue penalty tracking, e.g., upfront flat fee or system log)
INSERT INTO Fines (BorrowingRecordID, FineAmount, NumberOfLateDays, PaymentStatus)
VALUES (4, 15.00, 10, 0); -- PaymentStatus: 0 (Pending)

-- Linked to BorrowingRecordID 5 (Returned on time but fined for structural book damage)
INSERT INTO Fines (BorrowingRecordID, FineAmount, NumberOfLateDays, PaymentStatus)
VALUES (5, 20.00, 0, 0); -- PaymentStatus: 0 (Pending - Fined for property damage)
