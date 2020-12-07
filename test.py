import requests
import json
from bs4 import BeautifulSoup
from func import db

cursor, connection = db.rds_connect("aurora")
query_search =  """
                select 
                    company_name
                from public.search_linkedin
                where
                    company_linkedin_url is null
                limit 1
                """
cursor.execute(query_search)
result = cursor.fetchall()


for res in result:
    print(res[0])
    company = str(res[0]).replace(' ', '%20')
    query = 'site:linkedin.com/company/ AND "{}"'.format(company)
    #headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36'}
    headers = {'User-Agent': 'My User Agent 1.0'}
    url = 'https://www.google.com/search?q=' + query
    resp = requests.get(url, headers=headers)

    #print(resp.content)
    #json_text = json.dumps(str(resp.content.text))
    print(json.dumps(resp.text))
    '''
    soup = BeautifulSoup(resp.content, "html.parser")
    print(soup)
    for searchWrapper in soup.find_all('h3', {'class':'r'}):
        print(searchWrapper)
        url = searchWrapper.find('a')["href"]
        print(url)

       
        query_update =  """
                        update public.search_linkedin as t1 
                        set company_linkedin_url = \'{}\' 
                        where 
                            company_linkedin_url is null 
                            and upper(trim(company_name)) = \'{}\'
                        """.format(company_linkedin_url, company_name)
        cursor.execute(query_update)
        connection.commit()
        '''        