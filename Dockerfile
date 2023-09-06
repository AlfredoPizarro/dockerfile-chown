FROM docker.io/httpd:latest

# Create a new user and group with your specified username and UID/GID
RUN groupadd -g 1001 web \
    && useradd -u 1001 -g 1001 -M -d /var/www/html -s /sbin/nologin web

USER web
EXPOSE 8080

# Entry point
ENTRYPOINT ["sleep", "infinity"]
