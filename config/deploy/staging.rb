server '10.10.10.89', :app, :web, :db, primary: true
ssh_options[:keys] = ["~/.ssh/id_rsa"]

set :user,        'deployer'
set :group,       'staff'

set :branch,      'origin/stage'
set :deploy_to,   "/home/#{user}/apps/#{stage}.#{application}"
set :unicorn_env, 'staging'