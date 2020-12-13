import os
import datetime
from func import db

cursor, connection = db.rds_connect("aurora")

enrich_list = ['ig_enrich1.company_enrich', 'ig_enrich2.company_enrich', 'ig_enrich3.company_enrich', 'ig_enrich_rl1.company_enrich', 'ig_enrich_rl2.company_enrich', 'ig_enrich_rl3.company_enrich', 'ig_enrich_rl4.company_enrich', 'ig_enrich_drl1.company_enrich', 'ig_enrich_drl2.company_enrich', 'ig_enrich_drl3.company_enrich', 'ig_enrich_drl4.company_enrich', 'ig_enrich_ops.company_enrich', 'ig_test.enrich_api_b2', 'ig_test.enrich_api_b3', 'ig_test.enrich_api_b4']
netwise_list = ['ig_ingestion.alteryx_netwise_q3_b1', 'ig_ingestion.alteryx_netwise_q3_b2', 'ig_ingestion.alteryx_raw_netwise', 'ig_vendor.dv01wn_q4_refresh']
alteryx_list = ['ig_ingestion.alteryx_production']

enrich_dir = os.getcwd() + "//query//database_update//enrichment_source"
netwise_dir = os.getcwd() + "//query//database_update//netwise_source"
alteryx_dir = os.getcwd() + "//query//database_update//alteryx_source"

log = open(os.getcwd() + '//log_file.txt', 'a')
log.write("Start: {}\n".format(datetime.datetime.now()))


for i in os.listdir(netwise_dir):
    print("{} File: {}".format(datetime.datetime.now(), i))
    log.write("{} File: {}".format(datetime.datetime.now(), i))
    sql_file = netwise_dir + "//{}".format(i)
    f = open(sql_file, 'r')
    q_string = f.read()
    for j in netwise_list:
        print("\tTable: {}".format(j))
        log.write("\t{} Table: {}\n==".format(datetime.datetime.now(), j))
        query = q_string.format(j)
        try:
            res = cursor.execute(query)
            print("\t\tCommited: {}".format(cursor.rowcount))
            log.write("\t\t{} Commited: {}\n".format(datetime.datetime.now(), cursor.rowcount))
            connection.commit()
        except Exception as e:
            print(e)
            log.write("{} Error: {}\n".format(datetime.datetime.now(), e))
            pass

for i in os.listdir(enrich_dir):
    print("{} File: {}".format(datetime.datetime.now(), i))
    log.write("{} File: {}".format(datetime.datetime.now(), i))
    sql_file = enrich_dir + "//{}".format(i)
    f = open(sql_file, 'r')
    q_string = f.read()
    for j in enrich_list:
        print("\tTable: {}".format(j))
        log.write("\t{} Table: {}\n".format(datetime.datetime.now(), j))
        query = q_string.format(j)
        try:
            res = cursor.execute(query)
            print("\t\tCommited: {}".format(cursor.rowcount))
            log.write("\t\t{} Commited: {}\n".format(datetime.datetime.now(), cursor.rowcount))
            connection.commit()
        except Exception as e:
            print(e)
            log.write("{} Error: {}\n".format(datetime.datetime.now(), e))
            pass

for i in os.listdir(alteryx_dir):
    print("File: {}".format(i))
    log.write("{} File: {}".format(datetime.datetime.now(), i))
    sql_file = alteryx_dir + "//{}".format(i)
    f = open(sql_file, 'r')
    q_string = f.read()
    for j in enrich_list:
        print("\tTable: {}".format(j))
        log.write("\t{} Table: {}\n".format(datetime.datetime.now(), j))
        query = q_string.format(j)
        try:
            res = cursor.execute(query)
            print("\t\tCommited: {}".format(cursor.rowcount))
            log.write("\t\t{} Commited: {}\n".format(datetime.datetime.now(), cursor.rowcount))
            connection.commit()
        except Exception as e:
            print(e)
            log.write("{} Error: {}\n".format(datetime.datetime.now(), e))
            pass

log.write("End: {}\n".format(datetime.datetime.now()))
log.close()