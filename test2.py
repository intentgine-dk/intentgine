import os

enrich_list = ['ig_enrich1.company_enrich', 'ig_enrich2.company_enrich', 'ig_enrich3.company_enrich', 'ig_enrich_rl1.company_enrich', 'ig_enrich_rl2.company_enrich', 'ig_enrich_rl3.company_enrich', 'ig_enrich_rl4.company_enrich', 'ig_enrich_drl1.company_enrich', 'ig_enrich_drl2.company_enrich', 'ig_enrich_drl3.company_enrich', 'ig_enrich_drl4.company_enrich', 'ig_enrich_ops.company_enrich', 'ig_test.enrich_api_b2', 'ig_test.enrich_api_b3', 'ig_test.enrich_api_b4']
netwise_list = ['ig_ingestion.alteryx_netwise_q3_b1', 'ig_ingestion.alteryx_netwise_q3_b2', 'ig_ingestion.alteryx_raw_netwise', 'ig_vendor.dv01wn_q4_refresh']
alteryx_list = ['ig_ingestion.alteryx_production']

enrich_dir = os.getcwd() + "//query//database_update//enrichment_source"
netwise_dir = os.getcwd() + "//query//database_update//netwise_source"
alteryx_dir = os.getcwd() + "//query//database_update//alteryx_source"

title_dict = {
    enrich_dir: enrich_list, 
    netwise_dir: netwise_list, 
    alteryx_dir: alteryx_list
}

for k, v in title_dict.items():
    for i in os.listdir(k):
        sql_file = k + "//{}".format(i)
        f = open(sql_file, 'r')
        q_string = f.read()
        print(q_string)