import os
import requests
from xlrd import open_workbook
from requests.auth import HTTPBasicAuth

header_initial = {'Authorization': '3e25ec8c-88bf-4354-bdc6-b16ae0ed4843'}
header_final = {'Authorization': 'f41d4dd0-ab4b-4d05-b931-e41c8b2cb795'}

epicor = ['business & sales', 'erp (enterprise resource planning)', 'finance & accounting', 'accounting', 'accounting automation', 'software as a service']
dropsuite = ['email', 'it management', 'storage']
tricentis = ['application development software', 'application release automation', 'software development', 'integrated development environments', 'software testing']
xant = ['technology', 'sales software', 'sales acceleration software', 'sales intelligence software']
sproutloud = ['marketing', 'channels & types', 'search marketing']
travel_pull = ['travel expenses', 'expense management', 'business travel expenses', 'incentive travel', 'travel time', 'group travel', 'travel management']

m_dict = dict()
input_list = ['Dropsuite', 'Epicor', 'Sproutloud', 'Xant', 'Tricentis', 'travel_pull']

res = open('travel_pull.txt', 'w')
wb = open_workbook(os.getcwd() + '//travel_pull.xlsx')
for sheet in wb.sheets():
    number_of_rows = sheet.nrows
    number_of_columns = sheet.ncols

    rows = []
    for row in range(1, number_of_rows):
        values = []
        for col in range(number_of_columns):
            value = (sheet.cell(row,col).value)
            try:
                value = str(int(value))
            except ValueError:
                pass
            finally:
                values.append(value)
        domain = values[0]
        postal = values[2]
        m_dict[domain] = postal

for k, v in m_dict.items():
    print(k)
    domain = k
    postal = v

    resp = requests.get('https://api3.180bytwo.com/api/v1/match?name={}&zip={}'.format(domain, postal), headers=header_initial)
    
    for body in resp.json()['body']:
        accountlink_id = body['accountlink_id']
        for topic in travel_pull:
            resp2 = requests.get('https://api3.180bytwo.com/api/v1/intent?accountLinkId={}&topic={}'.format(accountlink_id, topic), headers=header_final)
            for score in resp2.json()['body']['scores']:
                print(domain, accountlink_id, topic, score['score'])
                note = domain + '|' + accountlink_id + '|' + topic + '|' + str(score['score']) + '\n'
                res.write(note)

res.close()