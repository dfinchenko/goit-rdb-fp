use pandemic;

SELECT 
    c.country_name,
    c.country_code,
    AVG(i_c.Number_rabies) as avg_rabies,
    MIN(i_c.Number_rabies) as min_rabies,
    MAX(i_c.Number_rabies) as max_rabies,
    SUM(i_c.Number_rabies) as total_rabies
FROM countries c
JOIN infectious_cases i_c ON c.country_id = i_c.country_id
WHERE i_c.Number_rabies IS NOT NULL 
GROUP BY c.country_name, c.country_code
ORDER BY avg_rabies DESC
LIMIT 10;