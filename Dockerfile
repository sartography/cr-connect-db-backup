FROM postgres:alpine

# Install Supervisor, which will make sure cron starts and runs
RUN apk add --no-cache supervisor

# Copy over Supervisor configuration file
RUN mkdir /etc/supervisor.d
COPY postgres_cron.ini /etc/supervisor.d/postgres_cron.ini

# TODO: Copy over crond config file
# TODO: Copy over .pgpass file
# TODO: Inject environment variables for pg_dump

# Start Supervisor
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
