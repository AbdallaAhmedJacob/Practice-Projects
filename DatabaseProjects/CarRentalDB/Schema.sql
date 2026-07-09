USE master;

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'CarRental')
	CREATE DATABASE CarRental;
ELSE
	DROP DATABASE CarRental;
	CREATE DATABASE CarRental;
GO

USE CarRental;
--- =====================================================================
--- Table Customers
--- =====================================================================
CREATE TABLE Customers(
	CustomerID INT  NOT NULL IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL ,
	LastName NVARCHAR(50) NOT NULL ,
	PhoneNumber NVARCHAR(50) NOT NULL ,
	Email			   NVARCHAR(255) NOT NULL ,
	DriversLicenseNumber NVARCHAR(100) NOT NULL ,

	CONSTRAINT PK_Customers_CustomerID PRIMARY KEY(CustomerID)
);
--- =====================================================================
--- Table Fuels
--- =====================================================================
CREATE TABLE Fuels(
	FuelID INT NOT NULL  IDENTITY(1,1),	
	FuelType NVARCHAR(100) NOT NULL ,

	CONSTRAINT PK_Fuels_FuelID PRIMARY KEY(FuelID)
);
--- =====================================================================
--- Table Categories
--- =====================================================================
CREATE TABLE Categories(
	CategoryID INT NOT NULL  IDENTITY(1,1),	
	Category NVARCHAR(100) NOT NULL ,

	CONSTRAINT PK_Categories_Category PRIMARY KEY(CategoryID)
);

GO

--- =====================================================================
--- Table Vehicles
--- =====================================================================
CREATE TABLE Vehicles(
	VehicleID INT NOT NULL  IDENTITY(1,1),
	CategoryID INT NOT NULL,
	FuelID INT NOT NULL,
	MadeIn	NVARCHAR(50)  NOT NULL,
	Model	NVARCHAR(50)  NOT NULL,
	MakeYear SMALLINT  NOT NULL,
	Mileage	INT		  NOT NULL,
	RentalRate	DECIMAL(10,2)	  NOT NULL,
	PlatNumber	NVARCHAR(50)  NOT NULL,
	IsAvailableForRent BIT NOT NULL,

	CONSTRAINT PK_Vehicles_VehicleID PRIMARY KEY(VehicleID),
	CONSTRAINT FK_Vehicles_CategoryID FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID),
	CONSTRAINT FK_Vehicles_FuelID FOREIGN KEY(FuelID) REFERENCES Fuels(FuelID)
);
--- =====================================================================
--- Table Maintenance
--- =====================================================================
CREATE TABLE Maintenance(
	MaintenanceID INT NOT NULL IDENTITY(1,1),	
	VehicleID INT NOT NULL,
	MaintenanceDescription NVARCHAR(300) NOT NULL,
	Maintenance DATE NOT NULL,
	Cost DECIMAL(10,2) NOT NULL,

	CONSTRAINT PK_Maintenance_MaintenanceID PRIMARY KEY(MaintenanceID),
	CONSTRAINT FK_Maintenance_VehicleID FOREIGN KEY(VehicleID) REFERENCES Vehicles(VehicleID)
);

GO

--- =====================================================================
--- Table VehicleBookings
--- =====================================================================
CREATE TABLE VehicleBookings(
	VehicleBookingID INT NOT NULL IDENTITY(1,1),	
	CustomerID INT NOT NULL,
	VehicleID INT NOT NULL,
	RentalStartDate	DATETIME NOT NULL,
	RentalEndDate   DATETIME NOT NULL,
	PickupLocation NVARCHAR(100) NOT NULL,
	DropLocation   NVARCHAR(100) NOT NULL,
	InitialRentalDate TINYINT NOT NULL,
	InitialTotalDueAmount DECIMAL(10,2)   NOT NULL,
	InitialVehicleCheckNotes NVARCHAR(500)NOT NULL,

	CONSTRAINT PK_VehicleBookings_VehicleBookingID PRIMARY KEY(VehicleBookingID),
	CONSTRAINT FK_VehicleBookings_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT FK_VehicleBookings_VehicleID FOREIGN KEY(VehicleID) REFERENCES Vehicles(VehicleID)
);

GO

--- =====================================================================
--- Table RentalTransactions
--- =====================================================================
CREATE TABLE RentalTransactions(
	RentalTransactionID INT IDENTITY(1,1) NOT NULL,	
	VehicleBookingID INT			NOT NULL,
	PaymentAmount DECIMAL(10,2)		NOT NULL,
	PaymentMethod NVARCHAR(100) 	NOT NULL,
	PaymentStatus BIT				NOT NULL,
	Notes NVARCHAR(255)			    NULL,

	CONSTRAINT PK_RentalTransactions_RentalTransactionID PRIMARY KEY(RentalTransactionID),
	CONSTRAINT FK_RentalTransactions_VehicleBookingID FOREIGN KEY(VehicleBookingID) REFERENCES VehicleBookings(VehicleBookingID),
	CONSTRAINT UQ_RentalTransactions_VehicleBookingID UNIQUE(VehicleBookingID)
);
--- =====================================================================
--- Table VehicleReturns
--- =====================================================================
CREATE TABLE VehicleReturns(
	VehicleReturnID INT IDENTITY(1,1) NOT NULL,
	VehicleBookingID INT			NOT NULL,
	ConsumedMileage INT NOT NULL,
	ActualFinalAmount  DECIMAL(10,2) NOT NULL,
	RemainingAmount     DECIMAL(10,2) NOT NULL,
	ActualReturnDate DATE NOT NULL, 
	ActualRentalDays TINYINT NOT NULL,
	VehicleCheckNotes NVARCHAR(255) NOT NULL,

	CONSTRAINT PK_VehicleReturns_VehicleReturnID PRIMARY KEY(VehicleReturnID),
	CONSTRAINT FK_VehicleReturns_VehicleBookingID FOREIGN KEY(VehicleBookingID) REFERENCES VehicleBookings(VehicleBookingID),
	CONSTRAINT UQ_VehicleReturns_VehicleBookingID UNIQUE(VehicleBookingID)
);

GO

--- =====================================================================
--- Table Charges
--- =====================================================================
CREATE TABLE Charges(
	ChargeID INT NOT NULL IDENTITY(1,1),	
	VehicleReturnID INT NOT NULL,
	ChargeAmount DECIMAL(10,2) NOT NULL,
	ChargeStatus BIT NOT NULL,
	Notes NVARCHAR(255) NULL,

	CONSTRAINT PK_Charges_ChargeID PRIMARY KEY(ChargeID),
	CONSTRAINT FK_Charges_VehicleReturnID FOREIGN KEY(VehicleReturnID) REFERENCES VehicleReturns(VehicleReturnID)
);

GO