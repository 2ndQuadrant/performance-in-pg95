psql test -c "select extract(epoch from now())::int, now(), pg_current_xlog_location(), pg_current_xlog_insert_location()" >> pg.xlog.log 2> /dev/null
psql test -c "select extract(epoch from now())::int, now(), * from pg_stat_bgwriter" >> pg.bgwriter.log 2> /dev/null

while true; do

	sleep 1;

	psql test -t -c "select extract(epoch from now())::int, now(), pg_current_xlog_location(), pg_current_xlog_insert_location()" >> pg.xlog.log 2> /dev/null
	psql test -t -c "select extract(epoch from now())::int, now(), * from pg_stat_bgwriter" >> pg.bgwriter.log 2> /dev/null

done
