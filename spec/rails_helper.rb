# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'

# require 'support/factory_bot'
#require 'support/devise'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'capybara/rspec'
require 'selenium/webdriver'
require 'capybara/rails'
require 'capybara/minitest'
require 'webdrivers'
require 'selenium-webdriver'
# require 'webdrivers/chromedriver'
require 'simplecov'
# require 'support/capybara'
# require 'capybara-screenshot/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

#SimpleCov.start do
#  SimpleCov.coverage_dir('public/coverage')
#end
#puts "required simplecov"

# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end



RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation

  # Factory Bot Configuration
  config.include FactoryBot::Syntax::Methods


  # Remove this line if you're not using ActiveRecord or ActiveRecord factories
  config.fixture_path = "#{::Rails.root}/spec/factories"

  # Devise Configuration
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers, type: :request
  config.before(:suite) { Warden.test_mode! }

  # Request spec helper
  # config.include RequestSpecHelper, type: :request

  # The different available types are documented in the features, such as in
  # https://rspec.info/features/6-0/rspec-rails
  #config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  #config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  #Checks for pending migrations and applies them before tests are run.
  ActiveRecord::Migration.maintain_test_schema!


  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true


  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
