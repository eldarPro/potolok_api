ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
require 'rails/commands/server'

Rails::Server.new(app: 'my_app', Host: '0.0.0.0', Port: 3000).start
