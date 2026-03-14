-- Q1 Average Screen Time by Occupation

SELECT
    occupation,
    AVG(daily_screen_time_hours) AS avg_screen_time
FROM sleep_mobile_stress_dataset 
GROUP BY occupation
ORDER BY avg_screen_time DESC;


-- Q2 Top 5 Occupations with Highest Stress

SELECT
    occupation,
    AVG(stress_level) AS avg_stress
FROM sleep_mobile_stress_dataset 
GROUP BY occupation
ORDER BY avg_stress DESC
LIMIT 5;


-- Q3 Users With Above Average Screen Time

SELECT
    user_id,
    daily_screen_time_hours
FROM sleep_mobile_stress_dataset 
WHERE daily_screen_time_hours >
      (SELECT AVG(daily_screen_time_hours)
       FROM sleep_mobile_stress_dataset);


-- Q4 Screen Time Category vs Average Sleep

SELECT
CASE
    WHEN "daily_screen_time_hours" < 3 THEN 'Low Screen Time'
    WHEN "daily_screen_time_hours" BETWEEN 3 AND 6 THEN 'Moderate Screen Time'
    ELSE 'High Screen Time'
END AS screen_time_category,

AVG("sleep_duration_hours") AS avg_sleep_duration

FROM sleep_mobile_stress_dataset
GROUP BY screen_time_category;


-- Q5 Top 10 Most Stressed Users

SELECT
    user_id,
    stress_level
FROM sleep_mobile_stress_dataset 
ORDER BY stress_level DESC
LIMIT 10;


-- Q6 High Screen Time and Low Sleep Users

SELECT
    user_id,
    daily_screen_time_hours,
    sleep_duration_hours
FROM sleep_mobile_stress_dataset 
WHERE daily_screen_time_hours > 6
AND sleep_duration_hours < 6;


-- Q7 Average Sleep Duration by Gender

SELECT
    gender,
    AVG(sleep_duration_hours) AS avg_sleep_duration
FROM sleep_mobile_stress_dataset 
GROUP BY gender;



-- Q8 Phone Usage Before Sleep vs Sleep Quality

SELECT
CASE
    WHEN phone_usage_before_sleep_minutes < 30 THEN 'Low Phone Use'
    WHEN phone_usage_before_sleep_minutes BETWEEN 30 AND 60 THEN 'Moderate Phone Use'
    ELSE 'High Phone Use'
END AS phone_usage_category,

AVG(sleep_quality_score) AS avg_sleep_quality

FROM sleep_mobile_stress_dataset
GROUP BY phone_usage_category;



-- Q9 Most Physically Active Occupations

SELECT
    occupation,
    AVG(physical_activity_minutes) AS avg_activity_minutes
FROM sleep_mobile_stress_dataset 
GROUP BY occupation
ORDER BY avg_activity_minutes DESC;



-- Q10 Physical Activity Level vs Stress

SELECT
CASE
    WHEN physical_activity_minutes < 30 THEN 'Low Activity'
    WHEN physical_activity_minutes BETWEEN 30 AND 60 THEN 'Moderate Activity'
    ELSE 'High Activity'
END AS activity_level,

AVG(stress_level) AS avg_stress

FROM sleep_mobile_stress_dataset
GROUP BY activity_level
ORDER BY avg_stress DESC;
