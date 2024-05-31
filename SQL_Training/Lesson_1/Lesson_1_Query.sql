#Task 1
alter table user_details
drop column status;

select * from user_details;

#Task 2a
#top_names is an array of 5 most common names
with top_names as (
SELECT first_name, COUNT(*) AS name_count
FROM user_details
GROUP BY first_name
ORDER BY name_count DESC
LIMIT 5)
select * from user_details where first_name in (select first_name from top_names);

#Task 2b
select * from user_details; #So we can export it

#Task 3
SELECT gender,
       COUNT(*) AS total_users,
       SUM(CASE WHEN username REGEXP '[4]' THEN 1 ELSE 0 END) AS users_with_number_six,
       SUM(CASE WHEN username REGEXP '[4]' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS percentage_with_number_six
FROM user_details
GROUP BY gender;
#22% of females use the digit 4 in their usernames
#17% of males use the digit 4 in their usernames 
#AI conclusion - if you use the digit 4 in your username, you are 22/39 a female and 17/39 a male.


