require_relative "../scenario/_mmconnect.rb"

is_source("mm connect", "Türfernschließung und -entriegelung")
div_mym = @driver.find_elements(:css, ".mym-caption")
el = div_mym.detect{ |div| div.text == "Türfernschließung und -entriegelung" }
el.click
# Türfernschließung und -entriegelung
sleep 3
@steps << "click on Türfernschließung und -entriegelung"
@steps << "title is #{@driver.title}"

fast_find("Tu-e", :tag_name, "h1", "Informationen zu den Diensten.")
find_img("Tu-e", "https://me-content.mercedes-benz.com/global/connectMeServiceInfopages/de_DE/images/BuB_Detailseite_Keyvisual_Fenstersteuerung.jpg")

fast_find("Tu-e", :link_text, "Häufig gestellte Fragen")
fast_find("Tu-e", :link_text, "Programmierung Standheizung")
fast_find("Tu-e", :link_text, "Fernabfrage Fahrzeugstatus")
fast_find("Tu-e", :link_text, "Nutzungsbedingungen: Mercedes me connect Remotedienste/Fahrzeug-Setup")

is_source("Tu-e", "Türfernschließung und -entriegelung.")
is_source("Tu-e", "Unterwegs alles sicher im Griff.")
is_source("Tu-e", "Die Vorteile im Überblick:")

inside_link("Häufig gestellte Fragen")
inside_link("Programmierung Standheizung")
inside_link("Fernabfrage Fahrzeugstatus")
inside_link("Nutzungsbedingungen: Mercedes me connect Remotedienste/Fahrzeug-Setup")


@driver.find_element(:id, "mym-breadcrumb-back").click
@steps << "zurück"

is_source("mm connect", "Geographische Fahrzeugüberwachung")
div_mym = @driver.find_elements(:css, ".mym-caption")
el = div_mym.detect{ |div| div.text == "Geographische Fahrzeugüberwachung" }
el.click
# Geographische Fahrzeugüberwachung
sleep 3
@steps << "click on Geographische Fahrzeugüberwachung"
@steps << "title is #{@driver.title}"

fast_find("mm_GF", :tag_name, "h1", "Informationen zu den Diensten.")
find_img("mm_GF", "https://me-content.mercedes-benz.com/global/connectMeServiceInfopages/de_DE/images/BuB_Detailseite_Keyvisual_Fahrzeugueberwachung.jpg")

fast_find("mm_GF", :link_text, "Häufig gestellte Fragen")
fast_find("mm_GF", :link_text, "Fahrzeugortung")
fast_find("mm_GF", :link_text, "Fahrzeugstandort")
fast_find("mm_GF", :link_text, "Nutzungsbedingungen: Ortungsdienste/Fahrzeug-Monitoring")

is_source("mm_GF", "Geographische Fahrzeugüberwachung.")
is_source("mm_GF", "Definierter Freiraum.")
is_source("mm_GF", "Die Vorteile im Überblick:")

inside_link("Häufig gestellte Fragen")
inside_link("Fahrzeugortung")
inside_link("Fahrzeugstandort")
inside_link("Nutzungsbedingungen: Ortungsdienste/Fahrzeug-Monitoring")

@steps.each { |step| puts step }
