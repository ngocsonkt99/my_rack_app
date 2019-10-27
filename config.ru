$LOAD_PATH << '.'
require 'rack'
require 'tilt'

module Frack
  class Application
    class << self
      def call(env)
         ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app.']]
        # Your code goes here...
      end
    end
  end
end

use Rack::CommonLogger
use Rack::ContentLength
run Frack::Application
