require_relative "../scenario/_mmconnect.rb"

is_source("mm connect", "Programmierung Standheizung")
div_mym = @driver.find_elements(:css, ".mym-caption")
el = div_mym.detect{ |div| div.text == "Programmierung Standheizung" }
el.click
# Programmierung Standheizung
sleep 3
@steps << "click on Programmierung Standheizung"
@steps << "title is #{@driver.title}"

fast_find("mm_ps", :tag_name, "h1", "Informationen zu den Diensten.")
find_img("mm_ps", "https://me-content.mercedes-benz.com/global/connectMeServiceInfopages/de_DE/images/BuB_Detailseite_Keyvisual_Thermometer.jpg")

fast_find("mm_ps", :link_text, "Häufig gestellte Fragen")
fast_find("mm_ps", :link_text, "Türfernschließung und -entriegelung")
fast_find("mm_ps", :link_text, "Fernabfrage Fahrzeugstatus")
fast_find("mm_ps", :link_text, "Nutzungsbedingungen: Mercedes me connect Remotedienste/Fahrzeug-Setup")

is_source("mm_ps", "Programmierung Standheizung/-belüftung.")
is_source("mm_ps", "Von überall das Fahrzeug vorwärmen oder lüften.")
is_source("mm_ps", "Verfügbarkeit der Mercedes me connect Dienste.")

inside_link("Häufig gestellte Fragen")
inside_link("Türfernschließung und -entriegelung")
inside_link("Fernabfrage Fahrzeugstatus")
inside_link("Nutzungsbedingungen: Mercedes me connect Remotedienste/Fahrzeug-Setup")


@driver.find_element(:id, "mym-breadcrumb-back").click
@steps << "zurück"

is_source("mm connect", "Programmierung Ladeeinstellungen und Vorklimatisierung")
div_mym = @driver.find_elements(:css, ".mym-caption")
el = div_mym.detect{ |div| div.text == "Programmierung Ladeeinstellungen und Vorklimatisierung" }
el.click
# Programmierung Ladeeinstellungen und Vorklimatisierung
sleep 3
@steps << "click on Programmierung Ladeeinstellungen und Vorklimatisierung"
@steps << "title is #{@driver.title}"

fast_find("mm_PLuV", :tag_name, "h1", "Informationen zu den Diensten.")
find_img("mm_PLuV", "https://me-content.mercedes-benz.com/global/connectMeServiceInfopages/de_DE/images/BuB_Detailseite_Keyvisual_Programmierung_LuV.jpg")

fast_find("mm_PLuV", :link_text, "Häufig gestellte Fragen")
fast_find("mm_PLuV", :link_text, "Fernabfrage Fahrzeugstatus")
fast_find("mm_PLuV", :link_text, "Routenplanung")
fast_find("mm_PLuV", :link_text, "Nutzungsbedingungen: Mercedes me connect Remotedienste/Fahrzeug-Setup")

is_source("mm_PLuV", "Programmierung Ladeeinstellungen und Vorklimatisierung.*")
is_source("mm_PLuV", "Die Fernbedienung für Ihr Fahrzeug.")
is_source("mm_PLuV", "Ebenfalls interessant:")

inside_link("Häufig gestellte Fragen")
inside_link("Fernabfrage Fahrzeugstatus")
inside_link("Routenplanung")
inside_link("Nutzungsbedingungen: Mercedes me connect Remotedienste/Fahrzeug-Setup")

@steps.each { |step| puts step }
