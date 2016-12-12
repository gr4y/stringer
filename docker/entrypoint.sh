#!/bin/bash

# run migrations
$(which rake) db:migrate

# install foreman
if [ -e "Procfile" ]; then
  $(which gem) install foreman
fi

$(which bundle) exec unicorn -p 5000 -c ./config/unicorn.rb
