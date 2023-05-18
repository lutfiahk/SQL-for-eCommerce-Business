-- MENGHITUNG MONTHLY ACTIVE USER TIAP BULAN
SELECT DATE_PART('MONTH', O.ORDER_PURCHASE_TIMESTAMP) ACTIVE_MONTH, 
	DATE_PART('YEAR', O.ORDER_PURCHASE_TIMESTAMP) ACTIVE_YEAR, 
	COUNT(DISTINCT C.CUSTOMER_UNIQUE_ID) ACTIVE_CUST
	FROM ORDERS_DATASET O LEFT JOIN CUSTOMERS_DATASET C
	ON O.CUSTOMER_ID = C.CUSTOMER_ID
	GROUP BY ACTIVE_YEAR, ACTIVE_MONTH
	ORDER BY ACTIVE_YEAR, ACTIVE_MONTH;

-- MENGHITUNG RATA-RATA MONTHLY ACTIVE USER TIAP TAHUN
WITH MAU AS (SELECT DATE_PART('MONTH', O.ORDER_PURCHASE_TIMESTAMP) ACTIVE_MONTH, 
	DATE_PART('YEAR', O.ORDER_PURCHASE_TIMESTAMP) ACTIVE_YEAR, 
	COUNT(DISTINCT C.CUSTOMER_UNIQUE_ID) TOTAL_CUSTOMER_AKTIF
	FROM ORDERS_DATASET O LEFT JOIN CUSTOMERS_DATASET C
	ON O.CUSTOMER_ID = C.CUSTOMER_ID
	GROUP BY ACTIVE_YEAR, ACTIVE_MONTH)
SELECT ACTIVE_YEAR, ROUND(AVG(TOTAL_CUSTOMER_AKTIF),2) AS AVG_MAU FROM MAU GROUP BY ACTIVE_YEAR;

-- MELIHAT NEW CUSTOMER TIAP TAHUNNYA
WITH ID AS (SELECT MIN(EXTRACT(YEAR FROM O.ORDER_PURCHASE_TIMESTAMP)) AS ACTIVE_YEAR, C.CUSTOMER_UNIQUE_ID CUST_ID
	FROM ORDERS_DATASET O LEFT JOIN CUSTOMERS_DATASET C ON O.CUSTOMER_ID = C.CUSTOMER_ID GROUP BY CUST_ID)
SELECT ACTIVE_YEAR, COUNT(DISTINCT CUST_ID) NEW_CUST FROM ID GROUP BY ACTIVE_YEAR;

-- Menampilkan jumlah customer yang melakukan pembelian lebih dari satu kali (repeat order) 
SELECT ACTIVE_YEAR, COUNT(DISTINCT CUST_ID) AVG_ORDER FROM
	(SELECT DATE_PART('YEAR', O.ORDER_PURCHASE_TIMESTAMP) ACTIVE_YEAR, C.CUSTOMER_UNIQUE_ID CUST_ID, COUNT(O.ORDER_ID) TOTAL_ORDER 
		FROM ORDERS_DATASET O 
		LEFT JOIN CUSTOMERS_DATASET C ON O.CUSTOMER_ID = C.CUSTOMER_ID 
		GROUP BY ACTIVE_YEAR, CUSTOMER_UNIQUE_ID HAVING COUNT(O.ORDER_ID) > 1 ORDER BY TOTAL_ORDER DESC) AS AGG
GROUP BY ACTIVE_YEAR;

-- Menampilkan rata-rata jumlah order yang dilakukan customer untuk masing-masing tahun 
WITH AGG AS (SELECT C.CUSTOMER_UNIQUE_ID CUST_ID, DATE_PART('YEAR',O.ORDER_PURCHASE_TIMESTAMP) ACTIVE_YEAR, COUNT(DISTINCT ORDER_ID)
	FROM ORDERS_DATASET O LEFT JOIN CUSTOMERS_DATASET C ON O.CUSTOMER_ID = C.CUSTOMER_ID
	GROUP BY CUST_ID, ACTIVE_YEAR)
SELECT ACTIVE_YEAR, ROUND(AVG(COUNT),2) AVG_YEAR_FREQ FROM AGG GROUP BY ACTIVE_YEAR ORDER BY ACTIVE_YEAR;

-- Menggabungkan ketiga metrik yang telah berhasil ditampilkan menjadi satu tampilan tabel
WITH AGG AS (SELECT C.CUSTOMER_UNIQUE_ID CUST_ID, DATE_PART('YEAR',O.ORDER_PURCHASE_TIMESTAMP) ACTIVE_YEAR, COUNT(DISTINCT ORDER_ID)
	FROM ORDERS_DATASET O LEFT JOIN CUSTOMERS_DATASET C ON O.CUSTOMER_ID = C.CUSTOMER_ID
	GROUP BY CUST_ID, ACTIVE_YEAR)
SELECT ACTIVE_YEAR, ROUND(AVG(COUNT),2) AVG_YEAR_FREQ FROM AGG GROUP BY ACTIVE_YEAR ORDER BY ACTIVE_YEAR;

-- Menggabungkan ketiga metrik yang telah berhasil ditampilkan menjadi satu tampilan tabel

WITH NEW_CUST AS 
(SELECT ACTIVE_YEAR, COUNT(DISTINCT CUST_ID) NEW_CUST 
	FROM (SELECT MIN(EXTRACT(YEAR FROM O.ORDER_PURCHASE_TIMESTAMP)) AS ACTIVE_YEAR, C.CUSTOMER_UNIQUE_ID CUST_ID
		FROM ORDERS_DATASET O LEFT JOIN CUSTOMERS_DATASET C ON O.CUSTOMER_ID = C.CUSTOMER_ID GROUP BY CUST_ID) AS AGG
	GROUP BY ACTIVE_YEAR),

AVG_MAU AS 
(SELECT ACTIVE_YEAR, FLOOR(AVG(TOTAL_CUSTOMER_AKTIF)) AS AVG_MAU 
	FROM (SELECT DATE_PART('MONTH', O.ORDER_PURCHASE_TIMESTAMP) ACTIVE_MONTH, 
			DATE_PART('YEAR', O.ORDER_PURCHASE_TIMESTAMP) ACTIVE_YEAR, 
			COUNT(DISTINCT C.CUSTOMER_UNIQUE_ID) TOTAL_CUSTOMER_AKTIF
			FROM ORDERS_DATASET O LEFT JOIN CUSTOMERS_DATASET C
			ON O.CUSTOMER_ID = C.CUSTOMER_ID
			GROUP BY ACTIVE_YEAR, ACTIVE_MONTH) AS AGG
	GROUP BY ACTIVE_YEAR),
TOT_REPEAT_CUST AS 
(SELECT ACTIVE_YEAR, COUNT(DISTINCT CUST_ID) TOT_REPEAT_CUST FROM
	(SELECT DATE_PART('YEAR', O.ORDER_PURCHASE_TIMESTAMP) ACTIVE_YEAR, C.CUSTOMER_UNIQUE_ID CUST_ID, COUNT(O.ORDER_ID) TOTAL_ORDER 
		FROM ORDERS_DATASET O 
		LEFT JOIN CUSTOMERS_DATASET C ON O.CUSTOMER_ID = C.CUSTOMER_ID 
		GROUP BY ACTIVE_YEAR, CUSTOMER_UNIQUE_ID HAVING COUNT(O.ORDER_ID) > 1 ORDER BY TOTAL_ORDER DESC) AS AGG
GROUP BY ACTIVE_YEAR),

AVG_YEAR_FREG AS (SELECT ACTIVE_YEAR, ROUND(AVG(COUNT),2) AVG_YEAR_FREQ 
	FROM (SELECT C.CUSTOMER_UNIQUE_ID CUST_ID, DATE_PART('YEAR',O.ORDER_PURCHASE_TIMESTAMP) ACTIVE_YEAR, COUNT(DISTINCT ORDER_ID)
			FROM ORDERS_DATASET O LEFT JOIN CUSTOMERS_DATASET C ON O.CUSTOMER_ID = C.CUSTOMER_ID
			GROUP BY CUST_ID, ACTIVE_YEAR) AS AGG
	GROUP BY ACTIVE_YEAR ORDER BY ACTIVE_YEAR)
SELECT A.ACTIVE_YEAR, A.NEW_CUST, B.AVG_MAU, C.TOT_REPEAT_CUST, D.AVG_YEAR_FREQ
FROM NEW_CUST A JOIN AVG_MAU B ON A.ACTIVE_YEAR = B.ACTIVE_YEAR 
	JOIN TOT_REPEAT_CUST C ON B.ACTIVE_YEAR = C.ACTIVE_YEAR 
	JOIN AVG_YEAR_FREG D ON C.ACTIVE_YEAR = D.ACTIVE_YEAR;