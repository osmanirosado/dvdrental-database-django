FROM osmanirosado/dvdrental-database:2019.05

# Postgres docker image documentation fragment:
# "... initialization files will be executed in sorted name order as defined by the current locale, ..."
COPY 02-replace-composite-primary-keys.sh /docker-entrypoint-initdb.d/
