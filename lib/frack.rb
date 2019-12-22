$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
require 'rack'
require 'tilt'

ENV['APP_ENV'] || 'development'

require 'erb'
require 'active_record'

require_relative '../config/database'
require 'app/models/user'
require 'app/controllers/users_controller'
require 'app/controllers/welcome_controller'

module Frack
  autoload :Router, 'frack/router'
  autoload :Application, 'frack/application'
  autoload :BaseController, 'frack/base_controller'
end
