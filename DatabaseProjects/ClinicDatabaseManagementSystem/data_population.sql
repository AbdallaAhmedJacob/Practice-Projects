USE Clinic_DB;

-- =========================================================================
-- 1. INSERT APPOINTMENT STATUSES
-- =========================================================================
INSERT INTO AppointmentStatuses (AppointmentStatus) VALUES ('Pending');
INSERT INTO AppointmentStatuses (AppointmentStatus) VALUES ('Confirmed');
INSERT INTO AppointmentStatuses (AppointmentStatus) VALUES ('Completed');
INSERT INTO AppointmentStatuses (AppointmentStatus) VALUES ('Canceled');
INSERT INTO AppointmentStatuses (AppointmentStatus) VALUES ('Rescheduled');
INSERT INTO AppointmentStatuses (AppointmentStatus) VALUES ('No Show');

-- =========================================================================
-- 2. INSERT MEDICATIONS
-- =========================================================================
INSERT INTO Medications (MedicationName) VALUES ('Amoxicillin 500mg');
INSERT INTO Medications (MedicationName) VALUES ('Paracetamol 500mg');
INSERT INTO Medications (MedicationName) VALUES ('Ibuprofen 400mg');
INSERT INTO Medications (MedicationName) VALUES ('Metformin 850mg');
INSERT INTO Medications (MedicationName) VALUES ('Atorvastatin 20mg');
INSERT INTO Medications (MedicationName) VALUES ('Lisinopril 10mg');
INSERT INTO Medications (MedicationName) VALUES ('Omeprazole 20mg');
INSERT INTO Medications (MedicationName) VALUES ('Amlodipine 5mg');
INSERT INTO Medications (MedicationName) VALUES ('Azithromycin 250mg');
INSERT INTO Medications (MedicationName) VALUES ('Salbutamol Inhaler');

-- =========================================================================
-- 3. INSERT ADDRESSES (110 Addresses: 10 for Doctors, 100 for Patients)
-- =========================================================================
-- Doctors Addresses (1 to 10)
INSERT INTO Addresses (City, Street, BuildingNumber) VALUES ('New York', 'Broadway St', '101A');
INSERT INTO Addresses (City, Street, BuildingNumber) VALUES ('Los Angeles', 'Sunset Blvd', '202B');
INSERT INTO Addresses (City, Street, BuildingNumber) VALUES ('Chicago', 'Michigan Ave', '303C');
INSERT INTO Addresses (City, Street, BuildingNumber) VALUES ('Houston', 'Main St', '404D');
INSERT INTO Addresses (City, Street, BuildingNumber) VALUES ('Phoenix', 'Camelback Rd', '505E');
INSERT INTO Addresses (City, Street, BuildingNumber) VALUES ('Philadelphia', 'Market St', '606F');
INSERT INTO Addresses (City, Street, BuildingNumber) VALUES ('San Antonio', 'River Walk', '707G');
INSERT INTO Addresses (City, Street, BuildingNumber) VALUES ('San Diego', 'Broadway', '808H');
INSERT INTO Addresses (City, Street, BuildingNumber) VALUES ('Dallas', 'Elm St', '909I');
INSERT INTO Addresses (City, Street, BuildingNumber) VALUES ('San Jose', 'First St', '110J');

-- Patients Addresses (11 to 110 - Sample blocks of 10 for efficiency)
INSERT INTO Addresses (City, Street, BuildingNumber) VALUES 
('New York', '5th Ave', '11'),
('New York', 'Park Ave', '12'), 
('New York', 'Madison Ave', '13'),
('New York', 'Lexington Ave', '14'),
('New York', '2nd Ave', '15'), 
('Los Angeles', 'Hollywood Blvd', '16'),
('Los Angeles', 'Wilshire Blvd', '17'),
('Los Angeles', 'Santa Monica Blvd', '18'),
('Los Angeles', 'Melrose Ave', '19'), 
('Los Angeles', 'Olympic Blvd', '20'),
('Chicago', 'State St', '21'), 
('Chicago', 'Clark St', '22'), 
('Chicago', 'Dearborn St', '23'), 
('Chicago', 'Grand Ave', '24'), 
('Chicago', 'Halsted St', '25'),
('Houston', 'Fannin St', '26'), 
('Houston', 'Smith St', '27'), 
('Houston', 'Louisiana St', '28'), 
('Houston', 'Texas Ave', '29'),
('Houston', 'Walker St', '30'),
('Phoenix', 'Central Ave', '31'), 
('Phoenix', 'Washington St', '32'), 
('Phoenix', 'Jefferson St', '33'), 
('Phoenix', 'Van Buren St', '34'), 
('Phoenix', 'McDowell Rd', '35'),
('Philadelphia', 'Broad St', '36'), 
('Philadelphia', 'Chestnut St', '37'), 
('Philadelphia', 'Walnut St', '38'),
('Philadelphia', 'Arch St', '39'), 
('Philadelphia', 'Race St', '40'),
('San Antonio', 'Houston St', '41'), 
('San Antonio', 'Commerce St', '42'), 
('San Antonio', 'Alamo St', '43'),
('San Antonio', 'Navarro St', '44'), 
('San Antonio', 'Presa St', '45'),
('San Diego', 'Fifth Ave', '46'), 
('San Diego', 'Sixth Ave', '47'), 
('San Diego', 'Balboa Ave', '48'), 
('San Diego', 'Miramar Rd', '49'), 
('San Diego', 'Pacific Hwy', '50'),
('Dallas', 'Main St', '51'), 
('Dallas', 'Commerce St', '52'),
('Dallas', 'Pacific Ave', '53'), 
('Dallas', 'Ervay St', '54'), 
('Dallas', 'Akard St', '55'),
('San Jose', 'Santa Clara St', '56'),
('San Jose', 'Market St', '57'), 
('San Jose', 'San Carlos St', '58'), 
('San Jose', 'Almaden Blvd', '59'), 
('San Jose', 'Park Ave', '60'),
('New York', '7th Ave', '61'), 
('New York', '8th Ave', '62'), 
('New York', '9th Ave', '63'), 
('New York', '10th Ave', '64'), 
('New York', '11th Ave', '65'),
('Los Angeles', 'Sunset Blvd', '66'),
('Los Angeles', 'Grand Ave', '67'), 
('Los Angeles', 'Hope St', '68'), 
('Los Angeles', 'Flower St', '69'),
('Los Angeles', 'Figueroa St', '70'),
('Chicago', 'Lincoln Ave', '71'), 
('Chicago', 'Clark St', '72'), 
('Chicago', 'Broadway', '73'), 
('Chicago', 'Belmont Ave', '74'),
('Chicago', 'Fullerton Ave', '75'),
('Houston', 'Richmond Ave', '76'), 
('Houston', 'Westheimer Rd', '77'),
('Houston', 'Post Oak Blvd', '78'), 
('Houston', 'Gessner Rd', '79'), 
('Houston', 'Voss Rd', '80'),
('Phoenix', 'Thomas Rd', '81'), 
('Phoenix', 'Indian School Rd', '82'), 
('Phoenix', 'Camelback Rd', '83'),
('Phoenix', 'Bethany Home Rd', '84'),
('Phoenix', 'Glendale Ave', '85'),
('Philadelphia', 'Pine St', '86'), 
('Philadelphia', 'Spruce St', '87'),
('Philadelphia', 'Locust St', '88'), 
('Philadelphia', 'South St', '89'),
('Philadelphia', 'Bainbridge St', '90'),
('San Antonio', 'Broadway', '91'), 
('San Antonio', 'St Marys St', '92'), 
('San Antonio', 'McCullough Ave', '93'), 
('San Antonio', 'San Pedro Ave', '94'), 
('San Antonio', 'Main Ave', '95'),
('San Diego', 'University Ave', '96'), 
('San Diego', 'El Cajon Blvd', '97'),
('San Diego', 'Adams Ave', '98'), 
('San Diego', 'Park Blvd', '99'), 
('San Diego', 'Grand Ave', '100'),
('Dallas', 'Mockingbird Ln', '101'), 
('Dallas', 'Gastons Ave', '102'), 
('Dallas', 'Abrams Rd', '103'), 
('Dallas', 'Skillman St', '104'), 
('Dallas', 'Greenville Ave', '105'),
('San Jose', 'Bascom Ave', '106'), 
('San Jose', 'Winchester Blvd', '107'), 
('San Jose', 'Meridian Ave', '108'), 
('San Jose', 'Lincoln Ave', '109'), 
('San Jose', 'Race St', '110');

-- =========================================================================
-- 4. INSERT PERSONS (110 Persons)
-- =========================================================================
-- Doctors Persons (PersonID 1 to 10)
INSERT INTO Persons (FirstName, LastName, Gender, DateOfBirth, FK_AddressID) VALUES ('John', 'Smith', 'M', '1975-03-15', 1);
INSERT INTO Persons (FirstName, LastName, Gender, DateOfBirth, FK_AddressID) VALUES ('Sarah', 'Johnson', 'F', '1980-07-22', 2);
INSERT INTO Persons (FirstName, LastName, Gender, DateOfBirth, FK_AddressID) VALUES ('Robert', 'Williams', 'M', '1968-11-05', 3);
INSERT INTO Persons (FirstName, LastName, Gender, DateOfBirth, FK_AddressID) VALUES ('Emily', 'Brown', 'F', '1985-01-30', 4);
INSERT INTO Persons (FirstName, LastName, Gender, DateOfBirth, FK_AddressID) VALUES ('Michael', 'Jones', 'M', '1972-05-18', 5);
INSERT INTO Persons (FirstName, LastName, Gender, DateOfBirth, FK_AddressID) VALUES ('Jessica', 'Miller', 'F', '1978-09-12', 6);
INSERT INTO Persons (FirstName, LastName, Gender, DateOfBirth, FK_AddressID) VALUES ('William', 'Davis', 'M', '1965-04-25', 7);
INSERT INTO Persons (FirstName, LastName, Gender, DateOfBirth, FK_AddressID) VALUES ('Amanda', 'Garcia', 'F', '1983-12-08', 8);
INSERT INTO Persons (FirstName, LastName, Gender, DateOfBirth, FK_AddressID) VALUES ('David', 'Rodriguez', 'M', '1970-08-14', 9);
INSERT INTO Persons (FirstName, LastName, Gender, DateOfBirth, FK_AddressID) VALUES ('Ashley', 'Wilson', 'F', '1982-02-28', 10);

-- Patients Persons (PersonID 11 to 110 - Inserting 100 Rows)
INSERT INTO Persons (FirstName, LastName, Gender, DateOfBirth, FK_AddressID) VALUES
('James', 'Thomas', 'M', '1990-01-01', 11), 
('Mary', 'Jackson', 'F', '1991-02-02', 12), 
('John', 'White', 'M', '1988-03-03', 13), 
('Patricia', 'Harris', 'F', '1985-04-04', 14), 
('Robert', 'Martin', 'M', '1979-05-05', 15),
('Jennifer', 'Thompson', 'F', '1993-06-06', 16), 
('Michael', 'Garcia', 'M', '1982-07-07', 17), 
('Elizabeth', 'Martinez', 'F', '1995-08-08', 18), 
('William', 'Robinson', 'M', '1974-09-09', 19), 
('Linda', 'Clark', 'F', '1987-10-10', 20),
('David', 'Rodriguez', 'M', '1992-11-11', 21), 
('Barbara', 'Lewis', 'F', '1983-12-12', 22), 
('Richard', 'Lee', 'M', '1976-01-13', 23), 
('Susan', 'Walker', 'F', '1990-02-14', 24), 
('Joseph', 'Hall', 'M', '1981-03-15', 25),
('Jessica', 'Allen', 'F', '1989-04-16', 26), 
('Thomas', 'Young', 'M', '1984-05-17', 27), 
('Sarah', 'Hernandez', 'F', '1994-06-18', 28), 
('Charles', 'King', 'M', '1977-07-19', 29), 
('Karen', 'Wright', 'F', '1986-08-20', 30),
('Christopher', 'Lopez', 'M', '1991-09-21', 31), 
('Nancy', 'Hill', 'F', '1980-10-22', 32), 
('Daniel', 'Scott', 'M', '1975-11-23', 33), 
('Lisa', 'Green', 'F', '1993-12-24', 34), 
('Matthew', 'Adams', 'M', '1988-01-25', 35),
('Betty', 'Baker', 'F', '1982-02-26', 36), 
('Anthony', 'Gonzalez', 'M', '1979-03-27', 37), 
('Margaret', 'Nelson', 'F', '1990-04-28', 38), 
('Mark', 'Carter', 'M', '1985-05-29', 39), 
('Sandra', 'Mitchell', 'F', '1973-06-30', 40),
('Donald', 'Perez', 'M', '1994-07-01', 41), 
('Ashley', 'Roberts', 'F', '1987-08-02', 42), 
('Steven', 'Turner', 'M', '1978-09-03', 43), 
('Dorothy', 'Phillips', 'F', '1991-10-04', 44), 
('Paul', 'Campbell', 'M', '1983-11-05', 45),
('Kimberly', 'Parker', 'F', '1976-12-06', 46), 
('Andrew', 'Evans', 'M', '1989-01-07', 47), 
('Emily', 'Edwards', 'F', '1984-02-08', 48), 
('Joshua', 'Collins', 'M', '1995-03-09', 49), 
('Donna', 'Stewart', 'F', '1972-04-10', 50),
('Kenneth', 'Sanchez', 'M', '1992-05-11', 51), 
('Michelle', 'Morris', 'F', '1981-06-12', 52), 
('Kevin', 'Rogers', 'M', '1977-07-13', 53), 
('Carol', 'Reed', 'F', '1990-08-14', 54), 
('Brian', 'Cook', 'M', '1986-09-15', 55),
('Amanda', 'Morgan', 'F', '1983-10-16', 56), 
('George', 'Bell', 'M', '1974-11-17', 57), 
('Melissa', 'Murphy', 'F', '1993-12-18', 58), 
('Edward', 'Bailey', 'M', '1988-01-19', 59), 
('Deborah', 'Rivera', 'F', '1979-02-20', 60),
('Ronald', 'Cooper', 'M', '1991-03-21', 61), 
('Stephanie', 'Richardson', 'F', '1985-04-22', 62), 
('Timothy', 'Cox', 'M', '1976-05-23', 63), 
('Rebecca', 'Howard', 'F', '1994-06-24', 64), 
('Jason', 'Ward', 'M', '1982-07-25', 65),
('Sharon', 'Torres', 'F', '1987-08-26', 66), 
('Jeffrey', 'Peterson', 'M', '1973-09-27', 67), 
('Cynthia', 'Gray', 'F', '1990-10-28', 68), 
('Ryan', 'Ramirez', 'M', '1984-11-29', 69), 
('Kathleen', 'James', 'F', '1978-12-30', 70),
('Jacob', 'Watson', 'M', '1995-01-01', 71), 
('Amy', 'Brooks', 'F', '1989-02-02', 72), 
('Gary', 'Kelly', 'M', '1981-03-03', 73), 
('Shirley', 'Sanders', 'F', '1975-04-04', 74), 
('Nicholas', 'Price', 'M', '1992-05-05', 75),
('Angela', 'Bennett', 'F', '1986-06-06', 76), 
('Eric', 'Wood', 'M', '1977-07-07', 77), 
('Anna', 'Barnes', 'F', '1993-08-08', 78), 
('Jonathan', 'Ross', 'M', '1983-09-09', 79), 
('Ruth', 'Henderson', 'F', '1980-10-10', 80),
('Stephen', 'Coleman', 'M', '1991-11-11', 81), 
('Brenda', 'Jenkins', 'F', '1974-12-12', 82), 
('Larry', 'Perry', 'M', '1988-01-13', 83), 
('Pamela', 'Powell', 'F', '1985-02-14', 84), 
('Justin', 'Long', 'M', '1979-03-15', 85),
('Nicole', 'Patterson', 'F', '1994-04-16', 86), 
('Scott', 'Hughes', 'M', '1982-05-17', 87), 
('Christine', 'Flores', 'F', '1976-06-18', 88), 
('Brandon', 'Washington', 'M', '1990-07-19', 89), 
('Samantha', 'Butler', 'F', '1987-08-20', 90),
('Benjamin', 'Simmons', 'M', '1973-09-21', 91), 
('Catherine', 'Foster', 'F', '1992-10-22', 92), 
('Samuel', 'Gonzales', 'M', '1984-11-23', 93), 
('Virginia', 'Bryant', 'F', '1978-12-24', 94), 
('Gregory', 'Alexander', 'M', '1995-01-25', 95),
('Debra', 'Russell', 'F', '1981-02-26', 96), 
('Alexander', 'Griffin', 'M', '1986-03-27', 97), 
('Rachel', 'Diaz', 'F', '1993-04-28', 98), 
('Patrick', 'Hayes', 'M', '1975-05-29', 99), 
('Janet', 'Myers', 'F', '1980-06-30', 100),
('Jack', 'Ford', 'M', '1989-07-01', 101), 
('Janice', 'Hamilton', 'F', '1984-08-02', 102), 
('Dennis', 'Graham', 'M', '1991-09-03', 103), 
('Carolyn', 'Sullivan', 'F', '1977-10-04', 104), 
('Jerry', 'Wallace', 'M', '1982-11-05', 105),
('Judy', 'Woods', 'F', '1974-12-06', 106), 
('Tyler', 'Cole', 'M', '1994-01-07', 107), 
('Heather', 'West', 'F', '1988-02-08', 108), 
('Aaron', 'Jordan', 'M', '1985-03-09', 109), 
('Diana', 'Owens', 'F', '1980-04-10', 110);

-- =========================================================================
-- 5. INSERT EMAILS & PHONES (110 Rows Each)
-- =========================================================================
-- Sample Emails for 1 to 20 (The rest follow the same logical layout)
INSERT INTO Emails (FK_PersonID, Email) VALUES 
(1, 'dr.john@clinic.com'), (2, 'dr.sarah@clinic.com'), (3, 'dr.robert@clinic.com'), (4, 'dr.emily@clinic.com'), (5, 'dr.michael@clinic.com'),
(6, 'dr.jessica@clinic.com'), (7, 'dr.william@clinic.com'), (8, 'dr.amanda@clinic.com'), (9, 'dr.david@clinic.com'), (10, 'dr.ashley@clinic.com'),
(11, 'patient11@mail.com'), (12, 'patient12@mail.com'), (13, 'patient13@mail.com'), (14, 'patient14@mail.com'), (15, 'patient15@mail.com'),
(16, 'patient16@mail.com'), (17, 'patient17@mail.com'), (18, 'patient18@mail.com'), (19, 'patient19@mail.com'), (20, 'patient20@mail.com');

INSERT INTO Phones (FK_PersonID, Phone) VALUES 
(1, '+1-555-0001'), (2, '+1-555-0002'), (3, '+1-555-0003'), (4, '+1-555-0004'), (5, '+1-555-0005'),
(6, '+1-555-0006'), (7, '+1-555-0007'), (8, '+1-555-0008'), (9, '+1-555-0009'), (10, '+1-555-0010'),
(11, '+1-555-0011'), (12, '+1-555-0012'), (13, '+1-555-0013'), (14, '+1-555-0014'), (15, '+1-555-0015'),
(16, '+1-555-0016'), (17, '+1-555-0017'), (18, '+1-555-0018'), (19, '+1-555-0019'), (20, '+1-555-0020');

-- =========================================================================
-- 6. INSERT DOCTORS (10 Doctors linked to PersonID 1-10)
-- =========================================================================
INSERT INTO Doctors (FK_PersonID, Specialization) VALUES (1, 'Cardiology');
INSERT INTO Doctors (FK_PersonID, Specialization) VALUES (2, 'Pediatrics');
INSERT INTO Doctors (FK_PersonID, Specialization) VALUES (3, 'Dermatology');
INSERT INTO Doctors (FK_PersonID, Specialization) VALUES (4, 'Orthopedics');
INSERT INTO Doctors (FK_PersonID, Specialization) VALUES (5, 'General Medicine');
INSERT INTO Doctors (FK_PersonID, Specialization) VALUES (6, 'Neurology');
INSERT INTO Doctors (FK_PersonID, Specialization) VALUES (7, 'Ophthalmology');
INSERT INTO Doctors (FK_PersonID, Specialization) VALUES (8, 'Psychiatry');
INSERT INTO Doctors (FK_PersonID, Specialization) VALUES (9, 'Oncology');
INSERT INTO Doctors (FK_PersonID, Specialization) VALUES (10, 'Gynecology');

-- =========================================================================
-- 7. INSERT PATIENTS (100 Patients linked to PersonID 11-110)
-- =========================================================================
INSERT INTO Patients (FK_PersonID) VALUES 
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
(21), (22), (23), (24), (25), (26), (27), (28), (29), (30),
(31), (32), (33), (34), (35), (36), (37), (38), (39), (40),
(41), (42), (43), (44), (45), (46), (47), (48), (49), (50),
(51), (52), (53), (54), (55), (56), (57), (58), (59), (60),
(61), (62), (63), (64), (65), (66), (67), (68), (69), (70),
(71), (72), (73), (74), (75), (76), (77), (78), (79), (80),
(81), (82), (83), (84), (85), (86), (87), (88), (89), (90),
(91), (92), (93), (94), (95), (96), (97), (98), (99), (100),
(101), (102), (103), (104), (105), (106), (107), (108), (109), (110);

-- =========================================================================
-- 8. INSERT APPOINTMENTS (Sample Appointments distributed among statuses)
-- =========================================================================
-- FK_DoctorID (1-10), FK_PatientID (1-100), FK_AppointmentStatusID (1=Pending, 2=Confirmed, 3=Completed, 4=Canceled, 5=Rescheduled, 6=No Show)
INSERT INTO Appointments (FK_DoctorID, FK_PatientID, FK_AppointmentStatusID, AppointmentDate, AppointmentTime) VALUES (1, 1, 3, '2026-06-10', '09:00:00'); -- Completed
INSERT INTO Appointments (FK_DoctorID, FK_PatientID, FK_AppointmentStatusID, AppointmentDate, AppointmentTime) VALUES (2, 2, 3, '2026-06-11', '10:00:00'); -- Completed
INSERT INTO Appointments (FK_DoctorID, FK_PatientID, FK_AppointmentStatusID, AppointmentDate, AppointmentTime) VALUES (3, 3, 1, '2026-06-21', '11:00:00'); -- Pending
INSERT INTO Appointments (FK_DoctorID, FK_PatientID, FK_AppointmentStatusID, AppointmentDate, AppointmentTime) VALUES (4, 4, 2, '2026-06-22', '14:30:00'); -- Confirmed
INSERT INTO Appointments (FK_DoctorID, FK_PatientID, FK_AppointmentStatusID, AppointmentDate, AppointmentTime) VALUES (5, 5, 4, '2026-06-12', '16:00:00'); -- Canceled
INSERT INTO Appointments (FK_DoctorID, FK_PatientID, FK_AppointmentStatusID, AppointmentDate, AppointmentTime) VALUES (6, 6, 5, '2026-06-25', '08:30:00'); -- Rescheduled
INSERT INTO Appointments (FK_DoctorID, FK_PatientID, FK_AppointmentStatusID, AppointmentDate, AppointmentTime) VALUES (7, 7, 6, '2026-06-14', '13:00:00'); -- No Show
INSERT INTO Appointments (FK_DoctorID, FK_PatientID, FK_AppointmentStatusID, AppointmentDate, AppointmentTime) VALUES (8, 8, 3, '2026-06-15', '11:30:00'); -- Completed

-- =========================================================================
-- 9. INSERT MEDICAL RECORDS (Linked only to Completed Appointments: ID 1, 2, 8)
-- =========================================================================
INSERT INTO MedicalRecords (FK_AppointmentID, Description, Diagnosis, Notes) 
VALUES (1, 'Patient complains of chest tightness during exercise.', 'Mild hypertension', 'Monitor sodium intake and check blood pressure daily.');

INSERT INTO MedicalRecords (FK_AppointmentID, Description, Diagnosis, Notes) 
VALUES (2, 'Child with continuous coughing and high fever.', 'Acute Bronchitis', 'Keep the child warm and ensure plenty of fluids.');

INSERT INTO MedicalRecords (FK_AppointmentID, Description, Diagnosis, Notes) 
VALUES (8, 'Severe back pain after lifting heavy weight.', 'Lumbar muscle strain', 'Bed rest for 3 days and avoid heavy lifting.');

-- =========================================================================
-- 10. INSERT PRESCRIPTIONS (Linked to MedicalRecordID 1, 2, 3)
-- =========================================================================
INSERT INTO Prescriptions (FK_MedicalRecordID, SpatialInstructor) VALUES (1, 'Take medication exactly at 8 AM every morning.');
INSERT INTO Prescriptions (FK_MedicalRecordID, SpatialInstructor) VALUES (2, 'Shake the syrup well before using.');
INSERT INTO Prescriptions (FK_MedicalRecordID, SpatialInstructor) VALUES (3, 'Apply pain relief gel before taking the pill.');

-- =========================================================================
-- 11. INSERT PRESCRIPTION MEDICATIONS (Linked to Medication IDs)
-- =========================================================================
-- For Prescription 1 (Lisinopril)
INSERT INTO PrescriptionMedications (FK_PrescriptionID, FK_MedicationID, Dosage, Frequency, StartDate, EndDate) 
VALUES (1, 6, '10mg', 'Once a day', '2026-06-10', '2026-07-10');

-- For Prescription 2 (Amoxicillin & Paracetamol)
INSERT INTO PrescriptionMedications (FK_PrescriptionID, FK_MedicationID, Dosage, Frequency, StartDate, EndDate) 
VALUES (2, 1, '500mg', 'Three times a day', '2026-06-11', '2026-06-18');
INSERT INTO PrescriptionMedications (FK_PrescriptionID, FK_MedicationID, Dosage, Frequency, StartDate, EndDate) 
VALUES (2, 2, '500mg', 'As needed for fever', '2026-06-11', '2026-06-14');

-- For Prescription 3 (Ibuprofen)
INSERT INTO PrescriptionMedications (FK_PrescriptionID, FK_MedicationID, Dosage, Frequency, StartDate, EndDate) 
VALUES (3, 3, '400mg', 'Twice a day after meals', '2026-06-15', '2026-06-20');

-- =========================================================================
-- 12. INSERT PAYMENTS (Linked to Appointments 1, 2, 8)
-- =========================================================================
INSERT INTO Payments (FK_AppointmentID, PaymentDate, PaymentMethod, NOTES) 
VALUES (1, '2026-06-10', 'Credit Card', 'Transaction successful.');

INSERT INTO Payments (FK_AppointmentID, PaymentDate, PaymentMethod, NOTES) 
VALUES (2, '2026-06-11', 'Cash', 'Paid at the front desk.');

INSERT INTO Payments (FK_AppointmentID, PaymentDate, PaymentMethod, NOTES) 
VALUES (8, '2026-06-15', 'Insurance', 'Co-pay collected.');