require 'deprec'

#72.32.249.98
#ns1.slicehost.net.
#http://ip-address.comjuice.com/browse/ip/72.32.249.98

set :application, "smallclouds"
set :domain, "174.143.214.111:2222"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :deploy_via, :copy

set :user, 'root'
set :sudo, 'sudo -p Password:'

set :runner, user

set :svn_username, 'gretch'
set :svn_password, 'zkfqob'

set :repository, "http://git.gitorious.org/articley/articley.git"

set :ruby_vm_type,      :ree        # :ree, :mri
set :web_server_type,   :apache     # :apache, :nginx
set :app_server_type,   :passenger  # :passenger, :mongrel
set :db_server_type,    :postgresql      # :mysql, :postgresql, :sqlite

# set :packages_for_project, %w(libmagick9-dev imagemagick libfreeimage3) # list of packages to be installed
# set :gems_for_project, %w(rmagick mini_magick image_science) # list of gems to be installed

# Update these if you're not running everything on one host.
role :app, domain
role :web, domain
role :db,  domain, :primary => true, :no_release => true

# If you aren't deploying to /opt/apps/#{application} on the target
# servers (which is the deprec default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    top.deprec.app.restart
  end

end

#cap deprec:rails:symlink_database_yml
