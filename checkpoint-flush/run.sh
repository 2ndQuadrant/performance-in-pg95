export PATH=/home/postgres/pg-test/bin:$PATH

WARMUP_TIME=1800
BENCH_TIME=3600
DATADIR=/mnt/data/pgdata

pg_ctl -D $DATADIR -l pg.log -w restart > /dev/null 2>&1;

for flushing in off on; do

	for sorting in off on; do

		echo `date +%s` [`date +"%Y/%m/%d %H:%M:%S"`] "sort=$sorting flush=$flushing"

		outdir="flush-$flushing-sort-$sorting";
		mkdir $outdir;

		psql postgres -c "ALTER SYSTEM SET checkpoint_sort = $sorting" > /dev/null;
		psql postgres -c "ALTER SYSTEM SET checkpoint_flush_to_disk = $flushing" > /dev/null;

		pg_ctl -D $DATADIR -l $outdir/pg.log -w restart > /dev/null 2>&1;

		psql postgres -c "SHOW checkpoint_sort" > $outdir/config.txt 2>&1;
		psql postgres -c "SHOW checkpoint_flush_to_disk" >> $outdir/config.txt 2>&1;

		for scale in 50 200 3000; do

			echo `date +%s` [`date +"%Y/%m/%d %H:%M:%S"`] "  scale=$scale"

			stimestamp=`date +%s`

			mkdir "$outdir/$scale"

			dropdb --if-exists test;
			createdb test;

			sleep 10;

			echo `date +%s` [`date +"%Y/%m/%d %H:%M:%S"`] "    initializing"
			pgbench -i -s $scale test > $outdir/$scale/bench.log 2>&1

			# warmup (1h)

			echo `date +%s` [`date +"%Y/%m/%d %H:%M:%S"`] "    warmup"
			psql test -c CHECKPOINT  >> $outdir/$scale/bench.log 2>&1
			pgbench -c 4 -T $WARMUP_TIME test > $outdir/$scale/warmup.log 2>&1

			# benchmark (2h), regular read-write bench

			echo `date +%s` [`date +"%Y/%m/%d %H:%M:%S"`] "    regular benchmark"
			psql test -c CHECKPOINT  >> $outdir/$scale/bench.log 2>&1
			pgbench -c 4 -T $BENCH_TIME -l --aggregate-interval=1 test > $outdir/$scale/pgbench.log 2>&1

			mv pgbench_log.* $outdir/$scale/pgbench.translog

			# benchmark (2h), small subset of active data

			echo `date +%s` [`date +"%Y/%m/%d %H:%M:%S"`] "    exponential benchmark"
			pgbench -c 4 -T $BENCH_TIME -f exponential.sql -l --aggregate-interval=1 test > $outdir/$scale/pgbench.exponential.log 2>&1

			mv pgbench_log.* $outdir/$scale/pgbench.exponential.translog

                        # benchmark (2h), small subset of active data

                        echo `date +%s` [`date +"%Y/%m/%d %H:%M:%S"`] "    gaussian benchmark"
                        pgbench -c 4 -T $BENCH_TIME -f gaussian.sql -l --aggregate-interval=1 test > $outdir/$scale/pgbench.gaussian.log 2>&1

                        mv pgbench_log.* $outdir/$scale/pgbench.gaussian.translog

			etimestamp=`date +%s`

			# collect stats from sar
			sh collect-sar.sh $stimestamp $etimestamp $outdir/$scale

		done

	done

done
