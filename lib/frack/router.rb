# frozen_string_literal: true

module Frack
  class Router
    attr_reader :app

    ROUTES = {
      '/' => 'WelcomeController#index',
      '/users' => 'UsersController#index'
    }

    def initialize(app)
      @app = app
    end

    def call(env)
      if (mapping = ROUTES[env['PATH_INFO']])
        env.merge!(controller_action(mapping))
        app.call(env)
      else
        Rack::Response.new('Not found', 404)
      end
    end

    def controller_action(mapping)
      Hash[%w[controller action].zip mapping.split('#')]
    end
  end
end
