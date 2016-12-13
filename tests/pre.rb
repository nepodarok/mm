require_relative "../helpers/tools"
require 'selenium-webdriver'
@driver = Selenium::WebDriver.for:chrome
@driver.manage.timeouts.implicit_wait = 10
@driver.manage.delete_all_cookies
@steps << "Cookies has been cleared"
@driver.navigate.to "http://me.mercedes-benz.com"
if @driver.find_element(:css, ".emb-cp-layer p.close")
  @steps << "OK: Layout witn notification about new cookies has been found"
   fast_find("Cookies", :tag_name, "h5", "Use of cookies")
   highlight @driver.find_element(:css, ".btn-link")
  @driver.find_element(:css, ".btn-link").click
else
  @steps << "ERROR: Not manage set new cookies"
end

@steps << "find and click 'Deutschland - Deutsch'"
highlight @driver.find_element(:link_text, "Deutschland - Deutsch")
@driver.find_element(:link_text, "Deutschland - Deutsch").click
sleep 5

@steps << "Title is #{@driver.title}"
fast_find("Cookies", :tag_name, "h5", "Verwendung von Cookies")
@steps << "find and close cookies notification"
highlight @driver.find_element(:css, ".btn-link")
@driver.find_element(:css, ".btn-link").click

@steps << "find and clck 'Register' button"
highlight @driver.find_element(:id, "registerButtonLandingpage")
@driver.find_element(:id, "registerButtonLandingpage").click
sleep 6
@driver.switch_to.frame @driver.find_element(:id, "iFrameResizer0")
is_source("Registrierung", "Registrierung")
highlight @driver.find_element(:id, "ciam-profile-header-title")
@steps << "Start testing register"
highlight @driver.find_element(:id, "firstName_input")
@driver.find_element(:id, "firstName_input").send_keys ("Donald")
highlight @driver.find_element(:id, "lastName_input")
@driver.find_element(:id, "lastName_input").send_keys ("Trump")

@steps << "OK: puts invalid data for catching validate rules"
highlight @driver.find_element(:css, "button.btn")
@driver.find_element(:css, "button.btn").submit
sleep 5
is_source("Register", "Bitte beachten Sie die Fehlermeldungen bei den rot markierten Feldern und füllen Sie die entsprechenden Felder korrekt aus.")
is_source("Form of adress", "Bitte treffen Sie eine Auswahl")
is_source("Register", "Pflichtfeld")
is_source("Register", "Bitte bestätigen Sie, dass Sie die rechtlichen Hinweise gelesen haben und diese akzeptieren.")
@steps << "finish testing Register"

@steps << "find and click Log In button"
@driver.navigate.to "https://me.secure.mercedes-benz.com"
sleep 4
highlight @driver.find_element(:id, "loginButtonLandingpage")
@driver.find_element(:id, "loginButtonLandingpage").click
sleep 2
@driver.switch_to.frame @driver.find_element(:id, "iFrameResizer0")
highlight @driver.find_element(:id, "ciam-weblogin-header-title")
@steps << "Start testing Log in"
highlight @driver.find_element(:id, "name")
@steps << "OK: puts invalid data for catching validate rules"
@driver.find_element(:id, "name").send_keys ("Donald")
sleep 2
@driver.find_element(:id, "ciam-weblogin-auth-login-button").submit
sleep 2
is_source("Log In", "Bitte geben Sie eine E-Mail-Adresse oder eine internationale Telefonnummer ein")
is_source("Log In", "Pflichtfeld")
@driver.find_element(:id, "name").clear
sleep 2
highlight @driver.find_element(:id, "name")
@driver.find_element(:id, "name").send_keys ("lb.aqs.mmp+atcde@gmail.com")
sleep 2
highlight @driver.find_element(:id, "password")
@driver.find_element(:id, "password").clear
sleep 2
@driver.find_element(:id, "password").send_keys ("Start123")
highlight @driver.find_element(:id, "ciam-weblogin-auth-login-button")
@driver.find_element(:id, "ciam-weblogin-auth-login-button").click
@steps << "Log in vith valid data"

sleep 5
highlight @driver.find_element(:id, "mym-headernavigation-username")
highlight @driver.find_element(:id, "mym-nav-menu-flyout-btn")
@driver.find_element(:id, "mym-nav-menu-flyout-btn").click
sleep 2
highlight @driver.find_element(:link_text, "Meine Daten")
@driver.find_element(:link_text, "Meine Daten").click

@steps << "go to my data page"

links = @driver.find_elements("tag_name", "a")
edit_links = links.find_all { |link| link.attribute("class") == "mym-edit-link mym-edit-link-js" }
  highlight edit_links[0]
  edit_links[0].click
  sleep 3

@steps << "edit user name"
highlight @driver.find_element(:id, "mym-form-firstName1")
@driver.find_element(:id, "mym-form-firstName1").clear
@driver.find_element(:id, "mym-form-firstName1").send_keys ("Logi New")
@driver.find_element(:css, ".mym-submit-button-js").submit
highlight @driver.find_element(:id, "mym-headernavigation-username")
@steps << "check out new name"

@steps << "return old name"
links = @driver.find_elements("tag_name", "a")
edit_links = links.find_all { |link| link.attribute("class") == "mym-edit-link mym-edit-link-js" }
highlight edit_links[0]
edit_links[0].click
sleep 3
@driver.find_element(:id, "mym-form-firstName1").clear
sleep 4
@driver.find_element(:id, "mym-form-firstName1").send_keys ("Logi")
sleep 4
@driver.find_element(:css, ".mym-submit-button-js").submit
highlight @driver.find_element(:id, "mym-headernavigation-username")

multi_find("Maine Daten", :tag_name, "h4", "Geburtsdatum")

links = @driver.find_elements("tag_name", "a")
edit_links = links.find_all { |link| link.attribute("class") == "mym-edit-link mym-edit-link-js" }
highlight edit_links[2]
edit_links[2].click

@steps << "edit birthdate"
highlight @driver.find_element(:id, "mym-edit-birthdate-form")
# Geburtsdatum
@steps << "edit day"
sleep 3
#day
mySelect = @driver.find_element(:id,"mym-form-birthdate-day")
options = mySelect.find_elements(:tag_name=>"option")
options.each do |g|
    if g.text == "11"
    g.click
    break
    end
end
sleep 2
#month
@steps << "edit month"
mySelect = @driver.find_element(:id,"mym-form-birthdate-month")
options = mySelect.find_elements(:tag_name=>"option")
options.each do |g|
    if g.text == "12"
    g.click
    break
    end
end
sleep 2
#year
@steps << "edit year"
mySelect = @driver.find_element(:id,"mym-form-birthdate-year")
options = mySelect.find_elements(:tag_name=>"option")
options.each do |g|
    if g.text == "1992"
    g.click
    break
    end
  end
  sleep 2
  highlight @driver.find_element(:id, "birthdate-button-submit")
  @driver.find_element(:id, "birthdate-button-submit").click

  links = @driver.find_elements("tag_name", "a")
  edit_links = links.find_all { |link| link.attribute("class") == "mym-edit-link mym-edit-link-js" }
    highlight edit_links[2]
    edit_links[2].click
     # Geburtsdatum
     highlight @driver.find_element(:id, "mym-edit-birthdate-form")
        sleep 3
@steps << "return old date value"
    #day
    mySelect = @driver.find_element(:id,"mym-form-birthdate-day")
    options = mySelect.find_elements(:tag_name=>"option")
    options.each do |g|
      if g.text == "06"
      g.click
      break
      end
    end
    sleep 2
    #month
    mySelect = @driver.find_element(:id,"mym-form-birthdate-month")
    options = mySelect.find_elements(:tag_name=>"option")
    options.each do |g|
      if g.text == "08"
      g.click
      break
      end
  end
  sleep 2
    #year
    mySelect = @driver.find_element(:id,"mym-form-birthdate-year")
    options = mySelect.find_elements(:tag_name=>"option")
    options.each do |g|
      if g.text == "1990"
      g.click
      break
      end
    end
    highlight @driver.find_element(:id, "birthdate-button-submit")
    @driver.find_element(:id, "birthdate-button-submit").click

@steps << "go to index page"
highlight @driver.find_element(:id, "mym-logo")
@driver.find_element(:id, "mym-logo").click
sleep 5

@steps << "find and click 'Add new vehicle'"
multi_find("ip", :tag_name, "h4", "Zu meinem Fahrzeug")
divs = @driver.find_elements(:tag_name, "div")
divs.each do |div|
  if div.attribute("data-analytics-linkname") == "Add new vehicle"
  ## @driver.execute_script("arguments[0].style.border='3px solid red'", div);
sleep 3
    @driver.execute_script("arguments[0].click();", div);
    break
 end
end

@steps << "add VIN code and folow instruction"
sleep 5
highlight @driver.find_element(:id, "ident")
@driver.find_element(:id, "ident").send_keys ("WDD2050871F299472")
sleep 5
highlight @driver.find_element(:id, "assignVehicle")
@driver.find_element(:id, "assignVehicle").click
sleep 5
highlight @driver.find_element(:id, "nextStep")
@driver.find_element(:id, "nextStep").click
sleep 5
@driver.find_element(:id, "terms_next").click
sleep 5
@driver.find_element(:id, "your-vehicle").click
sleep 5

@steps << "check out new car"
highlight @driver.find_element(:css, ".mym-model")
highlight @driver.find_element(:css, ".mym-manage")
@driver.find_element(:css, ".mym-manage").click
sleep 5
links = @driver.find_elements("tag_name", "a")
   edit_links = links.find_all { |link| link.attribute("class") == "mym-edit-link mym-edit-link-js" }
     highlight edit_links[0]
     edit_links[0].click
sleep 3

@steps << "Adding car's numer"

highlight @driver.find_element(:id, "manage-vehicle-userlabel")
@driver.find_element(:id, "manage-vehicle-userlabel").send_keys ("S-TT 1234")
sleep 2
btns = @driver.find_elements(:css, ".mym-btn")
highlight btns[1]
btns[1].click
highlight @driver.find_element(:id, "mym-nav-vehicle-flyout-btn")
@steps << "check out car's data"

@driver.find_element(:id, "mym-nav-vehicle-flyout-btn").click
sleep 5
highlight @driver.find_element(:id, "mym-nav-vehicle-flyout")

@steps << "delete car"
highlight @driver.find_element(:id, "mym-button-delete")
@driver.find_element(:id, "mym-button-delete").click
sleep 2
highlight @driver.find_element(:id, "mym-vehicle-delete-button")
@driver.find_element(:id, "mym-vehicle-delete-button").click
sleep 2
highlight @driver.find_element(:id, "deletevehiclesuccess-button-vehicleoverview")
@driver.find_element(:id, "deletevehiclesuccess-button-vehicleoverview").click

@steps << "go to user data"
highlight @driver.find_element(:id, "mym-headernavigation-username")
@driver.find_element(:id, "mym-headernavigation-username").click
sleep 3
highlight @driver.find_element(:link_text, "Benutzerkonto löschen")
@driver.find_element(:link_text, "Benutzerkonto löschen").click
@driver.switch_to.frame @driver.find_element(:id, "iFrameResizer0")
highlight @driver.find_element(:id, "password_delete_account_input")
@driver.find_element(:id, "password_delete_account_input").send_keys "Start123"
highlight @driver.find_element(:css, ".btn")
@steps << "delete user"
@driver.navigate.back
## click_img("Index page", "https://me.secure.mercedes-benz.com/resources/mmp-vehicle-portlets/images/vehicles/flyout_new_vehicle.png")
sleep 5
@steps.each { |step| puts step }
