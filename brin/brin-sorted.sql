\set scale 250
\set m 1000000 * :scale
\setrandom id 1 :m

SELECT * FROM test_brin_sorted WHERE id = :id;

