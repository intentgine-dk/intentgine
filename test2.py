import os
from func import db

cursor, connection = db.rds_connect("aurora")
work_dir = os.getcwd() + "//query//database_update//netwise_source"
netwise_list = ['ig_ingestion.alteryx_netwise_q3_b2']

for i in os.listdir(work_dir):
    print("File: {}".format(i))
    sql_file = work_dir + "//{}".format(i)
    f = open(sql_file, 'r')
    q_string = f.read()
    for j in netwise_list:
        print("\tTable: {}".format(j))
        query = q_string.format(j)
        try:
            res = cursor.execute(query)
            print("\t\tCommited: {}".format(cursor.rowcount))
            connection.commit()
        except Exception as e:
            print(e)
            pass