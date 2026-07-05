# Karate Club Database Management System
---

## Project Overview

This project involves designing and implementing a relational database for a Karate Club. 
The goal is to build a structured system that manages members, instructors, dynamic training allocations, strict belt rank promotion records, and financial operations, ensuring absolute data integrity and efficient business reporting.

---

## Requirements

The database was built to meet the following functional requirements:

- **Persons, Members & Instructors:** Implement an OOP-like table inheritance model separating core personal profiles from specific member attributes (birth dates) and instructor tracking.
- **Contact Channels:** Support flexible multi-entry communication layers via separate tables for emails, phone numbers, and physical addresses to accommodate family accounts sharing resources.
- **Belt Rank System:** Maintain a fixed progression of 17 belt ranks (from White Belt up to Black Belt 10th Dan), each enforced with unique testing fees.
- **Subscription Management:** Log member subscription histories, tying them to structured membership plans (Monthly Regular, Quarterly Premium, Half-Yearly VIP, Annual Elite).
- **Belt Rank Tests:** Log dynamic grading test sessions, linking the evaluated member, the testing instructor, the targeted belt rank, and the absolute session outcome (Pass/Fail).
- **Financial Enforcement:** Maintain high-integrity transaction records where each paid amount and method is uniquely mapped (1:1) to individual subscriptions or belt test records to completely eliminate duplicate billing vulnerabilities.

---

## Database Schema

- `schema.sql`: Contains the production DDL statements to create database entities and define cascading integrity constraints.
- `DataPopulation.sql`: Contains the comprehensive initial seeding script injecting 50+ fully coordinated relational records for integration testing.
- `Queries.sql`: Features 15 advanced data intelligence queries targeting operational KPIs, business logic validation, and financial reporting.

---

## Technologies Used

- SQL (SQL Server).
- Database Modeling (Conceptual ERD & Physical Schema).