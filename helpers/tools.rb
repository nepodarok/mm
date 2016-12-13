@steps = []

def highlight element, time = 3
  orig_style = element.attribute("style")
  @driver.execute_script("arguments[0].setAttribute(arguments[1], arguments[2])", element, "style", "border:
  3px solid green; color: green; font-weight: bold;")
   if time > 0
     sleep time
     @driver.execute_script("arguments[0].setAttribute(arguments[1], arguments[2])", element, "style", orig_style)
   end
 end

def is_source(element, value)
  if @driver.page_source.include? value
     @steps << "OK: '#{value}' has been found in '#{element}'"
  else
    @steps << "ERROR: '#{value}' has been found in '#{element}'"
  end
end

def fast_find(element, selector, value_selector, compare = value_selector)
  if @driver.find_element(selector, value_selector).text == compare
    el = @driver.find_element(selector, value_selector)
    # highlight el
    @steps << "OK: Element '#{element}' include '#{compare}' by selector '#{selector}'"
  else
    @steps << "ERROR: Element '#{element}' include '#{compare}' by selector '#{selector}'"
  end
end

def multi_find(element, selector, value_selector, compare = value_selector)
    els = @driver.find_elements(selector, value_selector)
    el = els.detect { |el| el.text == compare }
    if el.text == compare
    highlight el
    @steps << "OK: Element '#{element}' include '#{compare}' by selector '#{selector}'"
  else
    @steps << "ERROR: Element '#{element}' include '#{compare}' by selector '#{selector}'"
  end
end

def click_img(element, pic_path)
  imgs = @driver.find_elements(:tag_name, "img")
  img = imgs.detect { |img|  img.attribute("src") == pic_path }
  @steps << "img with attribute src = '#{pic_path}' has been found"
  highlight img
  img.click
  sleep 3
end

def find_img(element, pic_path)
  imgs = @driver.find_elements(:tag_name, "img")
  img = imgs.detect { |img|  img.attribute("src") == pic_path }
  if img.attribute('src') == pic_path
    @steps << "OK: In '#{element}' has found pic_path: '#{pic_path}' "
    if img.displayed?
       @steps << "OK: In '#{element}' is displayed: '#{pic_path}' "
     else
       @steps << "ERROR: In '#{element}' is displayed: '#{pic_path}' "
     end
  else
    @steps << "ERROR: In '#{element}' has found pic_path: '#{pic_path}' "
    @steps << "ERROR: In '#{element}' is displayed: '#{pic_path}' "
  end
end


def outside_link(link_text)
  @driver.find_element(:link_text, link_text).click
  sleep 10
  @driver.switch_to.window @driver.window_handles.last
  @steps << "Click on '#{link_text}'"
  @steps << "title is '#{@driver.title}'"
  @driver.close
  @driver.switch_to.window @driver.window_handles.first
end

def inside_link(link_text)
  @driver.find_element(:link_text, link_text).click
  sleep 7
  @steps << "Click on '#{link_text}'"
  @steps << "title is '#{@driver.title}'"
  @driver.find_element(:id, "mym-breadcrumb-back").click
  sleep 5
end
