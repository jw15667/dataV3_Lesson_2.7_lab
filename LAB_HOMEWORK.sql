use sakila;

drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

-- SET GLOBAL local_infile=1;
-- set global local_infile=true;
-- SHOW GLOBAL VARIABLES;

-- We have just one item for each film, and all will be placed in the new table. 
-- For 2020, the rental duration will be 3 days, with an offer price of 2.99€ 
-- and a replacement cost of 8.99€ (these are all fixed values for all movies for this year). 
-- The catalog is in a CSV file named films_2020.csv that can be found at files_for_lab folder.
-- Instructions
-- Add the new films to the database.
-- Update information on rental_duration, rental_rate, and replacement_cost.
UPDATE films_2020 
SET rental_duration = '3', rental_rate = '2.99', replacement_cost = '8.99';
 
select * from films_2020;

-- n the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

select * from actor
group by last_name
having count(last_name) = 1;

-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

select * from actor
group by last_name
having count(last_name) >1;

-- Using the rental table, find out how many rentals were processed by each employee.
select * from rental
group by staff_id
having count(rental_id);









