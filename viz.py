import json
import pandas as pd

'Question: Vizualization to show average prices per car model and model year '

file = open("start.json","r")
json = json.loads(file.read())


#Read the json file into a pandas dataframe, select only required columns
df = pd.json_normalize(json,sep = "_")[['VIN',"Make",'Model',"BasePrice","ModelYear"]]
#convert BasePrice column to numeric
df["BasePrice"] = pd.to_numeric(df["BasePrice"])

"""equivalent sql code to the pandas group by code below

SELECT Make,Model,AVG(BasePRice)
FROM table
GROUP BY MAKE,MODEL
"""
price_by_model_year = df.groupby(["Make","Model","ModelYear"])['BasePrice'].mean()
#convert the groupby reurned series to a dataframe
price_by_model_year_df = price_by_model_year.to_frame('Price').reset_index()
#Only limited models have car prices available. Removing all models where
#car prices are not available for a given year
price_by_model_year_df = price_by_model_year_df[price_by_model_year_df["Price"].notna()]
price_by_model_year_df.to_csv("prices.csv")
#I used prices.csv file to create visualization in Tableau
