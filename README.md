# 🏥 Clinic Booking System – MySQL Database Project

## 📋 Project Title
**Clinic Booking and Visit Management System (CBVMS)**

---

## 📌 Project Description

The **Clinic Booking and Visit Management System (CBVMS)** is a MySQL-based relational database system designed to manage operations in a clinic or small hospital environment. This system helps administrators, staff, and healthcare professionals to:

- Register patients and doctors
- Assign specializations to doctors
- Book appointments between patients and doctors
- Track visit history, diagnoses, and prescriptions
- Maintain clean and efficient data integrity using constraints and relationships

The database is structured to reflect a real-world clinic's workflow, ensuring efficient storage, quick retrieval, and reliable management of clinical data.

---

## 🧰 Technologies Used

- **Database:** MySQL 8.0+
- **Language:** SQL
- **Tool (for ERD):** dbdiagram.io / MySQL Workbench / DrawSQL / Lucidchart (any can be used)
- **Platform Compatibility:** Localhost (XAMPP, MAMP, WAMP) or Cloud (e.g., PlanetScale, AWS RDS)

---

## ⚙️ How to Set Up & Run This Project

### 🔸 Step 1: Install MySQL
Ensure MySQL is installed and running on your system.

- Download from: https://dev.mysql.com/downloads/mysql/

  Import the .sql Schema File
You can import the provided SQL file (e.g., clinic_booking_system.sql) using one of the following methods:

## 💻 Using MySQL Command Line

mysql -u root -p clinic_booking_system < path/to/clinic_booking_system.sql

## 🖥️ Using MySQL Workbench

Open MySQL Workbench.

Connect to your MySQL instance.

Go to File > Open SQL Script and select clinic_booking_system.sql.

Click the ⚡ lightning bolt to execute the script.

## 🛠️ Using phpMyAdmin

Go to http://localhost/phpmyadmin

Create a new database: clinic_booking_system

Click Import and upload the .sql file

Click Go to run the script

## 🧠 Database Structure Overview

Entities:

Patient – Holds patient information

Doctor – Stores doctor records

Specialization – List of medical specializations

Doctor_Specialization – Junction table for many-to-many relationships

Appointment – Tracks scheduled meetings between patients and doctors

Visit – Records what happens during a visit (diagnosis, prescriptions, etc.)

## Relationships:

One-to-Many: A doctor can have many appointments

One-to-Many: A patient can have many appointments

Many-to-Many: A doctor can have multiple specializations and vice versa

One-to-One: Each appointment has exactly one visit record

## 🖼️ Entity-Relationship Diagram (ERD)
![clinic booking database schema](https://github.com/user-attachments/assets/afba12bb-a6fd-4d4c-ad69-94285e6c45a9)

