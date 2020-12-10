import os
import time
from func import db
from googlesearch import search

cursor, connection = db.rds_connect("aurora")

query_search =  """
                select 
                    company_name 
                from ig_test.req_linkedin
                where
                    company_linkedin_url is null
                """
cursor.execute(query_search)
result = cursor.fetchall()

for res in result:
    c_list = list()
    company_name = str(res[0]).replace("'", "''")
    print(company_name)
    search_results = search("{} Linkedin -ph.linkedin.com".format(company_name), tld='com', start=0, stop=5, pause=10.0)

    for linkedin_url in search_results:
        if "linkedin.com/company/" in linkedin_url:
            c_list.append(linkedin_url)

    if len(c_list) != 0:
        company_linkedin_url = c_list[0]
        print(company_linkedin_url)
        query_update =  """
                        update ig_test.req_linkedin as t1 
                        set company_linkedin_url = \'{}\' 
                        where 
                            company_linkedin_url is null 
                            and upper(trim(company_name)) = \'{}\'
                        """.format(company_linkedin_url, company_name)
        cursor.execute(query_update)
        connection.commit()
    else:
        query_update =  """
                        update ig_test.req_linkedin as t1 
                        set company_linkedin_url = 'Null' 
                        where 
                            company_linkedin_url is null 
                            and upper(trim(company_name)) = \'{}\'
                        """.format(company_name)
        cursor.execute(query_update)
        connection.commit()