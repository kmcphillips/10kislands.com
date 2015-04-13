server 'staging.kevinmcphillips.ca', user: 'kevin', roles: %w{web app}, primary: true

set :rails_env, 'staging'
set :deploy_to, "/home/kevin/staging.kevinmcphillips.ca"
