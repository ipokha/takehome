/*
This query creates a sql view that shows only the latest record for each VIN.
*/


DROP VIEW IF Exists Latest_Records;

CREATE VIEW Latest_Records AS 
	SELECT VIN,RecordDate
	FROM ( 
	-- Window function to assign a row number of 1 for latest record of each VIN
		SELECT VIN,RecordDate,BASEPRICE,
			ROW_NUMBER() OVER(PARTITION BY VIN
							ORDER BY VIN, RecordDate DESC) as RN
		FROM VEHICLE
		ORDER BY VIN,RECORDDATE
	) as arranged_by_latest_date_desc
	-- Only choose the records which have row number of 1. 
WHERE RN = 1;

-- attributes from other records can be retrieved by performing an inner join
-- For example if we want latest record of airbags we can join Latest_records view with airbag table with following sql code

/*
SELECT L.vin as VIN, L.RecordDate as latest_date, airbag.*
FROM Latest_Records AS L
INNER JOIN AIRBAG AS A 
ON L.VIN = A.VIN AND L.RecordDate = A.RecordDate
ORDER BY VIN, latest_date
*/