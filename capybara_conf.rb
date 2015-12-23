# -*- encoding : utf-8 -*-
#
# for capybara
require 'capybara'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'selenium-webdriver'
 
#Capybara.javascript_driver = :poltergeist
#Capybara.javascript_driver = :webkit
#Capybara.javascript_driver = :selenium

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, :js_errors => true, :timeout => 60)
end

Capybara.register_driver :selenium_firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
  config.run_server = false
  #config.default_driver = :selenium
  config.app_host = "http://www.google.com/"
end

RSpec.configure do |config|
  config.include Capybara::DSL
  Encoding.default_external = Encoding::UTF_8
end
