#!/usr/bin/python
# Reducer Part
from operator import itemgetter
import sys

dict_ip_count = {}

for line in sys.stdin:
  line = line.strip()
  ip, num = line.split('\t')
  try:
    num = int(num)
    dict_ip_count[ip] = dict_ip_count.get(ip, 0) + num
    except ValueError:
      pass

sorted_dict_ip_count = sorted(dict_ip_count.items(), key=itemgetter(0))

hour_flg = ''
dict_hr = {}

for hour_ip, count in sorted_dict_ip_count:

hour = hour_ip[:7]

ip = hour_ip[7:]

if not dict_hr.get(hour):
dict_hr[hour] = ({hour_ip: count})
else: dict_hr[hour].update({hour_ip: count})


for hour in sorted(dict_hr.keys()):
ips_in_current_hr = sorted(dict_hr[hour].items(), key=itemgetter(1), reverse=True)

print 'These are the top 3 IPs at %s' % (hour)

for i in range(0,3):
  x = ' -> '.join(str(v) for v in ips_in_current_hr[i])
  print x
  print '\n\n'
