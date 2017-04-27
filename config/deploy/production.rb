# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server 'basketingredients.com', user: 'chopped', roles: %w{app db web}

# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/puma', 'tmp/cache', 'tmp/sockets')
