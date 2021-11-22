#!/usr/bin/env python
# coding: utf-8

# In[1]:


import mysql.connector as sql_connector
import json


# In[2]:


# connect to database
mydb = sql_connector.connect(
    host = "",
    user = "",

    password = ""
)
mycursor = mydb.cursor()


# In[3]:


mycursor.execute("USE XXXX;")
mycursor.execute("SHOW TABLES;")
#Fetch all tables
mycursor.fetchall()


# In[4]:


#open json file
file = open("new_day.json","r")
parsed_json = json.loads(file.read())

#get columnnames for all tables - column name are dictionary key

#all keys not in inner dictionaries are part of VEHICLE TABLE
vehicle_keys = [key for key,val in parsed_json[0].items() if not isinstance(val,dict)]

#Each nested dictionary has a separate table that contains all keys inside the dic plus VIN as primary key
airbag_keys  = ["VIN"]+[key for key,val in parsed_json[0]['airbag'].items()]
battery_keys = ["VIN"]+[key for key,val in parsed_json[0]['battery'].items()]
brake_keys   = ["VIN"]+[key for key,val in parsed_json[0]['brake'].items()]
engine_keys  = ["VIN"]+[key for key,val in parsed_json[0]['engine'].items()]
lane_keys    = ["VIN"]+[key for key,val in parsed_json[0]['lane'].items()]
ncsa_keys    = ["VIN"]+[key for key,val in parsed_json[0]['ncsa'].items()]
trailer_keys = ["VIN"]+[key for key,val in parsed_json[0]['trailer'].items()]
plant_keys   = ["VIN"]+[key for key,val in parsed_json[0]['plant'].items()]
wheel_keys   = ["VIN"]+[key for key,val in parsed_json[0]['wheel'].items()]


# In[5]:


#all values in json are in str format. These are the columns that
# are not in str format in the VEHICLE table.

# Populating Vehicle Table

# In[6]:



#parse through each item in the json and populate the VEHICLE TABLE


sql_vehicle = 'INSERT INTO VEHICLE ({vehicle_keys}) VALUES ({vehicle_values}) ON DUPLICATE KEY UPDATE {duplicate_key_str}'

#get all the keys for vehicle
vehicle_keys = [key for key,val in parsed_json[0].items() if not isinstance(val,dict)]

#field keys string
vehicle_keys_str = ", ".join(vehicle_keys)

#string for ON Duplicate key Update
duplicate_key_str = ", ".join([f'{key} = VALUES({key})' for key in vehicle_keys])

#loop through each item in the json and update the VEHICLE table rows
for item in parsed_json:
    vehicle_values = ', '.join(['"{0}"'.format(item[key]) for key in vehicle_keys])
    composed_sql = sql_vehicle.format(vehicle_keys=vehicle_keys_str, vehicle_values=vehicle_values, duplicate_key_str = duplicate_key_str)
    mycursor.execute(composed_sql)
    print(f'Executed: {composed_sql}')
    print("affected rows = {}".format(mycursor.rowcount))


#committ changes
print(mydb.commit())



# Populating AIRBAG TABLE
#

# In[7]:


sql_airbag = 'INSERT INTO AIRBAG ({airbag_keys}) VALUES ({airbag_values}) ON DUPLICATE KEY UPDATE {duplicate_key_str}'
airbag_keys_str = ", ".join(airbag_keys)
duplicate_key_str = ", ".join([f'{key} = VALUES({key})' for key in airbag_keys])
for item in parsed_json:
    airbag_values = ', '.join([f'\"{item["VIN"]}\"']+['"{0}"'.format(item['airbag'][key]) for key in airbag_keys[1:]])
    composed_sql = sql_airbag.format(airbag_keys= airbag_keys_str, airbag_values=airbag_values, duplicate_key_str = duplicate_key_str)
    mycursor.execute(composed_sql)
    print(f'Executed: {composed_sql}')
    print("affected rows = {}".format(mycursor.rowcount))

#committ changes
mydb.commit()


# In[8]:


#Populating Battery Table

sql_battery = 'INSERT INTO battery ({battery_keys}) VALUES ({battery_values}) ON DUPLICATE KEY UPDATE {duplicate_key_str}'
battery_keys_str = ", ".join(battery_keys)
duplicate_key_str = ", ".join([f'{key} = VALUES({key})' for key in battery_keys])
print(airbag_keys_str)
for item in parsed_json:
    battery_values = ', '.join([f'\"{item["VIN"]}\"']+['"{0}"'.format(item['battery'][key]) for key in battery_keys[1:]])
    composed_sql = sql_battery.format(battery_keys= battery_keys_str, battery_values=battery_values, duplicate_key_str = duplicate_key_str)
    mycursor.execute(composed_sql)
    print(f'Executed: {composed_sql}')
    print("affected rows = {}".format(mycursor.rowcount))

#committ changes
mydb.commit()


# In[9]:


#populating brake table


sql_brake = 'INSERT INTO brake ({brake_keys}) VALUES ({brake_values}) ON DUPLICATE KEY UPDATE {duplicate_key_str}'
brake_keys_str = ", ".join(brake_keys)
duplicate_key_str = ", ".join([f'{key} = VALUES({key})' for key in brake_keys])
for item in parsed_json:
    brake_values = ', '.join([f'\"{item["VIN"]}\"']+['"{0}"'.format(item['brake'][key]) for key in brake_keys[1:]])
    composed_sql = sql_brake.format(brake_keys= brake_keys_str, brake_values=brake_values, duplicate_key_str = duplicate_key_str)
    mycursor.execute(composed_sql)
    print(f'Executed: {composed_sql}')
    print("affected rows = {}".format(mycursor.rowcount))

#committ changes
mydb.commit()


# In[10]:


#Populating engine table

sql_engine = 'INSERT INTO engine ({engine_keys}) VALUES ({engine_values}) ON DUPLICATE KEY UPDATE {duplicate_key_str}'
engine_keys_str = ", ".join(engine_keys)
duplicate_key_str = ", ".join([f'{key} = VALUES({key})' for key in engine_keys])
for item in parsed_json:
    engine_values = ', '.join([f'\"{item["VIN"]}\"']+['"{0}"'.format(item['engine'][key]) for key in engine_keys[1:]])
    composed_sql = sql_engine.format(engine_keys= engine_keys_str, engine_values=engine_values, duplicate_key_str = duplicate_key_str)
    mycursor.execute(composed_sql)
    print(f'Executed: {composed_sql}')
    print("affected rows = {}".format(mycursor.rowcount))

#committ changes


# In[11]:


#populating lane table


sql_lane = 'INSERT INTO lane ({lane_keys}) VALUES ({lane_values}) ON DUPLICATE KEY UPDATE {duplicate_key_str}'
lane_keys_str = ", ".join(lane_keys)
duplicate_key_str = ", ".join([f'{key} = VALUES({key})' for key in lane_keys])
print(airbag_keys_str)
for item in parsed_json:
    lane_values = ', '.join([f'\"{item["VIN"]}\"']+['"{0}"'.format(item['lane'][key]) for key in lane_keys[1:]])
    composed_sql = sql_lane.format(lane_keys= lane_keys_str, lane_values=lane_values, duplicate_key_str = duplicate_key_str)
    mycursor.execute(composed_sql)
    print(f'Executed: {composed_sql}')
    print("affected rows = {}".format(mycursor.rowcount))

mydb.commit()


# In[12]:


#populating ncsa table

sql_ncsa = 'INSERT INTO ncsa ({ncsa_keys}) VALUES ({ncsa_values}) ON DUPLICATE KEY UPDATE {duplicate_key_str}'
ncsa_keys_str = ", ".join(ncsa_keys)
duplicate_key_str = ", ".join([f'{key} = VALUES({key})' for key in ncsa_keys])
print(airbag_keys_str)
for item in parsed_json:
    ncsa_values = ', '.join([f'\"{item["VIN"]}\"']+['"{0}"'.format(item['ncsa'][key]) for key in ncsa_keys[1:]])
    composed_sql = sql_ncsa.format(ncsa_keys= ncsa_keys_str, ncsa_values=ncsa_values, duplicate_key_str = duplicate_key_str)
    mycursor.execute(composed_sql)
    print(f'Executed: {composed_sql}')
    print("affected rows = {}".format(mycursor.rowcount))

#committ changes
mydb.commit()


# In[13]:


#populating plant table


sql_plant = 'INSERT INTO plant ({plant_keys}) VALUES ({plant_values}) ON DUPLICATE KEY UPDATE {duplicate_key_str}'
plant_keys_str = ", ".join(plant_keys)
duplicate_key_str = ", ".join([f'{key} = VALUES({key})' for key in plant_keys])
print(airbag_keys_str)
for item in parsed_json:
    plant_values = ', '.join([f'\"{item["VIN"]}\"']+['"{0}"'.format(item['plant'][key]) for key in plant_keys[1:]])
    composed_sql = sql_plant.format(plant_keys= plant_keys_str, plant_values=plant_values, duplicate_key_str = duplicate_key_str)
    mycursor.execute(composed_sql)
    print(f'Executed: {composed_sql}')
    print("affected rows = {}".format(mycursor.rowcount))

#committ changes
mydb.commit()


# In[14]:


#populating trailer table


sql_trailer = 'INSERT INTO trailer ({trailer_keys}) VALUES ({trailer_values}) ON DUPLICATE KEY UPDATE {duplicate_key_str}'
trailer_keys_str = ", ".join(trailer_keys)
duplicate_key_str = ", ".join([f'{key} = VALUES({key})' for key in trailer_keys])
print(airbag_keys_str)
for item in parsed_json:
    trailer_values = ', '.join([f'\"{item["VIN"]}\"']+['"{0}"'.format(item['trailer'][key]) for key in trailer_keys[1:]])
    composed_sql = sql_trailer.format(trailer_keys= trailer_keys_str, trailer_values=trailer_values, duplicate_key_str = duplicate_key_str)
    mycursor.execute(composed_sql)
    print(f'Executed: {composed_sql}')
    print("affected rows = {}".format(mycursor.rowcount))
#committ changes
mydb.commit()


# In[15]:


#populating wheel table


sql_wheel = 'INSERT INTO wheel ({wheel_keys}) VALUES ({wheel_values}) ON DUPLICATE KEY UPDATE {duplicate_key_str}'
wheel_keys_str = ", ".join(wheel_keys)
duplicate_key_str = ", ".join([f'{key} = VALUES({key})' for key in wheel_keys])
print(airbag_keys_str)
for item in parsed_json:
    wheel_values = ', '.join([f'\"{item["VIN"]}\"']+['"{0}"'.format(item['wheel'][key]) for key in wheel_keys[1:]])
    composed_sql = sql_wheel.format(wheel_keys= wheel_keys_str, wheel_values=wheel_values, duplicate_key_str = duplicate_key_str)
    mycursor.execute(composed_sql)
    print(f'Executed: {composed_sql}')
    print("affected rows = {}".format(mycursor.rowcount))

#committ changes
mydb.commit()
mydb.close()

# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:
