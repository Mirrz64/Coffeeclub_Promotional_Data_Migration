-- Demographics

ALTER TABLE customers
ADD COLUMN income_bucket TEXT,
ADD COLUMN age_group TEXT;

UPDATE customers
SET income_bucket =
	CASE
		WHEN income > 80000 THEN 'High Earner'
		WHEN income > 40000 THEN 'Average Earner'
		ELSE 'Low Earner'
	END;

UPDATE customers
SET age_group =
	CASE
		WHEN age > 75 THEN 'Older seniors'
		WHEN age BETWEEN 60 AND 75 THEN 'Seniors'
		WHEN age BETWEEN 45 AND 59 THEN 'Late Mid Age'
		WHEN age BETWEEN 30 AND 44 THEN 'Early Mid Age'
		ELSE 'Young Adults'
	END;
