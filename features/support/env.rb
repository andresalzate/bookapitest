# frozen_string_literal: true

require 'active_support/core_ext/hash'
require 'active_support/core_ext/object/blank'
require 'byebug'
require 'dotenv'
require 'faker'
require 'logger'
require 'rspec'
require 'json-schema'

Dotenv.load

BOOKS_API_URL = ENV['BOOKS_API_URL']

current_dir = __dir__
helpers_files = File.join(current_dir, 'helpers', '*.rb')
params_builder_files = File.join(current_dir, 'params_builders', '**', '*.rb')

Dir[helpers_files].each { |file| require file }
Dir[params_builder_files].each { |file| require file }

World(RSpec::Matchers)
