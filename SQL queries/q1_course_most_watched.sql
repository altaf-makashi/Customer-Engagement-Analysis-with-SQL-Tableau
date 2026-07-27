use 365_database;
SELECT 
    ci.course_title,
    learn.total_students,
    learn.total_minutes_watched,
    rate.avg_rating,
    rate.num_ratings
FROM 365_course_info ci
JOIN (
    SELECT 
        course_id,
        COUNT(DISTINCT student_id) AS total_students,
        SUM(minutes_watched)       AS total_minutes_watched
    FROM 365_student_learning
    GROUP BY course_id
) learn ON ci.course_id = learn.course_id
LEFT JOIN (
    SELECT 
        course_id,
        ROUND(AVG(course_rating), 2) AS avg_rating,
        COUNT(course_rating)         AS num_ratings
    FROM 365_course_ratings
    GROUP BY course_id
) rate ON ci.course_id = rate.course_id
ORDER BY learn.total_minutes_watched DESC;