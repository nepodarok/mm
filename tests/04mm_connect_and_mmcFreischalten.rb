
require_relative "../scenario/_start"
require_relative "../scenario/_log_in"
sleep 5

find_img("Main page", "https://me.secure.mercedes-benz.com/resourceservice/tilesimages_mmp/450x252/connect_me.jpg")

h5 = @driver.find_elements(:tag_name, "h5")
connect_me = h5.detect { |h| h.text == "Mercedes me connect" }
@steps <<  "find and click 'Mercedes me connect'"
is_source("Mercedes me", "Mercedes me connect")
connect_me.click
sleep 5
@steps << "title is #{@driver.title}"

is_source("mm connect", "Für die Vernetzung mit Ihrem Mercedes-Benz.")
is_source("mm connect", "Mercedes me connect freischalten")
@steps << "click on 'Mercedes me connect freischalten'"

div_mym = @driver.find_elements(:css, ".mym-caption")
el = div_mym.detect{ |div| div.text == "Mercedes me connect freischalten" }
el.click

sleep 5
@steps << "title is #{@driver.title}"

find_img("Mercedes me connect freischalten", "https://me-content.mercedes-benz.com/global/connectMeServiceInfopages/de_DE/images/keyvisual_connectMeAktivieren.jpg")
is_source("mm connect", "Mercedes me connect freischalten.")
is_source("mm connect", "So einfach stellen Sie die Verbindung her.")

@steps << "Click on 'Fahrzeug freischalten'"
@driver.find_element(:link_text, "Fahrzeug freischalten").click
sleep 5
@steps << "title is #{@driver.title}"
@driver.find_element(:id, "mym-breadcrumb-back").click
sleep 5
@steps << "zurück"
@steps << "title is #{@driver.title}"

@driver.find_element(:id, "mym-breadcrumb-back").click
sleep 8
@steps << "zurück"
div_mym = @driver.find_elements(:css, ".mym-caption")

bs = div_mym.detect{ |div| div.text == "Business Services" }
bs.click

sleep 15
@steps << "clicking 'Business Services' and check out title"
@driver.switch_to.window( @driver.window_handles.last )
@steps << "title is '#{@driver.title}'"

@steps.each { |step| puts step }
