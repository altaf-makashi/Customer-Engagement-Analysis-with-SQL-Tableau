use 365_databse;
SELECT 
    CASE 
        WHEN sp.student_id IS NOT NULL THEN 'Paying'
        ELSE 'Free'
    END AS student_type,
    
    -- Student Counts
    COUNT(DISTINCT si.student_id) AS total_registered_students,
    COUNT(DISTINCT sl.student_id) AS active_watching_students,
    
    -- Engagement Metrics
    COALESCE(SUM(sl.total_minutes), 0) AS total_minutes_watched,
    
    -- Average 1: Across ALL registrants (Accounts created)
    ROUND(
        COALESCE(SUM(sl.total_minutes), 0) / COUNT(DISTINCT si.student_id), 
        2
    ) AS avg_minutes_per_registered_student,
    
    -- Average 2: Across ACTIVE viewers only (Users who watched >= 1 min)
    ROUND(
        COALESCE(SUM(sl.total_minutes), 0) / NULLIF(COUNT(DISTINCT sl.student_id), 0), 
        2
    ) AS avg_minutes_per_active_student

FROM 365_student_info si

-- Identify paying users via purchase records
LEFT JOIN (
    SELECT DISTINCT student_id 
    FROM 365_student_purchases
) sp ON si.student_id = sp.student_id

-- Pre-aggregate watch minutes per student to optimize query performance
LEFT JOIN (
    SELECT 
        student_id, 
        SUM(minutes_watched) AS total_minutes
    FROM 365_student_learning
    GROUP BY student_id
) sl ON si.student_id = sl.student_id

GROUP BY student_type;