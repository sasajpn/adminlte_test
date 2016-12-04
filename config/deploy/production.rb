role :app, %w{ sasahara@www.sasa97.biz }
role :web, %w{ sasahara@www.sasa97.biz }
role :db,  %w{ sasahara@www.sasa97.biz }

set :ssh_options, {
  port: '9724',
  keys: File.expand_path('~/.ssh/id_rsa'),
}
