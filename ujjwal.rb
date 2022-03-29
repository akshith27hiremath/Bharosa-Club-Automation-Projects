require 'selenium-webdriver'
require 'webdrivers'

CAS_URL = "https://www.camsonline.com/Investors/Statements/Consolidated-Account-Statement"  
# Scripts
MAKE_RADIOS_VISIBLE = <<-JS
  document.querySelectorAll('.mat-radio-outer-circle', '.mat-radio-inner-circle').forEach(o => o.remove())
  document.querySelectorAll('.cdk-visually-hidden').forEach(el => el.classList.remove('cdk-visually-hidden'))
JS

# Request a CAS from CAMS using selenium
def fetch_for(email, password)
  opts = Selenium::WebDriver::Chrome::Options.new
  opts.add_argument('--headless')
  @driver = Selenium::WebDriver.for :chrome, capabilities: [opts]
  @driver.navigate.to CAS_URL

  # Make all radio button visible so we can click them
  @driver.execute_script MAKE_RADIOS_VISIBLE
  # Accept the terms of service
  click_element id: "mat-radio-2-input"
  # Click proceed
  click_element css: "input.check-now-btn.mr-right"
  # Select the statement type
  click_element id: "mat-radio-6-input"
  # Time period radio buttons appeared so again made radios visible
  @driver.execute_script MAKE_RADIOS_VISIBLE
  # Select 'specific time period'
  click_element id: "mat-radio-14-input"
  
  # Click the calendar icon for from date
  click_element css: "body > app-root > div > app-investtransact > div.correct-details.ng-star-inserted > div > div:nth-child(1) > div:nth-child(2) > div > app-statements > div > div.pad-lr > div > div:nth-child(2) > form > div.ng-star-inserted > div:nth-child(1) > mat-form-field > div > div.mat-form-field-flex > div.mat-form-field-suffix.ng-tns-c4-8.ng-star-inserted > mat-datepicker-toggle > button > span > svg"
  
  # Choose the year button
  click_element css: "button[aria-label='Choose month and year']"
  # Go back 60 years to reveal the '1960' button
  3.times { click_element css: "button[aria-label='Previous 20 years']" }
  # Select the year 1960
  click_element css: "td[aria-label='1960']"
  # Select the month january
  click_element css: "td[aria-label='01-Jan-1960']"
  # Select the date 1
  click_element css: "td[aria-label='01-Jan-1960']"

  # Select zero balance folios
  click_element id: "mat-radio-8-input"

  # Enter the email
  input email, css: "input[formcontrolname='email_id']"
  # Enter the password
  input password, css: "input[formcontrolname='password']"
  # Confirm the password
  input password, css: "input[formcontrolname='confirmPassword']"
  # Submit the form
  click_element css: "button[type='submit']"

  match = wait do
    success_text = find_element(css: "body > app-root > div > app-investtransact > div.correct-details.ng-star-inserted > div > div:nth-child(1) > div:nth-child(2) > div > app-statements > div > div > div").text
    success_text.match /Your reference number is (.+)\./
  end
ensure
  @driver.quit
end

def wait(timeout = 30, &block)
  Selenium::WebDriver::Wait.new(timeout: timeout).until(&block)
end

def find_element(opts)
  wait { @driver.find_element opts }
end

def click_element(opts)
  simulate_human_slowness
  find_element(opts).click
end

def input(txt, opts)
  element = find_element opts
  simulate_human_slowness
  element.send_keys txt
  element.send_keys :tab
end

# Random delay before every action
def simulate_human_slowness
  sleep rand(0.5..10.0)
end
