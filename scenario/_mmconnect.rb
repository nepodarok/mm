require_relative "_start"
require_relative "_log_in"

sleep 4
h5 = @driver.find_elements(:tag_name, "h5")
connect_me = h5.detect { |h| h.text == "Mercedes me connect" }   #step1
connect_me.click
sleep 10
is_source("mm connect", "Für die Vernetzung mit Ihrem Mercedes-Benz.")
is_source("mm connect", "Sie finden diese in den Nutzungsbedingungen im Abschnitt „Mercedes me connect Diensteübersicht“.")
