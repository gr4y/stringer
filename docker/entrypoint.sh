# Install bundler
gem install bundler

# If the bundle is already was executed, skip this step
if [! -e ".bundle" ]; then
  bundle install
fi

# run migrations
rake db:migrate

# install foreman
if [ -e "Procfile" ]; then
  gem install foreman
fi

# start foreman
foreman start
