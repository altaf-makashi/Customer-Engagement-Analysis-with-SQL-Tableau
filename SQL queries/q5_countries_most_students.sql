use 365_database;
SELECT 
    si.student_country AS country,
    
    -- Registrations and Active Viewers
    COUNT(DISTINCT si.student_id) AS registered_students,
    COUNT(DISTINCT sl.student_id) AS active_watching_students,
    
    -- Engagement Aggregation
    COALESCE(SUM(sl.total_minutes), 0) AS total_minutes_watched,
    
    -- Metric 1: Minutes per Registered Student (Overall Yield)
    ROUND(
        COALESCE(SUM(sl.total_minutes), 0) / COUNT(DISTINCT si.student_id), 
        2
    ) AS avg_minutes_per_registered_student,
    
    -- Metric 2: Minutes per Active Student (True Engagement Intensity)
    ROUND(
        COALESCE(SUM(sl.total_minutes), 0) / NULLIF(COUNT(DISTINCT sl.student_id), 0), 
        2
    ) AS avg_minutes_per_active_student

FROM 365_student_info si

-- Pre-aggregate watch minutes per student to prevent join fan-out and timeouts
LEFT JOIN (
    SELECT 
        student_id, 
        SUM(minutes_watched) AS total_minutes
    FROM 365_student_learning
    GROUP BY student_id
) sl ON si.student_id = sl.student_id

-- Filter out nulls or missing country records if any exist
WHERE si.student_country IS NOT NULL AND si.student_country != ''

GROUP BY si.student_country
ORDER BY registered_students DESC;