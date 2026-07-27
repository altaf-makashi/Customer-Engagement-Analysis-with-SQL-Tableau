use 365_database;
WITH monthly_engagement AS (
    SELECT 
        DATE_FORMAT(date_watched, '%Y-%m') AS yearMonth,
        COUNT(DISTINCT student_id) AS active_students,
        SUM(minutes_watched) AS total_minutes_watched,
        ROUND(SUM(minutes_watched) / COUNT(DISTINCT student_id), 2) AS avg_minutes_per_active_student
    FROM 365_student_learning
    GROUP BY DATE_FORMAT(date_watched, '%Y-%m')
)
SELECT 
    yearMonth,
    active_students,
    total_minutes_watched,
    avg_minutes_per_active_student,
    LAG(total_minutes_watched) OVER (ORDER BY yearMonth) AS prev_month_minutes,
    ROUND(
        (total_minutes_watched - LAG(total_minutes_watched) OVER (ORDER BY yearMonth)) * 100.0 / 
        NULLIF(LAG(total_minutes_watched) OVER (ORDER BY yearMonth), 0), 
        2
    ) AS mom_growth_pct
FROM monthly_engagement
ORDER BY yearMonth;