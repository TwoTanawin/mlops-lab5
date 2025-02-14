
SELECT 
    COUNT("count") AS "Number of trips",
    SUM(total) AS "Total fares",
    pickup AS "Trip date"
FROM taxidata.yellow
WHERE pickup BETWEEN TIMESTAMP '2025-01-01 00:00:00'
                AND TIMESTAMP '2025-02-01 00:00:01'
GROUP BY pickup limit 10;
