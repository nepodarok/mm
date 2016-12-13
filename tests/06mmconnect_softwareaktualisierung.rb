require_relative "../scenario/_mmconnect.rb"
is_source("mm connect", "Softwareaktualisierung")
div_mym = @driver.find_elements(:css, ".mym-caption")
el = div_mym.detect{ |div| div.text == "Softwareaktualisierung" }
el.click
@steps << "click on Softwareaktualisierung"
# Softwareaktualisierung
@steps << "title is #{@driver.title}"
fast_find("DFiS", :tag_name, "h1", "Informationen zu den Diensten.")
fast_find("Softwareaktualisierung", :link_text, "Häufig gestellte Fragen zur Softwareaktualisierung")
fast_find("Softwareaktualisierung", :link_text, "Nutzungsbedingungen: Mercedes me connect Basisdienste")
is_source("Softwareaktualisierung", "Immer auf dem neuesten Stand – dank der Mercedes me connect Softwareaktualisierung.")
is_source("Softwareaktualisierung", "Ebenfalls interessant:")
find_img("Softwareaktualisierung", "https://me-content.mercedes-benz.com/global/connectMeServiceInfopages/de_DE/images/BuB_Keyvisual_remoteSoftwareUpdate.jpg")

inside_link("Häufig gestellte Fragen zur Softwareaktualisierung")
inside_link("Nutzungsbedingungen: Mercedes me connect Basisdienste")

@driver.find_element(:id, "mym-breadcrumb-back").click

is_source("mm connect", "Concierge-Service")
div_mym = @driver.find_elements(:css, ".mym-caption")
el = div_mym.detect{ |div| div.text == "Concierge-Service" }
el.click
# Concierge-Service
sleep 5
@steps << "click on Concierge-Service"
@steps << "title is #{@driver.title}"
fast_find("DFiS", :tag_name, "h1", "Informationen zu den Diensten.")
find_img("Concierge-Service", "https://me-content.mercedes-benz.com/global/connectMeServiceInfopages/de_DE/images/concierge_keyvisual.jpg")
fast_find("Concierge-Service", :link_text, "Häufig gestellte Fragen zum Mercedes me connect Concierge-Service")
fast_find("Concierge-Service", :link_text, "Nutzungsbedingungen: Mercedes me connect Concierge-Service")
is_source("Concierge-Service", "Ebenfalls interessant:")
is_source("Concierge-Service", "Mercedes me connect Concierge-service.")

inside_link("Häufig gestellte Fragen zum Mercedes me connect Concierge-Service")
inside_link("Nutzungsbedingungen: Mercedes me connect Concierge-Service")

@steps.each { |step| puts step }
