drop table counts;

#Count number of male & female for each individual unique name
create table counts (
	first_name varchar (200),
    male_count int, 
    female_count int
    );
    
insert into counts (first_name, male_count, female_count)
	select first_name,
			sum(case when gender = "male" then 1 else 0 end),
			sum(case when gender = "female" then 1 else 0 end)
    from user_details
    group by first_name;
    
#Add classification column
alter table counts
add column classification varchar (10);

#Classify gender for each name (i.e., each row)

SET SQL_SAFE_UPDATES = 0;

update counts
SET classification = CASE
    WHEN female_count >= 2 * male_count THEN 'female'
    WHEN male_count >= 2 * female_count THEN 'male'
    ELSE 'unisex'
END;

SET SQL_SAFE_UPDATES = 1;

select * from counts;

