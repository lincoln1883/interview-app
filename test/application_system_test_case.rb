# frozen_string_literal: true

require "test_helper"

Capybara.register_driver :selenium_chrome_headless do |app|
  capabilities = Selenium::WebDriver::Chrome::Options.new
  capabilities.add_argument "--headless"
  Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities:)
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium_chrome_headless
end
