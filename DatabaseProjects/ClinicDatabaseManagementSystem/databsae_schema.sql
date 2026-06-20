IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Clinic_DB')
	BEGIN
		CREATE DATABASE Clinic_DB;
	END

USE Clinic_DB;

CREATE TABLE Addresses(
	AddressID INT IDENTITY (1,1),
	City NVARCHAR(255) NOT NULL,
	Street NVARCHAR(255) NOT NULL,
	BuildingNumber NVARCHAR(255) NOT NULL,

	CONSTRAINT PK_AddressID PRIMARY KEY (AddressID)
);

CREATE TABLE Persons(
	PersonID INT IDENTITY (1,1),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Gender CHAR(1) NOT NULL,
	DateOfBirth DATE NOT NULL,
	FK_AddressID INT NOT NULL,

	CONSTRAINT PK_Persons_PersonID								PRIMARY KEY (PersonID),
	CONSTRAINT CK_Persons_Gender								CHECK(Gender IN ('M','F')),
	CONSTRAINT FK_Persons_FK_AddressID_Addresses_AddressID		FOREIGN KEY (FK_AddressID) REFERENCES Addresses(AddressID)
);

CREATE TABLE Emails(
	EmailID INT IDENTITY (1,1),
	FK_PersonID INT NOT NULL,
	Email NVARCHAR(255) NOT NULL,

	CONSTRAINT PK_Emails_Email		PRIMARY KEY (EmailID),
	CONSTRAINT FK_Emails_PersonID	FOREIGN KEY (FK_PersonID) REFERENCES Persons(PersonID),
	CONSTRAINT UQ_Emails_Email      UNIQUE (Email)
);

CREATE TABLE Phones(
	PhoneID INT IDENTITY (1,1),
	FK_PersonID INT NOT NULL,
	Phone NVARCHAR(20) NOT NULL,

	CONSTRAINT PK_Phones_PhoneID	PRIMARY KEY (PhoneID),
	CONSTRAINT FK_Phones_PersonID   FOREIGN KEY (FK_PersonID) REFERENCES Persons (PersonID),
	CONSTRAINT UQ_Phones_Phone      UNIQUE (Phone)
);

CREATE TABLE Patients(
	PatientID INT IDENTITY (1,1),
	FK_PersonID INT NOT NULL,

	CONSTRAINT PK_Patients_PatientID	PRIMARY KEY (PatientID),
	CONSTRAINT FK_Patients_PersonID   	FOREIGN KEY (FK_PersonID) REFERENCES Persons(PersonID),
	CONSTRAINT UQ_Patients_FK_PersonID	UNIQUE (FK_PersonID)
);

CREATE TABLE Doctors(
	DoctorID INT IDENTITY (1,1),
	FK_PersonID INT NOT NULL,
	Specialization NVARCHAR(255) NOT NULL,

	CONSTRAINT PK_Doctors_DoctorID PRIMARY KEY (DoctorID),
	CONSTRAINT FK_Doctors_FK_PersonID FOREIGN KEY (FK_PersonID) REFERENCES Persons(PersonID),
	CONSTRAINT UQ_Doctors_FK_PersonID	UNIQUE (FK_PersonID)
);

CREATE TABLE AppointmentStatuses(
	AppointmentStatusID INT IDENTITY (1,1),
	AppointmentStatus NVARCHAR(255) NOT NULL,

	CONSTRAINT PK_AppointmentStatuses_AppointmentStatusID PRIMARY KEY (AppointmentStatusID)
);

CREATE TABLE Appointments(
	AppointmentID INT IDENTITY (1,1),
	FK_DoctorID INT NOT NULL,
	FK_PatientID INT NOT NULL,
	FK_AppointmentStatusID INT NOT NULL,
	AppointmentDate DATE NOT NULL,
	AppointmentTime TIME NOT NULL,

	CONSTRAINT PK_Appointments_AppointmentID	    	PRIMARY KEY (AppointmentID),
	CONSTRAINT FK_Appointments_FK_DoctorID				FOREIGN KEY (FK_DoctorID) REFERENCES Doctors(DoctorID),
	CONSTRAINT FK_Appointments_FK_PatientID			    FOREIGN KEY (FK_PatientID)  REFERENCES Patients(PatientID),
	CONSTRAINT FK_Appointments_FK_AppointmentStatusID	FOREIGN KEY (FK_AppointmentStatusID) REFERENCES AppointmentStatuses(AppointmentStatusID),
);


CREATE TABLE MedicalRecords(
	MedicalRecordID INT IDENTITY (1,1),
	FK_AppointmentID INT NOT NULL,
	Description NVARCHAR(500) NOT NULL,
	Diagnosis NVARCHAR(500) NOT NULL,
	Notes NVARCHAR(500),

	CONSTRAINT PK_MedicalRecords_MedicalRecordID  PRIMARY KEY (MedicalRecordID),
	CONSTRAINT FK_MedicalRecords_FK_AppointmentID FOREIGN KEY (FK_AppointmentID) REFERENCES Appointments(AppointmentID)
);


CREATE TABLE Prescriptions(
	PrescriptionID INT IDENTITY (1,1),
	FK_MedicalRecordID INT NOT NULL,
	SpatialInstructor NVARCHAR(500),

	CONSTRAINT PK_Prescriptions_PrescriptionID		PRIMARY KEY (PrescriptionID),
	CONSTRAINT FK_MedicalRecords_FK_MedicalRecordID	FOREIGN KEY (FK_MedicalRecordID) REFERENCES MedicalRecords(MedicalRecordID)
);

CREATE TABLE Medications(
	MedicationID INT IDENTITY (1,1),
	MedicationName NVARCHAR(255) NOT NULL,
	
	CONSTRAINT PK_Medications_MedicationID PRIMARY KEY (MedicationID)
);

CREATE TABLE PrescriptionMedications(
	PrescriptionMedicationID INT IDENTITY (1,1),
	FK_PrescriptionID INT NOT NULL,
	FK_MedicationID INT NOT NULL,
	Dosage NVARCHAR(255) NOT NULL,
	Frequency NVARCHAR(255) NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,

	CONSTRAINT PK_PrescriptionMedications_PrescriptionMedicationID PRIMARY KEY (PrescriptionMedicationID),
	CONSTRAINT FK_PrescriptionMedications_FK_PrescriptionID		   FOREIGN KEY (FK_PrescriptionID) REFERENCES Prescriptions(PrescriptionID),
	CONSTRAINT FK_PrescriptionMedications_FK_MedicationID			   FOREIGN KEY (FK_MedicationID) REFERENCES Medications(MedicationID)
);

CREATE TABLE Payments(
	PaymentID INT IDENTITY (1,1),
	FK_AppointmentID INT NOT NULL,
	PaymentDate DATE NOT NULL,
	PaymentMethod NVARCHAR(255),
	NOTES NVARCHAR(500),

	CONSTRAINT PK_Payments_PaymentID		PRIMARY KEY (PaymentID),
	CONSTRAINT FK_Payments_FK_AppointmentID FOREIGN KEY (FK_AppointmentID) REFERENCES Appointments(AppointmentID),
	CONSTRAINT UQ_Payments_FK_AppointmentID UNIQUE (FK_AppointmentID)
);
