\timing on

set enable_seqscan = off;
set enable_indexscan = off;

\set n 100000000
\set m 100000
\set k 100

drop table if exists test_bitmap;

create table test_bitmap as select mod(i,:m) AS val from generate_series(1,:n) s(i);
create index test_bitmap_idx on test_bitmap(val);

vacuum freeze;
analyze;

\d+
\di+

explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (   5*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  10*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  15*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  20*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  25*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  30*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  35*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  40*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  45*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  50*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  55*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  60*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  65*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  70*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  75*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  80*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  95*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 200*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 300*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 400*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 500*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 600*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 700*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 800*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 900*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

drop index test_bitmap_idx;
create index test_bitmap_idx on test_bitmap using brin(val);

analyze;

\di+

explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (   5*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  10*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  15*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  20*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  25*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  30*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  35*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  40*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  45*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  50*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  55*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  60*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  65*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  70*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  75*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  80*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  95*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 200*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 300*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 400*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 500*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 600*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 700*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 800*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 900*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

drop index test_bitmap_idx;
create index test_bitmap_idx on test_bitmap using brin(val) WITH (pages_per_range = 1);

analyze;

\di+

explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (   5*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  10*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  15*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  20*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  25*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  30*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  35*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  40*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  45*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  50*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  55*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  60*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  65*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  70*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  75*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  80*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  95*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 200*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 300*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 400*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 500*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 600*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 700*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 800*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 900*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

drop index test_bitmap_idx;
create index test_bitmap_idx on test_bitmap using brin(val) WITH (pages_per_range = 4);

analyze;

\di+

explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (   5*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  10*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  15*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  20*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  25*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  30*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  35*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  40*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  45*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  50*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  55*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  60*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  65*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  70*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  75*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  80*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  95*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 200*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 300*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 400*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 500*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 600*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 700*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 800*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 900*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

drop index test_bitmap_idx;
create index test_bitmap_idx on test_bitmap using brin(val) WITH (pages_per_range = 8);

analyze;

\di+

explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (   5*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  10*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  15*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  20*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  25*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  30*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  35*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  40*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  45*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  50*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  55*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  60*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  65*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  70*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  75*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  80*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  95*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 200*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 300*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 400*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 500*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 600*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 700*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 800*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 900*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

drop index test_bitmap_idx;
create index test_bitmap_idx on test_bitmap using brin(val) WITH (pages_per_range = 16);

analyze;

\di+

explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (   5*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  10*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  15*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  20*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  25*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  30*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  35*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  40*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  45*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  50*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  55*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  60*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  65*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  70*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  75*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  80*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  95*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 200*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 300*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 400*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 500*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 600*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 700*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 800*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 900*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

drop index test_bitmap_idx;
create index test_bitmap_idx on test_bitmap using brin(val) WITH (pages_per_range = 32);

analyze;

\di+

explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (   5*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  10*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  15*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  20*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  25*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  30*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  35*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  40*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  45*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  50*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  55*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  60*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  65*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  70*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  75*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  80*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  95*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 200*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 300*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 400*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 500*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 600*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 700*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 800*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 900*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

drop index test_bitmap_idx;
create index test_bitmap_idx on test_bitmap using brin(val) WITH (pages_per_range = 64);

analyze;

\di+

explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
explain SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

SELECT COUNT(*) FROM test_bitmap WHERE val <= (   1*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (   5*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  10*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  15*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  20*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  25*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  30*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  35*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  40*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  45*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  50*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  55*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  60*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  65*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  70*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  75*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  80*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (  95*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 100*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 200*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 300*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 400*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 500*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 600*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 700*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 800*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= ( 900*:k);
SELECT COUNT(*) FROM test_bitmap WHERE val <= (1000*:k);

