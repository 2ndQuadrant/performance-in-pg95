\echo ------------ m=:m n=:n ------------

drop table if exists test_dim;
drop table if exists test_fact;

create table test_dim  as select (i-1) AS id, md5(i::text) AS val from generate_series(1,:m) s(i);
create table test_fact as select mod(i,:m) AS dim_id, md5(i::text) AS val from generate_series(1,:n) s(i);

vacuum freeze;
analyze;

\d+

explain select count(*) from test_fact join test_dim on (dim_id = id);

select count(*) from test_fact join test_dim on (dim_id = id);
select count(*) from test_fact join test_dim on (dim_id = id);

\timing on
select count(*) from test_fact join test_dim on (dim_id = id);

\timing off

