require_relative "../helpers/tools"
require 'selenium-webdriver'

@driver = Selenium::WebDriver.for:chrome
@driver.manage.timeouts.implicit_wait = 30
@driver.manage.delete_all_cookies

@steps << "Cookies has been cleared"

@driver.navigate.to "http://me.mercedes-benz.com"

if @driver.find_element(:css, ".emb-cp-layer p.close")
  @steps << "OK: Layout witn notification about new cookies has been found"
  #  highlight @driver.find_element(:css, ".btn-link")
  @driver.find_element(:css, ".btn-link").click
else
  @steps << "ERROR: Not manage set new cookies"
end
