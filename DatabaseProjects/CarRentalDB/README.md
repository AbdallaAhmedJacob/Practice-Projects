# Car Rental Database Management System
---

## Project Overview

This project involves designing and implementing a highly normalized relational database for a commercial Car Rental system. 
The goal is to build a high-integrity, structured system that seamlessly tracks customer profiles, vehicle fleets, booking lifecycles, single-payment financial transactions, vehicle return metrics, additional fines, and historical maintenance logs while ensuring zero data redundancy.

---

## Requirements

The database was built to meet the following functional and business requirements:

- **Customers:** Manage and track customer profiles including personal details and distinct driver's license numbers.
- **Fuels & Categories:** Provide lookup normalization tables to categorize the fleet by fuel types (Gasoline, Electric, etc.) and vehicle classifications (Sedan, SUV, 4x4, etc.).
- **Vehicles:** Maintain individual vehicle logs (Make, Model, Year, Mileage, Rental Rate, Plate Number) along with a real-time availability flag for rent operations.
- **Maintenance:** Record routine and urgent vehicle inspection details, service dates, and accumulated expenses to monitor fleet operational costs.
- **Vehicle Bookings:** Manage rental agreements linking customers to specific vehicles, tracking initial rental duration, pickup/drop-off stations, and upfront quotes.
- **Rental Transactions:** Enforce a strict single-payment mechanism per booking to manage primary rental dues, tracking payment status and channels.
- **Vehicle Returns:** Close booking cycles by capturing actual return dates, tracking mileage consumption, computing overdue rental days, and evaluating final check notes.
- **Charges:** Handle secondary financial logs by issuing independent multi-item fines or extra fees (e.g., late return penalties, vehicle damage costs) linked directly to the return event.

---

## Database Schema

- `schema.sql`: Contains the optimized DDL statements to construct tables, data types, and primary/foreign key constraints.
- `DataPopulation.sql`: Seeds realistic operational scenarios, tracking full mock transactional workflows from pickup to return.
- `Queries.sql`: Includes 15 business intelligence scripts and advanced management reports covering revenue, fleet wear, and overdue contracts.

---

## Technologies Used

- SQL (Microsoft SQL Server).
- Relational Database Modeling (Conceptual ERD & Physical Schema).
- Data Normalization (Third Normal Form - 3NF).