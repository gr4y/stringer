FROM ruby:2.3-slim

# Install needed Linux packages
RUN apt-get update && apt-get install -y git libxml2-dev libxslt-dev libcurl4-openssl-dev libpq-dev libsqlite3-dev build-essential postgresql libreadline-dev

# Define the application working directory inside the image
ENV APP_ROOT /data

# set the working directory
WORKDIR $APP_ROOT

# Install bundler
RUN gem install bundler
RUN gem install clockwork

# Install all ruby gems
RUN bundle install

# Copy the application into place
COPY . /data

# Expose the 'config'-directory as a volume, to be able to tweak things
VOLUME ["/data/config"]

# start foreman
CMD [ "foreman start" ]
