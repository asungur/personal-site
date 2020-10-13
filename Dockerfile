FROM phusion/passenger-ruby26:1.0.11

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# Enable Nginx (it is disabled by default)
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default

ADD app.conf /etc/nginx/sites-enabled/app.conf

WORKDIR /home/app/personal-site
COPY --chown=app:app . .

RUN gem install bundler:2.1.4

RUN bundle install

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*