CREATE TABLE taxidata.creditcard
WITH (
  format = 'Parquet',
  external_location = 's3://lab5-dataset/csv/creditcard/'
) AS
SELECT *
FROM taxidata.yellow
WHERE paytype = 'Credit';