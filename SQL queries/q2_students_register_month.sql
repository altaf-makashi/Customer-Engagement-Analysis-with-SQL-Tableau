use 365_database;
SELECT 
    DATE_FORMAT(si.date_registered, '%Y-%m') AS registration_month,
    COUNT(DISTINCT si.student_id) AS total_registered,
    COUNT(DISTINCT learned.student_id) AS total_onboarded,
    ROUND(COUNT(DISTINCT learned.student_id) * 100.0 / COUNT(DISTINCT si.student_id), 2) AS pct_onboarded
FROM 365_student_info si
LEFT JOIN (
    SELECT DISTINCT student_id FROM 365_student_learning
) learned ON si.student_id = learned.student_id
GROUP BY registration_month
ORDER BY registration_month;