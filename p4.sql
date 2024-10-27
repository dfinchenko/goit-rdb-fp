use pandemic;

SELECT 
    year,
    DATE(CONCAT(year, '-01-01')) as year_start_date,
    CURDATE() as date_now,
    TIMESTAMPDIFF(YEAR, 
                  DATE(CONCAT(year, '-01-01')), 
                  CURDATE()) as years_difference
FROM infectious_cases
GROUP BY year