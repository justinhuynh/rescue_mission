ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda-matchers'
require File.join(File.dirname(__FILE__), 'support/valid_attribute')
require File.join(File.dirname(__FILE__), 'support/factory_girl')
require 'capybara/rspec'
require 'capybara-webkit'

ActiveRecord::Migration.maintain_test_schema!
Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  # config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.use_transactional_fixtures = false

  config.before :each do
    if Capybara.current_driver == :rack_test
      DatabaseCleaner.strategy = :transaction
    else
      DatabaseCleaner.strategy = :truncation
    end
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
