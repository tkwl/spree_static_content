require 'capybara/rspec'
require 'capybara/rails'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    options: Selenium::WebDriver::Chrome::Options.new(args: %w[disable-popup-blocking headless disable-gpu window-size=1920,1080])
end

Capybara.javascript_driver = :chrome
