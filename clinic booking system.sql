-- Clinic Booking System SQL Schema
-- Author: [Your Name]
-- Date: [Insert Date]
-- Description: A relational schema for managing a clinic's patients, doctors, appointments, and visit records.

-- Drop tables if they exist to allow clean re-creation
DROP TABLE IF EXISTS Visit, Appointment, Doctor_Specialization, Specialization, Doctor, Patient;

-- -------------------------------
-- 1. Patient Table
-- -------------------------------
CREATE TABLE Patient (
    patient_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique patient identifier
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    address TEXT
);

-- -------------------------------
-- 2. Doctor Table
-- -------------------------------
CREATE TABLE Doctor (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique doctor identifier
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    hire_date DATE NOT NULL
);

-- -------------------------------
-- 3. Specialization Table
-- -------------------------------
CREATE TABLE Specialization (
    specialization_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE, -- e.g., 'Cardiology', 'Pediatrics'
    description TEXT
);

-- -------------------------------
-- 4. Doctor_Specialization (M:M)
-- A doctor can have multiple specializations, and one specialization can belong to many doctors.
-- -------------------------------
CREATE TABLE Doctor_Specialization (
    doctor_id INT,
    specialization_id INT,
    PRIMARY KEY (doctor_id, specialization_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (specialization_id) REFERENCES Specialization(specialization_id) ON DELETE CASCADE
);

-- -------------------------------
-- 5. Appointment Table
-- A patient books an appointment with a doctor
-- -------------------------------
CREATE TABLE Appointment (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE
);

-- -------------------------------
-- 6. Visit Table
-- Records after a completed appointment
-- -------------------------------
CREATE TABLE Visit (
    visit_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE NOT NULL, -- One visit per appointment (1:1)
    visit_date DATETIME NOT NULL,
    diagnosis TEXT,
    prescription TEXT,
    notes TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id) ON DELETE CASCADE
);
