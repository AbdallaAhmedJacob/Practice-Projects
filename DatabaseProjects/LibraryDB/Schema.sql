-- Library Database schema

IF NOT EXISTS(SELECT * FROM  sys.databases WHERE NAME = 'LibraryDB')
	CREATE DATABASE LibraryDB;
Go 

USE LibraryDB;

CREATE TABLE Settings (
	DefaultBorrowDays TINYINT,
	DefaultFinePerDay SMALLMONEY
);

CREATE TABLE Persons(
	PersonID  INT IDENTITY(1, 1) NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName  NVARCHAR(50) NOT NULL,

	CONSTRAINT PK_Persons_PersonID PRIMARY KEY (PersonID) 
);

CREATE TABLE Books(
	BookID	  INT IDENTITY(1,1) NOT NULL,
	BookTitle NVARCHAR(100) NOT NULL,
	ISBN	  NVARCHAR(50) NOT NULL,
	Genre     NVARCHAR(50) NOT NULL,
	
	CONSTRAINT PK_Books_BookID PRIMARY KEY(BookID)
);

CREATE TABLE Authors(
	AuthorID INT IDENTITY(1,1) NOT NULL,
	PersonID INT NOT NULL,

	CONSTRAINT PK_Authors_AuthorID PRIMARY KEY (AuthorID),
	CONSTRAINT FK_Authors_PersonID FOREIGN KEY (PersonID) REFERENCES Persons(PersonID),
	CONSTRAINT UQ_Authors_PersonID UNIQUE (PersonID)
);

CREATE TABLE Users(
	UserID				INT IDENTITY(1,1) NOT NULL,
	PersonID			INT NOT NULL,
	LibraryCardNumber	NVARCHAR(50) NOT NULL,

	CONSTRAINT PK_Users_UserID		PRIMARY KEY (UserID),
	CONSTRAINT FK_Users_PersonID	FOREIGN KEY (PersonID) REFERENCES Persons(PersonID),
	CONSTRAINT UQ_Users_PersonID UNIQUE (PersonID)
);

CREATE TABLE Emails(
	EmailID		INT IDENTITY(1,1) NOT NULL,
	PersonID	INT NOT NULL,
	Email		NVARCHAR(255) NOT NULL,

	CONSTRAINT PK_Emails_EmailID PRIMARY KEY (EmailID),
	CONSTRAINT FK_Emails_PersonID FOREIGN KEY (PersonID) REFERENCES Persons(PersonID),
	CONSTRAINT UQ_Emails_Email UNIQUE (Email)
);

CREATE TABLE Phones(
	PhoneID		INT IDENTITY(1,1) NOT NULL,
	PersonID	INT NOT NULL,
	Phone		NVARCHAR(50) NOT NULL,

	CONSTRAINT PK_Phones_PhoneID PRIMARY KEY (PhoneID),
	CONSTRAINT FK_Phones_PersonID FOREIGN KEY (PersonID) REFERENCES Persons(PersonID),
	CONSTRAINT UQ_Phones_Phone UNIQUE (Phone)
);

CREATE TABLE BookAuthors(
	BookAuthorID INT IDENTITY(1,1) NOT NULL,
	BookID	   INT NOT NULL,
	AuthorID     INT NOT NULL,

	CONSTRAINT PK_BookAuthors_BookAuthorID PRIMARY KEY (BookAuthorID),
	CONSTRAINT FK_BookAuthors_BookID	   FOREIGN KEY (BookID) REFERENCES Books(BookID),
	CONSTRAINT FK_BookAuthors_AuthorID	   FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE BookCopies(
	BookCopyID			INT IDENTITY(1,1) NOT NULL,
	BookID				INT NOT NULL,
	PublicationDate		DATE NOT NULL,
	AvailabilityStatus	NVARCHAR(50) NOT NULL,
	AdditionalDetails	NVARCHAR(255) NULL,

	CONSTRAINT PK_BookCopies_BookCopyID PRIMARY KEY (BookCopyID),
	CONSTRAINT FK_BookCopies_BookID		FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

CREATE TABLE Reservations(
	ReservationID	INT IDENTITY(1,1) NOT NULL,
	UserID			INT NOT NULL,
	BookCopyID		INT NOT NULL,
	ReservationDate DATETIME NOT NULL,

	CONSTRAINT PK_Reservations_ReservationID PRIMARY KEY (ReservationID),
	CONSTRAINT FK_Reservations_UserID		 FOREIGN KEY (UserID) REFERENCES Users(UserID),
	CONSTRAINT FK_Reservations_BookCopyID	 FOREIGN KEY (BookCopyID) REFERENCES BookCopies(BookCopyID)
);

CREATE TABLE BorrowingRecords(
	BorrowingRecordID   INT IDENTITY(1,1) NOT NULL,
	BookCopyID			INT NOT NULL,
	UserID				INT NOT NULL,
	BorrowingDate		DATETIME DEFAULT GETDATE() NOT NULL,
	DueDate				DATETIME NOT NULL,
	ActualDate			DATETIME NULL,

	CONSTRAINT PK_BorrowingRecords_BorrowingRecordID PRIMARY KEY (BorrowingRecordID),
	CONSTRAINT FK_BorrowingRecords_BookCopyID		 FOREIGN KEY (BookCopyID) REFERENCES BookCopies(BookCopyID),
	CONSTRAINT FK_BorrowingRecords_UserID			 FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Fines(
	FineID				INT IDENTITY(1,1) NOT NULL,
	BorrowingRecordID   INT NOT NULL,
	FineAmount			SMALLMONEY NOT NULL,
	NumberOfLateDays    TINYINT NOT NULL DEFAULT 0,
	PaymentStatus       BIT NOT NULL DEFAULT 0,

	CONSTRAINT PK_Fines_FineID			  PRIMARY KEY (FineID),
	CONSTRAINT FK_Fines_BorrowingRecordID FOREIGN KEY (BorrowingRecordID) REFERENCES BorrowingRecordS(BorrowingRecordID),
	CONSTRAINT UQ_Fines_BorrowingRecordID UNIQUE (BorrowingRecordID)
);

GO