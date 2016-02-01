#/bin/bash
#统计/usr/local/nagios/etc/objects/hosts目录下所有cfg文件监控主机的IP
#以方便校对

MonitorHostDir=/usr/local/nagios/etc/objects/hosts
HostNames=`/bin/ls -l $MonitorHostDir|grep -v "总用量"|awk '{print $9}'`

for i in $HostNames
do
	IP=`cat $MonitorHostDir/$i |grep address|awk '{print $2}'`
	echo "$i-----$IP"	
done
