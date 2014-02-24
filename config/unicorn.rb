# Set environment to development unless something else is specified.

env = ENV['RAILS_ENV'] || 'development'

# See http://unicorn.bogomips.org/Unicorn/Configurator.html for documentation
worker_processes 4

# listen on both a Unix domain socket and a TCP port,
# we use a shorter backlog for quicker failover when busy
listen '/tmp/regionalindicators.socket', backlog: 64
listen 8081

# Preload our app for more specified
preload_app true

# shut down workers after 30 seconds instead of the default 60
timeout 30

pid '/tmp/unicorn.regionalindicators.pid'

# Production-specific settings
if env == 'production'
  # Help ensure your application will always spawn in the
  # symlinked 'current' directory that Capistrano sets up
  working_directory '/home/deployer/apps/staging.regionalindicators.org/current'

  # feel free to point this anywhere accessible on the filesystem
  user 'deployer', 'staff'
  shared_path = '/home/deployer/apps/staging.regionalindicators.org/shared'

  stderr_path "#{shared_path}/log/unicorn.stderr.log"
  stdout_path "#{shared_path}/log/unicorn.stdout.log"
end

before_fork do |server, worker|
  # the following is highly recommended for Rails + 'preload_app true'
  # as there's no need for the master process to hold a connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  # Before forking, kill the master process that belongs to the
  # .oldbin PID. This enables 0 downtime deploys
  old_pid = '/tmp/unicorn.regionalindicators.pid.oldbin'

  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  # the following is *required* for Rails + 'preload_app true',
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end

  
  begin
    uid, gid = Process.euid, Process.egid
    user, group = 'deployer', 'staff'
    target_uid = Etc.getpwnam(user).uid
    target_gid = Etc.getgrnam(group).gid
    worker.tmp.chown(target_uid, target_gid)
    if uid != target_uid || gid != target_gid
      Process.initgroups(user, target_gid)
      Process::GID.change_privilege(target_gid)
      Process::UID.change_privilege(target_uid)
    end
  rescue => e
    if RAILS_ENV == 'development'
      STDERR.puts "couldn't change user, oh well"
    else
      raise e
    end
  end


  # if preload_app is true, then you may also want to check and restart
  # any other shared sockets/descriptors such as Memcached and Redis.
  # TokyoCabinet file handles are safe to reuse between any number of
  # forked children (assuming your kernel correctly implements
  # pread()/prwrite() system calls)
end