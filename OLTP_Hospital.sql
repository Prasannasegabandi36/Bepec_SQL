CREATE TABLE hospital (
    hospital_id INT PRIMARY KEY,
    hospital_name VARCHAR(100),
    location VARCHAR(100),
    phone VARCHAR(15)
);
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    phone VARCHAR(15),
    hospital_id INT,
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)
);
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(50),
    hospital_id INT,
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)
);
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    diagnosis VARCHAR(200),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
INSERT INTO hospital VALUES
(1,'City Hospital','Hyderabad','9876543210');

INSERT INTO patients VALUES
(101,'Ravi Kumar','Male',23,'9123456789',1),
(102,'Sita Reddy','Female',25,'9234567890',1);

INSERT INTO doctors VALUES
(201,'Dr. Sharma','Cardiology',1),
(202,'Dr. Mehta','Neurology',1);

INSERT INTO appointments VALUES
(301,101,201,'2026-03-10','Heart Checkup'),
(302,102,202,'2026-03-11','Migraine Treatment');