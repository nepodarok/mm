# test 1: deeply test pop up
# 1
require_relative "../helpers/tools"
require 'selenium-webdriver'

@driver = Selenium::WebDriver.for:chrome
@driver.manage.timeouts.implicit_wait = 10
@driver.manage.delete_all_cookies
@steps << "OK: Cookies has been cleared"
@driver.navigate.to "http://me.mercedes-benz.com"

if @driver.find_element(:css, ".emb-cp-layer p.close")
  fast_find("Cookies layout", :tag_name, "h5", "Use of cookies")
  fast_find("Cookies layout", :link_text, "Find out more about our cookies and how we use them.")

  highlight @driver.find_element(:link_text, "Find out more about our cookies and how we use them.")
  @driver.find_element(:link_text, "Find out more about our cookies and how we use them.").click
  sleep 5

  fast_find("Find out more about our cookies...", :tag_name, "h1", "Cookies")
  fast_find("Find out more about our cookies...", :tag_name, "a", "Information about deactivating local shared objects")
  highlight  @driver.find_element(:css, ".mym-layer-close")
  @driver.find_element(:css, ".mym-layer-close").click

  @driver.find_element(:id, "mym-headernavigation-imprint").click
  sleep 6

  fast_find("Provider", :tag_name, "h1", "Provider/Data privacy")
  fast_find("Provider", :tag_name, "h2", "Represented by the Board of Management:")
  is_source("Provider", "Chairman of the Supervisory Board:")

  tab = @driver.find_elements(:css, ".mym-tb-summary")
  highlight tab[1]
  tab[1].click  #Cookies
  fast_find("Cookies", :link_text, "Information about deactivating local shared objects")
  is_source("Cookies", "We use the following cookies on our website:")

  highlight tab[2]
  tab[2].click   #Data privacy
  is_source("Data privacy", "Daimler data protection regulations")
  is_source("Data privacy", "Collection and processing of personal data")
  is_source("Data privacy", "Social Plugins")
  is_source("Data privacy", "Freedom of Information")

  highlight tab[3]
  tab[3].click   #Legal notice

  is_source("Legal notice", "Products and prices")
  is_source("Legal notice", "Cautions regarding forward-looking statements")
  is_source("Legal notice", "Liability")
  @driver.find_element(:css, ".mym-layer-close").click

  @steps << "Start testing pop ups"

  highlight @driver.find_element(:link_text, "Provider")
  @driver.find_element(:link_text, "Provider").click
  sleep 5
  fast_find("Provider", :tag_name, "h1", "Provider.")
  fast_find("Provider", :tag_name, "h2", "Represented by the Board of Management:")
  highlight @driver.find_element(:css, ".mym-layer-close")
  @driver.find_element(:css, ".mym-layer-close").click

  highlight @driver.find_element(:link_text, "Privacy Statement")
  @driver.find_element(:link_text, "Privacy Statement").click
  sleep 5
  fast_find("Privacy Statement", :tag_name, "h1", "Privacy Statement.")
  fast_find("Privacy Statement", :tag_name, "h2", "Collection and processing of personal data")
  highlight @driver.find_element(:css, ".mym-layer-close")
  @driver.find_element(:css, ".mym-layer-close").click


  highlight @driver.find_element(:link_text, "Legal Notice")
  @driver.find_element(:link_text, "Legal Notice").click
  sleep 5
  fast_find("Privacy Statement", :tag_name, "h1", "Legal Notice.")
  fast_find("Privacy Statement", :tag_name, "h2", "Copyrights")
  highlight @driver.find_element(:css, ".mym-layer-close")
  @driver.find_element(:css, ".mym-layer-close").click



else
  @steps << "ERROR: Not manage to set new cookies"
end


@steps.each { |step| puts step }
