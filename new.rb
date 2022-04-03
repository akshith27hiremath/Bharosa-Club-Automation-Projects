require 'selenium-webdriver'
require 'webdrivers'

pathused = "./webdrivers/install/dir"
Webdrivers.install_dir = pathused

options = Selenium::WebDriver::Chrome::Options.new
# options.add_argument('--headless')
$driver = Selenium::WebDriver.for :chrome, options: options
$driver.get("https://www.camsonline.com/Investors/Statements/Consolidated-Account-Statement")

$tab = Selenium::WebDriver::Keys::KEYS[:tab]

$inputs = {
  "email" => "ujjwalthaakar@gmail.com",
  "password" => "bharosa12"
}

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
ele = wait.until { $driver.find_element(xpath: '//*[@id="mat-radio-2"]')} #wait for accept radio button to load in

def passtos()
  acceptradio = $driver.find_element(:xpath, "//*[@id='mat-radio-2']/label/div[1]/div[1]")
  acceptradio.click()
  proceed = $driver.find_element(:css, "input.check-now-btn.mr-right")
  proceed.click()
  puts("accept tos clicked")
end

def selectdetailed()
  detailedradio = $driver.find_element(:xpath, "//*[@id='mat-radio-6']/label/div[1]/div[2]")
  detailedradio.click()
end

def inputmail()
  email = $driver.find_element(:css, "input[formcontrolname='email_id']")
  email.send_keys($inputs['email'])
  email.send_keys($tab)
  print("inputted email")
end

def inputpassword()
  pwd = $driver.find_element(:css, "input[formcontrolname='password']")
  pwd.send_keys($inputs['password'])
  pwd.send_keys($tab)
  print("inputted password")
end

def confirmpassword()
  pwd = $driver.find_element(:css, "input[formcontrolname='confirmPassword']")
  pwd.send_keys($inputs['password'])
  pwd.send_keys($tab)
  print("confirmed password")
end

def choosetimeperiod()
  specifictp = $driver.find_element(:xpath, "//*[@id='mat-radio-14']/label/div[1]/div[1]")
  specifictp.click()
end

def allow0balancefolios()
  balancefolios = $driver.find_element(:xpath, "//*[@id='mat-radio-8']/label/div[1]/div[2]")
  balancefolios.click()
end

def settimeperiods()
  datesvg = $driver.find_elements(:css, "body > app-root > div > app-investtransact > div.correct-details.ng-star-inserted > div > div:nth-child(1) > div:nth-child(2) > div > app-statements > div > div.pad-lr > div > div:nth-child(2) > form > div.ng-star-inserted > div:nth-child(1) > mat-form-field > div > div.mat-form-field-flex > div.mat-form-field-suffix.ng-tns-c4-8.ng-star-inserted > mat-datepicker-toggle > button > span > svg")
  print("\n\n\n\n")
  print(datesvg)
  datesvg[0].click()
  wideyear = $driver.find_element(:css, "button[aria-label='Choose month and year']")
  wideyear.click()
  prev20 = $driver.find_element(:css, "button[aria-label='Previous 20 years']")
  prev20.click()
  prev20 = $driver.find_element(:css, "button[aria-label='Previous 20 years']")
  prev20.click()
  prev20 = $driver.find_element(:css, "button[aria-label='Previous 20 years']")
  prev20.click()
  yr1960 = $driver.find_element(:css, "td[aria-label='1960']")
  yr1960.click()
  jan = $driver.find_element(:css, "td[aria-label='01-Jan-1960']")
  jan.click()
  jan = $driver.find_element(:css, "td[aria-label='01-Jan-1960']")
  jan.click()
end

def submit()
  submitbutton = $driver.find_element(:css, ("button[type='submit']"))
  submitbutton.click()
end

passtos()
selectdetailed()
choosetimeperiod()
# allow0balancefolios()
settimeperiods()
inputmail()
load = wait.until { $driver.find_element(xpath: '//*[@id="mat-input-1"]')}
inputpassword()
confirmpassword()
# submit()
# load2 = wait.until ( $driver.find_element(xpath: 'xpath to success div'))
puts("\n\n\n\n\n")
raw = $driver.page_source
divsuccesstext = $driver.find_element(:css, "body > app-root > div > app-investtransact > div.correct-details.ng-star-inserted > div > div:nth-child(1) > div:nth-child(2) > div > app-statements > div > div > div").text
innerdivtext = $driver.find_element(:css, "body > app-root > div > app-investtransact > div.correct-details.ng-star-inserted > div > div:nth-child(1) > div:nth-child(2) > div > app-statements > div > div > div > div:nth-child(4) > p").text
m = innerdivtext.match /Your CAMS \+ KFintech summary has been sent to your registered email id (.+) Your reference number is (.+)./
puts "email: " + m[1] + "\n"
puts "reference number": m[2] + "\n"
sleep