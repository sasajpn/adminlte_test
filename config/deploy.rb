lock '3.6.1'

set :application, 'adminlte_test'
set :repo_url, 'https://github.com/sasajpn/adminlte_test.git'

set :branch, ENV['BRANCH'] || 'master'

set :deploy_to, '/var/www/adminlte_test'

set :linked_files, %w{.env config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}

set :keep_releases, 5

set :rbenv_ruby, '2.3.1'
set :rbenv_type, :system

set :log_level, :debug

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end

  after :publishing, :restart
end
