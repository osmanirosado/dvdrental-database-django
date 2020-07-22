#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "dvdrental" <<-EOSQL

CREATE UNIQUE INDEX CONCURRENTLY film_actor_unique
    ON film_actor (film_id, actor_id);
ALTER TABLE film_actor
    DROP CONSTRAINT film_actor_pkey,
    ADD CONSTRAINT film_actor_unique UNIQUE USING INDEX film_actor_unique,
    ADD COLUMN film_actor_id SERIAL PRIMARY KEY;

CREATE UNIQUE INDEX CONCURRENTLY film_category_unique
    ON film_category (film_id, category_id);
ALTER TABLE film_category
    DROP CONSTRAINT film_category_pkey,
    ADD CONSTRAINT film_category_unique UNIQUE USING INDEX film_category_unique,
    ADD COLUMN film_category_id SERIAL PRIMARY KEY;

EOSQL
