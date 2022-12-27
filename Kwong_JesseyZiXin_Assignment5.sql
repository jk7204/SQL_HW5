-- Question 2
SELECT DISTINCT userid, COUNT(*) AS Num_Visit
FROM visits
GROUP BY userid
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Answer: The user_id that has the most number of visits is user 50 with 363 visits.

-- Question 3
SELECT ROUND(CAST(total_price as float)/total_count, 2)  AS avg_price
FROM (SELECT	
(SELECT count(type) FROM meals WHERE type == 'chinese') AS total_count,
(SELECT sum(price) FROM meals WHERE type == 'chinese') AS total_price);

-- Answer: Average cost for a Chinese meal is 9.52.

-- Question 4
SELECT userid, count(*) AS Num_Purchase
FROM events
WHERE event == 'bought'
GROUP BY userid
ORDER BY count(*) DESC
LIMIT 1;

-- Answer: The user_id that bought the most meal is user 129.

-- Question 5
SELECT DISTINCT count(referred_by) AS Num_Referred
From referrals
GROUP BY referred_by
ORDER BY count(referred_by) DESC
LIMIT 1;

-- Answer: For these top referrers,6 is the number of other users referred.
 
-- Question 6
SELECT type, COUNT(*) AS Max_Shared
FROM meals
WHERE meal_id IN(SELECT meal_id FROM events WHERE userid == 129 AND event == 'share');

-- Answer:  Type of meal was most frequently shared by the user who bought the most meals is french meal. 

-- Question 7
SELECT quintile, 
NTH_VALUE(price,1) OVER (PARTITION BY quintile ORDER BY price ASC) lowest_price
FROM(
SELECT meal_id, price,
NTILE( 5 ) OVER (ORDER BY price DESC) quintile
FROM meals) 
WHERE quintile == 3
LIMIT 1;

-- Answer: The lowest price in quintile 3 is 10

-- Question 8
SELECT userid,  current_meal_type, current_order_date,event
FROM (
SELECT userid, events.meal_id, meals.type as current_meal_type, events.dt AS current_order_date, events.event as event,
LAG ( meals.type,-1,2) OVER ( PARTITION BY userid ORDER BY events.dt ) next_meal_type
FROM events
INNER JOIN meals ON events.meal_id = meals.meal_id) 
WHERE userid == 2 AND event == 'bought'
LIMIT 3;

-- Answer: Types of the first three meals bought by user 2 is Chinese, French and Italian.

-- Question 9
WITH avg_price AS (
SELECT DISTINCT AVG( price) OVER ( PARTITION BY type ORDER BY type ASC ) avg_price FROM meals)
UPDATE  meals SET avg_price = (avg_price)

select  (price-avg_price) AS price_diff
from (select m.*, avg(price) over (partition by type) as avg_price
      from meals m) m
where type == "italian"
order by price_diff ASC
limit 1 

-- Answer: the difference in price between each meal and the average of that type for itallian is -2.51871657754011