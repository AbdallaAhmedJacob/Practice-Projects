# Online Store Database Management System
---

## Project Overview

This project involves designing and implementing a relational database for a comprehensive E-Commerce Online Store Management System. The goal is to build a highly structured, fully normalized, and efficient database engine to manage products, customers, order lifecycles, structured multi-product baskets, secure payment logs, dynamic shipping workflows, and product reviews while ensuring maximum relational data integrity.

---

## Folder Structure

Based on the project repository layout, the files are organized as follows:
- **`Diagrams/`**: Contains the visual database models (ERD) and physical relational schemas.
- **`Schema.sql`**: Contains the complete DDL statements to create the database, tables, and enforce all relational constraints (PKs, FKs, Identity Seeds).
- **`DataPopulation.sql`**: Contains standard SQL scripts to populate all tables with realistic operational sample data for workflow testing.
- **`Queries.sql`**: Features a comprehensive set of business intelligence lookup queries, analytical reports, and system performance statistics.
- **`README.md`**: Project documentation (this file).

---

## Requirements

The database schema was engineered to successfully satisfy the following core functional requirements:

- **Product & Inventory Management:** Manage diverse product catalog definitions (Name, Description, Pricing, Images) alongside real-time inventory quantity adjustments and absolute stock availability states.
- **Customer Profiles:** Maintain distinct customer accounts including secure structural tracking of personal names, delivery addresses, multi-parameter contact details, and core user credentials.
- **Advanced Order Architecture:** Process dynamic customer shopping baskets via a specialized bridge structure (`Order Items`) capable of hosting multiple distinct products per single checkout transaction with historical snapshot pricing.
- **Workflow State Normalization:** Enforce centralized, rigid configuration pools for transactional states (`Order Statuses`, `Shipping Statuses`) to guarantee system-wide data normalization and prevent text redundancy.
- **Financial & Shipping Tracking:** Log distinct transactional monetary amounts with secure payment method signatures while tracking active carrier details, global tracking numbers, estimated timelines, and actual delivery rollbacks.
- **Feedback & Review Metrics:** Enable customers to submit product reviews, preserving text records, chronological timestamps, and numerical rating scores to drive recommendation algorithms.

---

## Database Schema Highlights

The system implements advanced physical design practices:
- **Third Normal Form (3NF) Compliance:** Resolved the Many-to-Many relationship between Orders and Products by introducing the `Order Items` intersection table to eliminate data redundancy.
- **Centralized Lookup Pools:** Isolated changing business states into discrete relational entities (`OrderStatuses`, `ShippingStatuses`) mapped via high-performance Integer Keys.
- **Strict Data Integrity:** Enforced explicit primary keys (`PK`), robust identity generation (`IDENTITY(1,1)`), and explicit constraint references (`FOREIGN KEY`) ensuring no orphaned transactions exist.
- **Precise Financial Typing:** Utilized high-precision numeric types (`DECIMAL(10,2)`) for money-related fields to completely avoid rounding errors inherent in float types.

---

## Technologies Used

- **RDBMS:** Microsoft SQL Server.
- **Modeling Tooling:** Crow's Foot Notation Entity Relationship Diagram (ERD).
- **Documentation:** Markdown Scripting.