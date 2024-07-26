--table creation for amazon_prime

CREATE TABLE amazon_prime (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(50),
    title VARCHAR(255),
    director TEXT,
    cast_a TEXT,
    country VARCHAR(250),
    month_added varchar(20),
	year_added int,
    release_year INT,
    rating VARCHAR(50),
    duration VARCHAR(50),
    genre VARCHAR(100),
    description TEXT
	 
);

SELECT * FROM amazon_prime;

 -- data cleaning

--1.duplicate values 2. null values 3. trimmimg 
 
 --DUPLICATE VALUES

SELECT show_id, COUNT(*) AS duplicate_count
FROM netflix
GROUP BY show_id
HAVING COUNT(*) > 1;

-------------------------------------------------------------------------




----------------------------------------------------------------------------------------------------------

--handling null values

SELECT COUNT(*) FILTER (WHERE show_id IS NULL) as showid_nulls,
COUNT(*) FILTER (WHERE type IS NULL) as type_nulls,
COUNT(*) FILTER (WHERE title IS NULL) as title_nulls,
COUNT(*) FILTER (WHERE director IS NULL) as director_nulls,
COUNT(*) FILTER (WHERE cast_a IS NULL) as cast_nulls,
COUNT(*) FILTER (WHERE country IS NULL) as country_nulls,
COUNT(*) FILTER (WHERE month_added IS NULL) as month_added_nulls,
COUNT(*) FILTER (WHERE year_added IS NULL) as year_added_nulls,
COUNT(*) FILTER (WHERE release_year IS NULL) as release_year_nulls,
COUNT(*) FILTER (WHERE rating IS NULL) as rating_nulls,
COUNT(*) FILTER (WHERE duration IS NULL) as duration_nulls,
COUNT(*) FILTER (WHERE genre IS NULL) as genre_in_nulls,
COUNT(*) FILTER (WHERE description IS NULL) as description_nulls
FROM amazon_prime;

-- imputation method

UPDATE amazon_prime
SET director = 'Not Specified'
WHERE director IS NULL;

UPDATE amazon_prime
SET cast_a = 'Not Specified'
WHERE cast_a IS NULL;

UPDATE amazon_prime
SET country = 'Not Specified'
WHERE country IS NULL;

UPDATE amazon_prime
SET month_added = 'Not Specified'
WHERE month_added IS NULL;

UPDATE amazon_prime
SET year_added = null
WHERE year_added IS NULL;

UPDATE amazon_prime
SET rating = 'Not Specified'
WHERE rating IS NULL;

------------------------------------------------------------------------------------
-----ADD A COLUMN ott_platform, this will help to analyse the fetched data is belongs to which ott_platform or table

ALTER TABLE amazon_prime
ADD COLUMN ott_platform VARCHAR(50);

UPDATE amazon_prime
SET ott_platform = 'amazon_prime';


select * from amazon_prime;

-- TO EXPORT THE FILE

COPY public."amazon_prime" TO 'C:\Users\akmal mirza\Desktop\PROJECT\DUMMY\sql\sql reluts\amazon_result.csv' DELIMITER ',' CSV HEADER;

-------------end


