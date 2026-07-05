-- ===================================================
-- Karate Club Database System.
-- ===================================================
USE master;

IF NOT EXISTS (SELECT * FROM sys.databases 
	WHERE NAME = 'KarateClubDB')
	BEGIN
		CREATE DATABASE KarateClubDB
	END
GO

USE KarateClubDB
GO

-- ===================================================
-- Parent table to store core personal data.
-- ===================================================
CREATE TABLE Persons(
	PersonID INT NOT NULL IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,

	CONSTRAINT PK_Persons_PersonID PRIMARY KEY(PersonID)
);
-- ===================================================
-- Memberships table to store membership plans data.
-- ===================================================
CREATE TABLE Memberships(
	MembershipID INT NOT NULL IDENTITY(1,1),
	MembershipStatus NVARCHAR(50) NOT NULL,

	CONSTRAINT PK_Memberships_MembershipID PRIMARY KEY(MembershipID)
);
-- ===================================================
-- Belts table to store belt ranks data.
-- ===================================================
CREATE TABLE Belts(
	BeltID INT NOT NULL IDENTITY(1,1),
	BeltRank NVARCHAR(50) NOT NULL,
	TestFee SMALLMONEY NOT NULL,

	CONSTRAINT PK_Belts_BeltID PRIMARY KEY(BeltID)
);
-- ===================================================
-- Payments table to store financial transactions data.
-- ===================================================
CREATE TABLE Payments(
	PaymentID INT NOT NULL IDENTITY(1,1),
	PaymentMethod NVARCHAR(255) NOT NULL,
	Amount SMALLMONEY NOT NULL,
	PaymentStatus BIT NOT NULL,
	PaymentDate DATETIME NOT NULL,
	Notes NVARCHAR(255) NULL,

	CONSTRAINT PK_Payments_PaymentID PRIMARY KEY(PaymentID)
);
GO
-- ===================================================
-- Members table inherits from Persons table and 
-- stores specific member-related data.
-- ===================================================
CREATE TABLE Members(
	MemberID INT NOT NULL IDENTITY(1,1),
	PersonID INT NOT NULL,
	DateOfBirth DATE NOT NULL,

	CONSTRAINT PK_Members_MemberID	PRIMARY KEY(MemberID),
	CONSTRAINT FK_Members_PersonID	FOREIGN KEY(PersonID) REFERENCES Persons(PersonID),
	CONSTRAINT UQ_Members_PersonID	UNIQUE(PersonID)
);
-- ===================================================
-- Instructors table inherits from Persons table and 
-- stores instructor-specific data.
-- ===================================================
CREATE TABLE Instructors(
	InstructorID INT NOT NULL IDENTITY(1,1),
	PersonID INT NOT NULL,

	CONSTRAINT PK_Instructors_InstructorID	PRIMARY KEY(InstructorID),
	CONSTRAINT FK_Instructors_PersonID		FOREIGN KEY(PersonID) REFERENCES Persons(PersonID),
	CONSTRAINT UQ_Instructors_PersonID		UNIQUE(PersonID)
);
-- ===================================================
-- Emails table is related to Persons table 
-- and stores multi-email address records.
-- ===================================================
CREATE TABLE Emails(
	EmailID INT NOT NULL IDENTITY(1,1),
	PersonID INT NOT NULL,
	Email NVARCHAR(255) NOT NULL,

	CONSTRAINT PK_Emails_EmailID	PRIMARY KEY(EmailID),
	CONSTRAINT FK_Emails_PersonID	FOREIGN KEY(PersonID) REFERENCES Persons(PersonID)
);
-- ===================================================
-- Phones table is related to Persons table 
-- and stores multi-phone number records.
-- ===================================================
CREATE TABLE Phones(
	PhoneID INT NOT NULL IDENTITY(1,1),
	PersonID INT NOT NULL,
	PhoneNumber NVARCHAR(255) NOT NULL,

	CONSTRAINT PK_Phones_PhoneID	PRIMARY KEY(PhoneID),
	CONSTRAINT FK_Phones_PersonID	FOREIGN KEY(PersonID) REFERENCES Persons(PersonID)
);
-- ===================================================
-- Addresses table is related to Persons table 
-- and stores physical location data.
-- ===================================================
CREATE TABLE Addresses(
	AddressID INT NOT NULL IDENTITY(1,1),
	PersonID INT NOT NULL,
	Street 		   NVARCHAR(255) NOT NULL,
	Neighborhood   NVARCHAR(255) NOT NULL,
	BuildingNumber NVARCHAR(255) NOT NULL,

	CONSTRAINT PK_Addresses_AddressID PRIMARY KEY(AddressID),
	CONSTRAINT FK_Addresses_PersonID  FOREIGN KEY(PersonID) REFERENCES Persons(PersonID)
);
GO-- ===================================================
-- SubscriptionPeriods table links Memberships, Members, 
-- and Payments tables to track period logs.
-- ===================================================
CREATE TABLE SubscriptionPeriods(
	SubscriptionPeriodID INT NOT NULL IDENTITY(1,1),
	MembershipID INT NOT NULL,
	MemberID INT NOT NULL,
	PaymentID INT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate   DATE NOT NULL,

	CONSTRAINT PK_SubscriptionPeriods_SubscriptionPeriodID PRIMARY KEY(SubscriptionPeriodID),
	CONSTRAINT FK_SubscriptionPeriods_MembershipID		   FOREIGN KEY(MembershipID) REFERENCES Memberships(MembershipID),
	CONSTRAINT FK_SubscriptionPeriods_MemberID			   FOREIGN KEY(MemberID) REFERENCES Members(MemberID),
	CONSTRAINT FK_SubscriptionPeriods_PaymentID			   FOREIGN KEY(PaymentID)	 REFERENCES Payments(PaymentID),
	CONSTRAINT UQ_SubscriptionPeriods_PaymentID			   UNIQUE(PaymentID)
);
-- ===================================================
-- MemberEmergencyContacts table links Persons and Members 
-- tables to resolve the many-to-many relationship.
-- ===================================================
CREATE TABLE MemberEmergencyContacts(
	MemberEmergencyContactID INT NOT NULL IDENTITY(1,1),
	PersonID INT NOT NULL,
	MemberID INT NOT NULL,

	CONSTRAINT PK_MemberEmergencyContacts_MemberEmergencyContactID PRIMARY KEY(MemberEmergencyContactID),
	CONSTRAINT FK_MemberEmergencyContacts_PersonID				   FOREIGN KEY(PersonID) REFERENCES Persons(PersonID),
	CONSTRAINT FK_MemberEmergencyContacts_MemberID				   FOREIGN KEY(MemberID) REFERENCES Members(MemberID)
);
-- ===================================================
-- InstructorMembers table links Instructors and Members 
-- tables to resolve the many-to-many relationship.
-- ===================================================
CREATE TABLE InstructorMembers(
	InstructorMemberID INT NOT NULL IDENTITY(1,1),
	InstructorID INT NOT NULL,
	MemberID INT NOT NULL,

	CONSTRAINT PK_InstructorMembers_InstructorMembersID PRIMARY KEY(InstructorMemberID),
	CONSTRAINT FK_InstructorMembers_InstructorID				   FOREIGN KEY(InstructorID) REFERENCES Instructors(InstructorID),
	CONSTRAINT FK_InstructorMembers_MemberID				   FOREIGN KEY(MemberID) REFERENCES Members(MemberID)
);
-- ===================================================
-- Qualifications table is related to Instructors table 
-- and stores academic and rank certifications.
-- ===================================================
CREATE TABLE Qualifications(
	QualificationID INT NOT NULL IDENTITY(1,1),
	InstructorID INT NOT NULL,
	Degree NVARCHAR(50) NOT NULL,
	GraduationDate DATE NOT NULL,

	CONSTRAINT PK_Qualifications_QualificationID PRIMARY KEY(QualificationID),
	CONSTRAINT FK_Qualifications_InstructorID	 FOREIGN KEY(InstructorID) REFERENCES Instructors(InstructorID) 
);
-- ===================================================
-- TestRecords table maps Instructors, Members, Belts, 
-- and Payments to track rank promotion tests.
-- ===================================================
CREATE TABLE TestRecords(
	TestRecordID INT NOT NULL IDENTITY(1,1),
	InstructorID INT NOT NULL,
	MemberID INT NOT NULL,
	BeltID INT NOT NULL,
	PaymentID INT NOT NULL,
	TestDate DATE NOT NULL,
	Result NVARCHAR(255) NOT NULL,

	CONSTRAINT PK_TestRecords_TestRecordID PRIMARY KEY(TestRecordID),
	CONSTRAINT FK_TestRecords_InstructorID FOREIGN KEY(InstructorID) REFERENCES Instructors(InstructorID),
	CONSTRAINT FK_TestRecords_MemberID FOREIGN KEY(MemberID) REFERENCES Members(MemberID),	
	CONSTRAINT FK_TestRecords_BeltID FOREIGN KEY(BeltID) REFERENCES Belts(BeltID),
	CONSTRAINT FK_TestRecords_PaymentID FOREIGN KEY(PaymentID) REFERENCES Payments(PaymentID),
	CONSTRAINT UQ_TestRecords_PaymentID UNIQUE(PaymentID)
);
GO
