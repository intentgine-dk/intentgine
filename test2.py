import os
import datetime

print(datetime.datetime.now())

log = open(os.getcwd() + '//log_file.txt', 'a')
log.write("dt: {}".format(datetime.datetime.now()))
log.close