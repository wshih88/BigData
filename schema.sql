CREATE TABLE review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

-- Customer table for first data set
CREATE TABLE customers (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT
);


SELECT * FROM vine_table;

SELECT *
FROM vine_table
WHERE vine = 'N';

SELECT *
FROM vine_table
WHERE vine = 'Y';

SELECT COUNT (review_id)
INTO review_count_N
FROM vine_table
WHERE vine = 'N';
-- N's 1781706

SELECT COUNT (review_id)
INTO review_count_Y
FROM vine_table
WHERE vine = 'Y';
-- Y's 4291

SELECT ROUND(AVG (helpful_votes), 2)
INTO avg_helpful_votes_n
FROM vine_table
WHERE vine = 'N';

SELECT ROUND(AVG(helpful_votes), 2) 
INTO avg_helpful_votes_y
FROM vine_table
WHERE vine = 'Y';

SELECT COUNT (star_rating)
INTO five_star_n
FROM vine_table
WHERE vine = 'N' AND star_rating = '5';

SELECT COUNT (star_rating)
INTO five_star_y
FROM vine_table
WHERE vine = 'Y' AND star_rating = '5';

--Percent Five-Star
SELECT COUNT (star_rating)
INTO five_star_y
FROM vine_table
WHERE vine = 'Y' AND star_rating = '5';

SELECT ROUND(AVG (star_rating), 2)
INTO avg_star_rating_n
FROM vine_table
WHERE vine = 'N';

SELECT ROUND(AVG (star_rating), 2)
INTO avg_star_rating_y
FROM vine_table
WHERE vine = 'Y';

ALTER TABLE avg_helpful_votes_n RENAME COLUMN mean to Avg_HV_N;
ALTER TABLE avg_helpful_votes_y RENAME COLUMN round to Avg_HV_Y;
ALTER TABLE avg_star_rating_n RENAME COLUMN round to Avg_Star_N;
ALTER TABLE avg_star_rating_y RENAME COLUMN round to Avg_Star_Y;
ALTER TABLE five_star_n RENAME COLUMN count to FiveStar_Count_N;
ALTER TABLE five_star_y RENAME COLUMN count to FiveStar_Count_Y;
ALTER TABLE review_count_n RENAME COLUMN review_count_n to Rev_Count_N;
ALTER TABLE review_count_y RENAME COLUMN count to Rev_Count_Y;


SELECT  rcn.rev_count_n, 
		rcy.Rev_Count_Y, 
		ahvn.avg_hv_n,
		ahvy.avg_hv_y, 
		asrn.avg_star_n, 
		asry.avg_star_y, 
		fsn.fivestar_count_n, 
		fsy.fivestar_count_y
INTO Summary
FROM review_count_n as rcn,
	 review_count_y as rcy,
	 avg_helpful_votes_n as ahvn,
	 avg_helpful_votes_y as ahvy,
	 avg_star_rating_n as asrn,
	 avg_star_rating_y as asry,
	 five_star_n as fsn,
	 five_star_y as fsy;

SELECT*FROM summary




--DROP TABLE avg_helpful_votes_
