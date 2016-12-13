# test 3: testing Log In and Register
# 1
require_relative "../scenario/_start"
# 2

@steps << "find and clck 'Register' button"
@driver.find_element(:id, "headernavigation-link-register").click
sleep 60
@driver.switch_to.frame @driver.find_element(:id, "iFrameResizer0")
is_source("Registration", "Registration")

@steps << "Start testing register"
@driver.find_element(:id, "firstName_input").send_keys ("Donald")
@driver.find_element(:id, "lastName_input").send_keys ("Trump")
@steps << "OK: puts invalid data for catching validate rules"
sleep 2
@driver.find_element(:css, "button.btn").submit
sleep 5
is_source("Register", "Please note the error messages in the fields marked in red and complete them correctly.")
is_source("Form of adress", "Please select an option")
is_source("Register", "Mandatory field")
is_source("Register", "Please confirm that you have read and agree to the legal information.")
@steps << "finish testing Register"

@steps << "find and click Log In button"
@driver.navigate.to "https://me.secure.mercedes-benz.com"
sleep 4
@driver.find_element(:id, "loginLinkHeaderNavigation").click
sleep 2
@driver.switch_to.frame @driver.find_element(:id, "iFrameResizer0")

@steps << "Start testing Log in"

@steps << "OK: puts invalid data for catching validate rules"
@driver.find_element(:id, "name").send_keys ("Donald")
sleep 2
@driver.find_element(:id, "ciam-weblogin-auth-login-button").submit
sleep 2
is_source("Log in", "Mandatory field")
@driver.find_element(:id, "name").clear
sleep 2

@driver.find_element(:id, "name").send_keys ("lb.aqs.mmp+atcde@gmail.com")
sleep 2

@driver.find_element(:id, "password").clear
sleep 2
@driver.find_element(:id, "password").send_keys ("Start123")
highlight @driver.find_element(:id, "ciam-weblogin-auth-login-button")
@driver.find_element(:id, "ciam-weblogin-auth-login-button").click
@steps << "Log in vith valid data"

# adress = @driver.find_element(:id, "headernavigation-link-register").attribute("href")
# highlight @driver.find_element(:id, "headernavigation-link-register")
#
# @driver.execute_script( "window.open()" )
# @driver.switch_to.window( @driver.window_handles.last )
# @driver.get adress
#
# sleep 7
#
# @steps << "Start testing register"
#
# highlight @driver.find_element(:id, "firstName_input")
# @driver.find_element(:id, "firstName_input").send_keys ("Name")
#
# @steps << "OK: puts invalid data for catching validate rules"
#
# highlight @driver.find_element(:css, "button.btn")
# @driver.find_element(:css, "button.btn").submit
# sleep 5
#
# @steps << "finish testing Register"
#
# @driver.navigate.to "http://me.mercedes-benz.com"
#
# log_in = @driver.find_element(:link_text, "Log in").attribute("href")
# highlight @driver.find_element(:link_text, "Log in")
# @driver.execute_script( "window.open()" )
# @driver.switch_to.window( @driver.window_handles.last )
# @driver.get log_in
# @steps << "start testing Log in"
# sleep 10
#
# highlight @driver.find_element(:css, "button.btn")
# @driver.find_element(:css, "button.btn").submit
# @steps << "testing invalid data"
# is_source("Log in", "Mandatory field")
#
# @steps << "Log in with user aleksandrnepodarok@gmail.com"
#
# @driver.find_element(:id, "name").send_keys ("aleksandrnepodarok@gmail.com")
# @driver.find_element(:id, "password").send_keys ("Asd2Asd2")
# highlight @driver.find_element(:css, "button.btn")
# @driver.find_element(:css, "button.btn").submit
# sleep 10
# is_source("Index page", "Alex Fedorov")
#
highlight @driver.find_element(:link_text, "Deutschland - Deutsch")
# 13
@driver.find_element(:link_text, "Deutschland - Deutsch").click
sleep 8

@steps << "Title is #{@driver.title}"
@steps.each { |step| puts step }
