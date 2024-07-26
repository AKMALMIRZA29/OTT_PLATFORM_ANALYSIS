------------disney_plus

CREATE TABLE disney_plus (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(20),
    title VARCHAR(250),
    director VARCHAR(255),
	cast_d TEXT,
    country VARCHAR(255),
    month_added varchar(20),
	year_added int,
    release_year INTEGER,
    rating VARCHAR(10),
    duration VARCHAR(20),
    genre VARCHAR(100),
	description TEXT
);

select * from disney_plus

--DUPLICATE VALUES

SELECT show_id, COUNT(*) AS duplicate_count
FROM disney_plus
GROUP BY show_id
HAVING COUNT(*) > 1;

-------------null values

SELECT COUNT(*) FILTER (WHERE show_id IS NULL) as showid_nulls,
COUNT(*) FILTER (WHERE type IS NULL) as type_nulls,
COUNT(*) FILTER (WHERE title IS NULL) as title_nulls,
COUNT(*) FILTER (WHERE director IS NULL) as director_nulls,
COUNT(*) FILTER (WHERE cast_d IS NULL) as cast_nulls,
COUNT(*) FILTER (WHERE country IS NULL) as country_nulls,
COUNT(*) FILTER (WHERE month_added IS NULL) as month_added_nulls,
COUNT(*) FILTER (WHERE year_added IS NULL) as year_added_nulls,
COUNT(*) FILTER (WHERE rating IS NULL) as rating_nulls,
COUNT(*) FILTER (WHERE duration IS NULL) as duration_nulls,
COUNT(*) FILTER (WHERE genre IS NULL) as genre_nulls,
COUNT(*) FILTER (WHERE description IS NULL) as description_nulls
FROM disney_plus;

-- imputation method

UPDATE disney_plus
SET director = 'Not Specified'
WHERE director IS NULL;

UPDATE disney_plus
SET cast_d = 'Not Specified'
WHERE cast_d IS NULL;

UPDATE disney_plus
SET country = 'Not Specified'
WHERE country IS NULL;

UPDATE disney_plus
SET description = 'Not Specified'
WHERE description IS NULL;

----deletion method


DELETE FROM disney_plus
WHERE month_added IS NULL;

DELETE FROM disney_plus
WHERE year_added IS NULL;

DELETE FROM disney_plus
WHERE rating IS NULL;

----------------------------------------------------------------------------------

-----ADD A COLUMN ott_platform, this will help to analyse the fetched data is belongs to which ott_platform or table

ALTER TABLE disney_plus
ADD COLUMN ott_platform VARCHAR(50);

UPDATE disney_plus
SET ott_platform = 'disney_plus';


select * from netflix;

--TO EXPORT THE FILE

COPY public."netflix" TO 'C:\Users\akmal mirza\Desktop\PROJECT\DUMMY\sql\sql reluts\disney_result.csv' DELIMITER ',' CSV HEADER;



