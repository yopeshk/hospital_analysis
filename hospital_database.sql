CREATE DATABASE project;
USE project;
SHOW TABLES;

DESCRIBE patients;
DESCRIBE diseases;
DESCRIBE admissions;

SELECT COUNT(*) AS total_patients FROM patients;
SELECT COUNT(*) AS total_diseases FROM diseases;
SELECT COUNT(*) AS total_admissions FROM admissions;



SELECT * FROM patients LIMIT 5;

SELECT * FROM diseases LIMIT 5;

SELECT * FROM admissions LIMIT 5;


SELECT 
    a.admission_id,
    p.patient_id,
    p.gender,
    d.disease_name,
    a.admission_type
FROM admissions a
JOIN patients p ON a.patient_id = p.patient_id
JOIN diseases d ON a.disease_id = d.disease_id
LIMIT 10;

SELECT 
    p.patient_id,
    p.city,
    COUNT(a.admission_id) AS total_admissions
FROM admissions a
JOIN patients p ON a.patient_id = p.patient_id
GROUP BY p.patient_id, p.city
HAVING total_admissions > 1
ORDER BY total_admissions DESC;


-- peak seasons/showing which months see the highest volume of patient influx.
SELECT 
    DATE_FORMAT(admission_date, '%Y-%m') AS admission_month,
    COUNT(admission_id) AS total_admissions
FROM admissions
GROUP BY admission_month
ORDER BY admission_month ASC;



	