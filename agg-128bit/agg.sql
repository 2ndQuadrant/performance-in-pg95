
CREATE TABLE test_aggregates (a BIGINT, b BIGINT);
INSERT INTO test_aggregates SELECT i, i FROM generate_series(1,50000000) s(i);

VACUUM FREEZE test_aggregates;
ANALYZE test_aggregates;

\timing on

SELECT SUM(a), AVG(b) FROM test_aggregates;
SELECT SUM(a), AVG(b) FROM test_aggregates;
SELECT SUM(a), AVG(b) FROM test_aggregates;
SELECT SUM(a), AVG(b) FROM test_aggregates;
SELECT SUM(a), AVG(b) FROM test_aggregates;
SELECT SUM(a), AVG(b) FROM test_aggregates;
SELECT SUM(a), AVG(b) FROM test_aggregates;
SELECT SUM(a), AVG(b) FROM test_aggregates;
