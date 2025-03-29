COPY stocks
FROM 'C:\Users\Public\indexData.csv'
WITH (FORMAT CSV, HEADER, NULL "null");

SELECT * FROM stocks;