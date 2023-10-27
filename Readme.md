# DVD Rental Database

Modify DVD Rental Database.

## Problem

Django does not support composite primary keys.

## Solution

Replace each composite primary key by a unique together constraint and a simple auto increment surrogate key. 

See `02-replace-composite-primary-keys.sh`.

## Build

```shell script
docker build -t osmanirosado/dvdrental-database-django:2019.05 .
```

## References

- [PostgreSQL UNIQUE Constraint](https://www.postgresqltutorial.com/postgresql-unique-constraint/)
- [Drop primary key without dropping an index](https://dba.stackexchange.com/questions/103074/drop-primary-key-without-dropping-an-index)
