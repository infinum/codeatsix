load 'deploy/assets'
require 'bundler/capistrano'

host = "codeatsix.infinum.co"

set :application, "codeatsix.infinum.co"
set :repository,  "git@github.com:infinum/codeatsix.git"
set :deploy_to, "/home/legacy/www/c/codeatsix.infinum.co" 

set :scm, :git
set :user, "legacy"
set :use_sudo, false
set :port, 22219

set :branch, "master"
set :deploy_via, :remote_cache

ssh_options[:forward_agent] = true

role :web, host
role :app, host 
role :db,  host, :primary => true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    run "ln -s #{File.join(shared_path,'database.yml')} #{File.join(current_path,'config','database.yml')}"
  end
end
