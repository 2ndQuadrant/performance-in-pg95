#!/bin/sh

stimestamp=$1
etimestamp=$2
outdir=$3

sdate=`date -d "@$stimestamp"`
edate=`date -d "@$etimestamp"`

sday=`date -d "$sdate" +%d`
eday=`date -d "$edate" +%d`

while true; do

        # two-char format
        d=$(printf "%02d" $sday)

        # paging statistics
        sadf -d -- -B /var/log/sa/sa$d >> sar.paging.data

        # i/o stats
        sadf -d -- -b /var/log/sa/sa$d >> sar.io.data

        # block devices
        sadf -d -- -d -p /var/log/sa/sa$d >> sar.devices.data

        # network stats
        sadf -d -- -n ALL /var/log/sa/sa$d >> sar.network.data

        # per-cpu stats
        sadf -d -- -P ALL /var/log/sa/sa$d >> sar.cpudetails.data

        # cpu utilization
        sadf -d -- -u ALL /var/log/sa/sa$d >> sar.cpu.data

        # queueing stats
        sadf -d -- -q  /var/log/sa/sa$d >> sar.queues.data

        # memory statistics
        sadf -d -- -R /var/log/sa/sa$d >> sar.memstats.data

        # memory utilization
        sadf -d -- -r /var/log/sa/sa$d >> sar.memutil.data

        # swap stats
        sadf -d -- -S /var/log/sa/sa$d >> sar.swap.data

        # swapping stats
        sadf -d -- -W /var/log/sa/sa$d >> sar.swapstats.data

        # task creation / context switching
        sadf -d -- -w /var/log/sa/sa$d >> sar.tasks.data

        # stop the loop if this was the last day
        if [ "$sday" -eq "$eday" ]; then
               	break;
        fi

        sdate=`date -d "$sdate + 1 day"`
        sday=`date -d "$sdate" +%d`

done

tar -czf $outdir/sar.tgz sar.* > /dev/null 2>&1
rm sar.*
