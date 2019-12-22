# frozen_string_literal: true
env = ENV['ENV'] || 'development'
root = File.expand_path __dir__
db_config_file_path = File.join(root, 'database.yml')
db_config_content = File.read(db_config_file_path)
config = YAML.load(ERB.new(db_config_content).result)
ActiveRecord::Base.configurations = config
ActiveRecord::Base.establish_connection env.to_sym
