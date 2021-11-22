# takehome
takehome test
- MYSQL files. 


Question1.sql has SQL statements to create the first Relational Database for start.json.


Question2.sql has SQL statements to update duplicate records, more comments provided in the sql file. 


Question3.sql has SQL statements to alter the exisiting tables to allow for recording changes over time for each record previously
uniquely identified by VIN in all tables. Adds RecordDate column to all tables and makes all tables refer to VEHICLE table
using composite key of RecordDate,VIN

Question3b.sql populates the table altered by Question3.sql and populates them with few random VIN and Record dates. 

Question3c.sql has sql statement to create a sql view that returns only the latest record for each vin

Answer to Question 4: viz.py is a python file that reades stat.json and returns prices.csv that is used in tableau to show price changes over time by car make,
  model. 

-tableau visualization can be viewed at 
https://public.tableau.com/views/CarPricesVizualization/Dashboard1?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link
you can select "All" in the dropdown for Make or select individual Make. Dropdown for Model changes based on linked records to Make. 
For example, if you select "Chevrolet" in Make, then only available Chevrolet models show up in the Model dropdown. 

Question5.ipynb - Jupyter notebook file with visualizations for car data start.json. 
Visualizations about popular car make, popular models for car makes, popular manufacturing destinations by country and state. 


Question6.py is a python file to populate tables set up by Question1.sql with new json files that are received every day. 
This file parses the json file and updates all the tables by either appending new car records uniquely identified by VIN or by 
updating with new values for cars that are present in the database. 

