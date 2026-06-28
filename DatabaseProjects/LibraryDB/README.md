# Library Database Management System
---

## Project Overview

This project involves designing and implementing a relational database for a simple Library Management System. The goal is to build a highly structured, fully normalized, and efficient system to manage books, multiple physical copies, authors, users, reservations, borrowings, and late return penalties while ensuring maximum data integrity.

---

## Folder Structure

Based on the project repository layout, the files are organized as follows:
- **`Diagrams/`**: Contains the visual database models and physical relational schemas.
- **`Schema.sql`**: Contains the complete DDL statements to create the database, tables, and enforce all relational constraints (PKs, FKs, Uniques).
- **`DataPopulation.sql`**: Contains standard SQL scripts to populate all tables with realistic sample data for testing.
- **`Queries.sql`**: Features a comprehensive set of relational search queries, analytical reports, and system statistics.
- **`README.md`**: Project documentation (this file).

---

## Requirements

The database schema was engineered to successfully satisfy the following core functional requirements:

- **Book & Copy Management:** Manage book definitions (Title, ISBN, Genre) alongside physical inventory tracking (`Book Copies`) with exact publication details, availability states (Available/Checked Out), and damage control logs.
- **User Management:** Maintain distinct library member accounts including secure tracking of names, flexible contact parameters (multiple phones/emails), and official unique library card IDs.
- **Borrowing & Returns:** Track historical and active lending cycles, accurately recording borrowing dates, strict due dates, and actual physical return timestamps.
- **Holds & Reservations:** Enable advanced booking queues on book copies that are currently checked out, ensuring transactional queue fairness using precise chronological timestamps (`DATETIME`).
- **Fine Management:** Automatically compute daily penalties for late rollbacks or asset damage, keeping tight logs on precise individual balances owed and clear transaction fulfillment statuses (Paid/Pending).

---

## Database Schema Highlights

The system implements advanced physical design practices:
- **Core Normalization:** Separated generic contact matrices (`Emails`, `Phones`) from structural entity actors (`Persons`).
- **Strict Data Integrity:** Enforced complex `UNIQUE` constraints and cascading foreign keys ensuring no orphaned transactions exist.
- **Global Settings Control:** Features a dedicated configurations entity (`Settings`) to cleanly handle global dynamic variables such as standard borrowing duration thresholds and daily tax margins.

---

## Technologies Used

- **RDBMS:** SQL Server.
- **Modeling Tooling:** Physical Relational Schema Design (Crow's Foot Notation ERD).
- **Documentation:** Markdown Scripting.