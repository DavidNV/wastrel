# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'faker'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'capybara'


ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include Capybara::DSL

  Capybara.register_driver :selenium_chrome do |app|
    puts "\n*" *5
    puts app.inspect
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: Selenium::WebDriver::Chrome::Options.new(
        binary: "/usr/local/bin/chromedriver"
      )
    )
  end
end


