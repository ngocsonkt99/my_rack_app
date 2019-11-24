# frozen_string_literal: true

class Router
  ROUTES = {'/' =>  'WelcomeController#index',
            '/users' => 'UsersController#index' }

  def call(env);
    if env['PATH_INFO'] == '/'
      Rack::Response.new(WelcomeController.new.index)
    if env['PATH_INFO'] == '/users'
      Rack::Response.new(UsersController.new.index)
    else
      Rack::Response.new('Not found', 404)
  end
 end
