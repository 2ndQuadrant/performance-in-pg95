\timing on

\set n 50000000

create table test_text_random as select md5(i::text) AS val from generate_series(1,:n) s(i);
create table test_text_asc as select * from test_text_random order by 1;
create table test_text_desc as select * from test_text_random order by 1 desc;

create table test_text_almost_asc as select val from (
  select ((row_number() over ()) + 1000 * random()) AS row_num,
         val from test_text_asc
) foo ORDER BY row_num;

create table test_text_almost_desc as select val from (
  select ((row_number() over ()) + 1000 * random()) AS row_num,
         val from test_text_desc
) foo ORDER BY row_num;



create table test_float_random as select random() AS val from generate_series(1,:n) s(i);
create table test_float_asc as select * from test_float_random order by 1;
create table test_float_desc as select * from test_float_random order by 1 desc;

create table test_float_almost_asc as select val from (
  select ((row_number() over ()) + 1000 * random()) AS row_num,
         val from test_float_asc
) foo ORDER BY row_num;

create table test_float_almost_desc as select val from (
  select ((row_number() over ()) + 1000 * random()) AS row_num,
         val from test_float_desc
) foo ORDER BY row_num;



create table test_numeric_random as select random() AS val from generate_series(1,:n) s(i);
create table test_numeric_asc as select * from test_numeric_random order by 1;
create table test_numeric_desc as select * from test_numeric_random order by 1 desc;

create table test_numeric_almost_asc as select val from (
  select ((row_number() over ()) + 1000 * random()) AS row_num,
         val from test_numeric_asc
) foo ORDER BY row_num;

create table test_numeric_almost_desc as select val from (
  select ((row_number() over ()) + 1000 * random()) AS row_num,
         val from test_numeric_desc
) foo ORDER BY row_num;


vacuum freeze;
vacuum analyze;

\d+

\echo ------------ text random ------------

SELECT COUNT(1) FROM (SELECT * FROM test_text_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_random ORDER BY 1) foo;

\echo ------------ text asc ------------

SELECT COUNT(1) FROM (SELECT * FROM test_text_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_asc ORDER BY 1) foo;

\echo ------------ text desc ------------

SELECT COUNT(1) FROM (SELECT * FROM test_text_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_desc ORDER BY 1) foo;

\echo ------------ text almost asc ------------

SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_asc ORDER BY 1) foo;

\echo ------------ text desc ------------

SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_text_almost_desc ORDER BY 1) foo;

\echo ------------ text indexes ------------

create index on test_text_random (val);
create index on test_text_asc (val);
create index on test_text_desc (val);
create index on test_text_almost_asc (val);
create index on test_text_almost_desc (val);



\echo ------------ float random ------------

SELECT COUNT(1) FROM (SELECT * FROM test_float_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_random ORDER BY 1) foo;

\echo ------------ float asc ------------

SELECT COUNT(1) FROM (SELECT * FROM test_float_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_asc ORDER BY 1) foo;

\echo ------------ float desc ------------

SELECT COUNT(1) FROM (SELECT * FROM test_float_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_desc ORDER BY 1) foo;

\echo ------------ float almost asc ------------

SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_asc ORDER BY 1) foo;

\echo ------------ float desc ------------

SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_float_almost_desc ORDER BY 1) foo;

\echo ------------ float indexes ------------

create index on test_float_random (val);
create index on test_float_asc (val);
create index on test_float_desc (val);
create index on test_float_almost_asc (val);
create index on test_float_almost_desc (val);


\echo ------------ numeric random ------------

SELECT COUNT(1) FROM (SELECT * FROM test_numeric_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_random ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_random ORDER BY 1) foo;

\echo ------------ numeric asc ------------

SELECT COUNT(1) FROM (SELECT * FROM test_numeric_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_asc ORDER BY 1) foo;

\echo ------------ numeric desc ------------

SELECT COUNT(1) FROM (SELECT * FROM test_numeric_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_desc ORDER BY 1) foo;

\echo ------------ numeric almost asc ------------

SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_asc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_asc ORDER BY 1) foo;

\echo ------------ numeric desc ------------

SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_desc ORDER BY 1) foo;
SELECT COUNT(1) FROM (SELECT * FROM test_numeric_almost_desc ORDER BY 1) foo;

\echo ------------ numeric indexes ------------

create index on test_numeric_random (val);
create index on test_numeric_asc (val);
create index on test_numeric_desc (val);
create index on test_numeric_almost_asc (val);
create index on test_numeric_almost_desc (val);
