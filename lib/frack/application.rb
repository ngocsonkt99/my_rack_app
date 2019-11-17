# frozen_string_literal: true

module Frack
  class Application
    class << self
      def call(env)
        if env['PATH_INFO'] == '/'
          Rack::Response.new(WelcomeController.new.index)
        elsif env['PATH_INFO'] == '/users'
          Rack::Response.new(UsersController.new.index)
        else
          Rack::Response.new('Not Found', 404)
        end
      end
    end
  end
end
