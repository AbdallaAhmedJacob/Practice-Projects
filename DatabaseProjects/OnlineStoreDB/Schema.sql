USE master;

IF NOT EXISTS (
	SELECT *
	FROM sys.databases
	WHERE NAME = 'OnlineStoreDB'
	)
BEGIN
	CREATE DATABASE OnlineStoreDB;
END
GO
--- ============================================
USE OnlineStoreDB;
-- Create table Products
IF NOT EXISTS(SELECT * FROM sys.tables WHERE NAME = 'Products')
BEGIN
	CREATE TABLE Products(
		ProductID INT NOT NULL IDENTITY(1,1),
		ProductName NVARCHAR(100) NOT NULL,
		Description	 NVARCHAR(500) NOT NULL,
		Quantity	  INT NOT NULL,
		Price		  DECIMAL(10,2) NOT NULL,
		ImagePath	  NVARCHAR(500) NOT NULL,
		Availability  NVARCHAR(50) NOT NULL,
		Details       NVARCHAR(500) NULL,

		CONSTRAINT PK_Products_ProductID PRIMARY KEY(ProductID)
	);
END

-- Create table Customers
IF NOT EXISTS(SELECT * FROM sys.tables WHERE NAME = 'Customers')
BEGIN
	CREATE TABLE Customers(
		CustomerID INT NOT NULL IDENTITY(1,1),
		CustomerName NVARCHAR(100) NOT NULL,
		ContactDetails NVARCHAR(50) NOT NULL,
		ShippingAddress NVARCHAR(50) NOT NULL,
		LoginCredentails NVARCHAR(100) NOT NULL,

		CONSTRAINT PK_Customers_CustomerID PRIMARY KEY(CustomerID)
	);
END

-- Create table OrderStatuses
IF NOT EXISTS(SELECT * FROM sys.tables WHERE NAME = 'OrderStatuses')
BEGIN
	CREATE TABLE OrderStatuses(
		OrderStatusID INT NOT NULL IDENTITY(1,1),
		OrderStatus NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_OrderStatuses_OrderID PRIMARY KEY(OrderStatusID)
	);
END

-- Create table ShippingStatuses
IF NOT EXISTS(SELECT * FROM sys.tables WHERE NAME = 'ShippingStatuses')
BEGIN
	CREATE TABLE ShippingStatuses(
		ShippingStatusID INT NOT NULL IDENTITY(1,1),
		ShippingStatus NVARCHAR(50) NOT NULL,

		CONSTRAINT PK_ShippingStatuses_ShippingID PRIMARY KEY(ShippingStatusID)
	);
END

-- Create table Orders
IF NOT EXISTS(SELECT * FROM sys.tables WHERE NAME = 'Orders')
BEGIN
	CREATE TABLE Orders(
		OrderID INT NOT NULL IDENTITY(1,1),
		CustomerID INT NOT NULL,
		OrderStatusID INT NOT NULL,
		OrderDate	DATETIME NOT NULL,
		ShippingMethod NVARCHAR(100) NULL,

		CONSTRAINT PK_Orders_OrderID PRIMARY KEY(OrderID),
		CONSTRAINT FK_Orders_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
		CONSTRAINT FK_Orders_OrderStatusID FOREIGN KEY(OrderStatusID) REFERENCES OrderStatuses(OrderStatusID)
	);
END

-- Create table Payments
IF NOT EXISTS(SELECT * FROM sys.tables WHERE NAME = 'Payments')
BEGIN
	CREATE TABLE Payments(
		PaymentID INT NOT NULL IDENTITY(1,1),
		CustomerID INT NOT NULL,
		Amount DECIMAL(10,2) NOT NULL, 
		PaymentMethod NVARCHAR(100) NOT NULL,
		Timestamp DATETIME NOT NULL,

		CONSTRAINT PK_Payments_PaymentID PRIMARY KEY(PaymentID),
		CONSTRAINT FK_Payments_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
	);
END
GO

-- Create table OrderItems
IF NOT EXISTS(SELECT * FROM sys.tables WHERE NAME = 'OrderItems')
BEGIN
	CREATE TABLE OrderItems(
		OrderItemID INT NOT NULL IDENTITY(1,1),
		ProductID INT NOT NULL,
		OrderID INT NOT NULL,
		Quantity INT NOT NULL,
		Price DECIMAL(10,2) NOT NULL,

		CONSTRAINT PK_OrderItems_OrderItemID PRIMARY KEY(OrderItemID),
		CONSTRAINT FK_OrderItems_ProductID FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
		CONSTRAINT FK_OrderItems_OrderID FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
	);
END

-- Create table Shipping
IF NOT EXISTS(SELECT * FROM sys.tables WHERE NAME = 'Shipping')
BEGIN
	CREATE TABLE Shipping(
		ShippingID INT NOT NULL IDENTITY(1,1),
		OrderID INT NOT NULL,
		ShippingStatusID INT NOT NULL,
		ShippingCarrierDetails	NVARCHAR(500) NOT NULL,
		TrackingNumber			NVARCHAR(100) NOT NULL,
		EstimatedDeliveryDate	DATETIME NOT NULL,
		ActualDeliveryDate		DATETIME NULL,
		Notes NVARCHAR(500) NULL,

		CONSTRAINT PK_Shipping_ShippingID PRIMARY KEY(ShippingID),
		CONSTRAINT FK_Shipping_OrderID FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
		CONSTRAINT FK_Shipping_ShippingStatusID FOREIGN KEY(ShippingStatusID) REFERENCES ShippingStatuses(ShippingStatusID)
	);
END
GO

-- Create table Reviews
IF NOT EXISTS(SELECT * FROM sys.tables WHERE NAME = 'Reviews')
BEGIN
	CREATE TABLE Reviews(
		ReviewID INT NOT NULL IDENTITY(1,1),
		CustomerID INT NOT NULL,
		ProductID INT NOT NULL,
		ReviewText NVARCHAR(500) NULL,
		RatingScore TINYINT NULL,
		Timestamp  DATETIME NOT NULL,

		CONSTRAINT PK_Reviews_ReviewID PRIMARY KEY(ReviewID),
		CONSTRAINT FK_Reviews_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
		CONSTRAINT FK_Reviews_ProductID FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
	);
END
