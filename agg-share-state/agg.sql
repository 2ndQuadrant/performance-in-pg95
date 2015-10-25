\timing on

CREATE TABLE test_aggregates  (a BIGINT);
INSERT INTO test_aggregates  SELECT i FROM generate_series(1,50000000) s(i);

VACUUM FREEZE;
ANALYZE;

SELECT SUM(a), AVG(a) FROM test_aggregates;
SELECT SUM(a), AVG(a) FROM test_aggregates;
SELECT SUM(a), AVG(a) FROM test_aggregates;

DROP TABLE test_aggregates;

CREATE TABLE test_aggregates  (a NUMERIC);
INSERT INTO test_aggregates  SELECT i FROM generate_series(1,50000000) s(i);

VACUUM FREEZE;
ANALYZE;

SELECT SUM(a), AVG(a) FROM test_aggregates;
SELECT SUM(a), AVG(a) FROM test_aggregates;
SELECT SUM(a), AVG(a) FROM test_aggregates;

