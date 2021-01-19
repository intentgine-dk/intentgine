import os
import glob
import pandas as pd

path = 'D://Werk//Rejects Backtrack - IM HIMSS-20210112T230905Z-001//Rejects Backtrack - IM HIMSS'
for root, dirs, files in os.walk(path):
    for filename in files:
        data = pd.read_csv(path + '//' + filename)
        if 'Email' in data.columns:
            for j in data['Email']:
                if str(j) != 'nan':
                    print(str(j).lower())
