import os
import datetime
from func import db

cursor, connection = db.rds_connect("aurora")

enrich_list = ['ig_enrich1.company_enrich', 'ig_enrich2.company_enrich', 'ig_enrich3.company_enrich', 'ig_enrich_rl1.company_enrich', 'ig_enrich_rl2.company_enrich', 'ig_enrich_rl3.company_enrich', 'ig_enrich_rl4.company_enrich', 'ig_enrich_drl1.company_enrich', 'ig_enrich_drl2.company_enrich', 'ig_enrich_drl3.company_enrich', 'ig_enrich_drl4.company_enrich', 'ig_enrich_ops.company_enrich', 'ig_test.enrich_api_b2', 'ig_test.enrich_api_b3', 'ig_test.enrich_api_b4']
netwise_list = ['ig_ingestion.alteryx_netwise_q3_b1', 'ig_ingestion.alteryx_netwise_q3_b2', 'ig_ingestion.alteryx_raw_netwise', 'ig_vendor.dv01wn_q4_refresh']
alteryx_list = ['ig_ingestion.alteryx_production']
dvcj038m_list = ['ig_vendor.dvcj03_email_8m_200830']
dvcj0328_list = ['ig_vendor.dvcj03_uscd28_200830']
dvcj0330_list = ['ig_vendor.dvcj03_uscd30_200830']
kaggle_list = ['ig_reference.kaggle_companies']
pdl_list = ['ig_reference.people_data_labs']

enrich_dir = os.getcwd() + "//query//database_update//enrichment_source"
netwise_dir = os.getcwd() + "//query//database_update//netwise_source"
alteryx_dir = os.getcwd() + "//query//database_update//alteryx_source"
dvcj038m_dir = os.getcwd() + "//query//database_update//dvcj038m_source"
dvcj0328_dir = os.getcwd() + "//query//database_update//dvcj0328_source"
dvcj0330_dir = os.getcwd() + "//query//database_update//dvcj0330_source"
kaggle_dir = os.getcwd() + "//query//database_update//kaggle_source"
pdl_dir = os.getcwd() + "//query//database_update//pdl_source"

log = open(os.getcwd() + '//log_file.txt', 'a')
log.write("Start: {}\n".format(datetime.datetime.now()))

title_dict = {
    enrich_dir: enrich_list, 
    netwise_dir: netwise_list, 
    alteryx_dir: alteryx_list,
    dvcj038m_dir: dvcj038m_list, 
    dvcj0328_dir: dvcj0328_list, 
    dvcj0330_dir: dvcj0330_list,
    kaggle_dir: kaggle_list, 
    pdl_dir: pdl_list
}

for k, v in title_dict.items():
    for i in os.listdir(k):
        print("File: {}".format(datetime.datetime.now(), i))
        log.write("{} File: {}".format(datetime.datetime.now(), i))
        sql_file = k + "//{}".format(i)
        f = open(sql_file, 'r')
        q_string = f.read()
        for j in v:
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


log.write("End: {}\n".format(datetime.datetime.now()))
log.close()
