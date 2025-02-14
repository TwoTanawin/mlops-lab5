CREATE VIEW cctrips AS
SELECT SUM(fare) AS "CreditCardFares"
FROM yellow
WHERE paytype = 'Credit';
