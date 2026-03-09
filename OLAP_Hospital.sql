-- Dimension table for customers
create database hos_olap;

use hos_olap;

CREATE TABLE dim_patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    gender VARCHAR(10),
    age INT
);
describe dim_patient;
CREATE TABLE dim_doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(50)
);
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    appointment_date DATE,
    month VARCHAR(20),
    year INT
);
CREATE TABLE fact_appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    date_id INT,
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES dim_patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES dim_doctor(doctor_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);

SELECT d.doctor_name, COUNT(f.patient_id) AS total_patients
FROM fact_appointments f
JOIN dim_doctor d ON f.doctor_id = d.doctor_id
GROUP BY d.doctor_name;