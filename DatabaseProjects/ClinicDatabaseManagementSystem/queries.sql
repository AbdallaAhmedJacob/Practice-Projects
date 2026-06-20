USE Clinic_DB;

-- =========================================================================
-- LEVEL 1: BASIC QUERIES
-- =========================================================================

-- 1. Get all doctors and their specializations
SELECT DoctorID, Specialization 
FROM Doctors;

-- 2. List all upcoming or past appointments ordered by date and time
SELECT AppointmentID, AppointmentDate, AppointmentTime 
FROM Appointments
ORDER BY AppointmentDate DESC, AppointmentTime ASC;

-- 3. Find all medications available in the clinic
SELECT MedicationID, MedicationName 
FROM Medications;

-- 4. List all appointments that were 'Canceled' or resulted in a 'No Show'
-- (Assuming Status 4 is Canceled and 6 is No Show)
SELECT AppointmentID, FK_PatientID, FK_DoctorID, AppointmentDate
FROM Appointments
WHERE FK_AppointmentStatusID IN (4, 6);


-- =========================================================================
-- LEVEL 2: JOIN QUERIES
-- =========================================================================

-- 5. Get full details of all Doctors (Name, Gender, and Specialization)
SELECT 
    d.DoctorID, 
    p.FirstName, 
    p.LastName, 
    p.Gender, 
    d.Specialization
FROM Doctors d
JOIN Persons p ON d.FK_PersonID = p.PersonID;

-- 6. Get full details of all Patients (Name, Date of Birth, and Contact Info)
SELECT 
    pa.PatientID, 
    pe.FirstName, 
    pe.LastName, 
    pe.DateOfBirth, 
    ph.Phone, 
    e.Email
FROM Patients pa
JOIN Persons pe ON pa.FK_PersonID = pe.PersonID
LEFT JOIN Phones ph ON pe.PersonID = ph.FK_PersonID
LEFT JOIN Emails e ON pe.PersonID = e.FK_PersonID;

-- 7. View all Appointments with Doctor Name, Patient Name, and Status Description
SELECT 
    a.AppointmentID,
    p_doc.FirstName AS DoctorFirstName,
    p_doc.LastName AS DoctorLastName,
    p_pat.FirstName AS PatientFirstName,
    p_pat.LastName AS PatientLastName,
    a.AppointmentDate,
    a.AppointmentTime,
    s.AppointmentStatus AS Status
FROM Appointments a
JOIN Doctors d ON a.FK_DoctorID = d.DoctorID
JOIN Persons p_doc ON d.FK_PersonID = p_doc.PersonID
JOIN Patients pat ON a.FK_PatientID = pat.PatientID
JOIN Persons p_pat ON pat.FK_PersonID = p_pat.PersonID
JOIN AppointmentStatuses s ON a.FK_AppointmentStatusID = s.AppointmentStatusID;


-- =========================================================================
-- LEVEL 3: CLINICAL & MEDICAL RECORDS
-- =========================================================================

-- 8. Get all Medical Records with Diagnosis along with Patient and Doctor Names
SELECT 
    m.MedicalRecordID,
    p_pat.FirstName AS PatientName,
    p_doc.FirstName AS DoctorName,
    m.Diagnosis,
    m.Description AS Symptoms,
    m.Notes
FROM MedicalRecords m
JOIN Appointments a ON m.FK_AppointmentID = a.AppointmentID
JOIN Patients pat ON a.FK_PatientID = pat.PatientID
JOIN Persons p_pat ON pat.FK_PersonID = p_pat.PersonID
JOIN Doctors d ON a.FK_DoctorID = d.DoctorID
JOIN Persons p_doc ON d.FK_PersonID = p_doc.PersonID;

-- 9. Get full Prescription details (Patient Name, Prescribed Medications, Dosage, and Duration)
SELECT 
    p_pat.FirstName AS PatientName,
    m.MedicationName,
    pm.Dosage,
    pm.Frequency,
    pm.StartDate,
    pm.EndDate
FROM PrescriptionMedications pm
JOIN Medications m ON pm.FK_MedicationID = m.MedicationID
JOIN Prescriptions pr ON pm.FK_PrescriptionID = pr.PrescriptionID
JOIN MedicalRecords mr ON pr.FK_MedicalRecordID = mr.MedicalRecordID
JOIN Appointments a ON mr.FK_AppointmentID = a.AppointmentID
JOIN Patients pat ON a.FK_PatientID = pat.PatientID
JOIN Persons p_pat ON pat.FK_PersonID = p_pat.PersonID;


-- =========================================================================
-- LEVEL 4: AGGREGATION & STATISTICS 
-- =========================================================================

-- 10. Count how many appointments each doctor has
SELECT 
    p.FirstName AS DoctorFirstName, 
    p.LastName AS DoctorLastName, 
    COUNT(a.AppointmentID) AS TotalAppointments
FROM Appointments a
JOIN Doctors d ON a.FK_DoctorID = d.DoctorID
JOIN Persons p ON d.FK_PersonID = p.PersonID
GROUP BY p.FirstName, p.LastName;

-- 11. Count appointments grouped by Status (e.g., how many Pending, Completed, etc.)
SELECT 
    s.AppointmentStatus, 
    COUNT(a.AppointmentID) AS TotalCount
FROM Appointments a
JOIN AppointmentStatuses s ON a.FK_AppointmentStatusID = s.AppointmentStatusID
GROUP BY s.AppointmentStatus;

-- 12. View total payments collected per payment method
SELECT 
    PaymentMethod, 
    COUNT(PaymentID) AS TotalTransactions
FROM Payments
GROUP BY PaymentMethod;