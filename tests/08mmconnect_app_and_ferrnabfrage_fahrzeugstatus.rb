require_relative "../scenario/_mmconnect.rb"

is_source("mm connect", "Mercedes me App")
div_mym = @driver.find_elements(:css, ".mym-caption")
el = div_mym.detect{ |div| div.text == "Mercedes me App" }
el.click
# Mercedes me App
sleep 3
@steps << "click on Mercedes me App"
@steps << "title is #{@driver.title}"

fast_find("mm_app", :tag_name, "h1", "Die Mercedes me App.")
find_img("mm_app", "https://me-content.mercedes-benz.com/global/connectMeServiceInfopages/de_DE/images/Keyvisual_mercedes_me_App.jpg")

fast_find("mm_app", :link_text, "iTunes")
fast_find("mm_app", :link_text, "Google Play")

is_source("mm_app", "Mit wenigen Swipes ans Ziel.")
is_source("mm_app", "App Store-Links")
is_source("mm_app", "Stets griffbereit – Das Mercedes me Dashboard auf einen Blick.")

outside_link("iTunes")
sleep 4
outside_link("Google Play")
@driver.find_element(:id, "mym-breadcrumb-back").click
@steps << "zurück"

is_source("mm connect", "Fernabfrage Fahrzeugstatus")
div_mym = @driver.find_elements(:css, ".mym-caption")
el = div_mym.detect{ |div| div.text == "Fernabfrage Fahrzeugstatus" }
el.click
# Fernabfrage Fahrzeugstatus
sleep 3
@steps << "click on Fernabfrage Fahrzeugstatus"
@steps << "title is #{@driver.title}"

fast_find("mm_ff", :tag_name, "h1", "Informationen zu den Diensten.")
find_img("mm_ff", "https://me-content.mercedes-benz.com/global/connectMeServiceInfopages/de_DE/images/BuB_Detailseite_Keyvisual_Fahrzeugstatus.jpg")

fast_find("mm_ff", :link_text, "Häufig gestellte Fragen")
fast_find("mm_ff", :link_text, "Programmierung Standheizung")
fast_find("mm_ff", :link_text, "Türfernschließung und -entriegelung")
fast_find("mm_ff", :link_text, "Nutzungsbedingungen: Mercedes me connect Remotedienste/Fahrzeug-Setup")

is_source("mm_ff", "Fernabfrage Fahrzeugstatus.")
is_source("mm_ff", "Wissen was anliegt.")
is_source("mm_ff", "Die Vorteile im Überblick:")

inside_link("Häufig gestellte Fragen")
inside_link("Programmierung Standheizung")
inside_link("Türfernschließung und -entriegelung")
inside_link("Nutzungsbedingungen: Mercedes me connect Remotedienste/Fahrzeug-Setup")

@steps.each { |step| puts step }
