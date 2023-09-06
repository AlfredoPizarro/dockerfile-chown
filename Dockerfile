FROM docker.io/httpd:latest

# Create a new user and group with your specified username and UID/GID
RUN groupadd -g 1001 web \
    && useradd -u 1001 -g 1001 -M -d /var/www/html -s /sbin/nologin web

# Change ownership of the web server directory to the new user
RUN chown -R web:web /usr/local/apache2/htdocs

# Optionally, you can copy your custom HTML files to the web server directory
 COPY ./files/index.html /usr/local/apache2/htdocs

# Specify the user to run Apache HTTP Server
USER web
EXPOSE 8080

# Entry point
ENTRYPOINT ["sleep", "infinity"]
