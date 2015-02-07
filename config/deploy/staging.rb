server 'staging.kevinmcphillips.ca', user: 'kevin', roles: %w{web app}, primary: true

set :rails_env, 'staging'
set :deploy_to, "/home/kevin/staging.kevinmcphillips.ca"
# set :branch, 'staging'

set :linked_dirs, fetch(:linked_dirs, []).push('public/system')
