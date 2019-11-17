# frozen_string_literal: true

require 'lib/frack.rb'

use Rack::Static, root: 'public', urls: ['/images', '/js', '/css']
use Rack::CommonLogger
use Rack::ContentLength
run Frack::Application
