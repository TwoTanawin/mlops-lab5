CREATE TABLE taxidata.jan
WITH (
  format = 'Parquet',
  external_location = 's3://lab5-dataset/csv/jan/'
) AS
SELECT *
FROM taxidata.yellow_new
WHERE pickup BETWEEN TIMESTAMP '2025-01-01 00:00:00'
                AND TIMESTAMP '2025-02-01 00:00:01';
