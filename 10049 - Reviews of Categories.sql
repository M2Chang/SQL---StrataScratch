--Find the top business categories based on the total number of reviews. Output the category along with the total number of reviews. Order by total reviews in descending order.


with cat as (
select unnest(string_to_array(categories , ';')) as category ,
review_count
from yelp_business) 

select category, sum(review_count) from cat
group by category
order by sum(review_count) desc
