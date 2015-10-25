\d+

create or replace function cheap_func(bigint, int)
    returns bool
    parallel safe
as $$
begin
    return mod($1,100) < $2;
end;
$$ language plpgsql;

create or replace function expensive_func(numeric, numeric)
    returns bool
    parallel safe
as $$
declare
    t numeric;
begin
    t := ((($1 * $1) / 100.0) * 1000.0) / $1;
    return ($1 < $2);
end;
$$ language plpgsql;

create or replace function very_expensive_func(numeric, numeric)
    returns bool
    parallel safe
as $$
declare
    t numeric;
begin
    t := pow(10, 50);
    return ($1 < $2);
end;
$$ language plpgsql;

\timing on

\echo ------------ cheap func ------------

set max_parallel_degree = 0;

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);

set max_parallel_degree = 1;

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);


set max_parallel_degree = 2;

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);

set max_parallel_degree = 3;

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);

set max_parallel_degree = 4;

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);

set max_parallel_degree = 5;

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 1);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 5);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 10);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 25);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 50);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 75);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 90);

SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);
SELECT COUNT(*) FROM test_parallel WHERE cheap_func(a, 100);


\echo ------------ expensive func ------------

set max_parallel_degree = 0;

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);

set max_parallel_degree = 1;

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);


set max_parallel_degree = 2;

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);

set max_parallel_degree = 3;

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);

set max_parallel_degree = 4;

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);

set max_parallel_degree = 5;

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.01);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.05);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.10);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.25);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.50);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.75);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 0.90);

SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE expensive_func(a, 1.00);


\echo ------------ very expensive func ------------

set max_parallel_degree = 0;

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);

set max_parallel_degree = 1;

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);


set max_parallel_degree = 2;

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);

set max_parallel_degree = 3;

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);

set max_parallel_degree = 4;

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);

set max_parallel_degree = 5;

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.01);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.05);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.10);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.25);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.50);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.75);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 0.90);

SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);
SELECT COUNT(*) FROM test_parallel WHERE very_expensive_func(a, 1.00);

