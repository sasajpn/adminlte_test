application = '/var/www/adminlte_test'

worker_processes 2
working_directory "#{application}/current"

listen "#{application}/shared/tmp/sockets/unicorn.sock"
timeout 30
pid "#{application}/shared/tmp/pids/unicorn.pid"

stderr_path "#{application}/shared/log/unicorn.stderr.log"
stdout_path "#{application}/shared/log/unicorn.stdout.log"

preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      Process.kill "QUIT", File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
