USE CarRental;
GO

-- =====================================================================
-- 1. Seeding Table: Fuels
-- =====================================================================
INSERT INTO Fuels (FuelType) VALUES 
('Gasoline'),
('Diesel'),
('Electric'),
('Hybrid');

-- =====================================================================
-- 2. Seeding Table: Categories
-- =====================================================================
INSERT INTO Categories (Category) VALUES 
('Sedan'),
('SUV'),
('4x4'),
('Hatchback'),
('Luxury');

-- =====================================================================
-- 3. Seeding Table: Customers
-- =====================================================================
INSERT INTO Customers (FirstName, LastName, PhoneNumber, Email, DriversLicenseNumber) VALUES 
('John', 'Doe', '+1-555-0198', 'john.doe@example.com', 'DL-987654321'),
('Jane', 'Smith', '+1-555-0147', 'jane.smith@example.com', 'DL-123456789'),
('Michael', 'Brown', '+1-555-0123', 'michael.b@example.com', 'DL-554433221'),
('Emily', 'Davis', '+1-555-0155', 'emily.d@example.com', 'DL-998877665'),
('David', 'Wilson', '+1-555-0177', 'david.w@example.com', 'DL-112233445');

-- =====================================================================
-- 4. Seeding Table: Vehicles
-- =====================================================================
INSERT INTO Vehicles (CategoryID, FuelID, MadeIn, Model, MakeYear, Mileage, RentalRate, PlatNumber, IsAvailableForRent) VALUES 
(1, 1, 'Toyota', 'Camry', 2023, 15000, 45.00, 'XYZ-1234', 1),
(2, 4, 'Toyota', 'RAV4', 2024, 8000, 60.00, 'ABC-5678', 1),
(3, 2, 'Ford', 'F-150', 2022, 35000, 85.00, 'TRK-9101', 0), -- Currently In Maintenance
(5, 3, 'Tesla', 'Model Y', 2023, 12000, 100.00, 'TSL-4321', 1),
(1, 1, 'Honda', 'Civic', 2022, 22000, 40.00, 'HND-7777', 1);

-- =====================================================================
-- 5. Seeding Table: Maintenance
-- =====================================================================
INSERT INTO Maintenance (VehicleID, MaintenanceDescription, Maintenance, Cost) VALUES 
(3, 'Brake pads replacement and oil change', '2026-07-08', 250.00),
(1, 'Routine annual inspection', '2026-05-12', 120.00);

-- =====================================================================
-- 6. Seeding Table: VehicleBookings
-- =====================================================================
-- Booking 1: Completed & Returned
-- Booking 2: Active / Paid (Not returned yet)
-- Booking 3: Completed with additional charges
INSERT INTO VehicleBookings (CustomerID, VehicleID, RentalStartDate, RentalEndDate, PickupLocation, DropLocation, InitialRentalDate, InitialTotalDueAmount, InitialVehicleCheckNotes) VALUES 
(1, 1, '2026-06-01 09:00:00', '2026-06-05 18:00:00', 'JFK Airport', 'JFK Airport', 4, 180.00, 'Clean interior, minor scratch on front bumper.'),
(2, 2, '2026-07-01 10:00:00', '2026-07-10 10:00:00', 'Downtown Branch', 'Downtown Branch', 9, 540.00, 'Perfect condition, full tank.'),
(3, 4, '2026-06-10 08:00:00', '2026-06-13 08:00:00', 'LAX Airport', 'LAX Airport', 3, 300.00, 'Brand new vehicle, no remarks.');

-- =====================================================================
-- 7. Seeding Table: RentalTransactions
-- =====================================================================
-- Strict 1:1 matching to Bookings
INSERT INTO RentalTransactions (VehicleBookingID, PaymentAmount, PaymentMethod, PaymentStatus, Notes) VALUES 
(1, 180.00, 'Credit Card', 1, 'Paid in full at pickup.'),
(2, 540.00, 'PayPal', 1, 'Advance online payment.'),
(3, 300.00, 'Credit Card', 1, 'Initial amount cleared.');

-- =====================================================================
-- 8. Seeding Table: VehicleReturns
-- =====================================================================
-- Return 1: Returned on time, no extra due
-- Return 3: Returned late, consumed more mileage, extra due
INSERT INTO VehicleReturns (VehicleBookingID, ConsumedMileage, ActualFinalAmount, ReminaingAmount, ActualReturnDate, ActualRentalDays, VehicleCheckNotes) VALUES 
(1, 450, 180.00, 0.00, '2026-06-05', 4, 'Returned clean, no new damage.'),
(3, 850, 450.00, 150.00, '2026-06-14', 4, 'Returned 1 day late, left rear wheel rim slightly scratched.');

-- =====================================================================
-- 9. Seeding Table: Charges
-- =====================================================================
-- Charges linked strictly to Return ID 2 (Booking 3) due to late return and damage
INSERT INTO Charges (VehicleReturnID, ChargeAmount, ChargeStatus, Notes) VALUES 
(2, 100.00, 1, 'Late return fee (1 day extra over initial contract).'),
(2, 50.00, 0, 'Pending payment for wheel rim scratch damage.');
GO