USE pandemic;

DROP FUNCTION IF EXISTS CalculateDiffYears;

DELIMITER //

CREATE FUNCTION calculate_diff_years(input_year INT)
RETURNS INT
DETERMINISTIC
BEGIN
   RETURN TIMESTAMPDIFF(
       YEAR,
       DATE(CONCAT(input_year, '-01-01')),
       CURDATE()
   );
END //

DELIMITER ;

SELECT 
    year,
    DATE(CONCAT(year, '-01-01')) as year_start_date,
    CURDATE() as date_now,
    calculate_diff_years(year) as years_diff
FROM infectious_cases
GROUP BY year
ORDER BY year DESC;