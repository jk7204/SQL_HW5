# SQL_HW5
DB Browser and Google Colab

CS 0479 Sections 002 and 003
Assignment #5
Instructor: Matt Zeidenberg


1. Consider the list of JSON documents in MongoDB’s bios example collection. Use that data to create a set of related tables in SQLite. The main table computer_scientists should contain id, last, first, birth, death. There should also be tables for contribs and awards. The computer_scientists table should be linked to the other two tables via one-to-many relationships, each of which should be represented in another table, for a total of five tables. Enforce foreign key constraints by adding them to your “CREATE TABLE” statements. What is the average number of awards per scientist? You can use any method you want to parse the JSON and insert it into SQLite (MongoDB queries or just pure Python, for instance).


The remaining questions are based on the ReadyChef database (readychef.db) which has been distributed along with this assignment. It represents data from a hypothetical e-commerce website that sells ready-to-eat meals. There are five tables in this database:

• events: contains actions taken by users with respect to meals: can be either bought, like, or share

• meals: contains the meal ids, meal types, date, and price. (Meals appear on the site on particular dates).

• referrals: contains pairs of user ids representing what users have referred other users to the site

• users: contains user ids, dates they joined the site, and what advertising campaign brought them to the site

• visits: contains dates and user ids representing user visits to the site.

2. What is the user id of the user that visited the site most frequently?

3. What is the average cost of Chinese meals in the meals table, rounded to two decimal places?

4. What user bought the most meals?

5. Quite a few users are tied for the most other users referred. For these top referrers, what is the number of other users referred?

6. What type of meal was most frequently shared by the user who bought the most meals?

7. Using a window function, assign a quintile from 1 to 5 to each meal based on the price with quintile 1 having the highest price and quintile 5 the lowest. What is the lowest price in quintile 3?

8. Using a window function, create a view that has the following columns: userid, current_order_date, current_meal_type, and next_meal_type. This should be based on partitioning by user and ordering by date for the meals each user bought. For each date that the user bought a meal, the next_meal_type should contain the type of the next meal that they bought, chronologically. Query this view to find the types of the first three meals bought by user 2.

9. Find the average price for each type of meal using a window function and add it to the table without reducing the number of meals. Then find the difference in price between each meal and the average of that type. What is this value for the cheapest Italian meal (that is, how much less is it than the average)?

