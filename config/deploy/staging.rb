server '10.10.10.89', :app, :web, :db, primary: true

set :user,      'deployer'
set :group,     'admin'

set :branch,    'origin/master'
set :deploy_to, "/home/#{user}/apps/#{stage}.#{application}"