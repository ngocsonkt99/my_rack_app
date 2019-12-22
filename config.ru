# frozen_string_literal: true

$LOAD_PATH << '.'
require 'rack'
require 'tilt'
require 'lib/frack.rb'
require 'byebug'

use Rack::Static, root: 'public', urls: ['/images', '/js', '/css']
use Rack::CommonLogger
use Rack::ContentLength
use Frack::Router
run Frack::Application
