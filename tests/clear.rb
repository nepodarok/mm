require 'selenium-webdriver'

@driver = Selenium::WebDriver.for:chrome
@driver.manage.timeouts.implicit_wait = 10
@driver.manage.delete_all_cookies
