USE KarateClubDB;
GO

-- ===================================================
-- 1. Populating Belts (17 fixed ranks with progressive fees)
-- ===================================================
INSERT INTO Belts (BeltRank, TestFee) VALUES 
('White Belt', 15.00),
('Yellow Belt', 20.00),
('Orange Belt', 25.00),
('Green Belt', 30.00),
('Blue Belt', 35.00),
('Purple Belt', 40.00),
('Brown Belt', 50.00),
('Black Belt (1st Dan)', 75.00),
('Black Belt (2nd Dan)', 85.00),
('Black Belt (3rd Dan)', 95.00),
('Black Belt (4th Dan)', 110.00),
('Black Belt (5th Dan)', 125.00),
('Black Belt (6th Dan)', 140.00),
('Black Belt (7th Dan)', 160.00),
('Black Belt (8th Dan)', 180.00),
('Black Belt (9th Dan)', 200.00),
('Black Belt (10th Dan)', 250.00);

-- ===================================================
-- 2. Populating Memberships
-- ===================================================
INSERT INTO Memberships (MembershipStatus) VALUES 
('Monthly Regular'),
('Quarterly Premium'),
('Half-Yearly VIP'),
('Annual Elite');

-- ===================================================
-- 3. Populating Persons (55 Records for Members, Instructors, and Contacts)
-- ===================================================
SET IDENTITY_INSERT Persons ON;
INSERT INTO Persons (PersonID, FirstName, LastName) VALUES
(1, 'James', 'Smith'), (2, 'Michael', 'Smith'), (3, 'Robert', 'Smith'), (4, 'Maria', 'Garcia'), (5, 'David', 'Smith'),
(6, 'Maria', 'Rodriguez'), (7, 'Mary', 'Smith'), (8, 'James', 'Johnson'), (9, 'Patricia', 'Smith'), (10, 'John', 'Smith'),
(11, 'Robert', 'Johnson'), (12, 'Michael', 'Johnson'), (13, 'Mary', 'Johnson'), (14, 'Patricia', 'Johnson'), (15, 'John', 'Johnson'),
(16, 'David', 'Johnson'), (17, 'Christopher', 'Smith'), (18, 'Barbara', 'Smith'), (19, 'Matthew', 'Smith'), (20, 'Elizabeth', 'Smith'),
(21, 'Jennifer', 'Smith'), (22, 'William', 'Johnson'), (23, 'Linda', 'Smith'), (24, 'Michael', 'Brown'), (25, 'Elizabeth', 'Johnson'),
(26, 'James', 'Brown'), (27, 'Mary', 'Brown'), (28, 'Robert', 'Brown'), (29, 'Patricia', 'Brown'), (30, 'John', 'Brown'),
(31, 'David', 'Brown'), (32, 'Joseph', 'Smith'), (33, 'Barbara', 'Johnson'), (34, 'Susan', 'Smith'), (35, 'Matthew', 'Johnson'),
(36, 'Elizabeth', 'Brown'), (37, 'Christopher', 'Johnson'), (38, 'Jennifer', 'Johnson'), (39, 'Linda', 'Johnson'), (40, 'William', 'Brown'),
(41, 'Richard', 'Smith'), (42, 'Thomas', 'Smith'), (43, 'Charles', 'Smith'), (44, 'Christopher', 'Brown'), (45, 'Daniel', 'Smith'),
(46, 'Matthew', 'Brown'), (47, 'Anthony', 'Smith'), (48, 'Mark', 'Smith'), (49, 'Paul', 'Smith'), (50, 'Steven', 'Smith'),
(51, 'John', 'Miller'), (52, 'James', 'Davis'), (53, 'Robert', 'Wilson'), (54, 'Michael', 'Moore'), (55, 'William', 'Taylor');
SET IDENTITY_INSERT Persons OFF;

-- ===================================================
-- 4. Populating Members (40 Members mapping to Persons 1-40)
-- ===================================================
INSERT INTO Members (PersonID, DateOfBirth) VALUES
(1, '2010-05-12'), (2, '2008-08-24'), (3, '2012-01-15'), (4, '1995-11-30'), (5, '1992-04-05'),
(6, '2005-07-19'), (7, '2009-02-11'), (8, '2011-09-03'), (9, '1998-06-21'), (10, '1994-12-14'),
(11, '2003-03-27'), (12, '2007-10-09'), (13, '2013-05-16'), (14, '1990-08-22'), (15, '1988-01-11'),
(16, '2004-11-05'), (17, '2006-02-18'), (18, '2010-12-25'), (19, '1997-04-13'), (20, '1993-09-09'),
(21, '2001-07-07'), (22, '2005-01-29'), (23, '2012-06-14'), (24, '1996-03-22'), (25, '1991-10-17'),
(26, '2002-08-05'), (27, '2008-04-12'), (28, '2011-11-11'), (29, '1999-05-23'), (30, '1995-02-02'),
(31, '2004-09-14'), (32, '2007-01-03'), (33, '2013-07-20'), (34, '1989-12-19'), (35, '1987-06-08'),
(36, '2003-10-31'), (37, '2006-05-15'), (38, '2009-03-24'), (39, '1998-01-10'), (40, '1994-07-26');

-- ===================================================
-- 5. Populating Instructors (5 Instructors mapping to Persons 41-45)
-- ===================================================
INSERT INTO Instructors (PersonID) VALUES 
(41), (42), (43), (44), (45);

-- ===================================================
-- 6. Populating Emails & Phones (For Members 1-40 and Instructors 41-45)
-- ===================================================
INSERT INTO Emails (PersonID, Email) VALUES
(1, 'james.s@gmail.com'), (2, 'michael.s@yahoo.com'), (3, 'robert.s@outlook.com'), (4, 'maria.g@gmail.com'), (5, 'david.s@gmail.com'),
(41, 'richard.coach@karate.com'), (42, 'thomas.sensei@karate.com'), (43, 'charles.m@karate.com'), (44, 'chris.b@gmail.com'), (45, 'daniel.s@yahoo.com');

INSERT INTO Phones (PersonID, PhoneNumber) VALUES
(1, '202-555-0143'), (2, '202-555-0176'), (3, '202-555-0199'), (4, '312-555-0122'), (5, '312-555-0155'),
(41, ' Los-555-0111'), (42, 'Los-555-0222'), (43, 'New-555-0333'), (44, 'New-555-0444'), (45, 'Houston-555-0555');

-- ===================================================
-- 7. Populating US Addresses (Mapping to Persons 1-10 & 41-43)
-- ===================================================
INSERT INTO Addresses (PersonID, Street, Neighborhood, BuildingNumber) VALUES
(1, '742 Evergreen Terrace', 'Springfield', 'Apt 4B'),
(2, '123 Main Street', 'Downtown', 'Suite 100'),
(3, '456 Elm Road', 'Oak Ridge', 'Block C'),
(4, '789 Maple Avenue', 'Riverdale', 'Floor 2'),
(5, '101 Pine Lane', 'Pine Valley', 'House 12'),
(6, '202 Cedar Blvd', 'Westside', 'Building 5'),
(7, '303 Birch Court', 'Greenbrier', 'Apt 1A'),
(8, '404 Walnut Way', 'Silver Spring', 'Suite 22'),
(9, '505 Ash Drive', 'Lakewood', 'House 9'),
(10, '606 Willow Lane', 'Sunnyvale', 'Room 305'),
(41, '555 Masters Blvd', 'Beverly Hills', 'Dojo A'),
(42, '777 Warrior Way', 'Manhattan', 'Floor 4'),
(43, '999 Champion St', 'Austin Heights', 'Suite 11');

-- ===================================================
-- 8. Populating Payments (50 unique operational payments)
-- ===================================================
-- Payments 1 to 35 are for Subscription Periods
-- Payments 36 to 50 are for Test Records
SET IDENTITY_INSERT Payments ON;
INSERT INTO Payments (PaymentID, PaymentMethod, Amount, PaymentStatus, PaymentDate, Notes) VALUES
(1, 'Cash', 50.00, 1, '2026-01-05', 'Regular January payment'),
(2, 'Credit Card', 135.00, 1, '2026-01-10', 'Premium Quarterly plan'),
(3, 'Apple Pay', 250.00, 1, '2026-01-15', 'VIP Half-Yearly plan'),
(4, 'Bank Transfer', 450.00, 1, '2026-01-20', 'Annual Elite plan'),
(5, 'Cash', 50.00, 1, '2026-02-01', 'Monthly membership renewal'),
(6, 'Credit Card', 50.00, 1, '2026-02-02', 'Monthly renewal'),
(7, 'Cash', 135.00, 1, '2026-02-05', 'Premium Quarterly'),
(8, 'Apple Pay', 50.00, 1, '2026-02-10', 'Regular sub'),
(9, 'Credit Card', 50.00, 1, '2026-02-12', 'Regular sub'),
(10, 'Cash', 250.00, 1, '2026-02-15', 'VIP Renewal'),
(11, 'Credit Card', 50.00, 1, '2026-03-01', 'Paid'),
(12, 'Cash', 50.00, 1, '2026-03-03', 'Paid'),
(13, 'Apple Pay', 50.00, 1, '2026-03-05', 'Paid'),
(14, 'Credit Card', 135.00, 1, '2026-03-10', 'Paid'),
(15, 'Bank Transfer', 50.00, 1, '2026-03-12', 'Paid'),
(16, 'Cash', 50.00, 1, '2026-04-01', 'Paid'),
(17, 'Credit Card', 50.00, 1, '2026-04-02', 'Paid'),
(18, 'Apple Pay', 250.00, 1, '2026-04-05', 'Paid'),
(19, 'Cash', 50.00, 1, '2026-04-10', 'Paid'),
(20, 'Credit Card', 50.00, 1, '2026-04-12', 'Paid'),
(21, 'Cash', 135.00, 1, '2026-05-01', 'Paid'),
(22, 'Apple Pay', 50.00, 1, '2026-05-02', 'Paid'),
(23, 'Credit Card', 50.00, 1, '2026-05-05', 'Paid'),
(24, 'Bank Transfer', 450.00, 1, '2026-05-10', 'Paid'),
(25, 'Cash', 50.00, 1, '2026-05-15', 'Paid'),
(26, 'Credit Card', 50.00, 1, '2026-06-01', 'Paid'),
(27, 'Apple Pay', 135.00, 1, '2026-06-02', 'Paid'),
(28, 'Cash', 50.00, 1, '2026-06-05', 'Paid'),
(29, 'Credit Card', 50.00, 1, '2026-06-08', 'Paid'),
(30, 'Bank Transfer', 250.00, 1, '2026-06-12', 'Paid'),
(31, 'Cash', 50.00, 1, '2026-06-20', 'Paid'),
(32, 'Credit Card', 50.00, 1, '2026-07-01', 'Paid'),
(33, 'Apple Pay', 50.00, 1, '2026-07-02', 'Paid'),
(34, 'Cash', 135.00, 1, '2026-07-04', 'Paid'),
(35, 'Credit Card', 50.00, 1, '2026-07-05', 'Latest renewal payment'),
(36, 'Cash', 15.00, 1, '2026-02-15', 'White Belt test fee'),
(37, 'Credit Card', 15.00, 1, '2026-02-20', 'White Belt test fee'),
(38, 'Apple Pay', 20.00, 1, '2026-03-01', 'Yellow Belt test fee'),
(39, 'Cash', 20.00, 1, '2026-03-05', 'Yellow Belt test fee'),
(40, 'Credit Card', 25.00, 1, '2026-03-15', 'Orange Belt test fee'),
(41, 'Cash', 25.00, 1, '2026-04-02', 'Orange Belt test fee'),
(42, 'Apple Pay', 30.00, 1, '2026-04-10', 'Green Belt test fee'),
(43, 'Credit Card', 35.00, 1, '2026-04-20', 'Blue Belt test fee'),
(44, 'Cash', 40.00, 1, '2026-05-01', 'Purple Belt test fee'),
(45, 'Credit Card', 50.00, 1, '2026-05-15', 'Brown Belt test fee'),
(46, 'Apple Pay', 75.00, 1, '2026-06-01', 'Black Belt 1st Dan fee'),
(47, 'Bank Transfer', 85.00, 1, '2026-06-10', 'Black Belt 2nd Dan fee'),
(48, 'Cash', 95.00, 1, '2026-06-18', 'Black Belt 3rd Dan fee'),
(49, 'Credit Card', 110.00, 1, '2026-06-25', 'Black Belt 4th Dan fee'),
(50, 'Apple Pay', 125.00, 1, '2026-07-02', 'Black Belt 5th Dan fee');
SET IDENTITY_INSERT Payments OFF;

-- ===================================================
-- 9. Populating SubscriptionPeriods (35 records mapping to Payments 1-35)
-- ===================================================
INSERT INTO SubscriptionPeriods (MembershipID, MemberID, PaymentID, StartDate, EndDate) VALUES
(1, 1, 1, '2026-01-05', '2026-02-05'), (2, 2, 2, '2026-01-10', '2026-04-10'),
(3, 3, 3, '2026-01-15', '2026-07-15'), (4, 4, 4, '2026-01-20', '2027-01-20'),
(1, 5, 5, '2026-02-01', '2026-03-01'), (1, 6, 6, '2026-02-02', '2026-03-02'),
(2, 7, 7, '2026-02-05', '2026-05-05'), (1, 8, 8, '2026-02-10', '2026-03-10'),
(1, 9, 9, '2026-02-12', '2026-03-12'), (3, 10, 10, '2026-02-15', '2026-08-15'),
(1, 11, 11, '2026-03-01', '2026-04-01'), (1, 12, 12, '2026-03-03', '2026-04-03'),
(1, 13, 13, '2026-03-05', '2026-04-05'), (2, 14, 14, '2026-03-10', '2026-06-10'),
(1, 15, 15, '2026-03-12', '2026-04-12'), (1, 16, 16, '2026-04-01', '2026-05-01'),
(1, 17, 17, '2026-04-02', '2026-05-02'), (3, 18, 18, '2026-04-05', '2026-10-05'),
(1, 19, 19, '2026-04-10', '2026-05-10'), (1, 20, 20, '2026-04-12', '2026-05-12'),
(2, 21, 21, '2026-05-01', '2026-08-01'), (1, 22, 22, '2026-05-02', '2026-06-02'),
(1, 23, 23, '2026-05-05', '2026-05-05'), (4, 24, 24, '2026-05-10', '2027-05-10'),
(1, 25, 25, '2026-05-15', '2026-06-15'), (1, 26, 26, '2026-06-01', '2026-07-01'),
(2, 27, 27, '2026-06-02', '2026-09-02'), (1, 28, 28, '2026-06-05', '2026-07-05'),
(1, 29, 29, '2026-06-08', '2026-07-08'), (3, 30, 30, '2026-06-12', '2026-12-12'),
(1, 31, 31, '2026-06-20', '2026-07-20'), (1, 32, 32, '2026-07-01', '2026-08-01'),
(1, 33, 33, '2026-07-02', '2026-08-02'), (2, 34, 34, '2026-07-04', '2026-10-04'),
(1, 35, 35, '2026-07-05', '2026-08-05');

-- ===================================================
-- 10. Populating MemberEmergencyContacts (Mapping Persons 51-55 as contacts)
-- ===================================================
INSERT INTO MemberEmergencyContacts (PersonID, MemberID) VALUES
(51, 1), (51, 2), -- Handled family scenario (siblings sharing same contact)
(52, 3), (53, 4), (54, 5), (55, 6), (51, 7), (52, 8), (53, 9), (54, 10);

-- ===================================================
-- 11. Populating InstructorMembers (Trainer Assignment Mapping)
-- ===================================================
INSERT INTO InstructorMembers (InstructorID, MemberID) VALUES
(1, 1), (1, 2), (1, 3), (2, 4), (2, 5), (3, 6), (3, 7), (4, 8), (4, 9), (5, 10);

-- ===================================================
-- 12. Populating Qualifications
-- ===================================================
INSERT INTO Qualifications (InstructorID, Degree, GraduationDate) VALUES
(1, 'Master of Martial Arts', '2015-06-20'),
(2, 'Sports Science Bachelor', '2018-05-14'),
(3, '5th Dan Certificate', '2012-11-01');

-- ===================================================
-- 13. Populating TestRecords (15 Test Entries mapping to Payments 36-50)
-- ===================================================
INSERT INTO TestRecords (InstructorID, MemberID, BeltID, PaymentID, TestDate, Result) VALUES
(1, 1, 1, 36, '2026-02-15', 'Pass'),
(1, 2, 1, 37, '2026-02-20', 'Pass'),
(2, 3, 2, 38, '2026-03-01', 'Fail'), -- Simulated failure record for realistic system stats
(2, 4, 2, 39, '2026-03-05', 'Pass'),
(3, 5, 3, 40, '2026-03-15', 'Pass'),
(3, 6, 3, 41, '2026-04-02', 'Pass'),
(4, 7, 4, 42, '2026-04-10', 'Pass'),
(4, 8, 5, 43, '2026-04-20', 'Pass'),
(5, 9, 6, 44, '2026-05-01', 'Pass'),
(5, 10, 7, 45, '2026-05-15', 'Pass'),
(1, 11, 8, 46, '2026-06-01', 'Pass'),
(2, 12, 9, 47, '2026-06-10', 'Pass'),
(3, 13, 10, 48, '2026-06-18', 'Fail'),
(4, 14, 11, 49, '2026-06-25', 'Pass'),
(5, 15, 12, 50, '2026-07-02', 'Pass');
GO