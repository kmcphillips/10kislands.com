lock '3.3.5'

set :application, '10kislands.com'
set :repo_url, 'git://github.com/kmcphillips/10kislands.com.git'
set :scm, :git
set :format, :pretty
set :log_level, :debug
set :keep_releases, 5
set :default_stage, "production"

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end
