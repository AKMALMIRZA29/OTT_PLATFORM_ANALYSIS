-- merging --------------------------------------------------------------------------------------------------------


CREATE TABLE amazon_disney_netflix AS
SELECT * FROM amazon_prime
UNION ALL
SELECT * FROM disney_plus
UNION ALL
SELECT * FROM netflix;


select * from amazon_disney_netflix
where show_id = 's1' ;