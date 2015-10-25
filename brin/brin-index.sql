\timing on

drop index if exists test_brin_sorted_idx;
drop index if exists test_brin_random_idx;

create index test_brin_sorted_idx on test_brin_sorted USING brin (id) WITH (pages_per_range = :p);
create index test_brin_random_idx on test_brin_random USING brin (id) WITH (pages_per_range = :p);

vacuum analyze test_brin_sorted;
vacuum analyze test_brin_random;

\di+

