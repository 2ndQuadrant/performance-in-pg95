# build tables
psql test < brin.sql > brin.log 2>&1
d=60

# first brin indexes
for p in 1 4 8 16 32 64 96 128 256; do

	# re-create BRIN indexes with 'p' pages per range
	psql test -v p=$p < brin-index.sql > indexes-$p.log 2>&1;

	# generate EXPLAIN
	psql test < brin-explain.sql > explain-$p.log 2>&1

	# warmup on sorted table
	pgbench -n -c 4 -T $d test -f brin-sorted.sql > warmup-sorted-$p.log 2>&1

	# benchmark on sorted table
	pgbench -n -c 4 -T $d test -f brin-sorted.sql > benchmark-sorted-$p.log 2>&1

	# warmup on random table
	pgbench -n -c 4 -T $d test -f brin-random.sql > warmup-random-$p.log 2>&1

	# benchmark on random table
	pgbench -n -c 4 -T $d test -f brin-random.sql > benchmark-random-$p.log 2>&1

done

# now btree index
psql test < brin-btree-index.sql > brin-btree.log 2>&1;

# generate EXPLAIN
psql test < brin-explain.sql > explain-btree.log 2>&1

# warmup on sorted table
pgbench -n -c 4 -T $d test -f brin-sorted.sql > warmup-sorted-btree.log 2>&1

# benchmark on sorted table
pgbench -n -c 4 -T $d test -f brin-sorted.sql > benchmark-sorted-btree.log 2>&1

# warmup on random table
pgbench -n -c 4 -T $d test -f brin-random.sql > warmup-random-btree.log 2>&1

# benchmark on random table
pgbench -n -c 4 -T $d test -f brin-random.sql > benchmark-random-btree.log 2>&1
