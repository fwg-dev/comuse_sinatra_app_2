require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#in order to send PATCH and DELETE requests I need this code
use Rack::MethodOverride

# mount controllers here
use UsersController
use PostsController

run ApplicationController
