# frozen_string_literal: true

module Frack
  class Application
    class << self
      attr_accessor :env

      def call(env)
        self.env = env
        Rack::Response.new(*dispatch)
      end

      def dispatch
        controller = env['controller']
        action = env['action']
        klass_controller = Object.const_get(controller)
        obj_controller = klass_controller.new
        obj_controller.public_send(action)
      end
    end
  end
end
