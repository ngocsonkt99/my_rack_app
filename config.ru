# frozen_string_literal: true

$LOAD_PATH << '.'
require 'rack'
require 'tilt'

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

  class BaseController
    def render(view)
      render_template('layouts/application') do
        render_template(view)
      end
    end

    def render_template(path, &block)
      Tilt.new("app/views/#{path}.html.erb").render(self, &block)
    end
  end
end

class UsersController < Frack::BaseController
  def index
    @users = User.all
    render('users/index')
  end
end

class WelcomeController < Frack::BaseController
  def index
    render('welcome/index')
  end
end

class User
  def self.all
    ['Tam', 'Tri', 'Son', 'Toan', 'Tu']
  end
end

use Rack::Static, root: 'public', urls: ['/images', '/js', '/css']
use Rack::CommonLogger
use Rack::ContentLength
run Frack::Application
