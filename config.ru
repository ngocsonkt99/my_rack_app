# frozen_string_literal: true

$LOAD_PATH << '.'
require 'lib/frack.rb'
  autoload :Router, 'frack/router'
use Rack::Static, root: 'public', urls: ['/images', '/js', '/css']
use Rack::CommonLogger
use Rack::ContentLength
run Frack::Application
