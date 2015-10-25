dropdb test
createdb test
psql test < sort-50.sql > sort-50.patched.log 2>&1

dropdb test
createdb test
psql test < sort-5.sql > sort-5.patched.log 2>&1
