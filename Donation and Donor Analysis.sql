/* This is a database of comprises of 2 tables about donation and Donor dataset. 
The following are questions answered using varous SQL Statement */

SELECT 
    *
FROM
    donation_data;
    
SELECT 
    *
FROM
    donor;
    
    
-- 1 How much is the total donation?
SELECT 
    SUM(donation) AS total_sum
FROM
    donation_data;
    
-- 2 What is the total donation by gender?
SELECT 
    gender, SUM(donation) AS total_sum
FROM
    donation_data
GROUP BY gender;

-- 3 Show the total donation and number of donations by gender

SELECT 
    gender, COUNT(gender), SUM(donation) AS total_sum
FROM
    donation_data
GROUP BY gender;

-- 4 Total donation made by frequency of donation

SELECT 
    donation_Frequency, SUM(donation) as total_donation
FROM
    donation_data Dd
        JOIN
    donor_data D ON Dd.id = D.id
GROUP BY donation_frequency
ORDER BY total_donation, donation_frequency;

-- 5 Total donation and number of donation by Job field

SELECT 
row_number() over (order by COUNT(job_field)) as donor_position,
    job_field,
    COUNT(job_field) AS num_of_job_donor,
    SUM(donation) AS total_donation
FROM
    donation_data
GROUP BY job_field
ORDER BY num_of_job_donor; 

-- 6 Total donation and number of donations above $200

SELECT 
   count(donation) as num_of_donation ,sum(donation) AS total_donation
FROM
    donation_data
    where donation > 200;
 -- GROUP BY donation


-- Total donation and number of donations below  $200
SELECT 
   count(donation) as num_of_donation ,sum(donation) AS total_donation
FROM
    donation_data
    where donation < 200;
use others;
-- Which top 10 states contributes the highest donations
select 
	state, sum(donation) as total_sum
from
    donation_data
    group by state
    order by total_sum desc
    limit 10;
    
-- Which top 10 states contributes the least donations
select 
	state, sum(donation) as total_sum
from
    donation_data
    group by state
    order by total_sum 
    limit 10;
    
-- What are the top 10 cars driven by the highest donor
SELECT 
    car, SUM(donation) as total_donation
    
FROM
    donor_data D
        JOIN
    donation_data DA ON D.id = DA.id
GROUP BY car
order by total_donation desc
limit 10;
