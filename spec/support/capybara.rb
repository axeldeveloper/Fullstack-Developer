require 'capybara/rspec'
require 'selenium/webdriver'


#Capybara.asset_host = 'http://localhost:3000'
CAPYBARA_WINDOW_SIZE = [1366, 768].freeze
# Capybara.register_driver :chrome do |app|
#   options = Selenium::WebDriver::Chrome::Options.new
#   options.add_argument("headless")
#   options.add_argument("window-size=#{CAPYBARA_WINDOW_SIZE.join(',')}")
#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :chrome,
#     options: options
#   )
# end
# Capybara.javascript_driver = :chrome
# Capybara.ignore_hidden_elements = false
# Capybara.save_path = "spec/screenshots"
#Capybara::Screenshot.autosave_on_failure = false

# Keep only the screenshots generated from the last failing test suite
#Capybara::Screenshot.prune_strategy = :keep_last_run
# From https://github.com/mattheworiordan/capybara-screenshot/issues/84#issuecomment-41219326
#Capybara::Screenshot.register_driver(:chrome) do |driver, path|
#  driver.browser.save_screenshot(path)
#end

Capybara.raise_server_errors = false

Capybara.register_driver :chrome_headless do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1400,1400')

  Capybara::Selenium::Driver.new(app,
    browser: :chrome, options: options, driver_path: '/usr/local/bin/chromedriver')
end

# Capybara.javascript_driver = :chrome_headless
Capybara.javascript_driver = :selenium_chrome

RSpec.configure do |config|
  # config.before(:each, type: :system) do
  #   ##driven_by :rack_test
  #
  #   driven_by :selenium, using: :headless_chrome, options: {
  #     browser: :remote,
  #     url: ENV.fetch('SELENIUM_DRIVER_URL')
  #   }
  #   Capybara.server_host = 'app'
  # end

  config.before(:each, type: :system, js: true) do
    driven_by :chrome_headless
  end
end