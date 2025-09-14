FROM mysql:9.4.0

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=sakila
ENV MYSQL_USER=sakila
ENV MYSQL_PASSWORD=sakila

# Copy Sakila database files
COPY sakila-db/sakila-schema.sql /docker-entrypoint-initdb.d/01-sakila-schema.sql
COPY sakila-db/sakila-data.sql /docker-entrypoint-initdb.d/02-sakila-data.sql

# Custom configuration for better compatibility
COPY mysql.cnf /etc/mysql/conf.d/sakila.cnf

EXPOSE 3306

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=60s --retries=3 \
    CMD mysqladmin ping -h localhost -u root -p$MYSQL_ROOT_PASSWORD || exit 1