FROM ruby:2.3-slim

# Install needed Linux packages
RUN apt-get update && apt-get install -y git libxml2-dev libxslt-dev libcurl4-openssl-dev libpq-dev libsqlite3-dev build-essential postgresql libreadline-dev

# Define the application working directory inside the image
ENV APP_ROOT /data
ENV RACK_ENV development

# Copy the application into place
COPY . $APP_ROOT

# set the working directory
WORKDIR $APP_ROOT
# Expose the 'config'-directory as a volume, to be able to tweak things
VOLUME ["/data/config"]

# Expose Port 5000
EXPOSE 5000

# start foreman
CMD [ "/data/docker/entrypoint.sh" ]
