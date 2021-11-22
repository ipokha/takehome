/*
Component Two - Daily Updates
Now that you have a data model defined. Assume you have inserted all the data from start.json into your tables. 
From here on forth, you receive a new file everyday with the newest car data. 
For this part use the new_day.json file and write a query that will insert the new day’s data into your 
tables, which should update each car’s row with the latest received values.

*/

-- I've not included all the columns and values that need to be included, i'll do so in 
-- the bonus question part where i'll be using python to populate the tables. 



-- The following insert statement does the following
-- If the primary key - VIN does not exist in the table, then add the new row to the table
-- If the primary key of the table exists, then update the row with new values. 

INSERT INTO VEHICLE(VIN,BasePrice) VALUES('XCDERDFDEIJHKLKUH',15000)
	ON DUPLICATE KEY UPDATE BasePrice = VALUES(BasePrice);


-- Vehicle table needs to be updated first, and then other tables becasuse of the foreign key constraint
-- ANY VIN number that is not already present in the VEHICLE table cannot be inserted into any other tables
-- This insert will fail due to foreign key constraint

INSERT INTO AIRBAG(VIN,loccurtain) VALUES('XCDERDFDEIJHKLKUX','Front')
	ON DUPLICATE KEY UPDATE loccurtain = VALUES(loccurtain);

-- Changing XCDERDFDEIJHKLKUX to XCDERDFDEIJHKLKUH will work because record for this VIN already exists in VEHICLE

INSERT INTO AIRBAG(VIN,loccurtain) VALUES('XCDERDFDEIJHKLKUH','Front')
	ON DUPLICATE KEY UPDATE loccurtain = VALUES(loccurtain);


-- If multiple columns are being updated multiple columns need to be included in the ON DUPLICATE key update part as follows.    
INSERT INTO VEHICLE(VIN,BasePrice,Manufacturer) VALUES('XCDERDFDEIJHKLKUH',20000,"Isit_enterprises")
	ON DUPLICATE KEY UPDATE BasePrice = VALUES(BasePrice), Manufacturer = VALUES(Manufacturer);
