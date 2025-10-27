require "capybara/rails"
require "capybara/rspec"
require "selenium/webdriver"

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--window-size=1200,900")

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :selenium_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--headless")
  options.add_argument("--window-size=1200,900")

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
