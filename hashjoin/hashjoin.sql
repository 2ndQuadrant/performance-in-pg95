set enable_nestloop = off;
set enable_mergejoin = off;

--------------------------------------------------------------------------------

\set n 5000000

\set m 10000
\i hashjoin-inner.sql

\set m 50000
\i hashjoin-inner.sql

\set m 100000
\i hashjoin-inner.sql

\set m 200000
\i hashjoin-inner.sql

\set m 400000
\i hashjoin-inner.sql

\set m 600000
\i hashjoin-inner.sql

\set m 800000
\i hashjoin-inner.sql

\set m 1000000
\i hashjoin-inner.sql

\set m 1500000
\i hashjoin-inner.sql

\set m 2000000
\i hashjoin-inner.sql

--------------------------------------------------------------------------------

\set n 50000000

\set m 10000
\i hashjoin-inner.sql

\set m 50000
\i hashjoin-inner.sql

\set m 100000
\i hashjoin-inner.sql

\set m 200000
\i hashjoin-inner.sql

\set m 400000
\i hashjoin-inner.sql

\set m 600000
\i hashjoin-inner.sql

\set m 800000
\i hashjoin-inner.sql

\set m 1000000
\i hashjoin-inner.sql

\set m 1500000
\i hashjoin-inner.sql

\set m 2000000
\i hashjoin-inner.sql
