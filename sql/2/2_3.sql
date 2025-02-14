select count (count) as "Number of trips",
    sum (total) as "Total fares",
    pickup as "Trip date"
from jan
group by pickup limit 10;