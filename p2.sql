use pandemic;

CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) NOT NULL,
    country_code VARCHAR(50) NOT NULL,
    UNIQUE (country_name, country_code)
);

ALTER TABLE infectious_cases
ADD COLUMN country_id INT AFTER Entity,
ADD FOREIGN KEY (country_id) REFERENCES countries(country_id);

INSERT INTO countries (country_name, country_code)
SELECT DISTINCT Entity, Code
FROM infectious_cases
WHERE Entity IS NOT NULL;

UPDATE infectious_cases i_c
JOIN countries c ON i_c.Entity = c.country_name AND i_c.Code = c.country_code
SET i_c.country_id = c.country_id
WHERE i_c.Entity IS NOT NULL;

ALTER TABLE infectious_cases
DROP COLUMN Entity,
DROP COLUMN Code;