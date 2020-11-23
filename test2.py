import os
import time
from func import db
from googlesearch import search

cursor, connection = db.rds_connect("aurora")

query_search =  """
                select 
                    company_name 
                    from public.search_linkedin 
                    where 
                company_linkedin_url is null limit 5;
                """
cursor.execute(query_search)
result = cursor.fetchall()

output_file = open(os.getcwd() + "\\files\\output\\company_linkedin_url.csv", "w")

for res in result:
    c_list = list()
    company_name = str(res[0])
    print(company_name)
    search_results = search("{} Linkedin -ph.linkedin.com".format(company_name))
    print(search_results)

    for linkedin_url in search_results:
        if "linkedin.com/company/" in linkedin_url:
            c_list.append(linkedin_url)

    if len(c_list) != 0:
        company_linkedin_url = c_list[0]
        output_file.write("{0} | {1}\n".format(company_name.strip(), c_list[0]))
    
    '''
    query_update =  """
                    update public.search_linkedin as t1
                    set company_linkedin_url = {0}
                    where
                        company_linkedin_url is null
                        and company_name = {1}
                    """.format(company_linkedin_url, company_name)

    cursor.execute(query_update)
    '''
    time.sleep(2)
    