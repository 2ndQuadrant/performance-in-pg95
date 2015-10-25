\set scale 250
\set n 1000000*:scale

drop table if exists test_brin_sorted;
drop table if exists test_brin_random;

create table test_brin_sorted as select id, md5(id::text) AS val from generate_series(1,(:n)) s(id);
create table test_brin_random as select (:n * random())::int as id, md5(random()::text) AS val from test_brin_sorted;

vacuum freeze;
analyze;

checkpoint;

\d+
