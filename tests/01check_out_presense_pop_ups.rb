# test 1: presense pop up
# 1
require_relative "../scenario/_start"
# 2
if @driver.find_element(:id, "mym-meta-navigation")
  highlight @driver.find_element(:id, "mym-meta-navigation")
  @steps << "OK: find top menu"
else
  @steps << "ERROR: find top menu"
end
# 3
if @driver.find_element(:id, "mym-footer")
  highlight @driver.find_element(:id, "mym-footer")
  @steps << "OK: find bottom menu"
else
  @steps << "ERROR: find bottom menu"
end
# 4-10
@list_jsp_id = ["mym-headernavigation-imprint", "headernavigation-link-register", "loginLinkHeaderNavigation", "footer-imprint", "footer-cookies", "footer-privacy", "footer-legalnotes"]
# @list_jsp_id = ["mym-headernavigation-imprint", "headernavigation-link-register"]
# mym-headernavigation-languageswitcher !!!
@list_jsp_id.each do |j_id|
  if @driver.find_element(:id, j_id)
    highlight @driver.find_element(:id, j_id)
    @driver.find_element(:id, j_id).click
    sleep 5
    highlight  @driver.find_element(:css, ".mym-layer-close")
    @driver.find_element(:css, ".mym-layer-close").click
    @steps << "OK: #{ @driver.find_element(:id, j_id).text }'s layout has been found"
  else
    @steps << "ERROR: #{ @driver.find_element(:id, j_id).text }'s layout has been found"
  end
end
# 11
is_source("main", "© 2016 Daimler AG. All Rights reserved.")

# 12
highlight @driver.find_element(:link_text, "Deutschland - Deutsch")
# 13
@driver.find_element(:link_text, "Deutschland - Deutsch").click
sleep 8

@steps << "Title is #{@driver.title}"
@steps.each { |step| puts step }
