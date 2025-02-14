CREATE EXTERNAL TABLE IF NOT EXISTS taxidata.yellow_new (
    vender      STRING,
    pickup      TIMESTAMP,
    dropoff     TIMESTAMP,
    count       INT,
    distance    DOUBLE,
    ratecode    STRING,
    storeflag   STRING,
    pulcid      STRING,
    dolocid     STRING,
    paytype     STRING,
    fare        DECIMAL(10,2),
    extra       DECIMAL(10,2),
    mta_tax     DECIMAL(10,2),
    tip         DECIMAL(10,2),
    tolls       DECIMAL(10,2),
    surcharge   DECIMAL(10,2),
    total       DECIMAL(10,2)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  'separatorChar' = ',',
  'quoteChar' = '\"'
)
STORED AS TEXTFILE
LOCATION 's3://lab5-dataset/csv/'
TBLPROPERTIES (
  'skip.header.line.count'='1'
);
