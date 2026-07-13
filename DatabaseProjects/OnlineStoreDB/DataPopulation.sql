USE OnlineStoreDB;
GO

-- 1. Populate OrderStatuses (Lookup Table)
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'OrderStatuses')
BEGIN
    INSERT INTO OrderStatuses (OrderStatus) VALUES 
    ('Pending'),
    ('Processing'),
    ('Completed'),
    ('Cancelled');
END

-- 2. Populate ShippingStatuses (Lookup Table)
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'ShippingStatuses')
BEGIN
    INSERT INTO ShippingStatuses (ShippingStatus) VALUES 
    ('Processing'),
    ('Out for Delivery'),
    ('Delivered'),
    ('Delayed'),
    ('Returned to Sender');
END

-- 3. Populate Products
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Products')
BEGIN
    INSERT INTO Products (ProductName, Description, Quantity, Price, ImagePath, Availability, Details) VALUES 
    ('iPhone 15 Pro', 'Apple smartphone with titanium design', 50, 999.99, '/images/iphone15.jpg', 'In Stock', '128GB, Natural Titanium'),
    ('Samsung Galaxy S24', 'Flagship Android phone with AI features', 40, 899.99, '/images/s24.jpg', 'In Stock', '256GB, Phantom Black'),
    ('Sony WH-1000XM5', 'Wireless noise-canceling headphones', 30, 349.99, '/images/sony_xm5.jpg', 'In Stock', 'Silver, 30 hours battery life'),
    ('MacBook Air M3', 'Lightweight laptop with Apple M3 chip', 15, 1099.99, '/images/macbook_air.jpg', 'In Stock', '8GB RAM, 256GB SSD'),
    ('Logitech MX Master 3S', 'Ergonomic wireless office mouse', 0, 99.99, '/images/mx_master3s.jpg', 'Out of Stock', 'Graphite, Silent clicks');
END

-- 4. Populate Customers
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Customers')
BEGIN
    INSERT INTO Customers (CustomerName, ContactDetails, ShippingAddress, LoginCredentails) VALUES 
    ('Ahmed Mansour', 'ahmed@email.com, +966500000001', '123 Riyadh St, Olaya District', 'ahmed_user/pass123'),
    ('Sara Al-Otaibi', 'sara@email.com, +966500000002', '456 King Fahd Rd, Jeddah', 'sara_shop/secure456'),
    ('John Doe', 'john.doe@email.com, +15550199', '789 Pine St, New York', 'johndoe/johnpass77'),
    ('Fatima Al-Ali', 'fatima@email.com, +971500000003', 'Marina Tower, Dubai', 'fatima_dxb/pwd987');
END

-- 5. Populate Orders
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Orders')
BEGIN
    INSERT INTO Orders (CustomerID, OrderStatusID, OrderDate, ShippingMethod) VALUES 
    (1, 3, '2026-07-01 10:30:00', 'Express Shipping'), -- Ahmed: Completed Order
    (2, 2, '2026-07-10 14:15:00', 'Standard Ground'),   -- Sara: Processing Order
    (3, 1, '2026-07-12 09:00:00', 'Express Shipping'), -- John: Pending Order
    (1, 4, '2026-07-05 16:45:00', 'Standard Ground');   -- Ahmed: Cancelled Order
END

-- 6. Populate OrderItems (Bridge Table for Orders & Products)
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'OrderItems')
BEGIN
    INSERT INTO OrderItems (ProductID, OrderID, Quantity, Price) VALUES 
    (1, 1, 1, 999.99),  -- Order 1: 1x iPhone 15 Pro
    (3, 1, 2, 349.99),  -- Order 1: 2x Sony Headphones
    (2, 2, 1, 899.99),  -- Order 2: 1x Samsung S24
    (4, 3, 1, 1099.99), -- Order 3: 1x MacBook Air
    (5, 4, 1, 99.99);   -- Order 4: 1x Logitech Mouse (Cancelled)
END

-- 7. Populate Payments
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Payments')
BEGIN
    INSERT INTO Payments (CustomerID, Amount, PaymentMethod, Timestamp) VALUES 
    (1, 1699.97, 'Credit Card', '2026-07-01 10:32:00'), -- For Order 1
    (2, 899.99, 'PayPal', '2026-07-10 14:18:00'),       -- For Order 2
    (3, 1099.99, 'Apple Pay', '2026-07-12 09:02:00');    -- For Order 3
END

-- 8. Populate Shipping
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Shipping')
BEGIN
    INSERT INTO Shipping (OrderID, ShippingStatusID, ShippingCarrierDetails, TrackingNumber, EstimatedDeliveryDate, ActualDeliveryDate, Notes) VALUES 
    (1, 3, 'DHL Express', 'TRK100200300', '2026-07-04', '2026-07-03 11:00:00', 'Delivered early to receptionist'),
    (2, 2, 'FedEx Ground', 'TRK400500600', '2026-07-15', NULL, 'Package is currently at regional facility'),
    (4, 5, 'Aramex', 'TRK700800900', '2026-07-09', NULL, 'Returned due to order cancellation');
END

-- 9. Populate Reviews
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Reviews')
BEGIN
    INSERT INTO Reviews (CustomerID, ProductID, ReviewText, RatingScore, Timestamp) VALUES 
    (1, 1, 'Absolutely amazing phone. Highly recommend the titanium feel!', 5, '2026-07-04 15:22:00'),
    (1, 3, 'Great sound canceling, but slightly tight on the ears after 4 hours.', 4, '2026-07-05 09:10:00');
END
GO