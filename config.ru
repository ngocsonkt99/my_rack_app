# frozen_string_literal: true

$LOAD_PATH << '.'
require 'rack'
require 'tilt'

module Frack
  class Application
    class << self
      def call(_env)
        Rack::Response.new(render('welcome/index'))
        # Your code goes here...
      end

      def render(view)
        puts "------------------------------> view: #{view}"
        render_template('layout/application') do
          render_template(view)
        end
      end

      def render_template(path, &block)
        Tilt.new("app/views/#{path}.html.erb").render(&block)
      end
    end
  end
end

use Rack::Static, root: 'public', urls: ['/images','/js','/css']
use Rack::CommonLogger
use Rack::ContentLength
run Frack::Application
