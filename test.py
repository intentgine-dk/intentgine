from googlesearch import search
import os, time


input_file = open(os.getcwd() + "\\files\\input\\company_name.csv", "r", encoding='utf8')
output_file = open(os.getcwd() + "\\files\\output\\company_linkedin_url.csv", "w")

for company_name in input_file:
    print(str(company_name).strip())
    res = search("{} Linkedin -ph.linkedin.com".format(company_name))
    
    c_list = list()
    for i in res:
        if "/company/" in i:
            c_list.append(i)

    if len(c_list) != 0:
        company_linkedin_url = c_list[0]
        output_file.write("{0} | {1}\n".format(company_name.strip(), c_list[0]))

    time.sleep(2)

input_file.close()
output_file.close()
