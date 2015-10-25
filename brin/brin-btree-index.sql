\timing on

drop index if exists test_brin_sorted_idx;
drop index if exists test_brin_random_idx;

create index test_brin_sorted_idx on test_brin_sorted (id);
create index test_brin_random_idx on test_brin_random (id);

vacuum analyze test_brin_sorted;
vacuum analyze test_brin_random;

\di+

