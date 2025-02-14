SELECT distance, paytype, fare, tip, tolls, surcharge, total FROM yellow
WHERE total >= 10.0 ORDER BY total DESC