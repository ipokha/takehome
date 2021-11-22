/* In Part B, you were required to update the car’s row values with the latest received data. 
However, we lose the changes over time by doing this (For example, seeing the price change over time would be useful). 
So, instead of updating, you append newly received data into the tables. What changes would you make to the tables to make this method work? 
And, write a create statement for a SQL view that would show only the latest data for all cars (Hint: Window Functions).
 */

-- Alterations to each table. 

-- DROPPING ALL the defined FOREIGN KEY CONSTRAINT

ALTER TABLE AIRBAG DROP CONSTRAINT AIRBAG_VEHICLES;
ALTER TABLE BATTERY DROP CONSTRAINT BATTERY_VEHICLES;
ALTER TABLE BRAKE DROP CONSTRAINT BRAKE_VEHICLES;
ALTER TABLE ENGINE DROP CONSTRAINT ENGINE_VEHICLES;
ALTER TABLE LANE DROP CONSTRAINT LANE_VEHICLES;
ALTER TABLE NCSA DROP CONSTRAINT NCSA_VEHICLES;
ALTER TABLE PLANT DROP CONSTRAINT PLANT_VEHICLES;
ALTER TABLE TRAILER DROP CONSTRAINT TRAILER_VEHICLES;
ALTER TABLE WHEEL DROP CONSTRAINT WHEEL_VEHICLES;


-- Altering each table so that each table has a new column called RecordDate that keeps the record of when a particular row was updated
-- Now, Primary key for each table is a composite of RecordDate and VIN
-- All tables references VEHICLE TABLE with a composite key (RecordDate,VIN)

ALTER TABLE VEHICLE
ADD RecordDate varchar(10),
DROP PRIMARY KEY,
ADD PRIMARY KEY (RecordDate,VIN);

ALTER TABLE AIRBAG
ADD RecordDate varchar(10),
DROP PRIMARY KEY,
ADD PRIMARY KEY (RecordDate,VIN),
ADD CONSTRAINT AIRBAG_VEHICLES FOREIGN KEY (VIN,RecordDate) REFERENCES VEHICLE(RecordDate,VIN);

ALTER TABLE BATTERY
ADD RecordDate varchar(10),
DROP PRIMARY KEY,
ADD PRIMARY KEY (RecordDate,VIN),

ADD CONSTRAINT BATTERY_VEHICLES FOREIGN KEY (VIN,RecordDate) REFERENCES VEHICLE(RecordDate,VIN);

ALTER TABLE BRAKE
ADD RecordDate varchar(10),
DROP PRIMARY KEY,
ADD PRIMARY KEY (RecordDate,VIN),
ADD CONSTRAINT BRAKE_VEHICLES FOREIGN KEY (VIN,RecordDate) REFERENCES VEHICLE(RecordDate,VIN);

ALTER TABLE ENGINE
ADD RecordDate varchar(10),
DROP PRIMARY KEY,
ADD PRIMARY KEY (RecordDate,VIN),
ADD CONSTRAINT ENGINE_VEHICLES FOREIGN KEY (VIN,RecordDate) REFERENCES VEHICLE(RecordDate,VIN);

ALTER TABLE LANE
ADD RecordDate varchar(10),
DROP PRIMARY KEY,
ADD PRIMARY KEY (RecordDate,VIN),
ADD CONSTRAINT LANE_VEHICLES FOREIGN KEY (VIN,RecordDate) REFERENCES VEHICLE(RecordDate,VIN);

ALTER TABLE NCSA
ADD RecordDate varchar(10),
DROP PRIMARY KEY,
ADD PRIMARY KEY (RecordDate,VIN),
ADD CONSTRAINT NCSA_VEHICLES FOREIGN KEY (VIN,RecordDate) REFERENCES VEHICLE(RecordDate,VIN);

ALTER TABLE PLANT
ADD RecordDate varchar(10),
DROP PRIMARY KEY,
ADD PRIMARY KEY (RecordDate,VIN),
ADD CONSTRAINT PLANT_VEHICLES FOREIGN KEY (VIN,RecordDate) REFERENCES VEHICLE(RecordDate,VIN);

ALTER TABLE TRAILER
ADD RecordDate varchar(10),
DROP PRIMARY KEY,
ADD PRIMARY KEY (RecordDate,VIN),
ADD CONSTRAINT TRAILER_VEHICLES FOREIGN KEY (VIN,RecordDate) REFERENCES VEHICLE(RecordDate,VIN);

ALTER TABLE WHEEL
ADD RecordDate varchar(10),
DROP PRIMARY KEY,
ADD PRIMARY KEY (RecordDate,VIN),
ADD CONSTRAINT WHEEL_VEHICLES FOREIGN KEY (VIN,RecordDate) REFERENCES VEHICLE(RecordDate,VIN);


