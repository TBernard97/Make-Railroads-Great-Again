import psycopg2
import re
import matplotlib.pyplot as plt
import os
import pandas as pd

# connection to database:
try:
    conn = psycopg2.connect("dbname='spatial' user='postgres' host='localhost' password='get your own'")
except:
    print("cant connect to the database")

cur = conn.cursor()
cur2 = conn.cursor()
cur3 = conn.cursor()

sql = "select parid::integer from volusia.parcel p where geom is not null" # limit 10"

print('SQL: ', sql)
cur.execute(sql)



i = 0
row = cur.fetchone()
while row is not None:
    i = i + 1
    parid = str(row[0])
    sql2 = """ select r.gid, r.geom, ST_Distance(r.geom, (select p.geom from volusia.parcel p where p.parid={}))
                from
                volusia.railroads r
                order by 
                r.geom <-> (select p.geom from volusia.parcel p where p.parid={}) limit 1;""".format(parid,parid)
    cur2.execute(sql2)
    row2 = cur2.fetchone()
    distance = row2[2]
    #Compare to postgres to make sure you didn't mess up
    # print("Row: {}, Parid: {}, Distance: {}".format(i, parid, distance))

    sql3 = "update volusia.parcel p1 set rrdistance = " + str(distance) + " where p1.parid=" + parid + ";"
    cur3.execute(sql3)
    print(sql3)
    if i%10000 == 0:
        print(i)
        conn.commit()
    row = cur.fetchone()

#df = pd. 
conn.commit()
conn.close()
