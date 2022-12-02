FROM bitnami/git:2.38.1
RUN mkdir -p /opt/installer
WORKDIR /opt/installer
COPY builder.sh /opt/installer/
COPY test.txt /opt/installer/
# create moodle with its plugins
RUN ./builder.sh

FROM moodlehq/moodle-php-apache:7.4
COPY --from=0 /opt/installer/moodle /var/www/html


