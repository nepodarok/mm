# Online Kartenupdate.
# Digitaler Fahrzeugschlüssel
require_relative "../scenario/_mmconnect.rb"
is_source("mm connect", "Digitaler Fahrzeugschlüssel")
div_mym = @driver.find_elements(:css, ".mym-caption")
@steps << "click on 'Digitaler Fahrzeugschlüssel'"
el = div_mym.detect{ |div| div.text == "Digitaler Fahrzeugschlüssel" }
el.click
sleep 5
@steps << "title is #{@driver.title}"
fast_find("DFiS", :tag_name, "h1", "Informationen zu den Diensten.")
fast_find("DFiS", :link_text, "Häufig gestellte Fragen zum Digitalen Fahrzeugschlüssel")
fast_find("DFiS", :link_text, "Nutzungsbedingungen für Mercedes me connect Navigationsdienste")
fast_find("DFiS", :link_text, "Informationen zur Gerätekompatibilität")
find_img("mm connect", "https://me-content.mercedes-benz.com/global/connectMeServiceInfopages/de_DE/images/BuB_Keyvisual_fbsMobil.jpg")
inside_link("Häufig gestellte Fragen zum Digitalen Fahrzeugschlüssel")
inside_link("Nutzungsbedingungen für Mercedes me connect Navigationsdienste")
outside_link("Informationen zur Gerätekompatibilität")
sleep 5
@driver.find_element(:id, "phone-verify-button").click
sleep 5
@steps << "check out SMS verification"
@steps << "close pop up"
@driver.find_element(:css, ".mym-layer-close").click
@driver.find_element(:id, "mym-breadcrumb-back").click
sleep 8
@steps << "step back - zuruk"
div_mym = @driver.find_elements(:css, ".mym-caption")
el = div_mym.detect{ |div| div.text == "Online Kartenupdate" }
el.click
sleep 8
@steps << "title is #{@driver.title}"
fast_find("Online Kartenupdate", :tag_name, "h1", "Informationen zu den Diensten.")
find_img("Online Kartenupdate", "https://me-content.mercedes-benz.com/global/connectMeServiceInfopages/de_DE/images/BuB_Keyvisual_mapUpdate.jpg")
is_source("Online Kartenupdate", "Online Kartenupdate.")
is_source("Online Kartenupdate", "Ebenfalls interessant:")
is_source("Online Kartenupdate", "Häufig gestellte Fragen zu Online Kartenupdate")
is_source("Online Kartenupdate", "Nutzungsbedingungen: Mercedes me connect Navigationsdienste")
is_source("Online Kartenupdate", "Anleitung Online Kartenupdate (PDF)")
@steps.each { |step| puts step }
