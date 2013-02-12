require 'yaml'

database_config = YAML::load_file('config/database.yml')
puts database_config
