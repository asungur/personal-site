# See https://github.com/phusion/passenger-docker/blob/master/CHANGELOG.md for
# a list of version numbers.
FROM phusion/passenger-ruby26:6.0.6

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default

ADD nginx/personal-site.conf /etc/nginx/sites-enabled/personal-site.conf

RUN mkdir /home/app/personal-site
COPY --chown=app:app . .

RUN bundle install --without development test

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*