--Find the top 5 states with the most 5 star businesses. Output the state name along with the number of 5-star businesses and order records by the number of 5-star businesses in descending order. In case there are ties in the number of businesses, return all the unique states. If two states have the same result, sort them in alphabetical order.

select state, num from (
select state, count(*) as num ,
RANK() OVER(ORDER BY count(*) DESC) as ranks
from yelp_business
where stars = 5
group by state
order by num desc ,state
) a
where ranks <=5
